---
title: "Walkthrough: Implementing New Workflow Events and Responses"
description: Learn how you can extend the native workflows by adding workflow events and responses in code to support additional business scenarios.
author: edupont04
ms.reviewer: na
ms.topic: conceptual
ms.service: "dynamics365-business-central"
ms.author: edupont
ms.date: 01/13/2021
---
# Walkthrough: Implementing New Workflow Events and Responses

If a business scenario requires a workflow event or a workflow response that is not supported in a [!INCLUDE [prod_short](includes/prod_short.md)] solution, you must implement it by extending the application code.  

In the **Workflow** page, the workflow administrator creates a workflow by listing the involved steps on the lines. Each step consists of a workflow event, moderated by event conditions, and a workflow response, customized by response options. You define workflow steps by filling fields on workflow lines from fixed lists of event and response values representing scenarios that are supported by the application code. For more information, see [Set Up Workflows](/dynamics365/business-central/across-set-up-workflows) in the business functionality content.  

The following procedure describes how to add a new workflow event and a new workflow response and then register the involved object relations, so that the new elements can be used in workflows. You can then share your code as an app or a per-tenant extension, for example. The workflow administrator can then select the new workflow event and response from the **Workflow** page to incorporate them in new or existing workflow steps.  

> [!IMPORTANT]  
> To ensure that custom workflow records are upgraded correctly, you must add new workflow events, workflow responses, and workflow table relations to dedicated extension points, as described in this procedure. During an upgrade to the next version, the libraries of workflow events, responses, and table relations are removed and then recreated with the latest content from Microsoft. By adding your custom workflow records using subscriptions to the Microsoft-provided extension points, you ensure that your custom record library gets recreated after an upgrade.

> [!NOTE]  
> This topic refers to two types of events:  
>
> - *Workflow event*: An occurrence in the application that users in the client can select from the **Workflow** page to define workflow steps. For more information, see [Workflows in Dynamics 365 Business Central](/dynamics365/business-central/across-workflow) in the business functionality content.
> - *Event*: The declaration of the occurrence or change in the application. Workflow events typically subscribe to events. For more information, see [Events in AL](devenv-events-in-al.md).

The development work involved in creating a new workflow event and a related workflow response consists of the following tasks, as a minimum:  

1. Create a workflow event  

    1. Create a workflow event code that identifies the workflow event  

    2. Add the workflow event code to the **Workflow Event** table  

    3. Create and publish an event that the workflow event subscribes to  

    4. Raise the event  

    5. Subscribe to the event and implement the workflow event  

2. Create a workflow response  

    1. Create a workflow response code that identifies the workflow response  

    2. Add the workflow response code to the **Workflow Response** table  

    3. Implement the workflow response  

    4. Enable that the workflow response can be executed  

    5. Add a new workflow response option  

3. Register workflow event/response combinations needed for the new workflow response  

4. Register workflow event hierarchies needed for the new workflow event  

5. Creating table relations between entities used when the new workflow event and response are used  

<!--6. Adding a FactBox that shows how a record participates in a workflow  -->

> [!NOTE]  
> Data and code samples in this procedure refer loosely to a workflow step of sending a notification when a purchase header is posted. However, the procedure alone does not result in a complete solution. The purpose of the walkthrough is simply to illustrate the process.

## Workflow event

In this section, we'll create a code to identify the workflow event, add the workflow event to the library, create an event that the workflow event subscribes to, raise the event, and then subscribe to the event and implement the workflow event.  

Each subsection takes you through the discrete steps.

### To create a workflow event code that identifies the workflow event  

1. Create a new .al file, such as MyWorkflowEvents.codeunit.al, and add a codeunit that will be used for new workflow events. Name it to reflect that it is used to identify the new workflow event, such as `MyWorkflowEvents`.  

2. Add a method in the codeunit. Optionally, use the shortcut `teventint`. Name the method to reflect that it is used to identify the workflow event, such as `MyWorkflowEventCode`, and make it take 128 characters of code as a parameter.  

> [!TIP]
> The terminology can be a bit confusing here. This method is not an *AL event*. It's a method that declares the *workflow event*, and it will subscribe to an *AL event* that, when triggered, will trigger the *workflow event*.

Your MyWorkflowEvents.codeunit.al file now looks like this:

