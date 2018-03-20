---
title: "DataItemTable Property"
ms.custom: na
ms.date: 06/08/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.assetid: cea4a2a5-4ec3-43a8-abd4-22bdeb90b3ef
caps.latest.revision: 6
author: SusanneWindfeldPedersen
---

 

# DataItemTable Property
Sets the [!INCLUDE[d365fin_long_md](../includes/d365fin_long_md.md)] database table that is associated with a data item.  
  
## Applies To  
  
-   Queries  
  
-   Reports  
  
## Remarks  
 Queries and reports retrieve data from one or more tables. You specify tables in these objects by defining a data item. You can associate the same table with more than one data item. However, each data item must have a unique name in the object. If you have data items with the same name, you can change the names by setting the [Name Property](devenv-name-property.md) or **Name** column on the DataItem.  
  
 The DateItemTable property is set automatically when you use Query Designer or Report Dataset Designer to create data items.