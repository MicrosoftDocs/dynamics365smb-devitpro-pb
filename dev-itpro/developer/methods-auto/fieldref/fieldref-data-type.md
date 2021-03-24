---
title: "FieldRef Data Type"
ms.author: solsen
ms.custom: na
ms.date: 02/15/2021
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# FieldRef Data Type
> **Version**: _Available or changed with runtime version 1.0._

Identifies a field in a table and gives you access to this field.



The following methods are available on instances of the FieldRef data type.

|Method name|Description|
|-----------|-----------|
|[Active()](fieldref-active-method.md)|Checks whether the field that is currently selected is enabled.|
|[CalcField()](fieldref-calcfield-method.md)|Updates FlowFields in a record.|
|[CalcSum()](fieldref-calcsum-method.md)|Calculates the total of all values of a SumIndexField in a table.|
|[Caption()](fieldref-caption-method.md)|Gets the current caption of a field as a String.|
|[Class()](fieldref-class-method.md)|Gets the value of the FieldClass Property of the field that is currently selected. This method returns an error if no field is selected.|
|[EnumValueCount()](fieldref-enumvaluecount-method.md)|Gets the number of Enum values (or Option members) from the Enum metadata for the field that is currently selected.|
|[FieldError([String])](fieldref-fielderror-method.md)|Stops the execution of the code, causing a run-time error, and creates an error message for a field.|
|[GetEnumValueCaption(Integer)](fieldref-getenumvaluecaption-method.md)|Gets an Enum value (or Option member) caption for the from the Enum metadata for the field that is currently selected.|
|[GetEnumValueCaptionFromOrdinalValue(Integer)](fieldref-getenumvaluecaptionfromordinalvalue-method.md)|Gets an Enum value (or Option member) caption for the from the Enum metadata for the field that is currently selected.|
|[GetEnumValueName(Integer)](fieldref-getenumvaluename-method.md)|Gets an Enum value (or Option member) name from the Enum metadata for the field that is currently selected.|
|[GetEnumValueNameFromOrdinalValue(Integer)](fieldref-getenumvaluenamefromordinalvalue-method.md)|Gets an Enum value (or Option member) name from the Enum metadata for the field that is currently selected.|
|[GetEnumValueOrdinal(Integer)](fieldref-getenumvalueordinal-method.md)|Gets the Enum value (or Option member) ordinal value from the Enum metadata for the field that is currently selected.|
|[GetFilter()](fieldref-getfilter-method.md)|Gets the filter that is currently applied to the field referred to by FieldRef.|
|[GetRangeMax()](fieldref-getrangemax-method.md)|Gets the maximum value in a range for a field.|
|[GetRangeMin()](fieldref-getrangemin-method.md)|Gets the minimum value in a range for a field.|
|[Length()](fieldref-length-method.md)|Gets the maximum size of the field (the size specified in the DataLength property of the field). This method is usually used for finding the defined length of code and text fields.|
|[Name()](fieldref-name-method.md)|Gets the name of a field as a string.|
|[Number()](fieldref-number-method.md)|Gets the number of a field as an integer.|
|[OptionCaption()](fieldref-optioncaption-method.md)|Gets the option caption of the field that is currently selected.|
|[OptionMembers()](fieldref-optionmembers-method.md)|Gets the list of options that are available in the field that is currently selected.|
|[OptionString()](fieldref-optionstring-method.md)|The 'OptionString' property has been deprecated and will be removed in the future. Use the 'OptionMembers' property instead.|
|[Record()](fieldref-record-method.md)|Gets the RecordRef of the field that is currently selected. This method returns an error if no field is selected.|
|[Relation()](fieldref-relation-method.md)|Finds the table relationship of a given field.|
|[SetFilter(String [, Any,...])](fieldref-setfilter-method.md)|Assigns a filter to a field that you specify.|
|[SetRange([Any] [, Any])](fieldref-setrange-method.md)|Sets a simple filter on a field, such as a single range or a single value.|
|[TestField()](fieldref-testfield--method.md)|Determines whether the contents of a field matches a given value. If the contents differ from the given value, an error message is displayed.|
|[TestField(Byte)](fieldref-testfield-byte-method.md)|Determines whether the contents of a field matches a given value. If the contents differ from the given value, an error message is displayed.|
|[TestField(Boolean)](fieldref-testfield-boolean-method.md)|Determines whether the contents of a field matches a given value. If the contents differ from the given value, an error message is displayed.|
|[TestField(Char)](fieldref-testfield-char-method.md)|Determines whether the contents of a field matches a given value. If the contents differ from the given value, an error message is displayed.|
|[TestField(Option)](fieldref-testfield-option-method.md)|Determines whether the contents of a field matches a given value. If the contents differ from the given value, an error message is displayed.|
|[TestField(Integer)](fieldref-testfield-integer-method.md)|Determines whether the contents of a field matches a given value. If the contents differ from the given value, an error message is displayed.|
|[TestField(BigInteger)](fieldref-testfield-biginteger-method.md)|Determines whether the contents of a field matches a given value. If the contents differ from the given value, an error message is displayed.|
|[TestField(Decimal)](fieldref-testfield-decimal-method.md)|Determines whether the contents of a field matches a given value. If the contents differ from the given value, an error message is displayed.|
|[TestField(Guid)](fieldref-testfield-guid-method.md)|Determines whether the contents of a field matches a given value. If the contents differ from the given value, an error message is displayed.|
|[TestField(String)](fieldref-testfield-string-method.md)|Determines whether the contents of a field matches a given value. If the contents differ from the given value, an error message is displayed.|
|[TestField(Label)](fieldref-testfield-label-method.md)|Determines whether the contents of a field matches a given value. If the contents differ from the given value, an error message is displayed.|
|[TestField(Text)](fieldref-testfield-text-method.md)|Determines whether the contents of a field matches a given value. If the contents differ from the given value, an error message is displayed.|
|[TestField(Code)](fieldref-testfield-code-method.md)|Determines whether the contents of a field matches a given value. If the contents differ from the given value, an error message is displayed.|
|[TestField(Date)](fieldref-testfield-date-method.md)|Determines whether the contents of a field matches a given value. If the contents differ from the given value, an error message is displayed.|
|[TestField(DateTime)](fieldref-testfield-datetime-method.md)|Determines whether the contents of a field matches a given value. If the contents differ from the given value, an error message is displayed.|
|[TestField(Time)](fieldref-testfield-time-method.md)|Determines whether the contents of a field matches a given value. If the contents differ from the given value, an error message is displayed.|
|[TestField(Variant)](fieldref-testfield-variant-method.md)|Determines whether the contents of a field matches a given value. If the contents differ from the given value, an error message is displayed.|
|[TestField(Enum)](fieldref-testfield-anyenum-method.md)|Determines whether the contents of a field matches a given value. If the contents differ from the given value, an error message is displayed.|
|[TestField(Any)](fieldref-testfield-joker-method.md)|Determines whether the contents of a field matches a given value. If the contents differ from the given value, an error message is displayed.|
|[Type()](fieldref-type-method.md)|Gets the data type of the field that is currently selected.|
|[Validate([Any])](fieldref-validate-method.md)|Use this method to enter a new value into a field and have the new value validated by the properties and code that have been defined for that field.|
|[Value([Any])](fieldref-value-method.md)|Sets or gets the value of the field that is currently selected. This method returns an error if no field is selected.|

[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)  