```AL
codeunit 50101 MyWorkflowEvents
{
    procedure MyWorkflowEventCode(): code[128];
    begin
    end;
}
```

### To add the workflow event code to the Workflow Event table  

1. Create another method in the codeunit. Name it to reflect that it is used to add the workflow event to the library, such as `AddMyWorkflowEventsToLibrary`.  

    This method will subscribe to the `OnAddWorkflowEventsToLibrary` method in the `Workflow Event Handling` codeunit in the base application, so you must set the [EventSubscriber](methods/devenv-eventsubscriber-attribute.md) attribute, and you must add code that handles the event.

The following code illustrates the new method in the `MyWorkflowEvents` codeunit:

```AL
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Event Handling", 'OnAddWorkflowEventsToLibrary', '', true, true)]
    procedure AddMyWorkflowEventsToLibrary()
    var
        WorkflowEventHandling: Codeunit"Workflow Event Handling";
    begin
        WorkflowEventHandling.AddEventToLibrary(MyWorkflowEventCode(), Database::"Purchase Header", 'My workflow event description', 0, false);
    end;

```

### To publish an event that the workflow event subscribes to  

1. Create another codeunit, such as MyEvents.codeunit.al, and add a method that publishes your event. Name the method to reflect that it is used as the publisher event, such as `OnAfterPostPurchaseHeader`.  

    ```AL
    codeunit 50102 MyEvents
    {
        [IntegrationEvent(false, false)]
        procedure OnAfterPostPurchaseHeader(PurchaseHeader: Record "Purchase Header")
        begin
        end;
    }
    ```

    Select the event type that is relevant for the workflow event, such as Integration. For more information, see [Event Types](devenv-event-types.md).  

### To raise the event  

1. Create an object or an extension object to add the code that will raise the event that triggers the workflow event, such as the `Purch.-Post` codeunit.  

    The following code raises the event by extending the `Purchase Order`page object in a new file, `MyPurchOrder.PageExt.al`.  

   ```AL
   pageextension 50100 WFW_PurchaseOrder extends "Purchase Order"
    {
        layout
        {
            modify(Status)
            {
                trigger OnBeforeValidate();
                var
                    MyEvents: Codeunit MyEvents;
                begin
                    MyEvents.OnAfterPostPurchaseHeader(Rec)
                end;
            }
        }
    } 
   ```  

   For more information, see [Raising Events](devenv-raising-events.md).  

### To subscribe to the event and implement the workflow event  

1. Go back to the MyWorkflowEvents.codeunit.al file file and add another method in the `MyWorkflowEvents` codeunit. Name the new method to reflect that it is used to subscribe to and implement the workflow event, such as `RunWorkflowOnAfterPostPurchaseHeader`.  

The following code illustrates the new workflow event that subscribes to your previously created event:

   ```AL
    [EventSubscriber(ObjectType::Codeunit, Codeunit::MyEvents, 'OnAfterPostPurchaseHeader', '', true, true)]
    local procedure RunWorkflowOnAfterPostPurchaseHeader(var PurchaseHeader: Record "Purchase Header")
    var
        WorkflowManagement: Codeunit "Workflow Management";
    begin
        WorkflowManagement.HandleEvent(MyWorkflowEventCode, PurchaseHeader);
    end;
   ```

Another task that you can perform at this point is to specify which filter fields appear in the **Workflow Event Conditions** page.  

For more information, see [Subscribing to Events](devenv-subscribing-to-events.md).  

You have now created a new workflow event. Next, we'll create a new workflow response that relates to the workflow event.  

## Workflow response

Create a new .al file, such as MyWorkflowResponses.codeunit.al, with code to identify the workflow response, add the workflow response code to the library, implement the workflow response, and then enable that the workflow response can be executed.  

### To create a workflow response code that identifies the workflow response  

1. Add a new codeunit that will be used for the new workflow responses. Name it to reflect that it handles your new responses, such `MyWorkflowResponses`.  

2. Add a method in the codeunit. Name the method to reflect that it is used to identify the workflow response, such as `MyWorkflowResponseCode` with a return value of code (128).  

### To add the workflow response code to the Workflow Response table  

