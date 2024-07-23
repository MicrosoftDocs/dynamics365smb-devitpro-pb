---
title: Failure modeling and robust coding practices
description: Describes how to reason over errors and handle them in code.
author: KennieNP
ms.author: kepontop
ms.reviewer: jswymer

ms.topic: conceptual
ms.date: 01/11/2024
ms.custom: bap-template
---

# Failure modeling and robust coding practices

The AL language (and its predecessor C/AL) was designed to make programming of business logic easy. The programmer just needs to code for the "sunshine scenario" or "the happy (code) path", then the AL runtime presents the user with error messages in unexpected things. While it's true that the AL runtime makes sure that the session never crashes, system-provided error messages can never provide the context of your code to the user and they should therefore be seen as a last resort. In many cases, your code can adapt to cater for unexpected things so that the user won't notice and stays on "the happy (code) path".

There are two techniques you can use to make your code more robust towards errors:

1. failure modeling, and
2. robust coding practices

In the following section, we'll introduce both concepts. 

## Using failure modelling to reason over possible error situations

A *failure model* is a description of potential ways that a component can fail as well as causes and effects of these failures. A component can be internal such as a codeunit, method, API, or report, or external such as an API webservice endpoint outside BC, an AL API from Microsoft or another vendor, or a file.

For each type of failure, you record a *failure mode*:

- component
- failure
- cause
- effect (if not dealt with)
- probability (can be absolute or categorical such as common/rare/very rare)
- remediation (can be blank when brainstorming about what can go wrong)

in a format that works for you (typically in an Excel worksheet). 

When doing failure modeling, you should think about the unhappy (code) path, and think of all the things that might happen, even though they could happen infrequently. When your code is running at scale, even the improbably event is likely to happen at some point in time.

You don't need to create failure models for all components in your extension/app, try to focus on things that are outside your control.

When you have a good list of failure modes, it's time to think about remediation of them. How does your code react in case any of these failures occur? Maybe you can implement a retry strategy before resorting to showing an error, maybe you can implement actionable error messages that allow the user to unblock themselves, or maybe you choose to ignore handling the failure.

## Using robust coding practices to reason handle possible error situations

Robust coding practices are a state of mind for you as a developer. Apart from coding for the happy path, you also reason over failure modes and how to deal with ways that your code and other peoples code can fail. 

These six principles might help you get started making your code more robust towards failures:

