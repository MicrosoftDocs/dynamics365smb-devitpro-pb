---
title: Create an extensibility request
description: When you find something that you'd like Microsoft to extend, you can ask us to do just that. This article explains how.
author: brentholtorf
ms.author: bholtorf
ms.reviewer: solsen
ms.date: 10/29/2026
ms.topic: article
ms.custom: bap-template
---
# Create an extensibility request

Microsoft's [BCApps repository](https://github.com/microsoft/BCApps) on GitHub is the open-source collaboration hub for [!INCLUDE [prod_short](../includes/prod_short.md)] application development. It includes the Base Application, Business Foundation, System Application, Microsoft's first-party apps, and developer tools.

This article describes how to request a missing extensibility point and provide the information we need to evaluate it.

Before you submit a request, search the existing BCApps issues to avoid duplicates, and check whether existing events or public APIs meet your needs. Create a [new extensibility request](https://github.com/microsoft/BCApps/issues/new?template=extensibility-request.yaml) by using the **Create an extensibility request** template. For example, you might request a new integration event or that a local procedure becomes public so your extension can call it.

Structured requests help us:

- Understand the need for the extension.
- Track whether something similar was already done.
- Improve the process for extensibility.

> [!NOTE]
>
> - We add new events in main and the latest release branch. In most cases, we make other types of requests, again, only in the main branch, available in upcoming major releases.
> - We don't add or update events if the procedure, field, or object (or any part of it) are marked as `Obsolete` or surrounded by `CLEAN` tags.

## Minimum requirements

Each request must contain the following information:

- A clear title that identifies the request type and target object or procedure.
- The business scenario or technical goal, the current limitation, and the benefit of change.
- The exact change you need. Include the affected objects, procedures, or triggers and their locations.
- The information required for the request type, as described in the following table.

Provide all required code as text in fenced `al` code blocks. Screenshots can supplement your explanation, but must not be the only source of code or essential details.

| Request type | Required information |
| --- | --- |
| **Event request** | For a new event, provide the publisher signature and the proposed call location with 5-10 lines of surrounding code. To add a parameter to an existing event, identify the event, object, procedure, and parameter; provide the type if it isn't clear from context. A full code snippet isn't mandatory for a clearly specified parameter addition. Events that bypass code also require the [IsHandled information](#ishandled-event-requirements). |
| **Request for external access** | Identify the target procedure or variable and the requested access or scope change, such as making a local procedure public or removing an `OnPrem` scope restriction. Describe how you'll use it. Current and proposed declarations are helpful, but aren't required if the target and change can be identified in the codebase. |
| **Enum request** | For a new enum or option-to-enum conversion, provide the proposed enum definition, values, captions, and where it will be used. To add values to an existing enum, identify its name and ID, the proposed values and captions, and compatibility with existing functionality. |
| **Extensibility enhancement** | Describe the exact code or design change, the technical limitation it addresses, and why the change is necessary and beneficial. |

If information is missing, we add a comment to the issue listing the details needed for further processing. Update the issue description or reply to the comment with those details so we can continue reviewing your request.

## Write a clear title

If your request requires changes in just one object, the title should contain information about the specific object to change. For example, **[Country Code] [Object Type] [Object Id] [Object Name]**. Also, add a description of the change, or a descriptive title with the `MultiObjects` tag.

Examples:

- [W1][Codeunit][80][SalesPost] OnBefore ProcessPosting event
- [US][MultiObjects] Transfer Receipt Posting updates
- [W1] New Enum instead option ...

## Describe why the change is needed

Provide a brief description of why you need us to change the app, and what the change allows you to do. Good explanations help us make the changes without contacting you with questions, so we can complete your request faster.

Good contributions not only help a single scenario, but hopefully enable other users with a similar requirement to use the same extensibility point. Keep that in mind when you design and request changes in our extensibility model.

Be specific. Don't be vague. Provide enough information to help us understand your need. For example, avoid sentences such as:

- "We want to use our function instead of the standard."
- "We want to avoid displaying testfield() errors to the user."

Explain why you want the change. For example, maybe it makes sense to change our standard code because many apps have the same process. Your explanation helps our investigation. For example, the change you're requesting might cause an issue somewhere that you aren't aware of. Maybe it makes sense to remove it in general.

## Describe the requests

Explain the scenario that you can't solve with our current extensibility offerings. Provide the code or design details required for your request type so that we can process your request faster.

Include one request type per issue. You can combine several requests of the same type, such as adding events in multiple objects or making several procedures public. Submit different types, such as an event and a procedure access change, as separate issues.

Explain dependencies between changes and identify all affected objects. Combined changes are evaluated as a whole: every change must pass review. If any change is blocked, the entire request is rejected; if any change needs clarification, the entire request waits for that information. Separate unrelated changes where practical.

### Contribute the implementation for an extensibility request

If you want to improve Business Central's extensibility and bring together all the changes your solution needs, consider contributing the implementation yourself. With this approach, you can **combine different request types in one issue**, such as new events, procedure access changes, and an enum change. We especially recommend this approach when you need five or more related changes across different request types. One issue helps us understand the complete scenario and keeps the changes together in one implementation pull request (PR). To get started, select **I will provide the implementation for this extensibility request** in the issue template. Provide the required information for every type, wait for Microsoft to approve the issue before opening your PR, and link your PR to the approved issue.

## Events

The following format is optional, but the required event information isn't. You can copy this template into your request and fill in the sections. For a new event, also show the proposed event call with 5-10 lines of surrounding code so its placement is clear.

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

### IsHandled event requirements

`IsHandled` is a widely used event pattern in the code base. It's very popular for overriding the code. However, the pattern has significant drawbacks that might not be obvious to developers. We recommend that you limit the use of the pattern to a bare minimum, and only use it in cases where it's absolutely necessary.  

Before you submit a request for a new event that uses the IsHandled pattern, review the guidance in [Using the IsHandled pattern](devenv-use-ishandled-pattern.md).  

If you must use the `IsHandled` pattern, you should document your reason. To learn more, go to [Minimum requirements for new IsHandled events](devenv-use-ishandled-min-req.md).

### Design guidelines

Before you create a request for an event, it's a good idea to understand your options. To learn more about events and extensibility, go to [Types of events for extensibility](types-of-events-for-extensibility.md).

- Add records with a VAR, due to the effect on performance and logic.
- Pass records rather than expose a specific length of the text field, or many fields from the record.
- Avoid variants in event signatures. Use interfaces or temporary tables, or a combination of **TableID** and **SystemId**.
- If there are many variables, use temporary tables to group the parameters. To learn more, go to [Argument table](https://alguidelines.dev/docs/navpatterns/patterns/argument-table/).
- Add new parameters to the end of an existing event's parameter list. Preserve existing parameter names, types, and order. Adding `var` to an existing event parameter is allowed; removing it isn't.
- Prefer extending an existing event when it supports the required timing, data, and behavior. If a nearby event doesn't meet your needs, explain the difference.

### Implementation advice

- Consider making designs that use manual binding, instead of static-automatic subscribers. Designs that use manual binding are easier to debug and require fewer system resources.
- Consider whether your event exposes sensitive data. Everyone can subscribe to the event, so using **Internal** isn't secure. Events must not expose sensitive data.
- Consider whether, and how, multiple extensions can use the event at the same time, and how to handle errors.

## Related information

[Events](types-of-events-for-extensibility.md)  
[Extensibility overview](devenv-extensibility-overview.md)  
[Extension objects overview](devenv-extension-object-overview.md)  