1. Add another method in the codeunit that will be the event subscriber. Name it to reflect that it is used to add the workflow response to the library, such as `AddMyWorkflowResponsesToLibrary` and set it to subscribe to the OnAddWorkflowResponsesToLibrary` method in the `Workflow Response Handling` codeunit.  

   ```AL
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Event Handling", 'OnAddWorkflowEventPredecessorsToLibrary', '', false, false)]
    local procedure AddWorkflowEventHierarchiesToLibrary(EventFunctionName: Code[128])
    begin
    end;
   ```

2. Add a local variable for the codeunit:

    ```al
    [...]
    var
    WorkflowResponseHandling: Codeunit "Workflow Response Handling";
    ```

3. In the method, write code that registers the response, so that you end up with something like the following code.  

   ```AL
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Response Handling", 'OnAddWorkflowResponsesToLibrary', '', true, true)]
    local procedure AddMyWorkflowResponsesToLibrary()
    var
        WorkflowEventHandling: codeunit "Workflow Event Handling";
    begin
        WorkflowResponseHandling.AddResponseToLibrary(MyWorkflowResponseCode, Database::"Purchase Header", 'Send a notification.', 'GROUP 0');
        End
    end;
   ```

> [!NOTE]  
> In the [To add a new workflow response option](#to-add-a-new-workflow-response-option) section, you will change the GROUP value to *50100*. This way, you'll be able to see the workflow in action.

The codeunit now looks something like this:

```AL
codeunit 50103 MyWorkflowResponses
{
    procedure MyWorkflowResponseCode(): code[128];
    begin
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Response Handling", 'OnAddWorkflowResponsesToLibrary', '', true, true)]
    local procedure AddMyWorkflowResponsesToLibrary()
    var
        WorkflowResponseHandling: Codeunit "Workflow Response Handling";
    begin
        WorkflowResponseHandling.AddResponseToLibrary(MyWorkflowResponseCode, Database::"Purchase Header", 'Send a notification.', 'GROUP 0');
    end;
}
```

### To implement the workflow response  

1. Create another method in the codeunit. Name it to reflect that it is used to implement the workflow response, such as `MyWorkflowResponse`, that takes a parameter based on the Purchase Header table.

2. In the method, write code that handles the response, so that you end up with something like the following code.  

    ```AL
    procedure MyWorkflowResponse(PurchaseHeader: Record "Purchase Header")
    begin
        Message('Status change on: %1 %2', PurchaseHeader."Document Type", PurchaseHeader."No.");
    end;
    ```  

### To enable that the workflow response can be executed  

1. Create another method in the codeunit that subscribes to the `OnExecuteWorkflowResponse` event on the `Workflow ResponseHandling`codeunit. Name it to reflect that it is used to enable the new workflow response to be executed alongside existing workflow responses, such as `ExecuteMyWorkflowResponses`.  

2. In the event subscriber method, write code that enables the response, so that you end up with something like the following code.  

    ```AL
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Response Handling", 'OnExecuteWorkflowResponse', '', true, true)]
    procedure ExecuteMyWorkflowResponses(ResponseWorkflowStepInstance: Record "Workflow Step Instance"; var ResponseExecuted: Boolean; var Variant: Variant; xVariant: Variant)
    var
        WorkflowResponse: record "Workflow Response";
    begin
        if WorkflowResponse.GET(ResponseWorkflowStepInstance."Function Name") then
            case WorkflowResponse."Function Name" of
                MyWFResponseCode:
                    BEGIN
                        MyWorkflowResponse(Variant);
                        ResponseExecuted := TRUE;
                    END;
            END;
    end;
    ```  

You'll update this method in step 8 in the next section.

### To add a new workflow response option  

1. Create a [table extension object](devenv-table-ext-object.md) that extends table 1523, **Workflow Step Argument**, such as MyWorkflowStepArgument.TableExt.al.  

2. Add a field that reflects your new response option, such as **My New Response Option**.  

    ```AL
    tableextension 50100 WFW_WorkflowStepArgument extends "Workflow Step Argument"
    {
        fields
        {
            field(50100; "My New Response Option"; Text[100])
            {
            }
        }
    }
    ```

3. Create a [page extension object](devenv-page-ext-object.md) that extends page 1523, **Workflow Response Options**, such as MyworkflowStepArgument.PageExt.al.  

4. Add a group and a control for the new field.  

    ```AL
    pageextension 50101 WFW_WorkflowResponseOptions extends "Workflow Response Options"
    {
        layout
        {
            addlast(content)
            {
                group(Group50100)
                {
                    Visible = Rec."Response Option Group" = 'GROUP 50100';
                    ShowCaption = false;

                    field(MyNewResponseOption; Rec."My New Response Option")
                    {
                        ApplicationArea = All;
                    }
                }
            }
        }
    }
    ```

    Here, the **Visibility** property of the group is set to `"Response Option Group" = 'GROUP 51000'`, but you can set it to another value.  

5. Go back to MyWorkflowResponses.codeunit.al and the ´AddMyWorkflowResponsesToLibrary` method.  

