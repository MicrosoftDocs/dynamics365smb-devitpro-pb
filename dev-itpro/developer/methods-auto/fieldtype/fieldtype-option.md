---
title: "FieldType System Option"
ms.author: solsen
ms.custom: na
ms.date: 11/23/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# FieldType Option Type
> **Version**: _Available from runtime version 1.0._

Represents the type of a table field.

## Members
|  Member  |  Description  |
|----------------|---------------|
|Boolean|Assumes the values true or false. When formatted, a Boolean field is shown as "Yes" or "No". The size of the corresponding SQL data type, TINYINT, is 1 byte.|
|Integer|Denotes an integer between -2,147,483,647 and 2,147,483,647. The size of the corresponding SQL data type, INTEGER, is 4 bytes.|
|BigInteger|A 64-bit integer.|
|Decimal|A decimal number between -10^63 and 10^63. The exponent ranges from -63 to 63. Decimal numbers are held in memory with 18 significant digits. The representation of a decimal number is a Binary Coded Decimal (BCD). The size of the corresponding SQL data type, DECIMAL(38,20), is 17 bytes. We recommend that you construct decimals that operate on numbers in the range of +/- 999,999,999,999,999.99. You can construct larger numbers in some cases, but overflow, truncation or loss of precision can occur.|
|Option|An option field is defined by using an option string, which is a comma-separated list of strings that represent each valid value of the field. This string is used when a field of type Option is formatted and its value is converted into a string.|
|Text|Any alphanumeric string. The field must be defined to be between 1 and 250 characters. The number of bytes used by a text field equals (number of characters + 1) * 2. The additional character is used for the string terminating character, which is '0' in Unicode. The size of a Unicode character is 2 bytes. Therefore, you multiply the number of characters by two to get the size.|
|Code|An alphanumeric string, which is right-justified if the contents are numbers only. If letters or blanks occur among the numbers, the contents are left-aligned. All letters are converted to uppercase upon entry.|
|DateTime|Represents a point in time as a combined date and time. The datetime is stored in the database as Coordinated Universal Time (UTC) and is always displayed as local time in Dynamics 365 Business Central.|
|Time|Any time in the range 00:00:00 to 23:59:59.999. A time field contains 1 plus the number of milliseconds since 00:00:00 o'clock, or 0 (zero), an undefined time.|
|Date|A date value in the range from January 1, 1753 to December 31, 9999. An undefined date is expressed as 0. All dates have a corresponding closing date. The system considers the closing date for a given date as a period that follows the given date but comes before the next normal date; that is, a closing date is sorted immediately after the corresponding normal date but before the next normal date.|
|DateFormula|Used to verify the date entered by the user.|
|Duration|Represents the difference between two points in time, in milliseconds. This value can be negative.|
|Guid|Globally unique identifier (GUID).|
|RecordId|Unique record identifier.|
|TableFilter|This data type is used to apply a filter to another table. Currently, this can only be used to apply security filters from the Permission table.|
|Blob|Binary Large Object. Used to store bitmaps and memos. Notice that the BLOB is not stored in the record, but in the BLOB area of the table.|
|Media|A complex type that encapsulates media files, such as image .jpg and .png files, in application database tables. The Media data type can be used as a table field data type, but cannot be used as a variable or parameter.|
|MediaSet|A complex type that encapsulates media, such as images, in application database tables. The MediaSet data type can be used as a table field data type, but cannot be used as variable or parameter.|

[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)  