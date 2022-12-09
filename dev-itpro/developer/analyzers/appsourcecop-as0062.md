---
title: "AppSourceCop Error AS0062"
description: "Page controls and actions must use the ApplicationArea property to be visible to users."
ms.author: solsen
ms.custom: na
ms.date: 10/26/2022
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# AppSourceCop Error AS0062
Page controls and actions must use the ApplicationArea property

## Description
Page controls and actions must use the ApplicationArea property to be visible to users. From runtime 11.0, you can specify on the application object level the ApplicationArea to use as default for all its controls and actions.

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks

Application areas represent a feature in the system that offers developers, administrators, and users the ability to define differentiated user experiences. They are mapped to controls to show or hide them on page objects to enable more or fewer business scenarios. Controls or actions without application area are not displayed in SaaS.

This rule validates that the `ApplicationArea` property is set on actions and controls. For more information, see [ApplicationArea Property](../properties/devenv-applicationarea-property.md).

## How to fix this diagnostic?

You must add the `ApplicationArea` property.

## Code example triggering the rule

```AL
page 50100 MyPage
{
    layout
    {
        area(Content)
        {
            field(MyField; 150) { }
        }
    }

    actions
    {
        area(Processing)
        {
            action(MyAction) { }
        }
    }
}
```

The field `MyField` and the action `MyAction` are not valid because they do not have the `ApplicationArea` property set.

## Code example not triggering the rule

### ApplicationArea property set on each members

```AL
page 50100 MyPage
{
    layout
    {
        area(Content)
        {
            field(MyField; 150)
            { 
                ApplicationArea = All;
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(MyAction) 
            {
                ApplicationArea = All;
            }
        }
    }
}
```

The field `MyField` and the action `MyAction` are valid because they have the `ApplicationArea` property set.

### ApplicationArea property set on the object

From runtime version 10.0, field, part, and action controls without ApplicationArea inherit the ApplicationArea defined on the page/report level.

The following code will then not trigger this analyzer diagnostic.

```AL
page 50100 MyPage
{
    ApplicationArea = All;

    layout
    {
        area(Content)
        {
            field(MyField; 150)
            {
                // ApplicationArea is inherited from the page.
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(MyAction) 
            {
                // ApplicationArea is inherited from the page.
            }
        }
    }
}
```

> [!NOTE]
> This inheritance does not apply to members defined in extension objects like page extensions or report extensions.

## See Also  
[AppSourceCop Analyzer](appsourcecop.md)  
[Get Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  
[ApplicationArea Property](..//properties/devenv-applicationarea-property.md)  