## Extensibility requests - Introduction
Before you create a new request, please check out these instructions which can help you and us to get a better and faster solution.<br>
Nothing of this is obligatory at the moment, but with more structured requests, it would be easier for all of us to understand the need, track if something similar has already been done and improve the whole process. 

#### <r>Important</r>
- We are adding new events just in master and latest releases branch (at the moment 25.x), and for other types of requests, just in master branch (will be available in most cases within next major releases).
- If the procedure, field, any part of object or even whole object is marked as obsolete or sorounded with CLEAN tags, we are not adding new events or updating exising ones there.

#### Each request should at least contains:
- Title
- Why is the change needed
- Description of the request

## <o>Title</o>
In case the request requires changes in just one object, title should contain information about the specific object "**[Country Code] [Object Type] [Object Id] [Object Name]**" which will be changed + some description, otherwise descriptive title with **[MultiObjects]** tag.

Example:
- [W1][Codeunit][80][SalesPost] OnBefore ProcessPosting event
- [US][MultiObjects] Transfer Receipt Posting updates
- [W1] New Enum instead option ...

## <o>Why is the change needed</o> 
Provide a brief description of why you need the change in the app and what you are planning to use it for. A good explanation will help us to make the changes without additional questions, which will decrease the time needed to complete the request.

#### <r>Pay attention</r>
Please do not add generic sentences, that do not help us understand your need. Avoid sentences like: 
- *"We would like to use our function instead of standard."* - instead explain why, maybe it make sense to change standard code as many of you have the same process
- *"We want to avoid displaying testfield() errors to the user."* - provide us with information on why, maybe that can be done differently, or it might cause an issue in another part of the system which you are not aware of, or it make sense to remove it in general.
- ... 

## <o>Description of the request(s)</o>
For every desired change create individual extensibility request.<br>
<r>Important</r> - In case there are several changes needed which are tied up (a case where if one of the request is not approved and done, all others are pretty useless), put all them in the same request, otherwise each need for the change should be in separate request.

## Events

### Events - submit requests in the predefined structure:

**EventRequest**<br> 
<i>[W1][Object_Type][Object_id][Object_name]<br>
[Procedure or trigger]
___
description
___
[IntegrationEvent(false,false)]
local procedure event_signature(needed_parameters)<br>
begin<br>
end;</i>

### Design guidelines:
When creating new event request, please check **[Event Types](Types%20of%20Events.md)** page.
- Records should be added with var due to performance and logic impact
- Passing records should be preferable than exposing a specific length of the text field or many fields from the record
- Variants, in events signatures should be avoided. Use interfaces or temporary tables instead, or a combination of “TableID” and “SystemId”
- If there are too many variables, use temporary tables to group the parameters ([Argument table](https://alguidelines.dev/docs/navpatterns/patterns/argument-table/) pattern)
- New variables can be added to the end of the existing event; however, it is not possible to change existing variables as it is a breaking change

### Implementation advice:
Consider making designs that use manual binding, instead of Static-Automatic subscribers. It is easier to debug, requires less system resources. It also leads to better designs.<br>
Consider if you are exposing any sensitive data through an event(s).  Everyone can subscribe to the event, using Internal is not a security feature. Sensitive data must never be exposed via events.<br>
Consider how/if the event should be used by multiple extensions at the same time and how the errors should be handled.<br>

<style>
r { color: Red }
o { color: Orange }
</style>