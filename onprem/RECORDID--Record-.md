---
title: "RECORDID (Record)"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 045f886a-225c-4f78-b7ae-7100c3bb88ec
caps.latest.revision: 4
manager: edupont
---
# RECORDID (Record)
Gets the RecordID of the record that is currently selected in the table. If no table is selected, an error is generated.  
  
## Syntax  
  
```  
  
RecordID := Record.RECORDID  
```  
  
#### Parameters  
 *Record*  
 Type: Record  
  
 The record whose recordID you want to get.  
  
## Property Value/Return Value  
 Type: RecordID  
  
## Remarks  
 You can show strings that include RECORDID in the user interface by using the [FORMAT Function \(Code, Text\)](FORMAT-Function--Code--Text-.md). In most cases, use the standard format value 1, which ensures that captions are shown in the current language. The following table illustrates the effect of the different standard formats when RECORDID is used in a FORMAT statement in a Danish locale.  
  
|Standard Format|Renders as|  
|---------------------|----------------|  
|FORMAT\(Customer.RECORDID,0,0\)|Customer: 1212121|  
|FORMAT\(Customer.RECORDID,0,1\)|Kunde: 1212121|  
|FORMAT\(Customer.RECORDID,0,9\)|Customer: 1212121|  
  
 When you use standard format 1, the caption of the record is returned. When you use other standard formats, the name of the record is returned, which is usually English \(US\). For more information, see [Format Property](Format-Property.md).  
  
## Example  
 The following example opens table 18 \(Customer\) as a Record variable that is named MyRecord. The [FINDLAST Function \(Record\)](FINDLAST-Function--Record-.md) finds the last record in the table. The record ID of the last record is retrieved, stored in the RecID variable displayed in message box. This example requires that you create the following variables and text constant in the **C/AL Globals** window.  
  
|Variable name|DataType|  
|-------------------|--------------|  
|MyRecord|Record|  
|RecID|RecordID|  
  
|Text constant name|DataType|ENU value|  
|------------------------|--------------|---------------|  
|MyTextConst|Text|The record ID for the last record is: %1|  
  
```  
  
MyRecord.OPEN(18);  
MyRecord.FINDLAST;  
RecID := MyRecord.RECORDID;  
MESSAGE(MyTextConst, RecID);  
```  
  
## See Also  
 [Record Data Type](Record-Data-Type.md)   
 [Format Property](Format-Property.md)