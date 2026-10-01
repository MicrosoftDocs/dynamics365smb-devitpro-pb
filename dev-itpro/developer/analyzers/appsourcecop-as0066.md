---
title: "AppSourceCop Error AS0066"
description: "A new method to an interface that has been published must not be added, because dependent extensions may break"
ms.author: solsen
ms.date: 04/30/2026
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# AppSourceCop Error AS0066
A new method to an interface that has been published must not be added.

## Description
A new method to an interface that has been published must not be added, because dependent extensions may break

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks

This error occurs when an attempt is made to add a new required method (a method without a body) to an interface that has already been published. Adding a required method changes the interface's runtime identifier and forces all dependent extensions to implement the new method, which can break them.

### Adding functionality safely with default methods

Instead of adding a required method, you can add a **default method** - a method with a body. Default methods are optional: existing implementors continue to compile and use the default behavior. Because default methods don't affect the runtime identifier, no dependent extensions break.

If the method must eventually be implemented by all consumers, use the [RequiredPending attribute](../attributes/devenv-requiredpending-attribute.md) on the default method first, then transition it to required in a later version. Learn more in [Interface method lifecycle](../devenv-interface-method-lifecycle.md).

## How to fix this diagnostic?

To resolve this error, choose one of the following approaches:

1. **Add the method as a default method** (recommended): Give the method a body so it has a default implementation. This doesn't break existing implementors.

   ```AL
   interface IMyInterface
   {
       procedure ExistingMethod();
   
       // New method with a default implementation - safe to add
       procedure NewMethod(): Boolean
       begin
           exit(true);
       end;
   }
   ```

2. **Remove the method**: If the method isn't needed, restore the interface to its original state.

## Related information

[Interfaces in AL](../devenv-interfaces-in-al.md)  
[RequiredPending attribute](../attributes/devenv-requiredpending-attribute.md)  
[Interface method lifecycle](../devenv-interface-method-lifecycle.md)  
[AppSourceCop Analyzer](appsourcecop.md)  
[Get Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  