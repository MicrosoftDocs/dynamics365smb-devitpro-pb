---
title: "AssistEdit Property"
ms.author: solsen
ms.custom: na
ms.date: 04/01/2021
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# AssistEdit Property
> **Version**: _Available or changed with runtime version 1.0._

Sets assist-edit capabilities for a text box.

## Applies to
-   Page Field

[//]: # (IMPORTANT: END>DO_NOT_EDIT)


## Property Value  
 **True** if assist-edit capabilities and an AssistEdit button are provided; otherwise, **false**. The default value is **false**.  

## Syntax

```AL
AssistEdit = true;
```

## Remarks  
 You can add AL code in the [OnAssistEdit Trigger](../triggers/devenv-onassistedit-trigger.md) to change the default assist-edit behavior.  

## See Also  
 [Lookup Property](devenv-lookup-property.md)   
 [DrillDown Property](devenv-drilldown-property.md)