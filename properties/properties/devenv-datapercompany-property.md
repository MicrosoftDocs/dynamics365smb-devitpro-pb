---
title: "DataPerCompany Property"
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.assetid: 1b5963cf-d43e-45ed-b1e0-cb9917ed2c1e
caps.latest.revision: 5
author: SusanneWindfeldPedersen
---

# DataPerCompany Property

Sets a value that indicates whether the table data applies to all companies in the database or only the current company. Some data can be useful to share across companies, data such as zip codes, country, and state.

Whether the value of this property can be changed is dependent on if the table holds data or not.

The value `true` means that data is available to the current company only, this is the default value. You can only set this property to `true` if the table is empty in all companies, or if the table holds data in only one company. You cannot change the value to `false` if there is data in the table in any of the companies. 
 
## Applies to

- Tables  
  
## Property Value

**True** if data is available only to this company; otherwise, **false**. The default value is **true**.  

## Syntax

```AL
DataPerCompany = true;
```
  
## See Also  

[Properties](devenv-properties.md)  
[DataSource Property](devenv-datasource-property.md)  