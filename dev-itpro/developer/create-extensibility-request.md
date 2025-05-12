---
title: Create an extensibility request
description: When you find something that you'd like Microsoft to extend, you can ask us to do just that. This article explains how.
author: brentholtorf
ms.author: bholtorf
ms.reviewer: solsen
ms.date: 04/02/2025
ms.topic: article
ms.custom: bap-template
---
# Create an extensibility request

Microsoft's [ALAppExtension repository](https://github.com/microsoft/ALAppExtensions/blob/main/README.md#microsoft-al-application-add-ons-for-microsoft-dynamics-365-business-central) on GitHub is a place where Microsoft and our partners can collaborate on building add-on apps and vertical solutions in the AL language for [!INCLUDE [prod_short](../includes/prod_short.md)].

This article describes how to submit a request for a code change from Microsoft. Before you create an extensibility request, check out these guidelines. This guidance can help you, and Microsoft, get to the right solution faster.

Collaborations start through extensibility requests that you submit from the [ALAppExtension](https://github.com/microsoft/ALAppExtensions/tree/main) repo. For example, you might request a new integration event or that we make a function external so your extension can access it. To learn more about extensibility requests, go to [Extensibility requests](https://github.com/microsoft/ALAppExtensions/blob/main/README.md#extensibility-requests).

Extensibility requests are optional. However, submitting structured requests makes things easier for everyone, and the change more likely to be implemented. Structured requests help us:

* Understand the need for the extension.
* Track whether something similar was already done.
* Improve the process for extensibility.

> [!NOTE]
>
> * We add new events in main and the latest release branch. In most cases, we make other types of requests, again, only in the main branch, available in upcoming major releases.
> * We don't add or update events if the procedure, field, or object (or any part of it) are marked as `Obsolete` or surrounded by `CLEAN` tags.

## Minimum requirements

Each request should at least contain the following information:

* Title
* A description of why the change is needed. What's the benefit?
* A description of the request

## Write a clear title

If your request requires changes in just one object, the title should contain information about the specific object to change. For example, **[Country Code] [Object Type] [Object Id] [Object Name]**. Also, add a description of the change, or a descriptive title with the `MultiObjects` tag.

Examples:

* [W1][Codeunit][80][SalesPost] OnBefore ProcessPosting event
* [US][MultiObjects] Transfer Receipt Posting updates
* [W1] New Enum instead option ...

## Describe why the change is needed

Provide a brief description of why you need us to change the app, and what the change allows you to do. Good explanations help us make the changes without contacting you with questions, so we can complete your request faster.

Good contributions not only help a single scenario, but hopefully enable other users with a similar requirement to use the same extensibility point. Keep that in mind when you design and request changes in our extensibility model.

Be specific. Don't be vague. Provide enough information to help us understand your need. For example, avoid sentences such as:

* We want to use our function instead of the standard.
* We want to avoid displaying testfield() errors to the user.

Explain why you want the change. For example, maybe it makes sense to change our standard code because many apps have the same process. Your explanation helps our investigation. For example, the change you're requesting might cause an issue somewhere that you aren't aware of. Maybe it makes sense to remove it in general.

## Describe the requests

Explain the scenario that you can't solve with our current extensibility offerings. If you have a specific implementation in mind that solves your scenario, add it so that we can process your request faster.

Create a separate extensibility request for every change you want us to make.

However, there can be exceptions. A request might require several changes, and some changes might depend on others. For example, there might be a situation where, unless one change is approved, the others don't make sense. In that situation, put all changes in the same request. Otherwise, create a request for each change.

## Events

It's optional, but we prefer that you submit requests related to events in the following structure. You can copy the following example into your request, and then fill in the sections with your information.

**EventRequest** 
```AL
[W1][Object_Type][Object_id][Object_name]
[Procedure or trigger]
___

Enter a description.
___

[IntegrationEvent(false,false)]
local procedure event_signature(needed_parameters)
begin
end;
```

### Design guidelines

Before you create a request for an event, it's a good idea to understand your options. To learn more about events and extensibility, go to [Types of events for extensibility](types-of-events-for-extensibility.md).

* Add records with a VAR, due to the effect on performance and logic.
* Pass records rather than expose a specific length of the text field, or many fields from the record.
* Avoid variants in event signatures. Use interfaces or temporary tables, or a combination of **TableID** and **SystemId**.
* If there are many variables, use temporary tables to group the parameters. To learn more, go to [Argument table](https://alguidelines.dev/docs/navpatterns/patterns/argument-table/).
* Add new variables to the end of an existing event. However, you can't change existing variables because that would cause a breaking change.

### Implementation advice

Consider making designs that use manual binding, instead of static-automatic subscribers. Designs that use manual binding are easier to debug and require fewer system resources.

Consider whether your event exposes sensitive data. Everyone can subscribe to the event, so using **Internal** isn't secure. Events must not expose sensitive data.

Consider whether, and how, multiple extensions can use the event at the same time, and how to handle errors.

## Related information

[Events](types-of-events-for-extensibility.md)  
[Extensibility overview](devenv-extensibility-overview.md)  
[Extension objects overview](devenv-extension-object-overview.md)  
