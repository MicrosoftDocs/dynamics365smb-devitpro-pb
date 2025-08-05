---
title: The UserControlHost page type
description: Learn how to use the UserControlHost page type in Business Central.
author: SusanneWindfeldPedersen
ms.author: solsen
ms.topic: overview
ms.date: 03/17/2025
ms.reviewer: solsen
---

# The UserControlHost page type

The `UserControlHost` page type is a specialized page type introduced in [!INCLUDE [prod_short](includes/prod_short.md)] runtime 15.0. It's designed to render a single user control in the client, optimizing the layout to maximize the available space for the control. This page type is particularly useful for embedding Power BI reports or displaying individual pages of such reports. Unlike standard pages, the `UserControlHost` page type has strict limitations, allowing only one user control in the layout and restricting extensibility and actions. This article provides an overview of the `UserControlHost` page type, its usage, and an example implementation.

The `UserControlHost` page type can **only** have a single control of type `usercontrol` within the layout `Content` area. Furthermore, you can't specify actions on this page type. Likewise, only a limited number of properties and triggers are available for it and the page type isn't extensible.

The following example illustrates the differences between a standard page and a `UserControlHost` page. The example uses the `WebPageViewer` user control, which is a simple web browser control that can be used to display web pages in the client.

## Example

```al
// Welcome to your new AL extension.
// Remember that object names and IDs should be unique across all extensions.
// AL snippets start with t*, like tpageext - give them a try and happy coding!

namespace UserControlHost.Demo;

using System.Integration;

page 50100 StandardPage
{
    PageType = Card;
    Caption = 'Standard Page';
    AboutTitle = 'About this page';
    AboutText = 'Displays a single user control in a standard card page';
    ApplicationArea = All;
    UsageCategory = Documents;

    layout
    {
        area(content)
        {
            usercontrol(WebPageViewer; WebPageViewer)
            {
                trigger ControlAddInReady(CallbackUrl: Text)
                begin
                    CurrPage.WebPageViewer.Navigate('https://www.example.com');
                end;
            }
        }
    }
}

page 50101 UserControlHost
{
    PageType = UserControlHost;
    Caption = 'User Control Host Page';
    AboutTitle = 'About this page';
    AboutText = 'Displays a single user control in a user control host page';
    ApplicationArea = All;
    UsageCategory = Documents;

    // UserControlHost pages aren't extensible (at all)
    // Extensible = true; // This property isn't supported

    layout
    {
        area(content)
        {
            // Only a single user control is permitted on pages of type UserControlHost
            usercontrol(WebPageViewer; WebPageViewer)
            {
                trigger ControlAddInReady(CallbackUrl: Text)
                begin
                    CurrPage.WebPageViewer.Navigate('https://www.example.com');
                end;
            }
        }
    }

    // Actions aren't permitted
    // actions { } // will trigger AL0875
}
```

> [!TIP]
> Use this page type to show a Power BI report in its own page. Learn more in [Embed Power BI reports, scorecards, dashboards in pages](devenv-power-bi-report-parts.md#open-a-power-bi-element-expanded-in-its-own-page).

## Related information

[Page types and layouts](devenv-page-types-and-layouts.md)  
[Page object](devenv-page-object.md)  