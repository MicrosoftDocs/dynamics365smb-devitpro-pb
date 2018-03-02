---
title: "AutoIncrement Property"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 7d9e7a7a-238f-4f7f-8934-aecef8a44c24
caps.latest.revision: 8
manager: edupont
---
# AutoIncrement Property
Sets whether the field value should be automatically incremented.  
  
## Applies To  
 Fields of [Integer Data Type](Integer-Data-Type.md) and [BigInteger Data Type](BigInteger-Data-Type.md)  
  
## Property Value  
 **Yes** if the field value is automatically incremented; otherwise, **No**. The default value is **Yes**.  
  
> [!NOTE]  
>  If you want to manually assign a value to a field that has the AutoIncrement property set to **Yes**, you must be member of the SQL Server db\_owner database permission set.  
  
## Remarks  
 A table can only contain one auto-increment field. The numbers assigned to this field will not always be consecutive for the following reasons:  
  
-   If you delete some records from a table, the numbers used for these records are not reused.  
  
-   If several transactions are performed at the same time, they will each be assigned a different number. However, if one of these transactions is rolled back, the number that it was assigned is not reused.  
  
 If you add an auto-increment field to an existing table, the field automatically generates consecutive values and inserts them into the table. If you enable the AutoIncrement property for a field that already contains data, there must be no zero values in the field.  
  
 The AutoIncrement property is designed to always assign numbers automatically. If you want to insert a record, be sure that the value in this field is blank before you insert the record.  
  
 The AutoIncrement property does not work with [!INCLUDE[navnow](includes/navnow_md.md)] temporary tables.  
  
## See Also  
 [Properties](Properties.md)