1. [Don't trust any code you didn't write](#principle-dont-trust-any-code-you-didnt-write)
2. [Don't trust consumers of your code](#principle-dont-trust-consumers-of-your-code-that-might-include-yourself)
3. [Don't trust the environment your code runs in](#principle-dont-trust-the-environment-your-code-runs-in)
4. [Offer graceful degradations](#principle-offer-graceful-degradations)
5. [Hide your internal data structures](#principle-hide-your-internal-data-structures)
6. [Assume the improbable](#principle-assume-the-improbable)

For more information about robust programming, see [Robustness (computer_science)](https://en.wikipedia.org/wiki/Robustness_(computer_science)).


### Principle: Don't trust any code you didn't write

Whenever you call something from your code, such as an AL method in a codeunit, a system method from the AL runtime, or an external service, check that it succeeds. Look up the documentation of the code and read about how it can fail (hopefully the publisher documented this. If not, ask them to do so. Do small experiments to learn how it fails and let the publisher know about your findings.)

Here are some examples of how you use this principle in practice:

- For AL methods that implements a boolean return code, check for that with an IF statement. 
- For AL methods that returns a result in an output parameter (using the `var` keyword), check that the result is sound. 
- For AL methods without a boolean return code, can you run them as a `Try` method?
- Have the compiler help you where possible instead of getting errors at runtime. When calling AL methods that take object ID parameters, try calling them using the scope operator `::` (for example, `Codeunit::"Job Queue Dispatcher"`) and not using literal integer values (for example, 448). In case objects are renumbered or aren't available, you'll get a compile error and not a runtime error.
- When calling external web service calls, check the HTTP status code.

For more information, see [Error handling strategies](devenv-al-error-handling.md#error-handling-strategies).

Primarily, anticipate that your code might encounter issues from other peoples code, and adopt a defensive programming approach to identify these issues at the earliest. Respond to failures in a manner that shields users from an overload of technical error messages.

### Principle: Don't trust consumers of your code (that might include yourself)

Just like you might not know the full extend of the Business Central developer documentation, consider the possibility that the programmer that calls your code might not have access to or be familiar with the manual pages or documentation for that. Aim to write your code in a way that it can gracefully handle any incorrect, unexpected, or malformed inputs or parameters. The definition of reasonable error handling depends on the situation. For instance, if an error message is displayed to a user, ensure that it's self-explanatory and doesn't necessitate the user to refer to a manual for understanding the error. If an error code is returned to the caller (perhaps from a codeunit method), ensure that the error codes are clear and detailed. Moreover, as soon as an issue is detected, take immediate corrective action or maybe fail the method. This prevents the error from further propagation up the AL stack trace.

Here are some examples of how you use this principle in practice:

- Sanitize and validate all input from parameters to your AL methods. In particular, if you need to do type conversions, check that the conversion succeeded.
- Where possible, return a boolean status code from your AL methods to help callers of your code write robust code.
- When your code calls external services, consider implementing or using resilience patterns such as Retry, Circuit breaker, and Attempt timeout. For more information, see [Build resilient HTTP apps: Key development patterns](/dotnet/core/resilience/http-resilience?tabs=dotnet-cli).
- When developing web service APIs, the AL runtime provides resilience protections such as rate limits and timeouts. But you could still consider implementing or using resilience patterns such as Circuit breaker.

One of the key reasons to adhere to this principle is that the individual invoking your code could very well be yourself. It’s common to forget the intricate details of your own program after a week or so. This could lead to potential errors such as incorrect function calls or providing non-valid input. By following this principle, you’re essentially safeguarding your code against such issues. This approach to programming, where you anticipate and prevents possible issues, is often referred to as defensive programming. It’s a proactive measure to ensure the robustness of your code against errors, both from within and outside the program. It’s like putting a safety net to catch any unforeseen or unexpected errors that might occur during the execution of the program. This way, even if you forget the specifics of your code, this safety net helps prevent major issues or crashes. It’s a strategy that not only helps in maintaining the code, but also in enhancing its overall reliability and efficiency.

For more information, see [Error handling strategies](devenv-al-error-handling.md#error-handling-strategies).

### Principle: Don't trust the environment your code runs in

Here are some examples of how you use this principle in practice:

[!INCLUDE[prod_short](includes/prod_short.md)] online runs in a multi-tenant environment, where your AL code shares resources with other sessions, both for the AL runtime and for the database. This means that a peak in resource consumption by AL code in a different session (running in your environment or in someone elses) can and will impact the performance of your session. The performance you get on average will differ from the performance you get right now.

Within a [!INCLUDE[prod_short](includes/prod_short.md)], you don't know the behavior of other apps and how they've customized the system. For example, some apps will subscribe to events that you also use in your app. You can't assume the order of event subscriber code being run, so other apps might interfere with the same objects or code flows that your app is modifying.

Also remember that you can't know how a customer sets up permissions for users. Although, a user might have access to the entry point of a method they might not have access to all tables referenced. Consider adding the `InherentPermissions` attribute to private methods not raising events. Write defensive code that checks for permissions and be careful when accessing data through `RecordRef` – particularly in an event subscriber, as you can't know, which table is being passed as argument.

### Principle: Offer graceful degradations

If your code is using an external component, you might want to design for situations where that component is temporarily unavailable. If so, can you make your code still functional but not offer the full experience for the users?

Here are some examples of how you use this principle in practice:

- Your code calls a cloud-based AI forecasting model. If that model is unavailable, could you offer a lower-quality but still functioning regression model programmed in AL?
- Your code sends files or data to a cloud-based service for further processing there. If that service is unavailable, could you store data/files in the database and then try connecting later?
- Your code reads files or data from a cloud-based service for further processing in AL. If that service is unavailable, could allow users to upload data/files manually until the service becomes available again?

### Principle: Hide your internal data structures

Concealing internal data structures enhances your program’s modularity. For example, if you want to change a collection representation from arrays to lists in your code, a well-designed and information-concealed interface wouldn't require changes in the calling program. But if this information hiding is neglected, changing the representation might break the functioning programs.

Take extra care protecting elements in your code that need to stay consistent across calls. For instance, a shared variable or data in a setup table. If users of your code can access these directly, they could unintentionally or intentionally alter the data, leading to function failures. 

### Principle: Assume the improbable

When doing fault modeling, you might discover failure modes that can occur but with low probability. When your code runs at scale (in many customer installations or sometimes in high concurrency), over time, some of these improbable failures will likely occur. Reason about how your code reacts to those and implement error handling accordingly. 

Here are some examples of how you use this principle in practice:

- If you don't handle the error, consider at least to log this to telemetry using `Telemetry.LogError` or a raw `Session.LogMessage` call. That way, you can always query for affect over time and across customer installations and maybe revisit the choice of error handling in case the error happens more frequently than what you initially expected.

## See also

[Actionable errors](devenv-actionable-errors.md)   
[Collecting errors](devenv-error-collection.md)  
[Dialog.Error(ErrorInfo) Method](methods-auto/dialog/dialog-error-errorinfo-method.md)  
[User experience guidelines for errors](devenv-error-handling-guidelines.md)   
[AL error handling](devenv-al-error-handling.md)  
