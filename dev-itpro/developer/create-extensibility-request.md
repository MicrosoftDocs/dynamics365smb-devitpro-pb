---
title: Create an extensibility request
description: When you find something that you'd like Microsoft to extend, you can ask us to do just that. This article explains how.
author: brentholtorf
ms.date: 10/09/2024
ms.topic: conceptual
ms.author: bholtorf
ms.reviewer: solsen
ms.custom: bap-template
---
# Create an extensibility request

Before you create an extensibility request, please check out these instructions. Following this guidance can help you, and Microsoft, get to the right solution faster.

At the moment, extensibility requests are optional. However, submitting structured requests makes things easier for everyone:

* Understand the need for the extension
* Track whether something similar was already done
* Improve the process for extensibility

> [!NOTE]
>
> * We're adding new events in master and latest release branch. At the time of this writing, the latest release branch is 25.x. In most cases, we'll make other types of requests, again, only in the master branch, available in upcoming major releases.
> * If the procedure, field, object or any part of it are marked as `Obsolete` or surrounded by `CLEAN` tags, we won't add or update the events.

## Minimum requirements

Each request should at least contain the following information:

* Title
* A description of why the change is needed. What's the benefit?
* A description of the request

### Title

If your request requires changes in just one object, the title should contain information about the specific object to change. For example "**[Country Code] [Object Type] [Object Id] [Object Name]** Also, add a description of the change, or a descriptive title with the `MultiObjects` tag.

Examples:

* [W1][Codeunit][80][SalesPost] OnBefore ProcessPosting event
* [US][MultiObjects] Transfer Receipt Posting updates
* [W1] New Enum instead option ...

## Describe why the change is needed

Provide a brief description of why you need us to change the app, and what the change allows you to do. Good explanations help us make the changes without contacting you with additional questions, which decreases the time to complete the request.

> [!TIP]
> Please don't provide generic sentences. Being vague doesn't help us understand your need. For example, avoid sentences such as:
> 
> * *"We would like to use our function instead of standard."*
>
> Instead, explain why. For example, maybe it makes sense to change our standard code because many of you have the same process.
>
> * *"We want to avoid displaying testfield() errors to the user."*
>
> Explain why. Maybe that can be done differently, or it might cause an issue in another part of the system which you are not aware of, or it makes sense to remove it in general. <!--This seems to mix our concerns with theirs.-->

## Describe the request(s)

Create a separate extensibility request for every change you want us to make.

A request might require several changes, and some of the changes might have one or more dependencies on others. For example, there might be a situation where, unless one change is approved, the others don't make sense. In that situation, put all changes in the same request. Otherwise, create a request for each change.

## Events

Submit requests related to events in the following predefined structure:

<!--ask Marko to verify this snippit-->

**EventRequest** 
[W1][Object_Type][Object_id][Object_name]
[Procedure or trigger]
___
description
___
[IntegrationEvent(false,false)]
local procedure event_signature(needed_parameters)
begin
end;

### Design guidelines

When you create a request for an event, please check **[Event Types](Types%20of%20Events.md)** page. <!--what are they looking for? Whether one already exists, maybe?-->

* Add records with a VAR <!--function?-->, due to performance and logic impact
* Pass records rather than expose a specific length of the text field or many fields from the record
* Avoid variants in event signatures. Use interfaces or temporary tables, or a combination of **TableID** and **SystemId**
* If there are too many variables, use temporary tables to group the parameters. To learn more, go to [Argument table](https://alguidelines.dev/docs/navpatterns/patterns/argument-table/)
* You can add new variables to the end of an existing event. However, you can't change existing variables because that would cause a breaking change

### Implementation advice

Consider making designs that use manual binding, instead of static-automatic subscribers. It's easier to debug, requires fewer system resources, and leads to better designs.

Consider whether you're exposing any sensitive data through an events. Everyone can subscribe to the event, using Internal is not a security feature. <!--Not sure what Internal is--> Events must not expose sensitive data.

Consider whether, and how, multiple extensions can use the event at the same time, and how to handle errors.

<style>
r { color: Red }
o { color: Orange }
</style>

## See also

[Events](types-of-events-for-extensibility.md)  
[Extensibility overview](devenv-extensibility-overview.md)  
[Extension objects overview](devenv-extension-object-overview.md)  