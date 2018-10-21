---
title: "ChangeCompany Method"
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
# ChangeCompany Method
Redirects references to table data from one company to another.

## Syntax
```
[Ok := ]  Table.ChangeCompany([CompanyName: String])
```
## Parameters
*Table*  
&emsp;Type: [Table](table-data-type.md)  
An instance of the [Table](table-data-type.md) data type.  

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
  
 The **CHANGECOMPANY** method is not affected by the [RESET Method \(Record\)](devenv-RESET-Method-Record.md). You can deselect a company by making a new call to **CHANGECOMPANY** or by using the [CLEAR Method](devenv-CLEAR-Method.md).  
  
 Global filters always belong to a specific company. If you use the following code to select the company named NewCompany, any filters assigned to *Record* will be transferred to *Record* in the new company.  
  
```  
Record.CHANGECOMPANY(NewCompany);  
```  
  
 Even if you run the **CHANGECOMPANY** method, triggers still run in the current company, not in the company that you specified in the **CHANGECOMPANY** method.  
  
## Example  
 This example shows how to use the **CHANGECOMPANY** method.  
  
```  
"G/L Account".CHANGECOMPANY('New Company');  
"G/L Account".GET('1000');  
"G/L Account".CALCFIELDS(Balance); // Calculates the balance  
// for account no. 1000 in 'New Company'  
"G/L Entry".CHANGECOMPANY('New Company');  
"G/L Entry".SETCURRENTKEY("Entry No.","Posting Date");  
"G/L Entry".SETRANGE("Entry No.",1000);  
"G/L Entry".SETRANGE("Posting Date",010196D,013196D);  
"G/L Entry".CALCSUMS(Amount); // Sums Amount from  
// all G/L entries on account no. 1000 within the specified range,  
// for 'New Company'  
"G/L Entry".RESET;  
"G/L Entry".FIND('+'); // Finds the largest "No." in the G/L Entry   
// table in 'New Company'  
"G/L Entry".DELETE; // Deletes this entry in 'New Company'  
```  
  
 This example shows that after the **CHANGECOMPANY** method has been called, all future references to the G/L Account and G/L Entry tables will refer to the table data in New Company.  
  
## Example  
 This example shows that CHANGECOMPANY only changes the company on a data level. Triggers and methods will still run in the context of the current company.  
  
```  
Rec.CHANGECOMPANY('B');  
Rec.FINDFIRST;  
Rec.MODIFY(TRUE);  
```  
  
 If you run the code in this example from Company A, it will modify Rec in Company B, but it will run the OnModify trigger in Company A.  
  

## See Also
[Table Data Type](table-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)