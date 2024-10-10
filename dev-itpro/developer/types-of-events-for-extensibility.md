---
title: Types of events for extensibility
description: This article describes various types of events for extensibility. 
author: brentholtorf
ms.author: bholtorf 
ms.reviewer: solsen
ms.topic: conceptual 
ms.collection: 
ms.date: 10/09/2024
ms.custom: bap-template
---

## Types of events for extensibility

Use events to design the application to react to specific actions or behaviors. <!--can we give an example of an action or behavior? Maybe... For example, an event might display a notification when someone changes a customer address.--> Events let you separate custom functionality from the application's business logic. By using events where customizations are typically made, you lower the cost of code modifications and upgrades to the original application.

<!--should we make the intro more about extensibility requests-->

To learn more about events, go to [Events in AL](devenv-events-in-al.md).

### Types of events

<!--need to say what the list shows-->

- [Business Events](#business-events)
- [OnBefore/OnAfter Events](#onbeforeonafter-events)
    - [Before/After Operation](#beforeafter-operation)
    - [Before/After Procedure](#beforeafter-procedure)
    - [Before/After specific line](#beforeafter-specific-line)
- [Verify Events](#verify-events)
- [Isolated Events](#isolated-events)
- [Switch Events](#switch-events-manually-bound-events)
- [OnSkip Events](#onskip-operation-events)
- [Handled Events](#handled-events)
- [Discovery Events](#discovery-events-mostly-obsoleted)

### Business events

**Very High Value** - Use business events to notify subscribers that a specific business event has occurred. <!--not sure what very high value means here-->

Examples:

- OnRejectApprovalRequest(var ApprovalEntry: Record "Approval Entry"),
- OnApproveApprovalRequest(var ApprovalEntry: Record "Approval Entry"),

![BusinessEvent_01](images/BusinessEvents_01.png)

![BusinessEvent_02](images/BusinessEvents_02.png)

<!--need to replace the images with code examples-->

### OnBefore/OnAfter Events

`OnBefore/After` events vary in terms of quality, depending on where they're implemented.

`OnBefore/After` events might not allow the code to override existing behavior just to add additional logic to flows.

#### Before/After Operation

**High Value** - If events are implemented before or after a large operation starts, they're High Quality. <!--High quality, or high value? Starting to think that we might want to explain what the high and medium quality and value mean-->

Examples of high-quality events are:

- `OnAfterPostSalesDoc`
- `OnBeforeSendEmail`
- `OnAfterEmailSent`

![OnBeforeAfterOperationEvents_01](images/OnBeforeAfterOperationEvents_01.png)

![OnBeforeAfterOperationEvents_02](images/OnBeforeAfterOperationEvents_02.png)

#### Before/After Procedure

**Medium Value** - We often use these events to provide more processing before or after a specific method is called.

These events are medium quality because they're connected to the specific procedure, but it's unclear how to handle them if the procedure is removed or changed.

![OnBeforeAfterProcedureEvents_01](images/OnBeforeAfterProcedureEvents_01.png)

![OnBeforeAfterProcedureEvents_02](images/OnBeforeAfterProcedureEvents_02.png)

#### Before/After specific line

**Low Value** - A valid use could be before we insert or modify a line to update specific fields. Otherwise, avoid them because they're too narrow. <!--should we elaborate on "narrow"?-->
They were needed before because the Hook pattern was used as a default extensibility.

We should carefully consider whether we need Hook events before we introduce them. Hook events have little reuse between extensions, and can be fragile to the code changes.

Example of valid usage: <!--replace images with code examples-->

<figure><img src="images/OnBeforeAfterLineEvents_01.png" alt="OnBeforeAfterLineEvents_01" style="border: 3px solid green;"></figure>

<figure><img src="images/OnBeforeAfterLineEvents_02.png" alt="OnBeforeAfterLineEvents_02" style="border: 3px solid green;"></figure>

Example of not the best usage (could be grouped): <!--not the best usage, or is this what not to do?-->

<figure><img src="images/OnBeforeAfterLineEvents_bad_01.png" alt="OnBeforeAfterLineEvents_bad_01" style="border: 3px solid red;"></figure>
or
<figure><img src="images/OnBeforeAfterLineEvents_bad_02.png" alt="OnBeforeAfterLineEvents_bad_02" style="border: 3px solid red;"></figure>

### Verify events

**Medium Value** - Use verify events before or after the operation to check whether the business logic is correct.

Verify events shouldn't create transactions. If the operation should be rolled back from an after event, make sure that the code before the event uses the `Ignore Commit` parameter.

Use before events as early in the code as possible. We must avoid any risk of partial commits when we introduce verify events.

<!--replace the images with code examples-->

![VerifyEvents_01](images/VerifyEvents_01.png)

![VerifyEvents_02](images/VerifyEvents_02.png)

![VerifyEvents_03](images/VerifyEvents_03.png)

### Isolated Events

**Medium Value** - Use isolated events to allow handling errors that won't interrupt the code execution.

Multiple extensions can subscribe and do their processing. An error from one extension won't interrupt the transaction.

Isolated events require a commit before invoking the code, and will commit before invoking the next subscriber. Therefore, they require a detailed review.

An alternative is to invoke the if Codeunit.Run() then to handle things in isolation. <!--not sure about this sentence. Check with Marko-->
`Codeunit.Run` requires an explicit commit before and has better testability, because there isn't an easy to test isolated events for error cases. To do error case testing, disable test isolation. Otherwise, the error eon't be handled.

Event <!--what event?--> is better than `Codeunit.Run` because it allows multiple subscribers. Running a codeunit only lets one implementation run at a time.

<!--need to replace the images with code examples-->

![IsolatedEvents_01](images/IsolatedEvents_01.png)

![IsolatedEvents_02](images/IsolatedEvents_02.png)

![IsolatedEvents_03](images/IsolatedEvents_03.png)

### Switch events (manually bound events)

**Medium Value** - For switch events, the idea is to create an event that only manually bound subscribers should subscribe to.

Then, early in the action, you can implement a manually bound subscriber that helps you change the behavior of that specific call.

<!--Need to replace the images with code examples-->

![SwitchEvents_01](images/SwitchEvents_01.png)

![SwitchEvents_02](images/SwitchEvents_02.png)

![SwitchEvents_03](images/SwitchEvents_03.png)

![SwitchEvents_04](images/SwitchEvents_04.png)

### OnSkip (operation) events

**Medium Value** - Skip events are similar to handled events. However, they can have multiple skip parameters, which gives us more granular control of the code.

The signature expects multiple subscribers, so there can be multiple extensions that handle the event.

<!--need to replace the images with code examples-->

![SkipEvents_01](images/SkipEvents_01.png)

![SkipEvents_02](images/SkipEvents_02.png)

or

![SkipEvents_03](images/SkipEvents_03.png)

![SkipEvents_04](images/SkipEvents_04.png)

### Handled events

**Low Value** - Handled events are low quality events. **Subscriber must exit if the event is already handled**, <!--is this bold for emphasis only?--> thus these events don't scale. Consider using skip events.

<!--need to replace the images with code examples-->

![HandledEvents_01](images/HandledEvents_01.png)

![HandledEvents_02](images/HandledEvents_02.png)

![HandledEvents_03](images/HandledEvents_03.png)

**Advantage**

* Easy to implement

**Disadvantages**

* Only one subscriber can process the request. If there are multiple subscribers, by contract the first subscriber should handle the event.
* We need to be careful about the events raised by the existing code. The question is whether to raise them. Introducing a handled event can break these events.
* It's unclear whether the code was handled, and why it was handled.

### Discovery events (mostly obsoleted)

Discovery events were used to discover all possible implementations of the functionality.

The event was raised with a temporary table, and then all subscribers would fill the temporary table. The table would show in the UI for the user to select the specific implementation.

We can get better designs with enums and interfaces.

<!--need to replace the images with code examples-->

![DiscoveryEvents_01](images/DiscoveryEvents_01.png)

![DiscoveryEvents_02](images/DiscoveryEvents_02.png)

<!--can we delete this?-->
<style>
r { color: Orange } 
</style>

## See also

[Extensibility overview](devenv-extensibility-overview.md)  
[Extension objects overview](devenv-extension-object-overview.md)  