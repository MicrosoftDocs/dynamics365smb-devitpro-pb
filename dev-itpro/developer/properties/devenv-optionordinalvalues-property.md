---
title: "OptionOrdinalValues Property"
ms.author: solsen
ms.custom: na
ms.date: 11/24/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# OptionOrdinalValues Property
> **Version**: _Available from runtime version 1.0._

Specifies the list of option values. Can be set if the property ExternalType is set to Picklist.

## Applies to
-   Table Field


[//]: # (IMPORTANT: END>DO_NOT_EDIT)


## Property values

The position of the option members value in the external database. You can set -1, 1, 2, but you cannot set the value to 0. 

## Syntax

```AL
OptionOrdinalValues = 1,2,3,4,5;
```

## Remarks

This property is used when you specify **CDS** in the **TableType** property. These tables use a different SQL Server connection than the normal tables in the [!INCLUDE[d365fin_long_md](../includes/d365fin_long_md.md)] database.  

## See Also  

[Properties](devenv-properties.md)  
[Table Properties](devenv-table-properties.md)  
[AL Proxy Table Generator](../devenv-al-table-proxy-generator.md)  


## See Also  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  