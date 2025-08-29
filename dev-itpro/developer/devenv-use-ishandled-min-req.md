---
title: Minimum requirements for new IsHandled events
description: Provides the minimum information that must accompany a request for adding a new IsHandled event.
author: AleksandricMarko
ms.date: 08/29/2025
ms.topic: how-to
ms.author: maleksandric
ms.reviewer: bholtorf
ms.custom: bap-template
---

# Requesting a new IsHandled event

Before you submit a request for a new event that uses the IsHandled pattern, review the guidance in [Using the IsHandled pattern](devenv-use-ishandled-pattern.md). In most cases there are better, more maintainable extensibility options (additional events, redesigned flow, interfaces, table/page extensions). An IsHandled pattern should be a last resort.

## Minimum required information

If, after evaluating alternatives, you still conclude that an IsHandled event is the only viable option, your request must include the following information to be considered:

1. Problem statement: A clear, concise description of the functional gap you need to address (what can't be done today, and why).
2. Proposed code change: The exact code addition or modification, including the event publisher signature and placement (surrounding 5–10 lines of context).
3. Invocation example (optional but recommended): How the event will be raised in your code and a sample subscriber showing intended use.
4. Alternatives evaluated: Which existing events, patterns, or extensibility points you tried and why they weren't sufficient.
5. Justification for IsHandled: Why a standard (non-IsHandled) event, redesign, or contribution isn't feasible.
6. Performance considerations: Expected frequency of execution and any potential impact (loops, large datasets, locking, external calls).
7. Data sensitivity review: Confirmation that the event doesn't expose sensitive or security‑relevant data (or a rationale if it must).
8. Multi‑extension interaction: Risks if multiple extensions subscribe; explanation of how conflicts or ordering are mitigated.

## Guidance for the proposed publisher

When providing the proposed code:

- Don't add unrelated side effects around the event call.
- Place the event as narrowly scoped as possible. Avoid wrapping large code blocks where smaller refactoring would suffice.
- Ensure the remaining code path after the check is minimal and predictable.

## Submission quality checklist

Your request is more likely to be approved if:

- The diff is minimal and self‑contained.
- Naming follows established naming conventions (PascalCase, descriptive, avoids abbreviations).
- You explain why future evolution of the base code won't be hindered.
- You indicate any required test adjustments.

> [!IMPORTANT]
> We reject requests that don't include all minimum required information without a detailed review.

## Example structure

Provide your request in this structure (replace bracketed sections):

Problem statement:

\<Describe the business scenario and gap>

Alternatives evaluated:

- Tried event \<EventName> in \<ObjectName>, but it wasn't sufficient because ...
- Considered adding a new field or action, but didn't because ...

Proposed publisher location:

Object: \<ObjectType> \<ObjectName>
Procedure: \<ProcedureName>
Placement rationale: \<Why here>

Proposed code snippet (before -> after):

\<Old code excerpt>
\<New code excerpt with OnBefore...IsHandled(var IsHandled; ...)> 

Subscriber example (illustrative):

\<Code>

Performance & data considerations:

\<Frequency, dataset size, sensitive fields?>

Multi‑extension interaction:

\<Conflict expectations and mitigation>

Justification for using IsHandled over alternatives:

\<Reason>

Following this template will help speed up the review and increase the likelihood of approval.

## Related information

[Types of events for extensibility](types-of-events-for-extensibility.md)  
[Using the IsHandled pattern for events](devenv-use-ishandled-pattern.md)  