6. In the method code, change `'GROUP 0'` to `'GROUP 50100'`.  

    ```AL
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Response Handling", 'OnAddWorkflowResponsesToLibrary', '', true, true)]
    local procedure AddMyWorkflowResponsesToLibrary()
    var
        WorkflowResponseHandling: Codeunit "Workflow Response Handling";
    begin
        WorkflowResponseHandling.AddResponseToLibrary(MyWorkflowResponseCode, Database::"Purchase Header", 'Send a notification.', 'GROUP 50100');
    end;
    ```

7. To use the new option in the `MyWorkflowResponse` method, proceed to add a local parameter and a local variable and show a message as the response.  

   ```AL
    local procedure MyWorkflowResponse(PurchaseHeader: Record "Purchase Header"; WorkflowStepInstance: Record "Workflow Step Instance")
    var
        WorkflowStepArgument: Record "Workflow Step Argument";
    begin
        if WorkflowStepArgument.Get(WorkflowStepInstance.Argument) then;

        Message('Status change on: %1 %2.\%3', PurchaseHeader."Document Type", PurchaseHeader."No.", WorkflowStepArgument."My New Response Option")
    end;
    ```

8. In the `ExecuteMyWorkflowResponses` method, make the following code change:  

     Change from this code: `MyWorkflowResponse(Variant);`  

     Change to this code: `MyWorkflowResponse(Variant,ResponseWorkflowStepInstance);`  

    You have now created the actual workflow event and response. Proceed to perform various tasks that enable them to be used in workflows.  

## Register workflow event/response combinations

In this section, you'll add new workflow event/response combinations to table 1509 **WF Event/Response Combination** so that they appear correctly in the **Workflow Events** and **Workflow Responses** pages.  

### To register workflow event/response combinations needed for the new workflow response  

