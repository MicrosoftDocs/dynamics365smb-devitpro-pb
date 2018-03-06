---
title: "CAPTION Method (RecordRef)"
ms.custom: na
ms.date: 07/04/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamics365-financials
ms.assetid: fe9efbda-301d-4d38-9892-e527fa5d6e61
author: SusanneWindfeldPedersen
manager: edupont
---

[!INCLUDE[newdev_dev_preview](../includes/newdev_dev_preview.md)]

# CAPTION Method (RecordRef)
Gets the caption of the table that is currently selected. Returns an error if no table is selected.  
  
## Syntax  
  
```  
  
Caption := RecordRef.CAPTION  
```  
  
#### Parameters  
 *RecordRef*  
 Type: RecordRef  
  
 The RecordRef that identifies the table in which you are interested.  
  
## Property Value/Return Value  
 Type: Text  
  
 The caption of the table.  
  
## Remarks  
 This method works just like the [TABLECAPTION Method \(Record\)](devenv-TABLECAPTION-Method-Record.md).  
  
## Example  
 The following example selects tables 3 through 5 and opens each table as a RecordRef variable that is named MyRecordRef. The CAPTION method uses the RecorRef variable to retrieve the caption for each of the tables and displays the table number and the caption in a message box. The [CLOSE Method \(RecordRef\)](devenv-CLOSE-Method-RecordRef.md) closes the table. This example requires that you create the following global variables and text constant.  
  
|Variable name|DataType|  
|-------------------|--------------|  
|MyRecordRef|RecordRef|  
|varCaption|Text|  
|i|Integer|  
  
|Text constant name|DataType|ENU value|  
|------------------------|--------------|---------------|  
|Text000|Text|Table No: %1 Caption: %2|  
  
```  
FOR i := 3 TO 6 DO BEGIN  
MyRecordRef.OPEN(i);  
varCaption := MyRecordRef.CAPTION;  
MESSAGE(Text000, i, varCaption);  
MyRecordRef.CLOSE;  
END;  
```  
  
 This example displays the following:  
  
 **Table No: 3   Caption: Payment terms**  
  
 **Table No: 4   Caption: Currency**  
  
 **Table No: 5   Caption: Finance Charge Terms**  
  
## See Also  
 [RecordRef Data Type](../datatypes/devenv-RecordRef-Data-Type.md)