---
title: "Triggers Overview"
ms.custom: na
ms.date: 04/29/2021
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---

# Triggers Overview

This section describes the triggers that are available to developers in [!INCLUDE [prod_short](../../includes/prod_short.md)]. Use the table of contents to scan the triggers, or use **Filter by title** to find a trigger if you know its name.

Triggers activate a method when a certain event occurs. When AL methods are run as a result of a predefined event on either an object or a control, the event triggers the method. Together the event and method make a trigger.

Triggers are typically used to perform calculations and verification. For example, in reports, triggers let you control how data is selected and retrieved in a more complex and effective way than you can achieve by using properties. Integration triggers are called whenever a record changes through code or user interaction.

## Coding triggers

Like properties, there are different triggers for the various AL object types. Some triggers are applied on the object'level, while others are applied on the control-level. For example, a table has some high-level triggers on the table object and lower-level triggers on field controls. Or consider reports, which have some triggers on the report object and some the data items. Trigger are tyically added at the end the code block for the object or control. Triggers have the following syntax:

```al
trigger Name()
var
    variable_name: type;
begin
    // Custom code
end;
```

## Snippet support

Typing the shortcut `ttrigger` will create the basic layout for a page object when using the [!INCLUDE[d365al_ext_md](../../includes/d365al_ext_md.md)] in Visual Studio Code.

[!INCLUDE[intelli_shortcut](../includes/intelli_shortcut.md)]

## See Also

[Methods](../methods-auto/library.md)  
[Properties](../properties/devenv-properties.md)