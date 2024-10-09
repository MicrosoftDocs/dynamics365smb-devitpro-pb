## Events

### Types of events
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


### Business Events 
<r>Very High Value</r> - Businesses events are used to notify the subscribers that a specific business event has occurred.<br>
Examples: 
- OnRejectApprovalRequest(var ApprovalEntry: Record "Approval Entry"), 
- OnApproveApprovalRequest(var ApprovalEntry: Record "Approval Entry"), 

![BusinessEvent_01](images/BusinessEvents_01.png)

![BusinessEvent_02](images/BusinessEvents_02.png)

### OnBefore/OnAfter Events 
OnBefore/After events vary in terms of quality depending on where they are implemented.<br>
OnBefore/After events may not allow the code to override existing behavior, just to add additional logic to the flows.

#### Before/After Operation 
<r>High Value</r> - If events are implemented before or after a large operation is started, they are of High Quality. Examples of high-quality events are:
- OnAfterPostSalesDoc, 
- OnBeforeSendEmail, 
- OnAfterEmailSent…

![OnBeforeAfterOperationEvents_01](images/OnBeforeAfterOperationEvents_01.png)

![OnBeforeAfterOperationEvents_02](images/OnBeforeAfterOperationEvents_02.png)

#### Before/After Procedure
<r>Medium Value</r> - We often use these events to provide additional processing before or after a specific method is called.<br>
These events are medium quality as they are connected to the specific procedure, and it is unclear how the events should be handled if the procedure is removed/changed.

![OnBeforeAfterProcedureEvents_01](images/OnBeforeAfterProcedureEvents_01.png)

![OnBeforeAfterProcedureEvents_02](images/OnBeforeAfterProcedureEvents_02.png)

#### Before/After specific line
<r>Low Value</r> - The valid usage could be before we insert/modify a line to update specific fields. Otherwise, they are too narrow and should be avoided.<br>
They were needed before because of the Hook pattern that was used as a default extensibility.<br>
We should carefully consider if the Hook events are needed before introducing them as they have little reuse between extensions and can be fragile to the code changes.
Example of valid usage:

<figure><img src="images/OnBeforeAfterLineEvents_01.png" alt="OnBeforeAfterLineEvents_01" style="border: 3px solid green;"></figure>

<figure><img src="images/OnBeforeAfterLineEvents_02.png" alt="OnBeforeAfterLineEvents_02" style="border: 3px solid green;"></figure>

Example of not the best usage (could be grouped):

<figure><img src="images/OnBeforeAfterLineEvents_bad_01.png" alt="OnBeforeAfterLineEvents_bad_01" style="border: 3px solid red;"></figure>
or
<figure><img src="images/OnBeforeAfterLineEvents_bad_02.png" alt="OnBeforeAfterLineEvents_bad_02" style="border: 3px solid red;"></figure>


### Verify Events 
<r>Medium Value</r> - Verify events can be used before or after the operation to check if everything is correct in business logic.<br> 
They should not make any transactions. If the operation should be rolled back from After Event, make sure that the code before the event uses the “Ignore Commit” parameter.<br>
Before events should be as early in the code as possible. We must ensure that there is no risk for partial commits if we are introducing verify events.

![VerifyEvents_01](images/VerifyEvents_01.png)

![VerifyEvents_02](images/VerifyEvents_02.png)

![VerifyEvents_03](images/VerifyEvents_03.png)

### Isolated Events 
<r>Medium Value</r> - Isolated events are used to allow handling errors that will not interrupt the code execution.<br>
Multiple extensions can subscribe and do their processing, an error from one extension will not interrupt the transaction.<br> 
Isolated events require a commitment before invoking the code and will commit before invoking the next subscriber, thus they require a detailed review.<br>
Alternative is invoking the if Codeunit.Run() then to handle things in isolation.<br> 
Codeunit.Run requires an explicit commit before and has better testability, as IsolatedEvents cannot be tested for error cases in an easy way -<br> 
Error case testing must be done with test isolation disabled, otherwise the error will not be handled.<br> 
Event is better than Codeunit.Run as it allows multiple subscribers, while running a codeunit only lets one implementation to run at the time. 

![IsolatedEvents_01](images/IsolatedEvents_01.png)

![IsolatedEvents_02](images/IsolatedEvents_02.png)

![IsolatedEvents_03](images/IsolatedEvents_03.png)

### Switch Events (Manually bound events)
<r>Medium Value</r> - For switch events, the idea is to create an event that should be subscribed only from manually bound subscribers.<br> 
Then early in the action you can implement a manually bound subscriber that will help you to change the behavior of that specific call.

![SwitchEvents_01](images/SwitchEvents_01.png)

![SwitchEvents_02](images/SwitchEvents_02.png)

![SwitchEvents_03](images/SwitchEvents_03.png)

![SwitchEvents_04](images/SwitchEvents_04.png)


### OnSkip [Operation] Events
<r>Medium Value</r> - Skip events are similar to Handled events, however they can have multiple “skip” parameters, so we can get a more granular control to the code.<br>
The signature expects multiple subscribers, so there can be multiple extensions handling the event. 

![SkipEvents_01](images/SkipEvents_01.png)

![SkipEvents_02](images/SkipEvents_02.png)

or<br>

![SkipEvents_03](images/SkipEvents_03.png)

![SkipEvents_04](images/SkipEvents_04.png)

### Handled Events
<r>Low Value</r> - Handled events are low quality events. **Subscriber must exit if the event is already handled**, thus these events do not scale. Consider using Skip events. 

![HandledEvents_01](images/HandledEvents_01.png)

![HandledEvents_02](images/HandledEvents_02.png)

![HandledEvents_03](images/HandledEvents_03.png)

Advantages 
- Easy to implement

Disadvantages 
- Only one subscriber can process the request. If there are multiple subscribers, by contract first subscriber should handle the event.
- We need to be careful about the events raised by the existing code. The question is whether they should be raised or not. Introducing the handled event can break these events.
- It is unclear if the code was handled and why it was handled.


### Discovery Events (mostly obsoleted)
Discovery events were used to discover all possible implementations of the functionality.<br> 
The event would be raised with a temporary table, then all subscribers would fill the temporary table.<br>
 The table would be shown in the UI for the user to select the specific implementation.<br> 
 We can get better designs with Enums and interfaces.

![DiscoveryEvents_01](images/DiscoveryEvents_01.png)

![DiscoveryEvents_02](images/DiscoveryEvents_02.png)


<style>
r { color: Orange }
</style>