---
title: "ChangeCompany Method"
ms.author: solsen
ms.custom: na
ms.date: 04/15/2020
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
# ChangeCompany Method
Redirects references to table data from one company to another.


## Syntax
```
[Ok := ]  RecordRef.ChangeCompany([CompanyName: String])
```
## Parameters
*RecordRef*  
&emsp;Type: [RecordRef](recordref-data-type.md)  
An instance of the [RecordRef](recordref-data-type.md) data type.  

*CompanyName*  
&emsp;Type: [String](../string/string-data-type.md)  
The name of the company to which you want to change. If you omit this parameter, you change back to the current company.  


## Return Value
*Ok*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
**true** if the operation was successful; otherwise **false**.  If you omit this optional return value and the operation does not execute successfully, a runtime error will occur.    


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks  
When executing this method, the user's access rights are respected. For example, a user cannot access data in *CompanyName* unless he already has the necessary access rights.  

The **CHANGECOMPANY** method is not affected by the [RESET Method (RecordRef)](recordref-reset-method.md). You can deselect a company by making a new call to **CHANGECOMPANY** or by using the [CLEAR Method](../system/system-clear-joker-method.md).  

Global filters always belong to a specific company. If you use the following code to select the company named NewCompany, any filters assigned to *RecordRef* will be transferred to *RecordRef* in the new company.  

```  
RecordRef.CHANGECOMPANY(NewCompany);  
```  

Even if you run the **CHANGECOMPANY** method, triggers still run in the current company, not in the company that you specified in the **CHANGECOMPANY** method.  

## Example  
This example shows how to use the **CHANGECOMPANY** method. The following code takes a RecordRef to table **18 Customer** in the current company and redirects it to the table in another company \(in this case Company B\). The last record in the Customer table of Company B is then deleted.  

```
var
    RecID: RecordID;
    MyRecordRef: RecordRef;
    Text000: Label 'Record to be deleted: %1';
begin
    MyRecordRef.OPEN(18);  
    MyRecordRef.CHANGECOMPANY('Company B');  
    MyRecordRef.FINDLAST;  
    RecID := MyRecordRef.RECORDID;  
    MESSAGE(Text000, RecID);  
    MyRecordRef.DELETE;  
end;
```  

## See Also
[RecordRef Data Type](recordref-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)