import ballerina/email;
import ballerina/file;
import ballerina/io;
import ballerina/lang.regexp;
import ballerina/log;
import ballerina/mime;
import ballerina/time;
import ballerina/xmldata;

//---- Following record types are used to represent the data in the JSON attachment ----------
type TurbineReading record {
    string Date;
    decimal Value;
};

type Metadata record {
    string site;
    string[] turbines;
    string timezone;
};

type TurbineData record {|
    TurbineReading[]...;
|};

type TurbinePayload record {
    int statuscode;
    Metadata metadata;
    TurbineData data;
};

//---- Following record types are used to represent the data in the output XML file ----------
type ValueInstance1 record {
    decimal Value;
    int Quality = 0;
};

type DataPointValue record {
    string DateStart;
    string DateStop;
    ValueInstance1 ValueInstance1;
};

configurable string host = ?;
configurable string username = ?;
configurable string password = ?;
configurable decimal pollingInterval = ?;

listener email:ImapListener emailListener = check new ({host, username, password, pollingInterval});

service "emailObserver" on emailListener {
    remote function onMessage(email:Message email) {
        mime:Entity[]? attachments = <mime:Entity[]?>email.attachments;
        if attachments is () {
            return;
        }

        foreach mime:Entity mEntity in attachments {
            do {
                json attachment = check mEntity.getJson();
                TurbinePayload turbinePayload = check attachment.cloneWithType();
                check processTurbinePayload(turbinePayload);
            } on fail var e {
                log:printError("Error while processing the attachment", 'error = e);
            }
        }
    }

    remote function onError(email:Error emailError) {
        log:printError("Error while polling for the emails.", emailError);
    }

    remote function onClose(email:Error? closeError) {
        log:printInfo("Closed the listener.");
    }
}

function processTurbinePayload(TurbinePayload turbinePayload) returns error? {
    foreach string turbine in turbinePayload.metadata.turbines {
        TurbineReading[] readings = turbinePayload.data[turbine] ?: [];
        foreach TurbineReading {Date, Value} in readings {
            // Populate the DataPointValue record
            DataPointValue dataPointValue = check createDataPointValue(Date, Value);
            // Convert the DataPointValue record to XML
            xml dataPointValueXml = check xmldata:toXml(dataPointValue);
            // Write the XML to a file
            string xmlFileName = check getXmlFilePath(turbine, Date);
            _ = check io:fileWriteXml(xmlFileName, dataPointValueXml);
        }
    }
}

function createDataPointValue(string date, decimal value) returns DataPointValue|error {
    // Convert the date to RFC 3339 format.
    string dateInRFC3339 = regexp:replace(re ` `, date, "T");
    string startTime = formatOutputDate(dateInRFC3339);
    string stopTime = check getStopTime(dateInRFC3339);
    return ToDavaPointValue(startTime, stopTime, value);
}

// This function can be used to demonstrate data mapper utility in Ballerina VSCode extension
function ToDavaPointValue(string startTime, string stopTime, decimal Value) returns DataPointValue => {
    DateStart: startTime,
    DateStop: stopTime,
    ValueInstance1: {
        Value: Value
    }
};

function getXmlFilePath(string turbine, string dateStartTime) returns string|error {
    string timeDirectoryPath = check file:joinPath(file:getCurrentDir(), "OutputFiles", dateStartTime);
    boolean dirExists = check file:test(timeDirectoryPath, file:EXISTS);
    if !dirExists {
        _ = check file:createDir(timeDirectoryPath, file:RECURSIVE);
    }

    string xmlFileName = check file:joinPath(timeDirectoryPath, turbine);
    return xmlFileName + ".xml";
}

function getStopTime(string startTime) returns string|error {
    time:Utc utcStartTime = check time:utcFromString(startTime);
    time:Utc utcStopTime = time:utcAddSeconds(utcStartTime, 3600);
    string stopTime = time:utcToString(utcStopTime);
    return formatOutputDate(stopTime);
}

// Converts "2023-09-23 21:00:00+00:00" to "23.09.2023 21:00:00"
function formatOutputDate(string dateTime) returns string =>
    string `${dateTime.substring(8, 10)}.${dateTime.substring(5, 7)}.${dateTime.substring(0, 4)} ${dateTime.substring(11, 19)}`;
