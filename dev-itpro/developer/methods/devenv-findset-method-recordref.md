---
title: "FINDSET Method (RecordRef)"
ms.custom: na
ms.date: 07/13/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamics365-financials
ms.assetid: 73e1cf73-5ced-435d-b6c5-0898bee1d49d
caps.latest.revision: 11
manager: edupont
---

[!INCLUDE[newdev_dev_preview](../includes/newdev_dev_preview.md)]

# FINDSET Method (RecordRef)
Finds a set of records in a table based on the current key and filter. FINDSET can only retrieve records in ascending order.  
  
## Syntax  
  
```  
  
[Ok :=] RecordRef.FINDSET([ForUpdate][,UpdateKey])  
```  
  
#### Parameters  
 *RecordRef*  
 Type: RecordRef  
  
 The RecordRef that refers to the table in which you want to find the set of records.  
  
 If the record is found, it is returned in *RecordRef* and any [FlowFields](../devenv-flowfields.md) in the record are set to zero. You must update any FlowFields using [CALCFIELDS Method \(Record\)](devenv-CALCFIELDS-Method-Record.md).  
  
 If the record is not found and if you omitted the return value, a run-time error occurs.  
  
 *ForUpdate*  
 Type: Boolean  
  
 Set this parameter to **false** if you do not want to modify any records in the set. Set this parameter to **true** if you want to modify records in the set.  
  
 If you set this parameter to **true**, the [LOCKTABLE Method \(RecordRef\)](devenv-LOCKTABLE-Method-RecordRef.md) is immediately performed on the table before the records are read.  
  
 *UpdateKey*  
 Type: Boolean  
  
 This parameter only applies if *ForUpdate* is **true**.  
  
 If you are going to modify any field value within the current key, set this parameter to **true**.  
  
## Property Value/Return Value  
 Type: Boolean  
  
 **true** if the record set was found; otherwise, **false**.  
  
 If you omit this optional return value and if the record cannot be found, a run-time error occurs. If you include a return value, it is assumed that you will handle any errors.  
  
## Remarks  
 You should use this method only when you explicitly want to loop through a recordset. You should only use this method in combination with REPEAT..UNTIL.  
  
 Furthermore, FINDSET only allows you to loop through the recordset from the top down. If you want to loop from the bottom up, you should use FIND\(‘+’\).  
  
 The general rules for using FINDSET are the following:  
  
-   FINDSET\(FALSE,FALSE\) - Read-only. This uses no server cursors and the record set is read with a single server call.  
  
-   FINDSET\(TRUE,FALSE\) - This is used to update non-key fields. This uses a cursor with a fetch buffer similar to FIND\(‘-’\).  
  
-   FINDSET\(TRUE,TRUE\) - This is used to update key fields.  
  
 This method is designed to optimize finding and updating sets. If you set any or both of the parameters to **false**, you can still modify the records in the set but these updates will not be performed optimally.  
  
 This method works the same way as the [FINDSET Method \(Record\)](devenv-FINDSET-Method-Record.md).  
  
## Example  
 The following example opens table 18 \(Customer\) as a RecordRef variable that is named MyRecordRef. The [FIELD Method \(RecordRef\)](devenv-FIELD-Method-RecordRef.md) creates a FieldRef variable that is named MyFieldRef with the first field \(No.\). The [SETFILTER Method \(FieldRef\)](devenv-SETFILTER-Method-FieldRef.md) uses the MyFieldRef variable to set a filter that selects records from 30000 to 32000. `MyRecordRef.FIELD(2)` creates a FieldRef for the second field \(Name\). The FINDSET method finds the set of records based on the key and the filters that have been set. The *ForUpdate* parameters and *UpdateKeys* are both set to **FALSE**. This makes the records in the set read-only. The record ID and name of each customer in the record set is displayed in a message box until no records are left in the record set. The following example requires that you create the following global variables and text constant.  
  
|Variable name|DataType|  
|-------------------|--------------|  
|MyRecordRef|RecordRef|  
|MyFieldRef|FieldRef|  
  
|Text constant name|DataType|ENU value|  
|------------------------|--------------|---------------|  
|Text000|Text|%1: "%2" is found in the set of records.|  
  
```  
  
MyRecordRef.OPEN(18);  
MyFieldRef := MyRecordRef.FIELD(1);  
MyFieldRef.SETFILTER('30000..32000');  
MyFieldRef := MyRecordRef.FIELD(2);  
IF MyRecordRef.FINDSET(FALSE, FALSE) THEN BEGIN  
  REPEAT  
    MESSAGE(Text000 , MyRecordRef.RECORDID, MyFieldRef.VALUE);  
  UNTIL MyRecordRef.NEXT = 0;  
END;  
```  
  
## See Also  
 [RecordRef Data Type](../datatypes/devenv-RecordRef-Data-Type.md)   
 [FIND Method \(RecordRef\)](devenv-FIND-Method-RecordRef.md)   
 [FINDFIRST Method \(RecordRef\)](devenv-FINDFIRST-Method-RecordRef.md)   
 [FINDLAST Method \(RecordRef\)](devenv-FINDLAST-Method-RecordRef.md)