1. Open the codeunit that you created in the [Workflow response](#workflow-response) section, `My Workflow Responses`.  

2. Create another method in the codeunit that subscribes to the `OnAddWorkflowResponsePredecessorsToLibrary` event on the `Workflow Response Handling` codeunit . Name it to reflect that it is used to add the workflow event/response combinations to table 1509 **WF Event/Response Combination**, such as `AddMyWorkflowEventResponseCombinationsToLibrary`.  

    ```AL
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Response Handling", 'OnAddWorkflowResponsePredecessorsToLibrary', '', false, false)]
    local procedure AddMyworkflowEventOnAddWorkflowResponsePredecessorsToLibrary(ResponseFunctionName: Code[128])
    var
        MyWorkflowEvents: Codeunit MyWorkflowEvents;
        WorkflowResponseHandling: Codeunit "Workflow Response Handling";
    begin
        Case ResponseFunctionName of
            MyWorkflowResponseCode():
                WorkflowResponseHandling.AddResponsePredecessor(MyWorkflowResponseCode(), MyWorkflowEvents.MyWorkflowEventCode());
        End
    end;
    ```

   In the method, write code that registers event/response combinations that you want to support in your application, using a CASE statement, such as the code in the example above.  
  
   You can also do this work from the user interface on page 1507 **Workflow-Event-Response-Combinations**.  

## Register workflow event hierarchies

In this section, you'll add new workflow event/event combinations to table 1509 **WF Event/Response Combination** so that they workflow events appear in the correct hierarchy in the **Workflow Events** page.  

### To register workflow event hierarchies needed for the new workflow event  

1. Go back to the MyWorkflowEvents.codeunit.al file with the codeunit that you created in the [To create a workflow event code that identifies the workflow event](#to-create-a-workflow-event-code-that-identifies-the-workflow-event) section, `My Workflow Events`.  

2. Create another method in the codeunit that subscribes to the `OnAddWorkflowEventPredecessorsToLibrary` event on the `Workflow Event Handling` codeunit. Name it to reflect that it is used to add the workflow event hierarchies to table 1509 **WF Event/Response Combination**, such as `AddWorkflowEventHierarchiesToLibrary`.  

    ```AL
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Event Handling", 'OnAddWorkflowEventPredecessorsToLibrary', '', false, false)]
    local procedure AddWorkflowEventHierarchiesToLibrary(EventFunctionName: Code[128])
    var
        WorkflowEventHandling: codeunit "Workflow Event Handling";
    begin
        Case EventFunctionName of
            MyWorkflowEventCode():
                //WorkflowEventHandling.AddEventPredecessor(MyWorkflowEventCode(), WorkflowEventHandling./*[Add your predecessor event code]*/);
                ;
        End
    end;
    ```

    In the method, write code that registers event hierarchies that you want to support in your application, using a CASE statement, such as the code in the example above.  

    You can also do this work from the user interface on page 1506 **Workflow-Event-Hierarchies**.  

## Create table relations

Workflows events can be executed on different types of records. To keep track of these, you must define relations between the involved records. In this section, you'll create  relationships between the entities that are used when the new workflow event and response are used.  

### To create table relations between entities that are processed when the new workflow event and response are used in workflows  

1. Got back to the MyWorkflowEvents.codeunit.al file with the codeunit that you created in the [To create a workflow event code that identifies the workflow event](#to-create-a-workflow-event-code-that-identifies-the-workflow-event) section, `My Workflow Events`.  

2. Create another method in the codeunit that subscribes to the `OnAddWorkflowTableRelationsToLibrary` event on the `Workflow Event Handling` codeunit. Name it to reflect that it is used add workflow table relations in table 1505 **Workflow Table Relation**, such as `AddWorkflowTableRelationsToLibrary`.  

    ```AL
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Event Handling", 'OnAddWorkflowTableRelationsToLibrary', '', false, false)]
    local procedure AddWorkflowTableRelationsToLibrary()
    var
        WorkflowSetup: Codeunit "Workflow Setup";
    begin
        WorkflowSetup.InsertTableRelation(Database::"Purchase Header", 1, Database::"Approval Entry", 2);
    end;
    ```

    In the method, write code that registers table relations that you want to support in your application, such as the example above.  

    You can also do this work from the user interface on page 1509 **Workflow Table-Relations**.  

<!--## Adding a FactBox that Shows How a Record Participates in a Workflow

Add a FactBox to relevant pages so that users can view when and how the new workflow event and response participate in workflows for records shown on the page.  

### To add a FactBox that shows how a record participates in a workflow  

1. Open the page object from where users need to see related workflows that use the new workflow event and response.  

2. Add a FactBox. Name it `WorkflowStatus`. For more information, see [Adding a FactBox to a Page](devenv-adding-a-factbox-to-page.md).  

3. Add a global variable as described in the following table.  

   |        Name        | DataType | Subtype | Visible|
   |--------------------|----------|---------|--------|
   | ShowWorkflowStatus | Boolean  |         | True   |

4. On the page, add the following code to the `OnAfterGetCurrentRecord` method to make the FactBox find the workflow that relates to the record.  

   ```AL
   ShowWorkflowStatus := CurrPage.WorkflowStatus.PAGE.SetFilterOnWorkflowRecord(RECORDID);  
   ```  
-->
You have now enabled a new workflow scenario by implementing the required workflow event and response in the application code. The workflow administrator can now select the workflow event and workflow response from the **Workflow** page to define new or edit existing workflows. For more information, see [Set Up Workflows](/dynamics365/business-central/across-set-up-workflows) in the business functionality content.

## See Also

[Workflows in Dynamics 365 Business Central](/dynamics365/business-central/across-workflow)  
[Set Up Workflows](/dynamics365/business-central/across-set-up-workflows)  
[Event Example](devenv-events-example.md)  
[Events in AL](devenv-events-in-al.md)  
[Page Extension Object](devenv-page-ext-object.md)  
[Table Extension Object](devenv-table-ext-object.md)  
[Codeunit Object](devenv-codeunit-object.md)  
[Table Object](devenv-table-object.md)  
[Getting Started with AL](devenv-get-started.md)  
[Development and Administration for Dynamics 365 Business Central](../index.md)  
