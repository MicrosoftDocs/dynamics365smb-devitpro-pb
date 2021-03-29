---
title: "XML Comments in Code"
description: "Adding documentation to AL code by including XML elements in special syntax."
ms.custom: na
ms.author: solsen
ms.date: 04/01/2021
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: conceptual
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---

# XML Comments in Code

[!INCLUDE[2020_releasewave2](../includes/2020_releasewave2.md)]

In [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)], you can add documentation to your code by including XML elements in special comment fields directly in the source code before the block of code that the comment refers to. The documentation comment must immediately precede a user-defined type that it annotates, for example a codeunit, table, or interface, or a member such as a field or method. The syntax for adding XML comments in your code is triple slashes `///` followed by one of the supported XML tags. There is IntelliSense support for writing documentation comments. Most importantly providing a template documentation comment when writing the third slash in the triple slash.

Documentation comments are visible when hovering over source symbols, in completion lists, and in signature help. By adding XML comments in code, you can improve readability, add useful information about the implementation, and help others take over code that you wrote. With XML comments you also enable IntelliSense in Visual Studio Code on the AL objects that you add in your code as a help to other developers, working with or extending your code. This means that when you have built an extension and someone extends this code, they will get inline documentation when they call the given object.

> [!NOTE]  
> Integration with documentation generator tools like DocFx and SandCastle is currently not supported.

> [!NOTE]  
> If you have the `showMyCode` setting in the app.json file set to `false` and download an app package; the app package will not contain any XML comments.

## Supported XML tags

The following table lists the XML elements that are supported for AL.

| Top-level XML Tag   | Description |Syntax|
|---------------------|-----------|---------|
|`<summary>`|A summary of the object|`<summary>description</summary>`|
|`<param>`  |Used in method declarations to describe one or more parameters defined in the method. For each parameter, specify the name and a description.|`<param name="name">description</param>`|
|`<returns>` |Used in method declarations to describe the return value of the method.|`<returns>description</returns>`|
|`<example>`|Used to specify an example of how to use a given codeunit or object.|`<example>description</example>`|
|`<remarks>`|Used to supplement information given in the `<summary>` section.|`<remarks>description</remarks>`|


| Formatting XML Tag   | Description |Syntax|
|----------------------|-----------|---------|
|`<paramref>`|Specifies a reference to a parameter in a `<summary>` or `<remarks>` block.|`<paramref name="name"/>`|
|`<para>`|Allows structuring text inside a `<summary>`, `<remarks>`, or `<returns>` tag.|`<para>paragraph</para>`|
|`<b>`|Allows formatting text as **bold** inside a top-level tag.|`<b>bold</b>`|
|`<i>`|Allows formatting text as *italic* inside a top-level tag.|`<i>italic</i>`|
|`<c>`|Specifies that text within a description should be marked as code inside a top-level tag.|`<c>inline code</c>`|
|`<code>`|Specifies that multiline text within a description should be marked as code inside a top-level tag.|`<code>code block</code>`|
|`<list>`|Specifies a list formatted as a bulleted or numbered list, or as a table in a `<summary>` or `<remarks>` block. |`<list type="bullet|number|table">`. See full [List syntax](devenv-xml-comments.md#list-syntax) below.|

### List syntax

```xml

<list type="bullet|number|table">
    <listheader>
        <term>term</term>
        <description>description</description>
    </listheader>
    <item>
        <term>term</term>
        <description>description</description>
    </item>
</list>
```

## Example

The following example is taken from the *Email.Codeunit.al* file in the System Application. In this example, the parameter `EmailMessageId` is documented using the `<param>` syntax.

```xml
/// <summary>
/// Provides functionality to create and send e-mails.
/// </summary>

codeunit 8901 "Email"
{
    Access = Public;

    /// <summary>
    /// Enqueues an email in the outbox to be sent in the background.
    /// </summary>
    /// <param name="EmailMessageId">The ID of the email to enqueue</param>
    procedure Enqueue(EmailMessageId: Guid)
    begin
        EmailImpl.Enqueue(EmailMessageId);
    end;
...

```

## Special symbols

For special symbols, such as angle brackets, to appear in text of a documentation comment, use the HTML encoding of `<` and `>` which is `&lt;` and `&gt;` respectively. The following example illustrates how.

```xml
/// <summary>
/// This property always returns a value &lt; 1.
/// </summary>
```

## Writing tips

Code comments improve the readability of the code that you have developed and they are very useful for anyone modifying or maintaining that code. Furthermore, code comments form the basis of auto-generated documentation. Great code comments must do the following:

1. Never state the obvious.
2. Write a meaningful comment, use precise wording to describe *why*.
3. Imagine yourself in the shoes of the developer using this piece of code, what would you want to know?
4. For properties and methods, use active wording such as *Sets...*, *Gets...*, and *Specifies...*, and then explain what it does.
5. List all preconditions for your parameters (cannot be null, must be within a certain range, and so on).
6. List any postconditions that could influence how callers deal with return values.
7. List any exceptions the method may throw (and under what circumstances).
8. If similar methods exist, explain the differences between them.
9. Call attention to anything unexpected (such as modifying global state).
10. Enumerate any side-effects, if there are any.
11. Be consistent.
12. Be concise.
13. Make sure that your comments are reviewed.

For more examples, see [https://stackoverflow.com/questions/3143324/what-are-best-practices-for-documenting-c-sharp-code-with-xml-comments](https://stackoverflow.com/questions/3143324/what-are-best-practices-for-documenting-c-sharp-code-with-xml-comments).

## See Also  

[AL Development Environment](devenv-reference-overview.md)  
[Developing Extensions in AL](devenv-dev-overview.md)  
[Pages Overview](devenv-pages-overview.md)  
[Microsoft Writing Style Guide](/style-guide/welcome/)  
