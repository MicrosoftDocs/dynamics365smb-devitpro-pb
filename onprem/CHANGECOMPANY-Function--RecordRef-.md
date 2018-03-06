---
title: "CHANGECOMPANY Function (RecordRef)"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 19dd10ea-7410-4e4c-82ae-fc03dcf70ccd
caps.latest.revision: 3
---
# CHANGECOMPANY Function (RecordRef)
Redirects references to table data from one company to another.  
  
## Syntax  
  
```  
  
[Ok :=] RecordRef.CHANGECOMPANY([CompanyName])  
```  
  
#### Parameters  
 *RecordRef*  
 Type: RecordRef  
  
 The RecordRef that refers to the record that you want to access from a table in another company.  
  
 *CompanyName*  
 Type: Text or code  
  
 The name of the company to which you want to change. If you omit this parameter, you change back to the current company.  
  
## Property Value/Return Value  
 Type: Boolean  
  
 **true** if the company was found; otherwise, **false**.  
  
 If you omit this optional return value and the company cannot be found, a run-time error occurs. If you include the return value, you must handle any errors.  
  
## Remarks  
 When executing this function, the user's access rights are respected. For example, a user cannot access data in *CompanyName* unless he already has the necessary access rights.  
  
 The **CHANGECOMPANY** function is not affected by the [RESET Function \(RecordRef\)](RESET-Function--RecordRef-.md). You can deselect a company by making a new call to **CHANGECOMPANY** or by using the [CLEAR Function](CLEAR-Function.md).  
  
 Global filters always belong to a specific company. If you use the following code to select the company named NewCompany, any filters assigned to *RecordRef* will be transferred to *RecordRef* in the new company.  
  
```  
RecordRef.CHANGECOMPANY(NewCompany);  
```  
  
 Even if you run the **CHANGECOMPANY** function, triggers still run in the current company, not in the company that you specified in the **CHANGECOMPANY** function.  
  
## Example  
 This example shows how to use the **CHANGECOMPANY** function. The following code takes a RecordRef to table **18 Customer** in the current company and redirects it to the table in another company \(in this case Company B\). The last record in the Customer table of Company B is then deleted.  
  
 This example requires that you create the following variables and text constant in the **C/AL Globals** window  
  
|Variable name|DataType|  
|-------------------|--------------|  
|MyRecordRef|RecordRef|  
|RecID|RecordID|  
  
|Text constant name|DataType|ENU value|  
|------------------------|--------------|---------------|  
|Text000|Text|Record to be deleted: %1|  
  
```  
MyRecordRef.OPEN(18);  
MyRecordRef.CHANGECOMPANY('Company B');  
MyRecordRef.FINDLAST;  
RecID := MyRecordRef.RECORDID;  
MESSAGE(Text000, RecID);  
MyRecordRef.DELETE;  
```  
  
## See Also  
 [RecordRef Data Type](RecordRef-Data-Type.md)