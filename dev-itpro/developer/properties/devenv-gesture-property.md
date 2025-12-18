---
title: "Gesture property"
description: "Specifies a gesture that runs the action on a device with a touch interface, such as the phone client."
ms.author: solsen
ms.date: 08/26/2024
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# Gesture Property
> **Version**: _Available or changed with runtime version 1.0._

Specifies a gesture that runs the action on a device with a touch interface, such as the phone client.

## Applies to
-   Page Action
-   Page File Upload Action

## Property value

|Value|Available or changed with|Description|
|-----------|-----------|---------------------------------------|
|**None**|runtime version 1.0|No gesture for the action.|
|**LeftSwipe**|runtime version 1.0|Swipe in from the right edge of the touch interface.|
|**RightSwipe**|runtime version 1.0|Swipe in from the left edge of the touch interface.|
|**ContextMenu**|runtime version 1.0|The action has a context menu.|

[//]: # (IMPORTANT: END>DO_NOT_EDIT)


## Syntax

```AL
Gesture = None;
```

## Remarks

You typically use the `Gesture` property on list type pages for running an action on items in a repeater control.

## Example

The following example shows how to use the `ContextMenu` value to make an action available through a context menu on mobile devices, rather than as a swipe gesture:

```AL
page 50100 "Customer List Enhanced"
{
    PageType = List;
    SourceTable = Customer;
    
    layout
    {
        area(Content)
        {
            repeater(Customers)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = All;
                }
            }
        }
    }
    
    actions
    {
        area(Processing)
        {
            action("Send Email")
            {
                ApplicationArea = All;
                Caption = 'Send Email';
                Image = Email;
                Scope = Repeater;
                Gesture = ContextMenu;  // Makes action available in context menu
                
                trigger OnAction()
                begin
                    // Email sending logic here
                end;
            }
            
            action("Create Sales Quote")
            {
                ApplicationArea = All;
                Caption = 'New Sales Quote';
                Image = NewSalesQuote;
                Scope = Repeater;
                Gesture = RightSwipe;  // Available as right swipe gesture
                
                trigger OnAction()
                begin
                    // Sales quote creation logic here
                end;
            }
        }
    }
}
```

In this example:

- The "Send Email" action with `Gesture = ContextMenu` will be available through the context menu when users long-press or right-click on a customer record
- The "Create Sales Quote" action with `Gesture = RightSwipe` will be available as a right swipe gesture on touch devices
- Both actions have `Scope = Repeater` to make them available at the record level rather than the page level

## Related information

[Implementation Tips for Gestures](../devenv-implementation-tips-gestures-property.md)  
[Introducing the Dynamics 365 Business Central Mobile App](../devenv-introducing-business-central-mobile-app.md)