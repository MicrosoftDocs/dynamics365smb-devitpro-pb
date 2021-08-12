---
title: "AppSourceCop Rule AS0089"
description: "Objects that can be referenced and which have been published must not be deleted."
ms.author: solsen
ms.custom: na
ms.date: 07/07/2021
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
# AppSourceCop Rule AS0089
Objects that can be referenced and which have been published must not be deleted.

## Description
Objects that can be referenced and which have been published must not be deleted. This might break the upgrade of existing installations and dependent extensions.

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## How to fix this diagnostic?
Reverting the change will fix this diagnostic. If deleting or renaming the object is required, the recommended approach is to mark it first as [ObsoleteState Pending](../properties/devenv-obsoletestate-property.md); if you are performing a rename, this is where you would introduce a new object with the new name. You can then mark the old object as [ObsoleteState Removed](../properties/devenv-obsoletestate-property.md) in a later version.

> [!NOTE]  
> This rule treats renaming and deleting as if it was the same action. The AppSourceCop analyzer cannot track renaming of objects without an ID.

## Code Examples
### Example 1: Deleting a Page Customization triggers the rule
Version 1.0 of the extension:
```AL
pagecustomization Foo_MyPageCustomization customizes "Customer List"
{
    layout
    {
        modify(Name)
        {
            Visible = false;
        }
    }
}
```
In version 2.0 of the extension, `Foo_MyPageCustomization` has been deleted. This will trigger rule AS0089.

### Example 2: Renaming an Interface triggers the rule
Version 1.0 of the extension:
```AL
interface FOO_IExampleInterface
{
    procedure ExampleProcedure() : Text;
}
```
In version 2.0 of the extension: 
```AL
interface FOO_IMyInterface
{
    procedure ExampleProcedure() : Text;
}
```
The page customization `FOO_IExampleInterface` has been renamed, this will trigger rule AS0089.

### Example 3: Deleting an obsolete pending Page Customization
Version 2.0 of the extension:
```AL
interface FOO_IMyInterface
{
    procedure ExampleProcedure(): Text;
    ObsoleteState = Pending;
    ObsoleteReason = 'Use FOO_IExampleInterface instead.';
}
interface FOO_IExampleInterface
{
    procedure SomeProcedure(): Text;
}
```
In version 3.0 of the extension, `FOO_IMyInterface` has been deleted. This is okay, because `FOO_IMyInterface` previously had been marked with `ObsoleteState = Pending` informing developers to use "FOO_IExampleInterface" instead.


## See Also  
[AppSourceCop Analyzer](appsourcecop.md)  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  
