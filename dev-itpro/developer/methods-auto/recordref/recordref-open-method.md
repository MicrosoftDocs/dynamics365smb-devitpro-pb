---
title: "Open Method"
ms.author: solsen
ms.custom: na
ms.date: 08/12/2020
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
# Open Method
Causes a RecordRef variable to refer to a table, which is identified by its number in a particular company.


## Syntax
```
 RecordRef.Open(No: Integer [, Temp: Boolean] [, CompanyName: String])
```
## Parameters
*RecordRef*  
&emsp;Type: [RecordRef](recordref-data-type.md)  
An instance of the [RecordRef](recordref-data-type.md) data type.  

*No*  
&emsp;Type: [Integer](../integer/integer-data-type.md)  
The number of the table.  
*Temp*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
  
*CompanyName*  
&emsp;Type: [String](../string/string-data-type.md)  
The name of the company to which you want to change. If you omit this parameter, the current company is used.  



[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks  
 When you use the RecordRef.OPEN method a new object is created. This object contains references to the open table, filters, and the record itself and all the fields it contains. You can open a table by using the table number or the name of the table that represents the table number. For example, you open the Customer table by using following syntax: `RecordRef.Open(18)` or `RecordRef.Open(DATABASE::Customer)`  
  
 If you use the *CompanyName* parameter, then this method works the same as the [CHANGECOMPANY Method \(Record\)](../../methods/devenv-changecompany-method-record.md).  

## Limitations 
 In the development settings, you can specify the allowed target level when publishing the extension, which includes the following options; Internal, Extension, Solution, and Personalization. When you set the **target** as `OnPrem`, this allows you to access all the table data with no restrictions. However, you cannot publish the extension to the AppSource. <!-- For more information, see [Development Settings](../../configuring-microsoft-dynamics-nav-server.md#development-settings). -->
 
 For [!INCLUDE[d365fin_long_md](../../includes/d365fin_long_md.md)], you must set the **target** as `Cloud` to publish your extension to the AppSource. However, when you use this setting with the RecordRef data type, some system and virtual tables are blocked with the ids that extend `2000000000+`. Therefore, you must declare the records explicitly as a record variable. For example: 
```
var r : record 2000000006;
```
## Example  
 The following example uses the OPEN method to create a RecordRef variable that is named MyRecordRef for the Customer table. The parameters are omitted in this example because there is only one company in this example and the table will not be open as temporary table. The caption and number of records in the table are displayed in a message box. At the end of the display, the [CLOSE Method \(RecordRef\)](recordref-close-method.md) closes the table. 

```  
var
    MyRecordRef: RecordRef;
    Text000: Label 'The %1 table contains %2 records.'; 
begin    
    MyRecordRef.OPEN(DATABASE::Customer);  
    MESSAGE(Text000, MyRecordRef.CAPTION, MyRecordRef.COUNT);  
    MyRecordRef.CLOSE;  
end;
```  
  
## Example  
 This example shows how to use the OPEN method. In this example, "MyRecordRef" opens table 27 and then "FIND\('-'\)" finds the first record in the table. "TempMyRecordRef" opens a temporary table which is empty and therefore the "FIND\('-'\)" returns false.
  
```  
var
    MyRecordRef: RecordRef;
    TempMyRecordRef: RecordRef;
begin  
    MyRecordRef.OPEN(27,FALSE);  
    TempMyRecordRef.OPEN(27,TRUE);  
      
    if MyRecordRef.FIND('-') then // This is true and will find the first record in the table.  
      MESSAGE('MyRecordRef finds')  
    else  
      MESSAGE('MyRecordRef does not find');  
      
    if TempMyRecordRef.FIND('-') then // This is false because there are no records in a temporary table.  
      MESSAGE('TempMyRecordRef finds')  
    else  
      MESSAGE('TempMyRecordRef does not find');  
end;
```  

## See Also
[RecordRef Data Type](recordref-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)