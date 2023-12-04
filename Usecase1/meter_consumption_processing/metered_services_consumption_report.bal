
import ballerina/edi;

public isolated function fromEdiString(string ediText) returns Metered_services_consumption_report_message|error {
    edi:EdiSchema ediSchema = check edi:getSchema(schemaJson);
    json dataJson = check edi:fromEdiString(ediText, ediSchema);
    return dataJson.cloneWithType();
}

public isolated function toEdiString(Metered_services_consumption_report_message data) returns string|error {
    edi:EdiSchema ediSchema = check edi:getSchema(schemaJson);
    return edi:toEdiString(data, ediSchema);    
} 

public isolated function getSchema() returns edi:EdiSchema|error {
    return edi:getSchema(schemaJson);
}

public isolated function fromEdiStringWithSchema(string ediText, edi:EdiSchema schema) returns Metered_services_consumption_report_message|error {
    json dataJson = check edi:fromEdiString(ediText, schema);
    return dataJson.cloneWithType();
}

public isolated function toEdiStringWithSchema(Metered_services_consumption_report_message data, edi:EdiSchema ediSchema) returns string|error {
    return edi:toEdiString(data, ediSchema);    
}

public type DOCUMENT_MESSAGE_NAME_GType record {|
   string Document_message_name__coded?;
   string Code_list_qualifier?;
   string Code_list_responsible_agency__coded?;
   string Document_message_name?;
|};

public type BEGINNING_OF_MESSAGE_Type record {|
   string code = "BGM";
   DOCUMENT_MESSAGE_NAME_GType? DOCUMENT_MESSAGE_NAME?;
   string Document_message_number?;
   string Message_function__coded?;
   string Response_type__coded?;
|};

public type DATE_TIME_PERIOD_GType record {|
   string Date_time_period_qualifier;
   string Date_time_period?;
   string Date_time_period_format_qualifier?;
|};

public type DATE_TIME_PERIOD_Type record {|
   string code = "DTM";
   DATE_TIME_PERIOD_GType DATE_TIME_PERIOD;
|};

public type REFERENCE_GType record {|
   string Reference_qualifier;
   string Reference_number?;
   string Line_number?;
   string Reference_version_number?;
|};

public type REFERENCE_Type record {|
   string code = "RFF";
   REFERENCE_GType REFERENCE;
|};

public type Segment_group_1_GType record {|
   REFERENCE_Type REFERENCE;
   DATE_TIME_PERIOD_Type[] DATE_TIME_PERIOD = [];
|};

public type PARTY_IDENTIFICATION_DETAILS_GType record {|
   string Party_id__identification;
   string Code_list_qualifier?;
   string Code_list_responsible_agency__coded?;
|};

public type NAME_AND_ADDRESS_GType record {|
   string Name_and_address_line;
   string Name_and_address_line_1?;
   string Name_and_address_line_2?;
   string Name_and_address_line_3?;
   string Name_and_address_line_4?;
|};

public type PARTY_NAME_GType record {|
   string Party_name;
   string Party_name_1?;
   string Party_name_2?;
   string Party_name_3?;
   string Party_name_4?;
   string Party_name_format__coded?;
|};

public type STREET_GType record {|
   string Street_and_number_p_o__box;
   string Street_and_number_p_o__box_1?;
   string Street_and_number_p_o__box_2?;
   string Street_and_number_p_o__box_3?;
|};

public type NAME_AND_ADDRESS_Type record {|
   string code = "NAD";
   string Party_qualifier;
   PARTY_IDENTIFICATION_DETAILS_GType? PARTY_IDENTIFICATION_DETAILS?;
   NAME_AND_ADDRESS_GType? NAME_AND_ADDRESS?;
   PARTY_NAME_GType? PARTY_NAME?;
   STREET_GType? STREET?;
   string City_name?;
   string Country_sub_entity_identification?;
   string Postcode_identification?;
   string Country__coded?;
|};

public type Segment_group_3_GType record {|
   REFERENCE_Type REFERENCE;
   DATE_TIME_PERIOD_Type[] DATE_TIME_PERIOD = [];
|};

public type DEPARTMENT_OR_EMPLOYEE_DETAILS_GType record {|
   string Department_or_employee_identification?;
   string Department_or_employee?;
|};

public type CONTACT_INFORMATION_Type record {|
   string code = "CTA";
   string Contact_function__coded?;
   DEPARTMENT_OR_EMPLOYEE_DETAILS_GType? DEPARTMENT_OR_EMPLOYEE_DETAILS?;
|};

public type COMMUNICATION_CONTACT_GType record {|
   string Communication_number;
   string Communication_channel_qualifier;
|};

public type COMMUNICATION_CONTACT_Type record {|
   string code = "COM";
   COMMUNICATION_CONTACT_GType COMMUNICATION_CONTACT;
|};

public type Segment_group_4_GType record {|
   CONTACT_INFORMATION_Type CONTACT_INFORMATION;
   COMMUNICATION_CONTACT_Type[] COMMUNICATION_CONTACT = [];
|};

public type Segment_group_2_GType record {|
   NAME_AND_ADDRESS_Type NAME_AND_ADDRESS;
   Segment_group_3_GType[] Segment_group_3 = [];
   Segment_group_4_GType[] Segment_group_4 = [];
|};

public type SECTION_CONTROL_Type record {|
   string code = "UNS";
   string Section_identification;
|};

public type LOCATION_IDENTIFICATION_GType record {|
   string Place_location_identification?;
   string Code_list_qualifier?;
   string Code_list_responsible_agency__coded?;
   string Place_location?;
|};

public type RELATED_LOCATION_ONE_IDENTIFICATION_GType record {|
   string Related_place_location_one_identification?;
   string Code_list_qualifier?;
   string Code_list_responsible_agency__coded?;
   string Related_place_location_one?;
|};

public type RELATED_LOCATION_TWO_IDENTIFICATION_GType record {|
   string Related_place_location_two_identification?;
   string Code_list_qualifier?;
   string Code_list_responsible_agency__coded?;
   string Related_place_location_two?;
|};

