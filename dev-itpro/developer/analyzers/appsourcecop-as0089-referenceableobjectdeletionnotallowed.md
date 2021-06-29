---
title: "AppSourceCop Rule AS0089"
ms.author: solsen
ms.custom: na
ms.date: 05/05/2021
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
Reverting the change will fix this diagnostic. If deleting/renaming the object is required, the recommended approach is to mark it first as [Obsolete Pending](../properties/devenv-obsoletestate-property.md); if you are performing a rename, this is where you would introduce a new object with the new name. You can then mark the old object as [Obsolete Removed](../properties/devenv-obsoletestate-property.md) in a later version.

> [!NOTE]  
> This rule evaluates renaming and deleting as the same thing. App Source cannot track renaming of objects without an ID.

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
In version 2.0 of the extension, Foo_MyPageCustomization has been deleted. This will trigger AS0089.

### Example 2: Renaming a Page Customization triggers the rule
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
In version 2.0 of the extension: 
```AL
pagecustomization Foo_MyRenamedPageCustomization customizes "Customer List"
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
The page customization Foo_MyPageCustomization has been renamed, this will trigger AS0089.

### Example 3: Deleting an obsolete pending Page Customization
Version 2.0 of the extension:
```AL
pagecustomization Foo_MyPageCustomization customizes "Customer List"
{
    ObsoleteState = Pending;
    ObsoleteReason = 'Use Foo_MyOtherPageCustomization instead.';
}

pagecustomization Foo_MyOtherPageCustomization customizes "Customer List"
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
In version 3.0 of the extension, Foo_MyPageCustomization has been deleted. This is okay, because Foo_MyPageCustomization had previously been marked with `ObsoleteState = Pending` and informing developers to use "Foo_MyOtherPageCustomization" instead.


## See Also  
[AppSourceCop Analyzer](appsourcecop.md)  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  