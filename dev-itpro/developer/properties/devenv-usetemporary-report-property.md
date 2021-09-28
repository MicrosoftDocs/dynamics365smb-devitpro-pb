---
title: "UseTemporary Property (Report)"
author: solsen
ms.custom: na
ms.date: 04/01/2021
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
ms.service: "dynamics365-business-central"
ms.assetid: 729f3649-f7c8-498d-8c16-961771f192a0
ms.author: jswymer
---
 
# UseTemporary Property (Report)
> **Version**: _Available from runtime version 1.0._

Sets whether a temporary table is used to store the data set that is returned for columns of a data item.

## Applies to  

- Report data items

## Property Value  

**True** to use a temporary table; otherwise, **false**. The default value is **false**.  

## Syntax

```AL
UseTemporary = true;
```

## Remarks  

A temporary table is used as a buffer or intermediate storage for data. A temporary table is not stored in the database, but is only held in memory until the report is closed. A temporary table is useful when the column data is not mapped directly to a field in the database but is instead the result of a process or operation, such as an aggregation of data from several columns. If a temporary table is not used, the data must be handled by AL code.  
  
For an example of the use of the UseTemporary property, see report 1306 in the [!INCLUDE[demolong](../includes/demolong_md.md)].  

## See Also  

[Properties](devenv-properties.md)   
[Report Object](../devenv-report-object.md)   
[UseTemporary Property (XMLPort)](devenv-usetemporary-xmlport-property.md)   
[Temporary Tables](../devenv-temporary-tables.md)

