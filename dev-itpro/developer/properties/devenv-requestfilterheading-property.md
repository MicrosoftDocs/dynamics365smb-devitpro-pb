---
title: "RequestFilterHeading Property"
ms.custom: na
ms.date: 10/01/2019
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.assetid: e11c0fa0-0d61-43b9-8613-cb443588e790
caps.latest.revision: 8
---


# RequestFilterHeading Property
Sets a caption for the request page tab that is related to this data item. The value is taken from the [RequestFilterHeadingML Property](devenv-requestfilterheadingml-property.md) if this property is set.  
  
## Applies To  
  
- Data items on reports.  
  
- Table elements XMLports.  
  
## Property Value  
Any valid string. If [RequestFilterHeadingML Property](devenv-requestfilterheadingml-property.md) is set, then the value for the selected language is used. If [RequestFilterHeadingML Property](devenv-requestfilterheadingml-property.md) is not set, then the default is the name of the table that is the specified in the [DataItemTable Property](devenv-dataitemtable-property.md). 

## Syntax
```
RequestFilterHeading = 'Entry';
``` 
  
## See Also  
[Multilanguage Development](../devenv-multilanguage-development.md)
