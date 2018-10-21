---
title: "GetView Method"
ms.author: solsen
ms.custom: na
ms.date: 10/17/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# GetView Method
Gets a string that describes the current sort order, key, and filters on a table.

## Syntax
```
String :=   Table.GetView([UseNames: Boolean])
```
## Parameters
*Table*  
&emsp;Type: [Table](table-data-type.md)  
An instance of the [Table](table-data-type.md) data type.  

*UseNames*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
  


## Return Value
*String*  
&emsp;Type: [String](../string/string-data-type.md)  
  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks  
 If the [SETVIEW Method \(Record\)](devenv-SETVIEW-Method-Record.md) has been executed, then the method will return the value that is set by **SETVIEW**.  
  
## Example  
 The following example uses the **GETVIEW** method to retrieve the key, the current sort order, and the filters that are set on the CustomerRec record in the **Customer** table. The method starts by returning the current key on which the **Customer** table is sorted. No., which is the field caption, is returned because the *UseCaptions* parameter is omitted. The key is stored in the ViewString variable and displayed in a message box. The sort key is then changed to the Name field and a filter that selects records with No. field values between 10000 and 20000 is set by using the [SETVIEW Method \(Record\)](devenv-SETVIEW-Method-Record.md). The method returns the keys, sort order, and filter again. The return value is stored in the ViewString variable and displayed in a message box. The values that are displayed are Name, Addrees, and City, for the WHERE No.= FILTER\(10000…20000\) filter. Finally, the method displays the field numbers instead of the captions because *UseCaptions* is set to **false**. The sort order that is displayed is Field2, Field5 and Field7 instead of the field names. The filter is also displayed. This example requires that you create the following global variables.  
  
|Variable name|DataType|Subtype|  
|-------------------|--------------|-------------|  
|CustomerRec|Record|Customer|  
|ViewString|Text|Not applicable|  
  
```  
ViewString := CustomerRec.GETVIEW;  
MESSAGE('The string:%1', ViewString);  
CustomerRec.SETVIEW('SORTING(Name) ORDER(Ascending) WHERE(No.=CONST(10000..20000))');  
ViewString := CustomerRec.GETVIEW;  
MESSAGE('The string:%1', ViewString);  
ViewString := CustomerRec.GETVIEW(FALSE);  
MESSAGE('The string:%1', ViewString);  
```  
  

## See Also
[Table Data Type](table-data-type.md)  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)