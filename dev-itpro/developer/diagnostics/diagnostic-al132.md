---
title: "Compiler Error AL0132"
description: "'{0}' does not contain a definition for '{1}'."
ms.author: solsen
ms.date: 10/01/2026
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# Compiler Error AL0132

[!INCLUDE[banner_preview](../includes/banner_preview.md)]

'{0}' does not contain a definition for '{1}'.


## Description
The referenced element does not contain a definition for the referenced member.  

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## How to fix this diagnostic?

The object or variable exists, but it has no field, method, or property with the name you used.

To fix it:

1. Check the spelling of the member. Quote names that contain spaces, for example `Customer."No."`.
2. Confirm you're using the right variable or object type. The member might be defined on a different object.
3. Use IntelliSense (after the `.`) or **Go to Definition** (F12) to list the available members.
4. If the member comes from another extension, add that extension as a dependency in **app.json**.

```al
var
    Cust: Record Customer;
begin
    // 'Naem' isn't a field on Customer -> AL0132
    Message(Cust.Naem);
    // Correct
    Message(Cust.Name);
end;
```

## Related information  
[Get Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  