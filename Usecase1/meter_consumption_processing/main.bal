import ballerina/io;

public function main() returns error? {
    string ediMultipleText = check io:fileReadString("resources/MSCONS_ExampleMultipleTS.edi");
    Metered_services_consumption_report_message mscons = check fromEdiString(ediMultipleText);
    io:println(mscons.toJsonString());

    string ediText = check io:fileReadString("resources/MSCONS_Example_SingleTS.edi");
    Metered_services_consumption_report_message mscons_single = check fromEdiString(ediText);
    io:println(mscons_single.toJsonString());
}