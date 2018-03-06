---
title: "DELETELINK Function (RecordRef)"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 6fb5c133-93a6-46d9-a1b9-f93abc07cae5
caps.latest.revision: 14
manager: edupont
---
# DELETELINK Function (RecordRef)
Deletes a specified link from a record in a table.  
  
## Syntax  
  
```  
  
RecordRef.DELETELINK(ID)  
```  
  
#### Parameters  
 *ID*  
 Type: Integer  
  
 The ID of the link you want to delete.  
  
## Remarks  
 When you add a link to a page or a table, an entry is created in the Record Link system table. Each entry is given an ID. This ID is specified as a parameter in the DELETELINK function.  
  
## Example  
 The following example deletes a link from a customer record in the Customer table. The code starts by opening table 18 \(Customer\) as a RecordRef variable that is named CustomerRecref. The [FIELD Function \(RecordRef\)](FIELD-Function--RecordRef-.md) creates a FieldRef variable that is named MyFieldRef for the first field in the table \(No.\). `MyFieldRef.VALUE` selects record 01121212 from the No. field. This record is initialized in the CustomerNum variable. The [FIND Function \(RecordRef\)](FIND-Function--RecordRef-.md) searches for record 01121212. If the record is found, the DELETELINK function deletes the link that is specified in the varLinkid variable. A message that states that the link is deleted is displayed in a message box. You can verify that the link is deleted in the **Links** FactBox on the Customer List or Customer Card pages. This example requires that you create the following variables and text constants in the **C/AL Globals** window.  
  
|Variable name|DataType|  
|-------------------|--------------|  
|CustomerNum|Integer|  
|varLinkid|Integer|  
|CustomerRecref|RecordRef|  
|MyFieldRef|FieldRef|  
  
|Text constant name|DataType|ENU value|  
|------------------------|--------------|---------------|  
|Text000|Text|The link with id %1 is deleted.|  
|Text001|Text|The customer cannot be found.|  
  
```  
  
CustomerNum := '01121212';  
varLinkid := 21;  
CustomerRecref.OPEN(18);  
MyFieldRef := CustomerRecref.FIELD(1);  
MyFieldRef.VALUE := CustomerNum;  
IF CustomerRecref.FIND('=') THEN BEGIN  
  CustomerRecref.DELETELINK(varLinkid);  
  MESSAGE(Text000, varLinkid);  
END  
ELSE  
  MESSAGE(Text001);  
  
```  
  
## See Also  
 [RecordRef Data Type](RecordRef-Data-Type.md)