public type PLACE_LOCATION_IDENTIFICATION_Type record {|
   string code = "LOC";
   string Place_location_qualifier;
   LOCATION_IDENTIFICATION_GType? LOCATION_IDENTIFICATION?;
   RELATED_LOCATION_ONE_IDENTIFICATION_GType? RELATED_LOCATION_ONE_IDENTIFICATION?;
   RELATED_LOCATION_TWO_IDENTIFICATION_GType? RELATED_LOCATION_TWO_IDENTIFICATION?;
   string Relation__coded?;
|};

public type Segment_group_7_GType record {|
   REFERENCE_Type REFERENCE;
   DATE_TIME_PERIOD_Type[] DATE_TIME_PERIOD = [];
|};

public type MEASUREMENT_DETAILS_GType record {|
   string Measurement_dimension__coded?;
   string Measurement_significance__coded?;
   string Measurement_attribute__coded?;
   string Measurement_attribute?;
|};

public type PRODUCT_CHARACTERISTIC_GType record {|
   string Characteristic_identification;
   string Code_list_qualifier?;
   string Code_list_responsible_agency__coded?;
   string Characteristic?;
   string Characteristic_1?;
|};

public type CHARACTERISTIC_CLASS_ID_Type record {|
   string code = "CCI";
   string Property_class__coded?;
   MEASUREMENT_DETAILS_GType? MEASUREMENT_DETAILS?;
   PRODUCT_CHARACTERISTIC_GType? PRODUCT_CHARACTERISTIC?;
|};

public type Segment_group_8_GType record {|
   CHARACTERISTIC_CLASS_ID_Type CHARACTERISTIC_CLASS_ID;
   DATE_TIME_PERIOD_Type[] DATE_TIME_PERIOD = [];
|};

public type ITEM_NUMBER_IDENTIFICATION_GType record {|
   string Item_number?;
   string Item_number_type__coded?;
   string Code_list_qualifier?;
   string Code_list_responsible_agency__coded?;
|};

public type SUB_LINE_INFORMATION_GType record {|
   string Sub_line_indicator__coded?;
   string Line_item_number?;
|};

public type LINE_ITEM_Type record {|
   string code = "LIN";
   string Line_item_number?;
   string Action_request_notification__coded?;
   ITEM_NUMBER_IDENTIFICATION_GType? ITEM_NUMBER_IDENTIFICATION?;
   SUB_LINE_INFORMATION_GType? SUB_LINE_INFORMATION?;
   string Configuration_level?;
   string Configuration__coded?;
|};

public type ITEM_NUMBER_IDENTIFICATION_1_GType record {|
   string Item_number?;
   string Item_number_type__coded?;
   string Code_list_qualifier?;
   string Code_list_responsible_agency__coded?;
|};

public type ITEM_NUMBER_IDENTIFICATION_2_GType record {|
   string Item_number?;
   string Item_number_type__coded?;
   string Code_list_qualifier?;
   string Code_list_responsible_agency__coded?;
|};

public type ITEM_NUMBER_IDENTIFICATION_3_GType record {|
   string Item_number?;
   string Item_number_type__coded?;
   string Code_list_qualifier?;
   string Code_list_responsible_agency__coded?;
|};

public type ITEM_NUMBER_IDENTIFICATION_4_GType record {|
   string Item_number?;
   string Item_number_type__coded?;
   string Code_list_qualifier?;
   string Code_list_responsible_agency__coded?;
|};

public type ADDITIONAL_PRODUCT_ID_Type record {|
   string code = "PIA";
   string Product_id__function_qualifier;
   ITEM_NUMBER_IDENTIFICATION_GType ITEM_NUMBER_IDENTIFICATION;
   ITEM_NUMBER_IDENTIFICATION_1_GType? ITEM_NUMBER_IDENTIFICATION_1?;
   ITEM_NUMBER_IDENTIFICATION_2_GType? ITEM_NUMBER_IDENTIFICATION_2?;
   ITEM_NUMBER_IDENTIFICATION_3_GType? ITEM_NUMBER_IDENTIFICATION_3?;
   ITEM_NUMBER_IDENTIFICATION_4_GType? ITEM_NUMBER_IDENTIFICATION_4?;
|};

public type ITEM_DESCRIPTION_GType record {|
   string Item_description_identification?;
   string Code_list_qualifier?;
   string Code_list_responsible_agency__coded?;
   string Item_description?;
   string Item_description_1?;
   string Language__coded?;
|};

public type ITEM_DESCRIPTION_Type record {|
   string code = "IMD";
   string Item_description_type__coded?;
   string Item_characteristic__coded?;
   ITEM_DESCRIPTION_GType? ITEM_DESCRIPTION?;
   string Surface_layer_indicator__coded?;
|};

public type VALUE_RANGE_GType record {|
   string Measure_unit_qualifier;
   string Measurement_value?;
   string Range_minimum?;
   string Range_maximum?;
   string Significant_digits?;
|};

public type MEASUREMENTS_Type record {|
   string code = "MEA";
   string Measurement_application_qualifier;
   MEASUREMENT_DETAILS_GType? MEASUREMENT_DETAILS?;
   VALUE_RANGE_GType? VALUE_RANGE?;
   string Surface_layer_indicator__coded?;
|};

public type CURRENCY_DETAILS_GType record {|
   string Currency_details_qualifier;
   string Currency__coded?;
   string Currency_qualifier?;
   string Currency_rate_base?;
|};

public type CURRENCY_DETAILS_1_GType record {|
   string Currency_details_qualifier;
   string Currency__coded?;
   string Currency_qualifier?;
   string Currency_rate_base?;
|};

public type CURRENCIES_Type record {|
   string code = "CUX";
   CURRENCY_DETAILS_GType? CURRENCY_DETAILS?;
   CURRENCY_DETAILS_1_GType? CURRENCY_DETAILS_1?;
   string Rate_of_exchange?;
   string Currency_market_exchange__coded?;
|};

public type PRICE_INFORMATION_GType record {|
   string Price_qualifier;
   string Price?;
   string Price_type__coded?;
   string Price_type_qualifier?;
   string Unit_price_basis?;
   string Measure_unit_qualifier?;
|};

