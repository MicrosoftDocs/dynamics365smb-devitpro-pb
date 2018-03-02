---
title: "CURRENTKEYINDEX Method (RecordRef)"
ms.custom: na
ms.date: 07/13/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamics365-financials
ms.assetid: f971359f-6bc8-46ad-9184-334f6e8e5b8e
author: SusanneWindfeldPedersen
manager: edupont
---

[!INCLUDE[newdev_dev_preview](../includes/newdev_dev_preview.md)]

# CURRENTKEYINDEX Method (RecordRef)
Gets or sets the current key of the table referred to by the *RecordRef*. The current key is set or returned as a number. This first key = 1, and so on.  
  
> [!WARNING]  
>  If *RecordRef* does not have an active record, CURRENTKEYINDEX will return -1. If this value is then passed to KEYINDEX, an index out of bounds error will occur. Therefore it is important to implement a check of the *RecordRef* parameter.  
  
## Syntax  
  
```  
  
[CurrKeyIndex :=] RecordRef.CURRENTKEYINDEX([NewKeyIndex])  
```  
  
#### Parameters  
 *RecordRef*  
 Type: RecordRef  
  
 *NewKeyIndex*  
 Type: Integer  
  
 The number of the new key.  
  
## Property Value/Return Value  
 Type: Integer  
  
 The number of the current key.  
  
## Example  
 The following example loops through four tables \(36-39\) opens each table as a RecordRef variable that is named MyRecordRef. The CURRENTKEYINDEX method retrieves the current key index of the tables. The name of the table and the current key index of each table are displayed in a message box. Each table is close before the next one is opened. This example requires that you create the following global variables and text constant.  
  
|Variable name|DataType|  
|-------------------|--------------|  
|MyRecordRef|RecordRef|  
|CurrentKeyIndex|Integer|  
|i|Integer|  
|varFromTable|Integer|  
|varToTable|Integer|  
  
|Text constant name|DataType|ENU value|  
|------------------------|--------------|---------------|  
|Text000|Text|Table: %1  Current key index: %2|  
  
```  
varFromTable := 36;  
varToTable := 39;  
FOR i := varFromTable TO varToTable DO BEGIN  
  MyRecordRef.OPEN(i);  
  CurrentKeyIndex := MyRecordRef.CURRENTKEYINDEX;  
  MESSAGE(Text000, MyRecordRef.NAME, CurrentKeyIndex);  
  MyRecordRef.CLOSE;  
END  
```  
  
## See Also  
 [RecordRef Data Type](../datatypes/devenv-RecordRef-Data-Type.md)