---
title: "Walkthrough: Implementing New Workflow Events and Responses"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 32b1f7c7-ea23-4fd1-a565-7161cdc4dc86
caps.latest.revision: 14
---
# Walkthrough: Implementing New Workflow Events and Responses
If a business scenario requires a workflow event or a workflow response that is not supported in a Microsoft Dynamics NAV solution, you must implement it by customizing the application code.  

 In the **Workflow** window, the workflow administrator creates a workflow by listing the involved steps on the lines. Each step consists of a workflow event, moderated by event conditions, and a workflow response, customized by response options. You define workflow steps by filling fields on workflow lines from fixed lists of event and response values representing scenarios that are supported by the application code. For more information, see [How to: Create Workflows](/dynamics-nav-app/across-how-to-create-workflows) in the application help.

 The following procedure describes how to add a new workflow event and a new workflow response to the application code and then register the involved object relations, so that the new elements can be used in workflows. The workflow administrator can then select the new workflow event and response from the **Workflow** window to incorporate them in new or existing workflow steps.  

> [!IMPORTANT]  
>  To ensure that custom workflow records are upgraded correctly, you must add new workflow events, workflow responses, and workflow table relations to dedicated extension points, as described in this procedure. During an upgrade to the next version, the libraries of workflow events, responses, and table relations are removed and then recreated with the latest content from Microsoft. By adding your custom workflow records using subscriptions to the Microsoft-provided extension points, you ensure that your custom record library gets recreated after an upgrade.  

> [!NOTE]  
>  This topic refers to two types of events:  
>   
> - *Workflow Event*: An occurrence in the application that users in the client can select from the **Workflow** page to define workflow steps. For more information, see [Workflow](/dynamics-nav-app/across-workflow) in the application Help.
> - *Event*: The declaration of the occurrence or change in the application. Workflow events typically subscribe to events. For more information, see [Events in Microsoft Dynamics NAV](Events-in-Microsoft-Dynamics-NAV.md).  

 The development work involved in creating a new workflow event and a related workflow response consists of the following tasks, as a minimum:  

1.  Creating a workflow event  

    1.  Creating a workflow event code that identifies the workflow event  

    2.  Adding the workflow event code to the Workflow Event table  

    3.  Creating and publishing an event that the workflow event subscribes to  

    4.  Raising the event  

    5.  Subscribing to the event and implement the workflow event  

2.  Creating a workflow response  

    1.  Creating a workflow response code that identifies the workflow response  

    2.  Adding the workflow response code to the Workflow Response table  

    3.  Implementing the workflow response  

    4.  Enabling that the workflow response can be executed  

    5.  Adding a new workflow response option  

3.  Registering workflow event/response combinations needed for the new workflow response  

4.  Registering workflow event hierarchies needed for the new workflow event  

5.  Creating table relations between entities used when the new workflow event and response are used  

6.  Adding a FactBox that shows how a record participates in a workflow  

