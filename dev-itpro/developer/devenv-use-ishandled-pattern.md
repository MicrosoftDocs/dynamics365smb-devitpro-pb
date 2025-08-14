---
title: Using the IsHandled pattern
description: This article describes how, and when, to use the popular IsHandled pattern for events.
author: brentholtorf
ms.date: 08/14/2025
ms.topic: how-to
ms.author: bholtorf
ms.reviewer: bholtorf
ms.custom: bap-template
---

# Using the IsHandled pattern for events

IsHandled is a widely used event pattern in the code bast. It's very popular for overriding the code. However, the pattern has significant drawbacks that might not be obvious to developers. We recommend that you limit the use of the pattern to a bare minimum, and only use it in cases where it's absolutely necessary. For example, when a better pattern isn't available.

## What is the IsHandled pattern?

```AL
{
OnFoo(IsHandled)
If not IsHandled then
   Error(FooIsNotPossibleErr);
}
```

The original goal of the IsHandled pattern was to enable developers to provide an implementation that didn't exist in the base code. The main use is to raise an event and throw an error if the even't wasn't handled.

Today, we mostly use "exit" instead of the error, which increases the number of possible code paths. 

********ISHANDLED PATTERN EXAMPLE 1**************

According to the pattern's definition, only one subscriber can handle the event. All other subscribers must exit if the event is handles, so the subscriber code should start by checking whether the event was already handled.

The goal of the IsHandled pattern was to provide interface-like functionality, before AL supported interfaces. Today, it's become a means of overriding the existing code, which was not the original intention.

## Why is the IsHandled pattern bad?

There are several issues with the IsHandled pattern.

- **Single subscribers only** - Event as a coding pattern, notifies all subscribers and enables them to react. By definition, the IsHandled pattern doesn't allow this. Only the first implementation called should be able to run. All other subscribers should exit. Subscribers to the IsHandled pattern are optional. They should allow other subscribers to do the task.
- **Coding by convention** - There's no way to enforce the rule defined in point 1 because the convention defines the pattern. A subscriber can break the rules and, for example, change the value back from True to False, or ignore the fact that the previous subscriber set the IsHandled value to True. This situation can make the code difficult to troubleshoot and can cause unexpected behavior in the code.
- **Clear purpose** - Events should have a clear purpose. The name of the event should reflect the purpose so it's easy to understand how to use the event. Handled patterns don't have a clear purpose in most cases because they're often named by the line or the function that is supposed to be skipped. That naming makes it difficult to know how it's going to be used and which code will run, which affects stability because any code can run. It also makes it difficult to refactor code.