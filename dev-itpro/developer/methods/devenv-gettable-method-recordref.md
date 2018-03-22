---
title: "GETTABLE Method (RecordRef)"
ms.custom: na
ms.date: 07/13/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamics365-financials
ms.assetid: 02713004-d111-47b8-8a06-569ef84599f9
caps.latest.revision: 8
---

[!INCLUDE[newdev_dev_preview](../includes/newdev_dev_preview.md)]

# GETTABLE Method (RecordRef)
Gets the table of a Record variable and causes the RecordRef to refer to the same table.  
  
## Syntax  
  
```  
  
RecordRefVar.GETTABLE(RecordVar)  
```  
  
#### Parameters  
 *RecordRefVar*  
 Type: RecordRef  
  
 The RecordRef for which you want to specify a table.  
  
 *RecordVar*  
 Type: Record  
  
 Use this record variable to specify the table to which the *RecordRefVar* refers.  
  
## Remarks  
 Any filters that are applied to the *RecordVar* are also applied to the *RecordRefVar*.  
  
 Another way to select the table to which a RecordRef refers is to use the [OPEN Method \(RecordRef\)](devenv-OPEN-Method-RecordRef.md) and specify a table number in the parameters.  
  
## Example  
 The following example is an excerpt from codeunit 8, AccSchedManagement. It iterates through records in the G/L Account table. It sets some values on the fields of a new record in the Acc. Schedule Line table based on the current G/L Account record and inserts the new record into the Acc. Schedule Line table. It calls GETTABLE to cause a RecordRef variable to refer to the same table as the new Acc. Schedule Line record, and then calls the LogInsertion method from codeunit 423, Change Log Management to log the change. The LogInsertion method requires a RecordRef as a parameter.  
  
 This example requires that you create the following variables.  
  
|Variable name|DataType|Subtype|  
|-------------------|--------------|-------------|  
|AccSchedLine|Record|Acc. Schedule Line|  
|AccSchedLineNo|Integer|Not applicable|  
|GLAcc|Record|G/L Account|  
|RecRef|RecordRef|Not applicable|  
|ChangeLogMgt|Codeunit|Change Log Management|  
  
 This example assumes that the AccSchedLineNo variable has been assigned a value previously in the code.  
  
```  
IF GLAcc.FIND('-') THEN  
  REPEAT  
    AccSchedLine.INIT;  
    AccSchedLine."Line No." := AccSchedLineNo;  
    AccSchedLineNo := AccSchedLineNo + 10000;  
    AccSchedLine.Description := GLAcc.Name;  
    IF GLAcc."Account Type" IN [GLAcc."Account Type"::Posting,GLAcc."Account Type"::Total,GLAcc."Account Type"::"End-Total"] THEN BEGIN  
      AccSchedLine.Totaling := GLAcc."No.";  
      AccSchedLine."Row No." := COPYSTR(GLAcc."No.",1,MAXSTRLEN(AccSchedLine."Row No."));  
    END;  
    IF GLAcc."Account Type" IN [GLAcc."Account Type"::Total,GLAcc."Account Type"::"End-Total"] THEN  
      AccSchedLine."Totaling Type" := AccSchedLine."Totaling Type"::"Total Accounts"  
    ELSE  
      AccSchedLine."Totaling Type" := AccSchedLine."Totaling Type"::"Posting Accounts";  
    AccSchedLine.INSERT;  
    RecRef.GETTABLE(AccSchedLine);  
    ChangeLogMgt.LogInsertion(RecRef);  
  UNTIL GLAcc.NEXT = 0;  
```  
  
## See Also  
 [RecordRef Data Type](../datatypes/devenv-RecordRef-Data-Type.md)   
 [SETTABLE Method \(RecordRef\)](devenv-SETTABLE-Method-RecordRef.md)