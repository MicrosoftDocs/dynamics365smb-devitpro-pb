---
title: "DataItemTable Property"
ms.date: 10/01/2020
ms.suite: na
ms.topic: article
author: SusanneWindfeldPedersen
---

# DataItemTable Property

Sets the [!INCLUDE[d365fin_long_md](../includes/d365fin_long_md.md)] database table that is associated with a data item.  
  
## Applies to  
  
- Queries  
- Reports  

## Syntax

```AL
dataitem(Name; DataItemTable){}
```

## Remarks

Queries and reports retrieve data from one or more tables. You specify tables in these objects by defining a data item. You can associate the same table with more than one data item. However, each data item must have a unique name in the object. If you have data items with the same name, you can change the names by setting the [Name Property](devenv-name-property.md) or **Name** column on the data item.  

## See Also

[Properties](devenv-properties.md)  
[DataSource Property](devenv-datasource-property.md)  