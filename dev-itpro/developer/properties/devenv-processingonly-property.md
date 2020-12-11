---
title: "ProcessingOnly Property"
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
# ProcessingOnly Property
> **Version**: _Available from runtime version 1.0._

Sets the value that indicates whether a report produces printed output or only processes data.

## Applies to
-   Report


[//]: # (IMPORTANT: END>DO_NOT_EDIT)


## Property Value

**True** if you want a report that will not produce output; otherwise, **false**. The default is **false**. 

## Syntax

```AL
ProcessingOnly = true;
``` 
  
## Remarks  

If **ProcessingOnly** is **true**, then the **Print** and **Preview** options on the request page are replaced by an **OK** button.  
  
## See Also  

[Properties](devenv-properties.md)