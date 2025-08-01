---
title: "RunObject property"
description: "Sets the object you want to run immediately when the action is activated."
ms.author: solsen
ms.date: 08/26/2024
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
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

The following object types are supported: pages, reports, codeunits, and from version 23.0 also queries.

Use the following properties to set parameters for the object you want to run:  
  
- [RunPageView property](devenv-runpageview-property.md)  
- [RunPageLink property](devenv-runpagelink-property.md)  

> [!NOTE]
> With [!INCLUDE [prod_short](../includes/prod_short.md)] 2025 release wave 1, actions on role centers that have the `RunObject` property specified, use the `Caption`, `ToolTip`, `AboutText`, and `AboutTitle` properties of the *targeted application object*, if none of these properties are specified on the action itself. This ensures consistency and reuse. You can override these values by specifically setting them on the action.

## Related information

[Properties](devenv-properties.md)  
[RunPageView Property](devenv-runpageview-property.md)  
[RunPageLink Property](devenv-runpagelink-property.md)  
