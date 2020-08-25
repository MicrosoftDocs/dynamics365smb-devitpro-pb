---
title: "RECORDID Method (Record)"
ms.custom: na
ms.date: 04/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: jswymer
---

# RECORDID Method (Record)
Gets the RecordID of the record that is currently selected in the table. If no table is selected, an error is generated.  
  
## Syntax  
  
```  
  
RecordID := Record.RECORDID  
```  
  
### Parameters  
 *Record*  
 Type: Record  
  
 The record whose recordID you want to get.  
  
## Return value  
 Type: RecordID  
  
## Remarks  
 You can show strings that include RECORDID in the user interface by using the [FORMAT Method \(Code, Text\)](devenv-format-method-code-text.md). In most cases, use the standard format value 1, which ensures that captions are shown in the current language. The following table illustrates the effect of the different standard formats when RECORDID is used in a FORMAT statement in a Danish locale.  
  
|Standard Format|Renders as|  
|---------------------|----------------|  
|FORMAT\(Customer.RECORDID,0,0\)|Customer: 1212121|  
|FORMAT\(Customer.RECORDID,0,1\)|Kunde: 1212121|  
|FORMAT\(Customer.RECORDID,0,9\)|Customer: 1212121|  
  
When you use standard format 1, the caption of the record is returned. When you use other standard formats, the name of the record is returned, which is usually English \(US\). For more information, see [Format Property](../properties/devenv-format-property.md).  
  
## Example  
The following example opens table 18 \(Customer\) as a Record variable that is named MyRecord. The [FINDLAST Method \(Record\)](devenv-findlast-method-record.md) finds the last record in the table. The record ID of the last record is retrieved, stored in the RecID variable displayed in message box.  
  
|Variable name|DataType|Subtype|  
|-------------|--------|-------|  
|MyRecord|Record|Customer|  
|RecID|RecordID|  |
  
|Text constant name|DataType|ENU value|  
|------------------|--------|---------------|  
|MyTextConst|Text|The record ID for the last record is: %1|  
  
```  
MyRecord.FINDLAST;  
RecID := MyRecord.RECORDID;  
MESSAGE(MyTextConst, RecID);  
```  
  
## See Also  
[Record Data Type](../datatypes/devenv-record-data-type.md)  
[Format Property](../properties/devenv-format-property.md)