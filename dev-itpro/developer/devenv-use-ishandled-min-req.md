---
title: Minimum requirements for new IsHandled events
description: Provides the minimum information that must accompany a request for adding a new IsHandled event.
author: AleksandricMarko
ms.date: 10/29/2026
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
3. Alternatives evaluated: Which existing events, patterns, or extensibility points you tried and why they weren't sufficient.
4. Justification for IsHandled: Why a standard (non-IsHandled) event, redesign, or contribution isn't feasible.
5. Performance considerations: Expected frequency of execution and any potential impact (loops, large datasets, locking, external calls).
6. Data sensitivity review: Whether sensitive or security-relevant data is involved and how the design avoids exposing protected data. A justification doesn't override restrictions on exposing that data.
7. Multi-extension interaction: Risks if multiple extensions subscribe; explanation of how conflicts or ordering are mitigated.

A sample subscriber that shows the intended use is optional but recommended. It doesn't replace the required publisher signature and call location.

## Guidance for the proposed publisher

When providing the proposed code:

- Don't add unrelated side effects around the event call.
- Place the event as narrowly scoped as possible. Avoid wrapping large code blocks where smaller refactoring would suffice.
- Ensure the remaining code path after the check is minimal and predictable.
- Initialize `IsHandled` to `false` immediately before raising the event. For a new event, place `var IsHandled: Boolean` last in the parameter list.
- Preserve existing `OnAfter` event execution even when the new event bypasses base logic. Keep those calls outside the skipped block rather than bypassing them with an early exit.


## Submission quality checklist

Your request is more likely to be approved if:

- The diff is minimal and self‑contained.
- Naming follows established naming conventions (PascalCase, descriptive, avoids abbreviations).
- You explain why future evolution of the base code won't be hindered.
- You indicate any required test adjustments.

> [!IMPORTANT]
> If information is missing, we add a comment to the issue listing the details needed for further processing. Update the issue description or reply to the comment with those details so we can continue reviewing your request. Requests that violate a rejection rule are rejected rather than approved after clarification.

## Example structure

Provide your request in this structure (replace the bracketed sections). Following this template will help speed up the review and increase the likelihood of approval.

**Problem statement:**

\<Describe the business scenario and gap>

**Alternatives evaluated:**

- Tried event \<EventName> in \<ObjectName>, but it wasn't sufficient because ...
- Considered adding a new field or action, but didn't because ...

**Proposed publisher location:**

Object: \<ObjectType> \<ObjectName>
Procedure: \<ProcedureName>
Placement rationale: \<Why here>

**Proposed code snippet (before -> after):**

\<Old code excerpt>
\<New code excerpt with the event call, IsHandled check, and publisher signature>

**Subscriber example (optional, illustrative):**

\<Code>

**Performance & data considerations:**

\<Frequency, dataset size, sensitive fields?>

**Multi‑extension interaction:**

\<Conflict expectations and mitigation>

**Justification for using IsHandled over alternatives:**

\<Reason>

## Related information

[Types of events for extensibility](types-of-events-for-extensibility.md)  
[Using the IsHandled pattern for events](devenv-use-ishandled-pattern.md)  