> [!NOTE]  
>  Data and code samples in this procedure refer loosely to a workflow step of sending a notification when a purchase header is posted. However, the procedure alone does not result in a complete solution.  

 To follow similar steps in a data-driven demo script with screenshots, see the “Build Your Own Workflow Event” demo script, which is available on the [Microsoft Dynamics NAV readiness landing page](http://go.microsoft.com/fwlink/?LinkID=623438&clcid=0x409).  

## Creating a Workflow Event  
 Create a code to identify the workflow event, add the workflow event to the library, create an event that the workflow event subscribes to, raise the event, and then subscribe to the event and implement the workflow event.  

### To create a workflow event code that identifies the workflow event  

1.  Create a new codeunit that will be used for new workflow events. Name it to reflect that it is used to identify the new workflow event, such as My Workflow Events. For more information, see [How to: Create a Codeunit](How-to--Create-a-Codeunit.md).  

2.  Create a global function in the codeunit. Name the function to reflect that it is used to identify the workflow event, such as MyWorkflowEventCode. For more information, see [How to: Add a Function to a Codeunit](How-to--Add-a-Function-to-a-Codeunit.md).  

3.  Open the **C/AL Locals** window to add a local return value. For more information, see [C-AL Locals](uiref/-$-S_10205-C-AL-Locals-$-.md).  

4.  On the **Return Value** tab, fill the fields as described in the following table.  

    |Return Type|Length|  
    |-----------------|------------|  
    |Code|128|  

### To add the workflow event code to the Workflow Event table  

1.  Create another function in the codeunit. Name it to reflect that it is used to add the workflow event to the library, such as AddMyWorkflowEventsToLibrary.  

2.  In the **Properties** window, fill the fields as described in the following table.  

    |Property|Value|  
    |--------------|-----------|  
    |Event|Subscriber|  
    |EventPublisherObject|Codeunit Workflow Event Handling|  
    |EventFunction|OnAddWorkflowEventsToLibrary|  

3.  Open the **C/AL Locals** window to add a local variable.  

4.  On the **Variables** tab, fill the fields as described in the following table.  

    |Name|DataType|Subtype|  
    |----------|--------------|-------------|  
    |WorkflowEventHandling|Codeunit|Workflow Event Handling|  

5.  In the function, write code that handles the event, such as the following code.  

    ```  
    WorkflowEventHandling.AddEventToLibrary(MyWorkflowEventCode,DATABASE::”Purchase Header”,’A purchase header is posted.’,0,FALSE);  
    ```  

### To create and publish an event that the workflow event subscribes to  

1.  Create a function in the codeunit where you want to raise the event, such as the Purch.-Post codeunit. Name the function to reflect that it is used as the publisher event, such as OnAfterPostPurchaseHeader.  

2.  In the **Properties** window, fill the fields as described in the following table.  

    |Property|Value|  
    |--------------|-----------|  
    |Event|Publisher|  
    |EventType|Select the event type that is relevant for the workflow event, such as Integration. For more information, see [Event Types](Event-Types.md).|  

3.  Open the **C/AL Locals** window to add a local parameter.  

4.  On the **Parameters** tab, fill the fields as described in the following table.  

    |Name|DataType|Subtype|  
    |----------|--------------|-------------|  
    |Purchase Header|Record|Purchase Header|  

 For more information, see [Publishing Events](Publishing-Events.md).  

### To raise the event  

1.  Go to the code in your solution where you want to raise the event, such as the Purch.-Post codeunit.  

2.  In the function, write code that raises the event, such as the following code.  

    ```  
    OnAfterPostPurchaseHeader(PurchaseHeader);  
    ```  

 For more information, see [Raising Events](Raising-Events.md).  

### To subscribe to the event and implement the workflow event  

1.  Create another function in the codeunit where you created the identification code, MyWorkflowEventCode. Name the function to reflect that it is used to subscribe to and implement the workflow event, such as RunWorkflowOnAfterPostPurchaseHeader.  

2.  In the **Properties** window, fill the fields as described in the following table.  

    |Property|Value|  
    |--------------|-----------|  
    |Event|Subscriber|  
    |EventPublisherObject|Select the object that contains the definition of the added event, such as the Purch.-Post codeunit.|  
    |EventFunction|OnAfterPostPurchaseHeader|  

3.  Choose **Yes** to overwrite your local parameters with the event parameters.  

4.  Open the **C/AL Locals** window to add a local variable.  

5.  On the **Variables** tab, fill the fields as described in the following table.  

    |Name|DataType|Subtype|  
    |----------|--------------|-------------|  
    |WorkflowManagement|Codeunit|Workflow Management|  

6.  In the function, write code that handles the event, such as the following code.  

    ```  
    WorkflowManagement.HandleEvent(MyWorkflowEventCode,PurchaseHeader);  
    ```  

 Another task that you can perform at this point is to specify which filter fields appear in the **Workflow Event Conditions** window.  

 For more information, see [Subscribing to Events](Subscribing-to-Events.md).  

 You have now created a new workflow event. Proceed to create a new workflow response that relates to the workflow event.  

## Creating a Workflow Response  
 Create a code to identify the workflow response, add the workflow response code to the library, implement the workflow response, and then enable that the workflow response can be executed.  

### To create a workflow response code that identifies the workflow response  

1.  Create a new codeunit that will be used for the new workflow responses. Name it to reflect that it handles your new responses, such My Workflow Responses.  

2.  Create a function in the codeunit. Name the function to reflect that it is used to identify the workflow response, such as MyWorkflowResponseCode.  

3.  Open the **C/AL Locals** window to add a local return value.  

4.  On the **Return Value** tab, fill the fields as described in the following table.  

    |Return Type|Length|  
    |-----------------|------------|  
    |Code|128|  

### To add the workflow response code to the Workflow Response table  

1.  Create another function in the codeunit. Name it to reflect that it is used to add the workflow response to the library, such as AddMyWorkflowResponsesToLibrary.  

2.  In the **Properties** window, fill the fields as described in the following table.  

    |Property|Value|  
    |--------------|-----------|  
    |Event|Subscriber|  
    |EventPublisherObject|Codeunit Workflow Response Handling|  
    |EventFunction|OnAddWorkflowResponsesToLibrary|  

3.  Open the **C/AL Locals** window to add a local variable.  

4.  On the **Variables** tab, fill the fields as described in the following table.  

    |Name|DataType|Subtype|  
    |----------|--------------|-------------|  
    |WorkflowResponseHandling|Codeunit|Workflow Response Handling|  

5.  In the function, write code that registers the response, such as the following code.  

    ```  
    WorkflowResponseHandling.AddResponseToLibrary(MyWorkflowResponseCode,DATABASE::"Purchase Header",'Send a notification.','GROUP 0')  
    ```  

    > [!NOTE]  
    >  In the “To add a new workflow response option” procedure, you will change the GROUP value to, for example, 50000.  

### To implement the workflow response  

1.  Create another function in the codeunit. Name it to reflect that it is used to implement the workflow response, such as MyWorkflowResponse.  

2.  Open the **C/AL Locals** window to add a local parameter.  

3.  On the **Parameters** tab, fill the fields as described in the following table.  

    |Name|DataType|Subtype|  
    |----------|--------------|-------------|  
    |Purchase Header|Record|Select the relevant record, such as Purchase Header table.|  

4.  In the function, write code that handles the response, such as the following code.  

    ```  
    CODEUNIT.RUN(CODEUNIT::"Purch.-Post",PurchaseHeader);  
    ```  

### To enable that the workflow response can be executed  

1.  Create another function in the codeunit. Name it to reflect that it is used to enable the new workflow response to be executed alongside existing workflow responses, such as ExecuteMyWorkflowResponses.  

2.  In the **Properties** window, fill the fields as described in the following table.  

    |Property|Value|  
    |--------------|-----------|  
    |Event|Subscriber|  
    |EventPublisherObject|Codeunit Workflow Response Handling|  
    |EventFunction|OnExecuteWorkflowResponse|  

3.  Choose **Yes** to overwrite your local parameters with the event parameters.  

4.  In the function, write code that enables the response, such as the following code.  

    ```  
    IF WorkflowResponse.GET(ResponseWorkflowStepInstance."Function Name") THEN  
      CASE WorkflowResponse."Function Name" OF  
        MyWFResponseCode:  
          BEGIN  
            MyWorkflowResponse(Variant);  
            ResponseExecuted := TRUE;  
          END;  
      END;  

    ```  

### To add a new workflow response option  

1.  Open table 1523, **Workflow Step Argument**, in design mode.  

2.  Add a field that reflects your new response option, such as **My New Response Option**. For more information, see [How to: Add Fields to a Table](How-to--Add-Fields-to-a-Table.md).  

3.  Open page 1523, **Workflow Response Options**, in design mode.  

4.  Add a group and a control for the new field.  

5.  For the **Visibility** property of the group, enter, for example, `"Response Option Group" = 'GROUP 50000'`.  

6.  Open the AddMyWorkflowResponsesToLibrary function.  

7.  In the function code, change `‘GROUP 0’` to `‘GROUP 50000’`.  

8.  To make sure that the new workflow response is updated, delete the **Send a notification.** response from table 1521, **Workflow Response**.  

     To use the new option in the MyWorkflowResponse function, proceed to add a local parameter and a local variable.  

9. Open the **C/AL Locals** window to add a local parameter and a local variable.  

10. On the **Parameters** tab, fill the fields as described in the following table.  

    |Name|DataType|Subtype|  
    |----------|--------------|-------------|  
    |WorkflowStepInstance|Record|Workflow Step Instance|  

11. On the **Variables** tab, fill the fields as described in the following table.  

    |Name|DataType|Subtype|  
    |----------|--------------|-------------|  
    |WorkflowStepArgument|Record|Workflow Step Argument|  

12. In the function, write code that enables the response, such as the following code:  

    ```  
    IF WorkflowStepArgument.GET(WorkflowStepInstance.Argument) THEN;  
    ```  

     You now have access to your new field on the table 1523 ** Workflow Step Argument**  that you can use as a workflow response option.  

13. In the ExecuteMyWorkflowResponses function, make the following code change:  

     Change from this code: `MyWorkflowResponse(Variant);`  

     Change to this code: `MyWorkflowResponse(Variant,ResponseWorkflowStepInstance);`  

 You have now created the actual workflow event and response. Proceed to perform various tasks that enable them to be used in workflows.  

## Registering Workflow Event/Response Combinations Needed for the New Workflow Response  
 Add new workflow event/response combinations to table 1509 **WF Event/Response Combination** so that they appear correctly in the **Workflow Events** and **Workflow Responses** windows.  

### To register workflow event/response combinations needed for the new workflow response  

1.  Open the codeunit that you created in the “To create a workflow response” procedure, My Workflow Responses.  

2.  Create another function in the codeunit. Name it to reflect that it is used to add the workflow event/response combinations to tabel 1509 **WF Event/Response Combination**, such as AddMyWorkflowEventResponseCombinationsToLibrary.  

3.  In the **Properties** window, fill the fields as described in the following table.  

    |Property|Value|  
    |--------------|-----------|  
    |Event|Subscriber|  
    |EventPublisherObject|Codeunit Workflow Response Handling|  
    |EventFunction|OnAddWorkflowResponsePredecessorsToLibrary|  

4.  Choose **Yes** to overwrite your local parameters with the event parameters.  

5.  Open the **C/AL Locals** window to add two local variables.  

6.  On the **Variables** tab, fill the fields as described in the following table.  

    |Name|DataType|Subtype|  
    |----------|--------------|-------------|  
    |MyWorkflowEvents|Codeunit|My Workflow Events|  
    |WorkflowResponseHandling|Codeunit|Workflow Response Handling|  

7.  In the function, write code that registers event/response combinations that you want to support in your application, using a CASE statement, such as the following code.  

    ```  
    CASE ResponseFunctionName OF  
      MyWorkflowResponseCode:  
        WorkflowResponseHandling.AddResponsePredecessor(MyWorkflowResponseCode,MyWorkflowEvents.MyWorkflowEventCode);  
    END;  
    ```  

 You can also do this work from the user interface on page 1507 **Workflow-Event-Response-Combinations**.  

## Registering Workflow Event Hierarchies Needed for the New Workflow Event  
 Add new workflow event/event combinations to table 1509 **WF Event/Response Combination** so that they workflow events appear in the correct hierarchy in the **Workflow Events** window.  

### To register workflow event hierarchies needed for the new workflow event  

1.  Open the codeunit that you created in the “To create a workflow event” procedure, My Workflow Events.  

2.  Create another function in the codeunit. Name it to reflect that it is used to add the workflow event hierarchies to table 1509 **WF Event/Response Combination**, such as AddWorkflowEventHierarchiesToLibrary.  

3.  In the **Properties** window, fill the fields as described in the following table.  

    |Property|Value|  
    |--------------|-----------|  
    |Event|Subscriber|  
    |EventPublisherObject|Codeunit Workflow Event Handling|  
    |EventFunction|OnAddWorkflowEventPredecessorsToLibrary|  

4.  Choose **Yes** to overwrite your local parameters with the event parameters.  

5.  Open the **C/AL Locals** window to add a local variable.  

6.  On the **Variables** tab, fill the fields as described in the following table.  

    |Name|DataType|Subtype|  
    |----------|--------------|-------------|  
    |WorkflowEventHandling|Codeunit|Workflow Event Handling|  

7.  To make sure that the new workflow event is updated, delete the **A purchase header is posted.** event from table 1520 **Workflow Event**.  

8.  In the function, write code that registers event hierarchies that you want to support in your application, using a CASE statement, such as the following code.  

    ```  
    CASE EventFunctionName OF  
      MyWorkflowEventCode:  
        WorkflowEventHandling.AddEventPredecessor(MyWorkflowEventCode,WorkflowEventHandling.[your desired predecessor event code]);  
    END;  
    ```  

 You can also do this work from the user interface on page 1506 **Workflow-Event-Hierarchies**.  

## Creating Table Relations Between Entities Used when the New Workflow Event and Response are Used  
 Workflows events can be executed on different types of records. To keep track of these, you must define relations between the involved records.  

### To create table relations between entities that are processed when the new workflow event and response are used in workflows  

1.  Open the codeunit that you created in the “To create a workflow event” procedure, My Workflow Events.  

2.  Create another function in the codeunit. Name it to reflect that it is used add workflow table relations in table 1505 **Workflow Table Relation**, such as AddWorkflowTableRelationsToLibrary.  

3.  In the **Properties** window, fill the fields as described in the following table.  

    |Property|Value|  
    |--------------|-----------|  
    |Event|Subscriber|  
    |EventPublisherObject|Codeunit Workflow Event Handling|  
    |EventFunction|OnAddWorkflowTableRelationsToLibrary|  

4.  Open the **C/AL Locals** window to add a local variable.  

5.  On the **Variables** tab, fill the fields as described in the following table.  

    |Name|DataType|Subtype|  
    |----------|--------------|-------------|  
    |WorkflowSetup|Codeunit|Workflow Setup|  

6.  To make sure that the new workflow event is updated, delete the **A purchase header is posted.** event from the table 1520 **Workflow Event**.  

7.  In the function, write code that registers table relations that you want to support in your application, such as the following code.  

    ```  
    WorkflowSetup.InsertTableRelation(DATABASE::”Purchase Header”,1,DATABASE::”Approval Entry”,2);  
    ```  

 You can also do this work from the user interface on page 1509 **Workflow Table-Relations**.  

## Adding a FactBox that Shows How a Record Participates in a Workflow  
 Add a FactBox to relevant pages so that users can view when and how the new workflow event and response participate in workflows for records shown on the page.  

### To add a FactBox that shows how a record participates in a workflow  

1.  Open, in design mode, the page from where users need to see related workflows that use the new workflow event and response.  

2.  Add a FactBox. Name it WorkflowStatus. For more information, see [How to: Add a FactBox to a Page](How-to--Add-a-FactBox-to-a-Page.md).  

3.  Open the **C/AL Globals** window to add a global variable.  

4.  On the **Variables** tab, fill the fields as described in the following table.  

    |Name|DataType|Subtype|  
    |----------|--------------|-------------|  
    |ShowWorkflowStatus|Boolean||  

5.  To make the FactBox visible, in the **Properties** window, fill the fields as described in the following table.  

    |Property|Value|  
    |--------------|-----------|  
    |Visible|ShowWorkflowStatus|  

6.  On the page, add the following code to the OnAfterGetCurrentRecord function to make the FactBox find the workflow that relates to the record.  

    ```  
    ShowWorkflowStatus := CurrPage.WorkflowStatus.PAGE.SetFilterOnWorkflowRecord(RECORDID);  
    ```  

 You have now enabled a new workflow scenario by implementing the required workflow event and response in the application code. The workflow administrator can now select the workflow event and workflow response from the **Workflow** page to define new or edit existing workflows. For more information, see [How to: Create Workflows](https://docs.microsoft.com/en-us/dynamics-nav-app/across-how-to-create-workflows) in the application help.

## See Also  
 [Workflow](/dynamics-nav-app/across-workflow)   
 [Events in Microsoft Dynamics NAV](Events-in-Microsoft-Dynamics-NAV.md)   
 [Welcome to the Developer and IT-Pro Help for Microsoft Dynamics NAV](index.md)
