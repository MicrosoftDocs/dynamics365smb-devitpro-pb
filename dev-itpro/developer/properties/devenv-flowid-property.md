---
title: "FlowId Property"
description: "Sets the ID of the Power Automate Flow triggered by this action."
ms.author: solsen
ms.date: 05/14/2024
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# FlowId Property
> **Version**: _Available or changed with runtime version 10.0._

Sets the ID of the Power Automate Flow triggered by this action.

## Applies to
-   Page Custom Action

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks

You can get the flow ID in Power Automate. Sign in to [Power Automate](https://powerautomate.com) and open the flow for editing. Then, get the flow ID from the URL in the browser address, which has a format like: `https://make.powerautomate.com/environments/<environment ID>/flows/<environment ID>`.

To learn more about Power Automate flows with Business Central, see [Power Automate Integration Overview](../../powerplatform/power-automate-overview.md).

## Example

The following example extends the **Cutomer Card** page with a promoted action that runs a Power Automate flow that has the flow ID `00001111-aaaa-2222-bbbb-3333cccc4444`.

```al
pageextension 50100 CustomerCardExt extends "Customer Card"
{
    actions
    {
        
        addlast(processing)
        {
            customaction(MyFlowAction)
            {
                ApplicationArea = All;
                CustomActionType = Flow;
                FlowId = '00001111-aaaa-2222-bbbb-3333cccc4444';
                FlowEnvironmentId = 'Default-44445555-eeee-6666-ffff-7777aaaa8888';
            }
        }
        addfirst(Promoted)
        {
            actionref(MyFlowPromoted; MyFlowAction)
            {
            }
        }

    }
}
```

## See Also  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  