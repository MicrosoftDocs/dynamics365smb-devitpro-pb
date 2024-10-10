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

Use events to design the application to react to specific actions or behaviors. Events let you separate custom functionality from the application's business logic. By using events where customizations are typically made, you lower the cost of code modifications and upgrades to the original application.

This article describes the types of integration events, and the events that we consider as high, medium, and low quality. How we define these rankings varies, depending on factors such as:

* The number of times they're implemented.
* How easy they are to maintain when you refactor code.

To learn more about events, go to [Events in AL](devenv-events-in-al.md).

### Types of events

The following list includes the types of events that are available. Use the links to learn more about them.

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

**Very High Value** - Use business events to notify subscribers that a specific business event has occurred. 

Examples:

* OnRejectApprovalRequest(var ApprovalEntry: Record "Approval Entry"),
* OnApproveApprovalRequest(var ApprovalEntry: Record "Approval Entry"),

![BusinessEvent_01](images/BusinessEvents_01.png)

![BusinessEvent_02](images/BusinessEvents_02.png)

<!--need to replace the images with code examples-->

### OnBefore/OnAfter Events

`OnBefore/After` events vary in terms of quality, depending on where they're implemented.

`OnBefore/After` events might not allow the code to override existing behavior just to add additional logic to flows.

#### Before/After Operation

**High Value** - If events are implemented before or after a large operation starts, they're high quality.

Examples of high-quality events are:

* `OnAfterPostSalesDoc`
* `OnBeforeSendEmail`
* `OnAfterEmailSent`

![OnBeforeAfterOperationEvents_01](images/OnBeforeAfterOperationEvents_01.png)

![OnBeforeAfterOperationEvents_02](images/OnBeforeAfterOperationEvents_02.png)

#### Before/After Procedure

**Medium Value** - We often use these events to provide more processing before or after a specific method is called. 

These events are medium quality because they're connected to the specific procedure, but it's unclear how to handle them if the procedure is removed or changed.

![OnBeforeAfterProcedureEvents_01](images/OnBeforeAfterProcedureEvents_01.png)

![OnBeforeAfterProcedureEvents_02](images/OnBeforeAfterProcedureEvents_02.png)

#### Before/After specific line

**Low Value** - A valid use could be before we insert or modify a line to update specific fields. Otherwise, avoid them because the point to a specific line of code. They were needed before because the Hook pattern was used as a default extensibility.

We should carefully consider whether we need Hook events before we introduce them. Hook events have little reuse between extensions, and can be fragile to code changes.

Example of valid usage: <!--replace images with code examples-->

<figure><img src="images/OnBeforeAfterLineEvents_01.png" alt="OnBeforeAfterLineEvents_01" style="border: 3px solid green;"></figure>

<figure><img src="images/OnBeforeAfterLineEvents_02.png" alt="OnBeforeAfterLineEvents_02" style="border: 3px solid green;"></figure>

Example of a lower quality usage, because they could be grouped into a single event, rather than several:

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

### Isolated events

**Medium Value** - Use isolated events to allow handling errors that won't interrupt the code execution.

Multiple extensions can subscribe and do their processing. An error from one extension won't interrupt the transaction.

Isolated events require a commit before invoking the code, and will commit before invoking the next subscriber. Therefore, they require a detailed review.

An alternative is to invoke `if Codeunit.Run()` and then handle things in isolation.

`Codeunit.Run` requires an explicit commit before and has better testability, because there isn't an easy to test isolated events for error cases. To do error case testing, disable test isolation. Otherwise, the error eon't be handled.

Events are better than `Codeunit.Run` because they allow multiple subscribers. Running a codeunit only lets one implementation run at a time.

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

**Low Value** - Handled events are low quality events.

> [!NOTE]
> Subscribers must exit if the event is already handled, thus these events don't scale. Consider using skip events.

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

The event was raised with a temporary table, and all subscribers would fill in the temporary table. The table would show in the UI so you could select the specific implementation.

We can get better designs with enums and interfaces.

<!--need to replace the images with code examples-->

![DiscoveryEvents_01](images/DiscoveryEvents_01.png)

![DiscoveryEvents_02](images/DiscoveryEvents_02.png)

## See also

[Extensibility overview](devenv-extensibility-overview.md)  
[Extension objects overview](devenv-extension-object-overview.md)  