---
title: "RecordId Method (Record)"
description: "The RecordId method in AL for Business Central"
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: jswymer
---

# RecordId Method (Record)
Gets the RecordId of the record that is currently selected in the table. If no table is selected, an error is generated.  
  
## Syntax  
  
```AL
RecordId := Record.RecordId;  
```  
  
### Parameters  
 *Record*  
 Type: Record  
  
 The record whose RecordId you want to get.  
  
## Return value  
 Type: RecordId  
  
## Remarks  

You can show strings that include RecordId in the user interface by using the [Format Method \(Code, Text\)](devenv-format-method-code-text.md). In most cases, use the standard format value 1, which ensures that captions are shown in the current language. The following table illustrates the effect of the different standard formats when RecordId is used in a Format statement in a Danish locale.  
  
|Standard Format|Renders as|  
|---------------------|----------------|  
|FORMAT\(Customer.RecordId,0,0\)|Customer: 1212121|  
|FORMAT\(Customer.RecordId,0,1\)|Kunde: 1212121|  
|FORMAT\(Customer.RecordId,0,9\)|Customer: 1212121|  
  
When you use standard format 1, the caption of the record is returned. When you use other standard formats, the name of the record is returned, which is usually English \(US\). For more information, see [Format Property](../properties/devenv-format-property.md).  
  
## Example

The following example opens table 18 \(Customer\) as a Record variable that is named MyRecord. The [FindLast Method \(Record\)](devenv-findlast-method-record.md) finds the last record in the table. The record ID of the last record is retrieved, stored in the RecID variable displayed in message box.  
  
|Variable name|DataType|Subtype|  
|-------------|--------|-------|  
|MyRecord|Record|Customer|  
|RecID|RecordId|  |
  
|Text constant name|DataType|ENU value|  
|------------------|--------|---------------|  
|MyTextConst|Text|The record ID for the last record is: %1|  
  
```AL
MyRecord.FindLast;  
RecID := MyRecord.RecordId;  
MESSAGE(MyTextConst, RecID);  
```  
  
## See Also  

[AL Method Reference](../methods-auto/library.md)  
[Record Data Type](../datatypes/devenv-record-data-type.md)  
[Format Property](../properties/devenv-format-property.md)