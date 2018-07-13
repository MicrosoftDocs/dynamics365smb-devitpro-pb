---
title: "OptionMembers Property (Field)"
ms.custom: na
ms.date: 05/31/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.assetid: c90654ad-da85-496c-900a-1c2fc7dd2f2b
caps.latest.revision: 13
---

<!--
Ask Esben for more information about it. 
-->
 
# OptionMembers Property (Field)
Gets the list of options that are available in the field that is currently selected. 

  
## Applies To  
  
-   Fields  

## Example
In the code snippet below, you can see how the property is set.

```
field(2; OptionField; option)
{
    OptionMembers = "Option with ", "spaces and ", "other symbols!";
}
```


## See Also  
[Properties](devenv-properties.md)  
[Report Object](../devenv-report-object.md)     
[Report Properties](devenv-report-properties.md)   
[OptionMembers Property (Report)](devenv-optionmembers-report-property.md)