public type PRICE_DETAILS_Type record {|
   string code = "PRI";
   PRICE_INFORMATION_GType? PRICE_INFORMATION?;
   string Sub_line_price_change__coded?;
|};

public type MONETARY_AMOUNT_GType record {|
   string Monetary_amount_type_qualifier;
   string Monetary_amount?;
   string Currency__coded?;
   string Currency_qualifier?;
   string Status__coded?;
|};

public type MONETARY_AMOUNT_Type record {|
   string code = "MOA";
   MONETARY_AMOUNT_GType MONETARY_AMOUNT;
|};

public type QUANTITY_DETAILS_GType record {|
   string Quantity_qualifier;
   string Quantity;
   string Measure_unit_qualifier?;
|};

public type QUANTITY_Type record {|
   string code = "QTY";
   QUANTITY_DETAILS_GType QUANTITY_DETAILS;
|};

public type Segment_group_10_GType record {|
   QUANTITY_Type QUANTITY;
   DATE_TIME_PERIOD_Type[] DATE_TIME_PERIOD = [];
|};

public type Segment_group_11_GType record {|
   CHARACTERISTIC_CLASS_ID_Type CHARACTERISTIC_CLASS_ID;
   MEASUREMENTS_Type[] MEASUREMENTS = [];
   DATE_TIME_PERIOD_Type[] DATE_TIME_PERIOD = [];
|};

public type Segment_group_9_GType record {|
   LINE_ITEM_Type LINE_ITEM;
   ADDITIONAL_PRODUCT_ID_Type[] ADDITIONAL_PRODUCT_ID = [];
   ITEM_DESCRIPTION_Type[] ITEM_DESCRIPTION = [];
   MEASUREMENTS_Type[] MEASUREMENTS = [];
   CURRENCIES_Type[] CURRENCIES = [];
   PRICE_DETAILS_Type[] PRICE_DETAILS = [];
   NAME_AND_ADDRESS_Type[] NAME_AND_ADDRESS = [];
   MONETARY_AMOUNT_Type[] MONETARY_AMOUNT = [];
   Segment_group_10_GType[] Segment_group_10 = [];
   Segment_group_11_GType[] Segment_group_11 = [];
|};

public type Segment_group_6_GType record {|
   PLACE_LOCATION_IDENTIFICATION_Type PLACE_LOCATION_IDENTIFICATION;
   DATE_TIME_PERIOD_Type[] DATE_TIME_PERIOD = [];
   Segment_group_7_GType[] Segment_group_7 = [];
   Segment_group_8_GType[] Segment_group_8 = [];
   Segment_group_9_GType[] Segment_group_9 = [];
|};

public type Segment_group_5_GType record {|
   NAME_AND_ADDRESS_Type NAME_AND_ADDRESS;
   Segment_group_6_GType[] Segment_group_6 = [];
|};

public type CONTROL_GType record {|
   string Control_qualifier;
   string Control_value;
   string Measure_unit_qualifier?;
|};

public type CONTROL_TOTAL_Type record {|
   string code = "CNT";
   CONTROL_GType CONTROL;
|};

public type Metered_services_consumption_report_message record {|
   BEGINNING_OF_MESSAGE_Type BEGINNING_OF_MESSAGE;
   DATE_TIME_PERIOD_Type[] DATE_TIME_PERIOD = [];
   Segment_group_1_GType[] Segment_group_1 = [];
   Segment_group_2_GType[] Segment_group_2 = [];
   SECTION_CONTROL_Type SECTION_CONTROL;
   Segment_group_5_GType[] Segment_group_5 = [];
   CONTROL_TOTAL_Type[] CONTROL_TOTAL = [];
|};



