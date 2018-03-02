---
title: "COPY Function (Record)"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 93fd51a9-c2db-4b12-912e-7eaa215e0b94
caps.latest.revision: 16
manager: edupont
---
# COPY Function (Record)
Copies a specified record, filters, marks, and keys that are associated with the record from a table or creates a reference to a record.  
  
## Syntax  
  
```  
  
Record.COPY(FromRecord [, ShareTable])  
```  
  
#### Parameters  
 *Record*  
 Type: Record  
  
 The record where the copy will be placed.  
  
 *FromRecord*  
 Type: Record  
  
 The record to copy.  
  
 *ShareTable*  
 Type: Boolean  
  
 Specifies whether the function copies filters, marks, and keys of the record or creates a reference to a temporary record.  
  
 If *FromRecord* and *Record* are both temporary and *ShareTable* is **true**, then the **COPY** function causes *Record* to reference the same table as *FromRecord*.  
  
> [!IMPORTANT]  
>  If *ShareTable* is **true**, then both *Record* and *FromRecord* must be temporary; otherwise an error will occur.  
  
 The default value is **false**. If you specify **false**, only filters, marks, and keys are copied.  
  
## Example  
 The following example copies a record to another record in the **Customer** table. The [GET Function \(Record\)](GET-Function--Record-.md) retrieves record number 30000 from the **Customer** table and stores record in the sourceRecord variable. The **COPY** function copies the record that is stored in the sourceRecord to the destRecord. The *ShareTable* parameter is set to **true** because the [Temporary Property](Temporary-Property.md) for the both sourceRecord and destRecord are set to **Yes** to make the records temporary. If the record is copied, then a message indicating that the record is copied is displayed in a message box. Otherwise, a message indicating that the record is not copied is displayed. This example requires that you create the following variables and text constant in the **C/AL Globals** window.  
  
|Variable name|DataType|Subtype|  
|-------------------|--------------|-------------|  
|sourceRecord|Record|Customer|  
|destRecord|Record|Customer|  
  
|Text constant name|ConstValue|  
|------------------------|----------------|  
|Text000|The record is copied.|  
|Text001|The record is not copied.|  
  
```  
IF sourceRecord.GET(30000) THEN BEGIN  
  destRecord.COPY(sourceRecord, TRUE);  
  MESSAGE(Text000);  
END  
ELSE BEGIN  
  MESSAGE(Text001);  
END;  
```  
  
## See Also  
 [Record Data Type](Record-Data-Type.md)