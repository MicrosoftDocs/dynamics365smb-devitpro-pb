---
title: Create a .NET Wrapper Module
description: This topic provides a description of how to contribute a .NET wrapper module.
author: bholtorf
ms.custom: na
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: conceptual
ms.service: "dynamics365-business-central"
ms.author: bholtorf
ms.date: 04/01/2021
---

# Create a .NET Wrapper Module
This topic provides a description of how to contribute a .NET wrapper module to [!INCLUDE[prod_short](../developer/includes/prod_short.md)], using the Regex module as an example. The Regex module is published in the [AlAppExtensions](https://github.com/microsoft/ALAppExtensions/) repository, and if you aren't already familiar with the Regex class in .NET, see the [.NET documentation](/dotnet/api/system.text.regularexpressions.regex?view=netcore-3.1).

## Converting the Regex architecture
In .NET, the Regex class provides functionality for regular expressions. You can implement the functionality in a similar way as a system module by creating a Regex codeunit that provides an interface and an internal Regex implementation that contains the logic.

:::image type="content" source="../media/regex-figure.png" alt-text="Regex components":::

## Wrapping a .NET method
For some methods, you can wrap the .NET method in AL in an internal codeunit and expose the procedure to the facade. For example, you can wrap the IsMatch method as follows.

```al
/// <summary>
/// Provides functionality to use regular expressions to match text, split text, replace text etc.  
/// </summary>
codeunit 3960 Regex
{
    Access = Public;

    var
        RegexImpl: Codeunit "Regex Impl.";

    /// <summary>
    /// Indicates whether the regular expression finds a match in the input string.
    /// </summary>
    /// <param name="Input">The string to search for a match.</param>
    /// <param name="Pattern">A regular expression pattern to match.</param>
    /// <returns>True if the regular expression finds a match; otherwise, false.</returns>
    procedure IsMatch(Input: Text; Pattern: Text): Boolean
    begin
        exit(RegexImpl.IsMatch(Input, Pattern));
    end;
}
```
```al
codeunit 3961 "Regex Impl."
{
    Access = Internal;

    var
        DotNetRegex: DotNet Regex;

    procedure IsMatch(Input: Text; Pattern: Text): Boolean
    begin
        Regex(Pattern);
        exit(DotNetRegex.IsMatch(Input))
    end;
}
```
## Codeunits in method signatures
Not all .NET Regex classes map so directly to system modules, however. The .NET Regex class also includes classes such as Match, Group, and Capture, that are used to represent results for regular expression matches. While it's tempting to wrap these classes in codeunits and use those to output results, you should avoid that because procedure signatures should not contain codeunits. Instead, use temporary tables to model these classes. The following code example shows how to implement the Match class in a temporary table.

```al
/// <summary>
/// Provides a representation of Regex Matches that models Match objects in .Net
/// </summary>



/// <remark>
/// For more information, visit https://docs.microsoft.com/dotnet/api/system.text.regularexpressions.match?view=netcore-3.1.
/// </remark>
table 3965 Matches
{
    TableType = Temporary;
    Extensible = false;

    fields
    {
        field(1; MatchIndex; Integer)
        {
            Description = 'The index of the match in the table.';
        }
        field(2; Index; Integer)
        {
            Description = 'The position in the original string where the first character of the captured substring is found.';
        }
        field(3; ValueBlob; Blob)
        {
            Access = Internal;
            Description = 'Gets the captured substring from the input string.';
        }
        field(4; Length; Integer)
        {
            Description = 'Gets the length of the captured substring.';
        }
        field(5; Success; Boolean)
        {
            Description = 'Gets a value indicating whether the match is successful.';
        }
    }
}
```
The temporary table has all the normal table procedures, and can be extended with procedures if needed. Now we can write the Match objects, output by .NET, to this table.

```al
codeunit 3961 "Regex Impl."
{
    Access = Internal;

    var
        DotNetRegex: DotNet Regex;
        DotNetMatchCollection: DotNet MatchCollection;

    procedure Match(Input: Text; Pattern: Text; var Matches: Record Matches)
    begin
        Regex(Pattern);
        DotNetMatchCollection := DotNetRegex.Matches(Input);
        InsertMatch(Matches);
    end;
}

```

## Avoiding Constructors
The .NET Regex class includes multiple constructors, but we should not expose them in the facade. We can, however, use constructors internally, as the code previous code example shows.

Removing constructors from a class can cause overloads. One way to get around that is to use the argument-table pattern. For example, you can construct a temporary table with all optional parameters and internally implement the logic to apply them.

The .NET Regex class contains three constructors that we want to support:

* Regex(Pattern)
* Regex(Pattern, RegexOptions)
* Regex(Pattern, RegexOptions, MatchTimeout)

In .NET, RegexOptions is an enum with options for matching the pattern (case-sensitivity, ignoring whitespace, and so on), and MatchTimeout sets a time-out interval for matching. The following example shows how to add those options to a temporary table.

```al
/// <summary>
/// Table with options to use with Regular Expressions
/// </summary>
table 3966 "Regex Options"
{
    Extensible = false;
    TableType = Temporary;

    fields
    {
        field(1; IgnoreCase; Boolean)
        {
            DataClassification = SystemMetadata;
            Description = 'Specifies case-insensitive matching.';
        }
        field(2; Multiline; Boolean)
        {
            DataClassification = SystemMetadata;
            Description = 'Changes the meaning of ^ and $ so they match at the beginning and end respectively of any line.';
        }
        
        ... 

        field(10; MatchTimeoutInMs; Integer)
        {
            DataClassification = SystemMetadata;
            Description = 'A time-out interval in milliseconds, to indicate when the matching should time out.';
            InitValue = -1; // Indicates no time-out 
        }
    }
}

```
This temporary table makes it straightforward to add overloads to the facade. For each method, there is one procedure without an options parameter, and one overload with an options table. The following example illustrates that for the Match procedure.

```al
/// <summary>
    /// Searches the input string for the first occurrence of the specified regular expression, using the specified matching options.
    /// </summary>
    /// <param name="Input">The string to search for a match.</param>
    /// <param name="Pattern">A regular expression pattern to match.</param>
    /// <param name="Match">The Match object to write information about the match to.</param>
    procedure Match(Input: Text; Pattern: Text; var Matches: Record Matches)
    begin
        RegexImpl.Match(Input, Pattern, Matches);
    end;

    /// <summary>
    /// Searches the input string for the first occurrence of the specified regular expression, using the specified matching options.
    /// </summary>
    /// <param name="Input">The string to search for a match.</param>
    /// <param name="Pattern">A regular expression pattern to match.</param>
    /// <param name="RegexOptions">A combination of the enumeration values that provide options for matching.</param>
    /// <param name="Match">The Match object to write information about the match to.</param>
    procedure Match(Input: Text; Pattern: Text; var RegexOptions: Record "Regex Options"; var Matches: Record Matches)
    begin
        RegexImpl.Match(Input, Pattern, RegexOptions, Matches);
    end;

```

## See Also
[Module Architecture](devenv-blueprint.md)  
[Getting Started with Modules in the System Application](devenv-getting-started.md)  
[Set Up an Environment for Developing a Module](devenv-set-up-an-environment.md)  
[Create a New Module in the System Application](devenv-new-module.md)  
[Change a Module in the System Application](devenv-change-a-module.md)  
