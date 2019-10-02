---
title: "InstructionalText Property"
ms.custom: na
ms.date: 10/01/2019
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.assetid: c90654ad-da85-496c-900a-1c2fc7dd2f2b
caps.latest.revision: 13
---

 

# InstructionalText Property
Sets the text used for instructions in the UI.  
  
## Applies To  
  
-   Page object  
  
-   RequestPage

-   PageGroup

## Remarks

The default is an empty string, which means there will be no instructions. According to the user assistance model for [!INCLUDE[prodshort](../includes/prodshort.md)], apps are expected to apply instructional text to setup guides and similar pages.  

The following example illustrates how you can apply instructional text in an app:  

```
InstructionalText = 'Add an entity from your list of contacts. The entity can be a person or a company.';
```

## See also

[Configuring the Help Experience](../../deployment/configure-help.md)  
[Page object](../devenv-page-object.md)  
