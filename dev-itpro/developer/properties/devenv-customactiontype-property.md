---
title: "CustomActionType Property"
description: "Sets the type of the custom action."
ms.author: solsen
ms.custom: na
ms.date: 03/15/2023
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# CustomActionType Property
> **Version**: _Available or changed with runtime version 10.0._

Sets the type of the custom action.

## Applies to
-   Page Custom Action

## Property Value

|Value|Available or changed with|Description|
|-----------|-----------|---------------------------------------|
|**Flow**|runtime version 1.0|An action that can trigger a Power Automate Flow.|
|**FlowTemplate**|runtime version 11.0|An action that can trigger a Power Automate template editor to create a new Flow from a specific template.|
|**FlowTemplateGallery**|runtime version 11.0|An action that can trigger a Power Automate template gallery to create a new Flow from a selection of templates.|

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks

To learn more about Power Automate flows with Business Central, see [Power Automate Integration Overview](../../powerplatform/power-automate-overview.md).

## Examples

The following examples illustrate the syntax of the three custom action types. The first example extends the **Customer Card** page with a promoted action that runs a Power Automate flow that has the flow ID `11111111-aaaa-2222-bbbb-333333333333`.

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
                FlowId = '11111111-aaaa-2222-bbbb-333333333333';
                FlowEnvironmentId = 'Default-44444444-cccc-5555-dddd-666666666666';
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

This code example extends the **Customer Card** page with a promoted action that triggers opening a specific Power Automate template wizard directly.

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
                CustomActionType = FlowTemplate;
                FlowTemplateId = '11111111-aaaa-2222-bbbb-333333333333';
                FlowCaption = 'Create a Power Automate flow using a template';
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

This third code example likewise extends the **Customer Card** page with a promoted action, this time it triggers opening the Power Automate template gallery wizard for the user to create a new Flow from a selection of templates.

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
                CustomActionType = FlowTemplateGallery;
                FlowTemplateCategoryName = 'd365bc_approval_generalJournal';
                FlowCaption = 'Select and create a Power Automate flow using a template';
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