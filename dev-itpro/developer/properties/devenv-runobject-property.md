---
title: "RunObject Property"
description: "Sets the object you want to run immediately when the action is activated."
ms.author: solsen
ms.custom: na
ms.date: 06/15/2022
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# RunObject Property
> **Version**: _Available or changed with runtime version 1.0._

Sets the object you want to run immediately when the action is activated.

## Applies to
-   Page Action

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Syntax
The following example illustrates how to use RunObject on the query object MyQuery (replace the **query** keyword with **page**, **report**, or **codeunit** to use RunObject on these data types)

```AL
RunObject = query "MyQuery";
```

## Remarks  

Use this property to select the object you want to run.  

The following object types are supported: pages, reports, codeunits, and from version 23 also queries.

Use the following properties to set parameters for the object you want to run:  
  
- [RunPageView Property](devenv-runpageview-property.md)  
- [RunPageLink Property](devenv-runpagelink-property.md)  

## See Also

[Properties](devenv-properties.md)  
