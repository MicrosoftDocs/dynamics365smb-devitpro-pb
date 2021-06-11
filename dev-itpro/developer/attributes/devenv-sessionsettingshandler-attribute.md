---
title: "SessionSettingsHandler Attribute"
description: "Specifies a session settings handler function"
ms.author: solsen
ms.custom: na
ms.date: 06/09/2021
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

# SessionSettingsHandler Attribute
> **Version**: _Available or changed with runtime version 3.0._

Specifies a session settings handler function


## Applies To

- Method

> [!NOTE]
> The **SessionSettingsHandler** attribute can only be set inside codeunits with the **SubType property** set to **Test**.

## Syntax

> **Version**: _Available or changed with runtime version 3.0._

```
[SessionSettingsHandler]
procedure SessionSettingsHandler(var SessionSettings: SessionSettings) : Boolean;
```

### Arguments
*SessionSettings*  
&emsp;Type: [SessionSettings](../methods-auto/sessionsettings/sessionsettings-data-type.md)  
Session settings object to be populated


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## Remarks

The **SessionSettingsHandler** method is called when SessionSetting is updated. 

For more information about handler methods, see [Creating Handler Methods](../devenv-creating-handler-methods.md).

## See Also

[AL Method Reference](../methods-auto/library.md)  
[Method Attributes](devenv-method-attributes.md)  
[Test Codeunits and Test Functions](../devenv-test-codeunits-and-test-methods.md)