final readonly & json schemaJson = {"name":"Metered_services_consumption_report_message", "tag":"Root_mapping", "delimiters":{"segment":"'", "field":"+", "component":":", "subcomponent":"NOT_USED", "repetition":"NOT_USED"}, "ignoreSegments":["UNA", "UNB", "UNH", "UNT", "UNZ"], "preserveEmptyFields":true, "includeSegmentCode":true, "segments":[{"code":"BGM", "tag":"BEGINNING_OF_MESSAGE", "truncatable":true, "minOccurances":1, "maxOccurances":1, "fields":[{"tag":"code", "repeat":false, "required":true, "truncatable":true, "dataType":"string", "startIndex":-1, "length":-1, "components":[]}, {"tag":"DOCUMENT_MESSAGE_NAME", "repeat":false, "required":false, "truncatable":true, "dataType":"composite", "startIndex":-1, "length":-1, "components":[{"tag":"Document_message_name__coded", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Code_list_qualifier", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Code_list_responsible_agency__coded", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Document_message_name", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}]}, {"tag":"Document_message_number", "repeat":false, "required":false, "truncatable":true, "dataType":"string", "startIndex":-1, "length":-1, "components":[]}, {"tag":"Message_function__coded", "repeat":false, "required":false, "truncatable":true, "dataType":"string", "startIndex":-1, "length":-1, "components":[]}, {"tag":"Response_type__coded", "repeat":false, "required":false, "truncatable":true, "dataType":"string", "startIndex":-1, "length":-1, "components":[]}]}, {"code":"DTM", "tag":"DATE_TIME_PERIOD", "truncatable":true, "minOccurances":1, "maxOccurances":9, "fields":[{"tag":"code", "repeat":false, "required":true, "truncatable":true, "dataType":"string", "startIndex":-1, "length":-1, "components":[]}, {"tag":"DATE_TIME_PERIOD", "repeat":false, "required":true, "truncatable":true, "dataType":"composite", "startIndex":-1, "length":-1, "components":[{"tag":"Date_time_period_qualifier", "required":true, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Date_time_period", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Date_time_period_format_qualifier", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}]}]}, {"tag":"Segment_group_1", "minOccurances":0, "maxOccurances":9, "segments":[{"code":"RFF", "tag":"REFERENCE", "truncatable":true, "minOccurances":1, "maxOccurances":1, "fields":[{"tag":"code", "repeat":false, "required":true, "truncatable":true, "dataType":"string", "startIndex":-1, "length":-1, "components":[]}, {"tag":"REFERENCE", "repeat":false, "required":true, "truncatable":true, "dataType":"composite", "startIndex":-1, "length":-1, "components":[{"tag":"Reference_qualifier", "required":true, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Reference_number", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Line_number", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Reference_version_number", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}]}]}, {"code":"DTM", "tag":"DATE_TIME_PERIOD", "truncatable":true, "minOccurances":0, "maxOccurances":9, "fields":[{"tag":"code", "repeat":false, "required":true, "truncatable":true, "dataType":"string", "startIndex":-1, "length":-1, "components":[]}, {"tag":"DATE_TIME_PERIOD", "repeat":false, "required":true, "truncatable":true, "dataType":"composite", "startIndex":-1, "length":-1, "components":[{"tag":"Date_time_period_qualifier", "required":true, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Date_time_period", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Date_time_period_format_qualifier", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}]}]}]}, {"tag":"Segment_group_2", "minOccurances":0, "maxOccurances":99, "segments":[{"code":"NAD", "tag":"NAME_AND_ADDRESS", "truncatable":true, "minOccurances":1, "maxOccurances":1, "fields":[{"tag":"code", "repeat":false, "required":true, "truncatable":true, "dataType":"string", "startIndex":-1, "length":-1, "components":[]}, {"tag":"Party_qualifier", "repeat":false, "required":true, "truncatable":true, "dataType":"string", "startIndex":-1, "length":-1, "components":[]}, {"tag":"PARTY_IDENTIFICATION_DETAILS", "repeat":false, "required":false, "truncatable":true, "dataType":"composite", "startIndex":-1, "length":-1, "components":[{"tag":"Party_id__identification", "required":true, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Code_list_qualifier", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Code_list_responsible_agency__coded", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}]}, {"tag":"NAME_AND_ADDRESS", "repeat":false, "required":false, "truncatable":true, "dataType":"composite", "startIndex":-1, "length":-1, "components":[{"tag":"Name_and_address_line", "required":true, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Name_and_address_line_1", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Name_and_address_line_2", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Name_and_address_line_3", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Name_and_address_line_4", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}]}, {"tag":"PARTY_NAME", "repeat":false, "required":false, "truncatable":true, "dataType":"composite", "startIndex":-1, "length":-1, "components":[{"tag":"Party_name", "required":true, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Party_name_1", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Party_name_2", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Party_name_3", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Party_name_4", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Party_name_format__coded", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}]}, {"tag":"STREET", "repeat":false, "required":false, "truncatable":true, "dataType":"composite", "startIndex":-1, "length":-1, "components":[{"tag":"Street_and_number_p_o__box", "required":true, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Street_and_number_p_o__box_1", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Street_and_number_p_o__box_2", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Street_and_number_p_o__box_3", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}]}, {"tag":"City_name", "repeat":false, "required":false, "truncatable":true, "dataType":"string", "startIndex":-1, "length":-1, "components":[]}, {"tag":"Country_sub_entity_identification", "repeat":false, "required":false, "truncatable":true, "dataType":"string", "startIndex":-1, "length":-1, "components":[]}, {"tag":"Postcode_identification", "repeat":false, "required":false, "truncatable":true, "dataType":"string", "startIndex":-1, "length":-1, "components":[]}, {"tag":"Country__coded", "repeat":false, "required":false, "truncatable":true, "dataType":"string", "startIndex":-1, "length":-1, "components":[]}]}, {"tag":"Segment_group_3", "minOccurances":0, "maxOccurances":9, "segments":[{"code":"RFF", "tag":"REFERENCE", "truncatable":true, "minOccurances":1, "maxOccurances":1, "fields":[{"tag":"code", "repeat":false, "required":true, "truncatable":true, "dataType":"string", "startIndex":-1, "length":-1, "components":[]}, {"tag":"REFERENCE", "repeat":false, "required":true, "truncatable":true, "dataType":"composite", "startIndex":-1, "length":-1, "components":[{"tag":"Reference_qualifier", "required":true, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Reference_number", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Line_number", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Reference_version_number", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}]}]}, {"code":"DTM", "tag":"DATE_TIME_PERIOD", "truncatable":true, "minOccurances":0, "maxOccurances":9, "fields":[{"tag":"code", "repeat":false, "required":true, "truncatable":true, "dataType":"string", "startIndex":-1, "length":-1, "components":[]}, {"tag":"DATE_TIME_PERIOD", "repeat":false, "required":true, "truncatable":true, "dataType":"composite", "startIndex":-1, "length":-1, "components":[{"tag":"Date_time_period_qualifier", "required":true, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Date_time_period", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Date_time_period_format_qualifier", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}]}]}]}, {"tag":"Segment_group_4", "minOccurances":0, "maxOccurances":9, "segments":[{"code":"CTA", "tag":"CONTACT_INFORMATION", "truncatable":true, "minOccurances":1, "maxOccurances":1, "fields":[{"tag":"code", "repeat":false, "required":true, "truncatable":true, "dataType":"string", "startIndex":-1, "length":-1, "components":[]}, {"tag":"Contact_function__coded", "repeat":false, "required":false, "truncatable":true, "dataType":"string", "startIndex":-1, "length":-1, "components":[]}, {"tag":"DEPARTMENT_OR_EMPLOYEE_DETAILS", "repeat":false, "required":false, "truncatable":true, "dataType":"composite", "startIndex":-1, "length":-1, "components":[{"tag":"Department_or_employee_identification", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Department_or_employee", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}]}]}, {"code":"COM", "tag":"COMMUNICATION_CONTACT", "truncatable":true, "minOccurances":0, "maxOccurances":9, "fields":[{"tag":"code", "repeat":false, "required":true, "truncatable":true, "dataType":"string", "startIndex":-1, "length":-1, "components":[]}, {"tag":"COMMUNICATION_CONTACT", "repeat":false, "required":true, "truncatable":true, "dataType":"composite", "startIndex":-1, "length":-1, "components":[{"tag":"Communication_number", "required":true, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Communication_channel_qualifier", "required":true, "truncatable":true, "dataType":"string", "subcomponents":[]}]}]}]}]}, {"code":"UNS", "tag":"SECTION_CONTROL", "truncatable":true, "minOccurances":1, "maxOccurances":1, "fields":[{"tag":"code", "repeat":false, "required":true, "truncatable":true, "dataType":"string", "startIndex":-1, "length":-1, "components":[]}, {"tag":"Section_identification", "repeat":false, "required":true, "truncatable":true, "dataType":"string", "startIndex":-1, "length":-1, "components":[]}]}, {"tag":"Segment_group_5", "minOccurances":1, "maxOccurances":99999, "segments":[{"code":"NAD", "tag":"NAME_AND_ADDRESS", "truncatable":true, "minOccurances":1, "maxOccurances":1, "fields":[{"tag":"code", "repeat":false, "required":true, "truncatable":true, "dataType":"string", "startIndex":-1, "length":-1, "components":[]}, {"tag":"Party_qualifier", "repeat":false, "required":true, "truncatable":true, "dataType":"string", "startIndex":-1, "length":-1, "components":[]}, {"tag":"PARTY_IDENTIFICATION_DETAILS", "repeat":false, "required":false, "truncatable":true, "dataType":"composite", "startIndex":-1, "length":-1, "components":[{"tag":"Party_id__identification", "required":true, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Code_list_qualifier", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Code_list_responsible_agency__coded", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}]}, {"tag":"NAME_AND_ADDRESS", "repeat":false, "required":false, "truncatable":true, "dataType":"composite", "startIndex":-1, "length":-1, "components":[{"tag":"Name_and_address_line", "required":true, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Name_and_address_line_1", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Name_and_address_line_2", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Name_and_address_line_3", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Name_and_address_line_4", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}]}, {"tag":"PARTY_NAME", "repeat":false, "required":false, "truncatable":true, "dataType":"composite", "startIndex":-1, "length":-1, "components":[{"tag":"Party_name", "required":true, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Party_name_1", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Party_name_2", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Party_name_3", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Party_name_4", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Party_name_format__coded", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}]}, {"tag":"STREET", "repeat":false, "required":false, "truncatable":true, "dataType":"composite", "startIndex":-1, "length":-1, "components":[{"tag":"Street_and_number_p_o__box", "required":true, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Street_and_number_p_o__box_1", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Street_and_number_p_o__box_2", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Street_and_number_p_o__box_3", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}]}, {"tag":"City_name", "repeat":false, "required":false, "truncatable":true, "dataType":"string", "startIndex":-1, "length":-1, "components":[]}, {"tag":"Country_sub_entity_identification", "repeat":false, "required":false, "truncatable":true, "dataType":"string", "startIndex":-1, "length":-1, "components":[]}, {"tag":"Postcode_identification", "repeat":false, "required":false, "truncatable":true, "dataType":"string", "startIndex":-1, "length":-1, "components":[]}, {"tag":"Country__coded", "repeat":false, "required":false, "truncatable":true, "dataType":"string", "startIndex":-1, "length":-1, "components":[]}]}, {"tag":"Segment_group_6", "minOccurances":1, "maxOccurances":99999, "segments":[{"code":"LOC", "tag":"PLACE_LOCATION_IDENTIFICATION", "truncatable":true, "minOccurances":1, "maxOccurances":1, "fields":[{"tag":"code", "repeat":false, "required":true, "truncatable":true, "dataType":"string", "startIndex":-1, "length":-1, "components":[]}, {"tag":"Place_location_qualifier", "repeat":false, "required":true, "truncatable":true, "dataType":"string", "startIndex":-1, "length":-1, "components":[]}, {"tag":"LOCATION_IDENTIFICATION", "repeat":false, "required":false, "truncatable":true, "dataType":"composite", "startIndex":-1, "length":-1, "components":[{"tag":"Place_location_identification", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Code_list_qualifier", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Code_list_responsible_agency__coded", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Place_location", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}]}, {"tag":"RELATED_LOCATION_ONE_IDENTIFICATION", "repeat":false, "required":false, "truncatable":true, "dataType":"composite", "startIndex":-1, "length":-1, "components":[{"tag":"Related_place_location_one_identification", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Code_list_qualifier", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Code_list_responsible_agency__coded", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Related_place_location_one", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}]}, {"tag":"RELATED_LOCATION_TWO_IDENTIFICATION", "repeat":false, "required":false, "truncatable":true, "dataType":"composite", "startIndex":-1, "length":-1, "components":[{"tag":"Related_place_location_two_identification", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Code_list_qualifier", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Code_list_responsible_agency__coded", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Related_place_location_two", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}]}, {"tag":"Relation__coded", "repeat":false, "required":false, "truncatable":true, "dataType":"string", "startIndex":-1, "length":-1, "components":[]}]}, {"code":"DTM", "tag":"DATE_TIME_PERIOD", "truncatable":true, "minOccurances":0, "maxOccurances":9, "fields":[{"tag":"code", "repeat":false, "required":true, "truncatable":true, "dataType":"string", "startIndex":-1, "length":-1, "components":[]}, {"tag":"DATE_TIME_PERIOD", "repeat":false, "required":true, "truncatable":true, "dataType":"composite", "startIndex":-1, "length":-1, "components":[{"tag":"Date_time_period_qualifier", "required":true, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Date_time_period", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Date_time_period_format_qualifier", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}]}]}, {"tag":"Segment_group_7", "minOccurances":0, "maxOccurances":99, "segments":[{"code":"RFF", "tag":"REFERENCE", "truncatable":true, "minOccurances":1, "maxOccurances":1, "fields":[{"tag":"code", "repeat":false, "required":true, "truncatable":true, "dataType":"string", "startIndex":-1, "length":-1, "components":[]}, {"tag":"REFERENCE", "repeat":false, "required":true, "truncatable":true, "dataType":"composite", "startIndex":-1, "length":-1, "components":[{"tag":"Reference_qualifier", "required":true, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Reference_number", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Line_number", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Reference_version_number", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}]}]}, {"code":"DTM", "tag":"DATE_TIME_PERIOD", "truncatable":true, "minOccurances":0, "maxOccurances":9, "fields":[{"tag":"code", "repeat":false, "required":true, "truncatable":true, "dataType":"string", "startIndex":-1, "length":-1, "components":[]}, {"tag":"DATE_TIME_PERIOD", "repeat":false, "required":true, "truncatable":true, "dataType":"composite", "startIndex":-1, "length":-1, "components":[{"tag":"Date_time_period_qualifier", "required":true, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Date_time_period", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Date_time_period_format_qualifier", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}]}]}]}, {"tag":"Segment_group_8", "minOccurances":0, "maxOccurances":99, "segments":[{"code":"CCI", "tag":"CHARACTERISTIC_CLASS_ID", "truncatable":true, "minOccurances":1, "maxOccurances":1, "fields":[{"tag":"code", "repeat":false, "required":true, "truncatable":true, "dataType":"string", "startIndex":-1, "length":-1, "components":[]}, {"tag":"Property_class__coded", "repeat":false, "required":false, "truncatable":true, "dataType":"string", "startIndex":-1, "length":-1, "components":[]}, {"tag":"MEASUREMENT_DETAILS", "repeat":false, "required":false, "truncatable":true, "dataType":"composite", "startIndex":-1, "length":-1, "components":[{"tag":"Measurement_dimension__coded", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Measurement_significance__coded", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Measurement_attribute__coded", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Measurement_attribute", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}]}, {"tag":"PRODUCT_CHARACTERISTIC", "repeat":false, "required":false, "truncatable":true, "dataType":"composite", "startIndex":-1, "length":-1, "components":[{"tag":"Characteristic_identification", "required":true, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Code_list_qualifier", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Code_list_responsible_agency__coded", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Characteristic", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Characteristic_1", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}]}]}, {"code":"DTM", "tag":"DATE_TIME_PERIOD", "truncatable":true, "minOccurances":0, "maxOccurances":99, "fields":[{"tag":"code", "repeat":false, "required":true, "truncatable":true, "dataType":"string", "startIndex":-1, "length":-1, "components":[]}, {"tag":"DATE_TIME_PERIOD", "repeat":false, "required":true, "truncatable":true, "dataType":"composite", "startIndex":-1, "length":-1, "components":[{"tag":"Date_time_period_qualifier", "required":true, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Date_time_period", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Date_time_period_format_qualifier", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}]}]}]}, {"tag":"Segment_group_9", "minOccurances":0, "maxOccurances":99999, "segments":[{"code":"LIN", "tag":"LINE_ITEM", "truncatable":true, "minOccurances":1, "maxOccurances":1, "fields":[{"tag":"code", "repeat":false, "required":true, "truncatable":true, "dataType":"string", "startIndex":-1, "length":-1, "components":[]}, {"tag":"Line_item_number", "repeat":false, "required":false, "truncatable":true, "dataType":"string", "startIndex":-1, "length":-1, "components":[]}, {"tag":"Action_request_notification__coded", "repeat":false, "required":false, "truncatable":true, "dataType":"string", "startIndex":-1, "length":-1, "components":[]}, {"tag":"ITEM_NUMBER_IDENTIFICATION", "repeat":false, "required":false, "truncatable":true, "dataType":"composite", "startIndex":-1, "length":-1, "components":[{"tag":"Item_number", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Item_number_type__coded", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Code_list_qualifier", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Code_list_responsible_agency__coded", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}]}, {"tag":"SUB_LINE_INFORMATION", "repeat":false, "required":false, "truncatable":true, "dataType":"composite", "startIndex":-1, "length":-1, "components":[{"tag":"Sub_line_indicator__coded", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Line_item_number", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}]}, {"tag":"Configuration_level", "repeat":false, "required":false, "truncatable":true, "dataType":"string", "startIndex":-1, "length":-1, "components":[]}, {"tag":"Configuration__coded", "repeat":false, "required":false, "truncatable":true, "dataType":"string", "startIndex":-1, "length":-1, "components":[]}]}, {"code":"PIA", "tag":"ADDITIONAL_PRODUCT_ID", "truncatable":true, "minOccurances":0, "maxOccurances":9, "fields":[{"tag":"code", "repeat":false, "required":true, "truncatable":true, "dataType":"string", "startIndex":-1, "length":-1, "components":[]}, {"tag":"Product_id__function_qualifier", "repeat":false, "required":true, "truncatable":true, "dataType":"string", "startIndex":-1, "length":-1, "components":[]}, {"tag":"ITEM_NUMBER_IDENTIFICATION", "repeat":false, "required":true, "truncatable":true, "dataType":"composite", "startIndex":-1, "length":-1, "components":[{"tag":"Item_number", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Item_number_type__coded", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Code_list_qualifier", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Code_list_responsible_agency__coded", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}]}, {"tag":"ITEM_NUMBER_IDENTIFICATION_1", "repeat":false, "required":false, "truncatable":true, "dataType":"composite", "startIndex":-1, "length":-1, "components":[{"tag":"Item_number", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Item_number_type__coded", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Code_list_qualifier", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Code_list_responsible_agency__coded", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}]}, {"tag":"ITEM_NUMBER_IDENTIFICATION_2", "repeat":false, "required":false, "truncatable":true, "dataType":"composite", "startIndex":-1, "length":-1, "components":[{"tag":"Item_number", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Item_number_type__coded", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Code_list_qualifier", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Code_list_responsible_agency__coded", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}]}, {"tag":"ITEM_NUMBER_IDENTIFICATION_3", "repeat":false, "required":false, "truncatable":true, "dataType":"composite", "startIndex":-1, "length":-1, "components":[{"tag":"Item_number", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Item_number_type__coded", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Code_list_qualifier", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Code_list_responsible_agency__coded", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}]}, {"tag":"ITEM_NUMBER_IDENTIFICATION_4", "repeat":false, "required":false, "truncatable":true, "dataType":"composite", "startIndex":-1, "length":-1, "components":[{"tag":"Item_number", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Item_number_type__coded", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Code_list_qualifier", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Code_list_responsible_agency__coded", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}]}]}, {"code":"IMD", "tag":"ITEM_DESCRIPTION", "truncatable":true, "minOccurances":0, "maxOccurances":5, "fields":[{"tag":"code", "repeat":false, "required":true, "truncatable":true, "dataType":"string", "startIndex":-1, "length":-1, "components":[]}, {"tag":"Item_description_type__coded", "repeat":false, "required":false, "truncatable":true, "dataType":"string", "startIndex":-1, "length":-1, "components":[]}, {"tag":"Item_characteristic__coded", "repeat":false, "required":false, "truncatable":true, "dataType":"string", "startIndex":-1, "length":-1, "components":[]}, {"tag":"ITEM_DESCRIPTION", "repeat":false, "required":false, "truncatable":true, "dataType":"composite", "startIndex":-1, "length":-1, "components":[{"tag":"Item_description_identification", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Code_list_qualifier", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Code_list_responsible_agency__coded", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Item_description", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Item_description_1", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Language__coded", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}]}, {"tag":"Surface_layer_indicator__coded", "repeat":false, "required":false, "truncatable":true, "dataType":"string", "startIndex":-1, "length":-1, "components":[]}]}, {"code":"MEA", "tag":"MEASUREMENTS", "truncatable":true, "minOccurances":0, "maxOccurances":9, "fields":[{"tag":"code", "repeat":false, "required":true, "truncatable":true, "dataType":"string", "startIndex":-1, "length":-1, "components":[]}, {"tag":"Measurement_application_qualifier", "repeat":false, "required":true, "truncatable":true, "dataType":"string", "startIndex":-1, "length":-1, "components":[]}, {"tag":"MEASUREMENT_DETAILS", "repeat":false, "required":false, "truncatable":true, "dataType":"composite", "startIndex":-1, "length":-1, "components":[{"tag":"Measurement_dimension__coded", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Measurement_significance__coded", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Measurement_attribute__coded", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Measurement_attribute", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}]}, {"tag":"VALUE_RANGE", "repeat":false, "required":false, "truncatable":true, "dataType":"composite", "startIndex":-1, "length":-1, "components":[{"tag":"Measure_unit_qualifier", "required":true, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Measurement_value", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Range_minimum", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Range_maximum", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Significant_digits", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}]}, {"tag":"Surface_layer_indicator__coded", "repeat":false, "required":false, "truncatable":true, "dataType":"string", "startIndex":-1, "length":-1, "components":[]}]}, {"code":"CUX", "tag":"CURRENCIES", "truncatable":true, "minOccurances":0, "maxOccurances":5, "fields":[{"tag":"code", "repeat":false, "required":true, "truncatable":true, "dataType":"string", "startIndex":-1, "length":-1, "components":[]}, {"tag":"CURRENCY_DETAILS", "repeat":false, "required":false, "truncatable":true, "dataType":"composite", "startIndex":-1, "length":-1, "components":[{"tag":"Currency_details_qualifier", "required":true, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Currency__coded", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Currency_qualifier", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Currency_rate_base", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}]}, {"tag":"CURRENCY_DETAILS_1", "repeat":false, "required":false, "truncatable":true, "dataType":"composite", "startIndex":-1, "length":-1, "components":[{"tag":"Currency_details_qualifier", "required":true, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Currency__coded", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Currency_qualifier", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Currency_rate_base", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}]}, {"tag":"Rate_of_exchange", "repeat":false, "required":false, "truncatable":true, "dataType":"string", "startIndex":-1, "length":-1, "components":[]}, {"tag":"Currency_market_exchange__coded", "repeat":false, "required":false, "truncatable":true, "dataType":"string", "startIndex":-1, "length":-1, "components":[]}]}, {"code":"PRI", "tag":"PRICE_DETAILS", "truncatable":true, "minOccurances":0, "maxOccurances":9, "fields":[{"tag":"code", "repeat":false, "required":true, "truncatable":true, "dataType":"string", "startIndex":-1, "length":-1, "components":[]}, {"tag":"PRICE_INFORMATION", "repeat":false, "required":false, "truncatable":true, "dataType":"composite", "startIndex":-1, "length":-1, "components":[{"tag":"Price_qualifier", "required":true, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Price", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Price_type__coded", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Price_type_qualifier", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Unit_price_basis", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Measure_unit_qualifier", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}]}, {"tag":"Sub_line_price_change__coded", "repeat":false, "required":false, "truncatable":true, "dataType":"string", "startIndex":-1, "length":-1, "components":[]}]}, {"code":"NAD", "tag":"NAME_AND_ADDRESS", "truncatable":true, "minOccurances":0, "maxOccurances":9, "fields":[{"tag":"code", "repeat":false, "required":true, "truncatable":true, "dataType":"string", "startIndex":-1, "length":-1, "components":[]}, {"tag":"Party_qualifier", "repeat":false, "required":true, "truncatable":true, "dataType":"string", "startIndex":-1, "length":-1, "components":[]}, {"tag":"PARTY_IDENTIFICATION_DETAILS", "repeat":false, "required":false, "truncatable":true, "dataType":"composite", "startIndex":-1, "length":-1, "components":[{"tag":"Party_id__identification", "required":true, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Code_list_qualifier", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Code_list_responsible_agency__coded", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}]}, {"tag":"NAME_AND_ADDRESS", "repeat":false, "required":false, "truncatable":true, "dataType":"composite", "startIndex":-1, "length":-1, "components":[{"tag":"Name_and_address_line", "required":true, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Name_and_address_line_1", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Name_and_address_line_2", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Name_and_address_line_3", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Name_and_address_line_4", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}]}, {"tag":"PARTY_NAME", "repeat":false, "required":false, "truncatable":true, "dataType":"composite", "startIndex":-1, "length":-1, "components":[{"tag":"Party_name", "required":true, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Party_name_1", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Party_name_2", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Party_name_3", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Party_name_4", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Party_name_format__coded", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}]}, {"tag":"STREET", "repeat":false, "required":false, "truncatable":true, "dataType":"composite", "startIndex":-1, "length":-1, "components":[{"tag":"Street_and_number_p_o__box", "required":true, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Street_and_number_p_o__box_1", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Street_and_number_p_o__box_2", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Street_and_number_p_o__box_3", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}]}, {"tag":"City_name", "repeat":false, "required":false, "truncatable":true, "dataType":"string", "startIndex":-1, "length":-1, "components":[]}, {"tag":"Country_sub_entity_identification", "repeat":false, "required":false, "truncatable":true, "dataType":"string", "startIndex":-1, "length":-1, "components":[]}, {"tag":"Postcode_identification", "repeat":false, "required":false, "truncatable":true, "dataType":"string", "startIndex":-1, "length":-1, "components":[]}, {"tag":"Country__coded", "repeat":false, "required":false, "truncatable":true, "dataType":"string", "startIndex":-1, "length":-1, "components":[]}]}, {"code":"MOA", "tag":"MONETARY_AMOUNT", "truncatable":true, "minOccurances":0, "maxOccurances":9, "fields":[{"tag":"code", "repeat":false, "required":true, "truncatable":true, "dataType":"string", "startIndex":-1, "length":-1, "components":[]}, {"tag":"MONETARY_AMOUNT", "repeat":false, "required":true, "truncatable":true, "dataType":"composite", "startIndex":-1, "length":-1, "components":[{"tag":"Monetary_amount_type_qualifier", "required":true, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Monetary_amount", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Currency__coded", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Currency_qualifier", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Status__coded", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}]}]}, {"tag":"Segment_group_10", "minOccurances":1, "maxOccurances":9999, "segments":[{"code":"QTY", "tag":"QUANTITY", "truncatable":true, "minOccurances":1, "maxOccurances":1, "fields":[{"tag":"code", "repeat":false, "required":true, "truncatable":true, "dataType":"string", "startIndex":-1, "length":-1, "components":[]}, {"tag":"QUANTITY_DETAILS", "repeat":false, "required":true, "truncatable":true, "dataType":"composite", "startIndex":-1, "length":-1, "components":[{"tag":"Quantity_qualifier", "required":true, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Quantity", "required":true, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Measure_unit_qualifier", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}]}]}, {"code":"DTM", "tag":"DATE_TIME_PERIOD", "truncatable":true, "minOccurances":0, "maxOccurances":9, "fields":[{"tag":"code", "repeat":false, "required":true, "truncatable":true, "dataType":"string", "startIndex":-1, "length":-1, "components":[]}, {"tag":"DATE_TIME_PERIOD", "repeat":false, "required":true, "truncatable":true, "dataType":"composite", "startIndex":-1, "length":-1, "components":[{"tag":"Date_time_period_qualifier", "required":true, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Date_time_period", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Date_time_period_format_qualifier", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}]}]}]}, {"tag":"Segment_group_11", "minOccurances":0, "maxOccurances":99, "segments":[{"code":"CCI", "tag":"CHARACTERISTIC_CLASS_ID", "truncatable":true, "minOccurances":1, "maxOccurances":1, "fields":[{"tag":"code", "repeat":false, "required":true, "truncatable":true, "dataType":"string", "startIndex":-1, "length":-1, "components":[]}, {"tag":"Property_class__coded", "repeat":false, "required":false, "truncatable":true, "dataType":"string", "startIndex":-1, "length":-1, "components":[]}, {"tag":"MEASUREMENT_DETAILS", "repeat":false, "required":false, "truncatable":true, "dataType":"composite", "startIndex":-1, "length":-1, "components":[{"tag":"Measurement_dimension__coded", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Measurement_significance__coded", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Measurement_attribute__coded", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Measurement_attribute", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}]}, {"tag":"PRODUCT_CHARACTERISTIC", "repeat":false, "required":false, "truncatable":true, "dataType":"composite", "startIndex":-1, "length":-1, "components":[{"tag":"Characteristic_identification", "required":true, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Code_list_qualifier", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Code_list_responsible_agency__coded", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Characteristic", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Characteristic_1", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}]}]}, {"code":"MEA", "tag":"MEASUREMENTS", "truncatable":true, "minOccurances":0, "maxOccurances":99, "fields":[{"tag":"code", "repeat":false, "required":true, "truncatable":true, "dataType":"string", "startIndex":-1, "length":-1, "components":[]}, {"tag":"Measurement_application_qualifier", "repeat":false, "required":true, "truncatable":true, "dataType":"string", "startIndex":-1, "length":-1, "components":[]}, {"tag":"MEASUREMENT_DETAILS", "repeat":false, "required":false, "truncatable":true, "dataType":"composite", "startIndex":-1, "length":-1, "components":[{"tag":"Measurement_dimension__coded", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Measurement_significance__coded", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Measurement_attribute__coded", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Measurement_attribute", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}]}, {"tag":"VALUE_RANGE", "repeat":false, "required":false, "truncatable":true, "dataType":"composite", "startIndex":-1, "length":-1, "components":[{"tag":"Measure_unit_qualifier", "required":true, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Measurement_value", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Range_minimum", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Range_maximum", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Significant_digits", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}]}, {"tag":"Surface_layer_indicator__coded", "repeat":false, "required":false, "truncatable":true, "dataType":"string", "startIndex":-1, "length":-1, "components":[]}]}, {"code":"DTM", "tag":"DATE_TIME_PERIOD", "truncatable":true, "minOccurances":0, "maxOccurances":9, "fields":[{"tag":"code", "repeat":false, "required":true, "truncatable":true, "dataType":"string", "startIndex":-1, "length":-1, "components":[]}, {"tag":"DATE_TIME_PERIOD", "repeat":false, "required":true, "truncatable":true, "dataType":"composite", "startIndex":-1, "length":-1, "components":[{"tag":"Date_time_period_qualifier", "required":true, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Date_time_period", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Date_time_period_format_qualifier", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}]}]}]}]}]}]}, {"code":"CNT", "tag":"CONTROL_TOTAL", "truncatable":true, "minOccurances":0, "maxOccurances":99, "fields":[{"tag":"code", "repeat":false, "required":true, "truncatable":true, "dataType":"string", "startIndex":-1, "length":-1, "components":[]}, {"tag":"CONTROL", "repeat":false, "required":true, "truncatable":true, "dataType":"composite", "startIndex":-1, "length":-1, "components":[{"tag":"Control_qualifier", "required":true, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Control_value", "required":true, "truncatable":true, "dataType":"string", "subcomponents":[]}, {"tag":"Measure_unit_qualifier", "required":false, "truncatable":true, "dataType":"string", "subcomponents":[]}]}]}]};
    