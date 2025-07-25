---
title: Best practices for AL code
description: Best practices for writing AL code for Business Central.
author: SusanneWindfeldPedersen
ms.date: 05/16/2025
ms.topic: best-practice
ms.author: solsen
ms.reviewer: solsen
---

# Best practices for AL  

This page defines some of the best practices to follow when writing AL code for [!INCLUDE[d365fin_long_md](../includes/d365fin_long_md.md)]. These best practices are additive to rules and guidelines that are caught during compilation of AL code. We recommend following these best practices when developing extensions in AL to ensure consistency and discoverability on file, object, and method naming, as well as better readability of written code.

> [!TIP]  
> Check out the great work that is going on at [https://alguidelines.dev/](https://alguidelines.dev/). New design patterns and best practices are being established, so join the discussions, and contribute through [GitHub](https://github.com/microsoft/alguidelines).

## Extension structure

An extension is fully contained in a single folder. This folder often contains multiple files, such as `app.json` and `launch.json` files, perhaps an image file representing the extension's logo, various folders for source; `\src`, other resources; `\res`, and a test folder; `\test` folder. The extension doesn't need to follow a flat structure, which means that, depending on the number of application files, extra folders can be used in the "src" or "test" folders to group objects based on their functionality, which can help make maintaining a large AL project easier.

## File naming 

Each file name should contain the object name (using only characters A–Z, a–z, and 0–9), the object type, and the `.al` file extension. In your extension, the name of each new application object (table, page, codeunit), can contain a prefix or suffix.

The CodeCop analyzer suggests that the object name is part of the file name, which is encouraged as a best practice. Adding any affixes to the file names is voluntary.

> [!NOTE]  
> If you're submitting an app to AppSource, you must follow the guidance in the [Technical validation checklist](../developer/devenv-checklist-submission.md).

### File naming notation

Follow the syntax for file naming as shown in the table:

|Full objects|Extensions|
|------|---------------------------|
|`<ObjectNameSuffix>.<FullTypeName>.al`|`<ObjectNameSuffix>.<FullTypeName>Ext.al`|
|`<PrefixObjectName>.<FullTypeName>.al`|`<PrefixObjectName>.<FullTypeName>Ext.al`|
|`<ObjectNameExcludingAffix>.<FullTypeName>.al`|`<ObjectNameExcludingAffix>.<FullTypeName>Ext.al`|

### Type map

Use the listed abbreviations for each type of object in the file naming:

|Object    |Abbreviation|
|----------|------------|
|Page      |Page|
|Page Extension|PageExt|
|Page Customization|PageCust|
|Codeunit  |Codeunit|
|Table     |Table|
|Table Extension|TableExt|
|XML Port  |Xmlport|
|Report    |Report|
|Request Page|RequestPage|
|Query     |Query|
|Enum      |Enum|
|Enum Extension|EnumExt|
|Control Add-ins|ControlAddin|
|Dotnet    |Dotnet|
|Profile   |Profile|
|Interface |Interface|
|Permission Set|PermissionSet|
|Permission Set Extension|PermissionSetExt|


### File naming examples

For the listed objects in the table, these examples show how to name the files.

|Object name|File name|
|------|---------------------------|
|codeunit 70000000 MyPrefixSalesperson|`MyPrefixSalesperson.Codeunit.al`|
|page 70000000 MyPrefixSalesperson|`MyPrefixSalesperson.Page.al`|
|pageextension 70000000 MyPrefixSalesperson extends "Customer Card"|`MyPrefixSalesperson.PageExt.al`|

### Examples of object naming

#### Table

```al
table 70000000 MyPrefixSalesperson
```

#### Page

```al
page 70000000 MyPrefixSalesperson
```

#### Action

```al
actions
{
    addafter(ApprovalEntries)
    {
        action(MyPrefixVacation)
```

#### Codeunit

```al
codeunit 70000000 MyPrefixSalesperson
```

## Copilot and action names

Trailing whitespaces are allowed in action names, meaning that you don't get a compiler error. For example these names are accepted:

```al
group("CopilotActionGroup  ")
{
    action("Suggest Sales Lines   ")
    {
        // Code that generates sales lines suggestions
    }
}
```

However, these trailing whitespaces are trimmed internally and aren't recognized by Copilot. To ensure that Copilot works correctly with your feature, you must *avoid trailing spaces* in action names. Instead, write the code like this:

```al
group("CopilotActionGroup")
{
    action("Suggest Sales Lines")
    {
        // Code that generates sales lines suggestions
    }
}
```

## Formatting

We recommend keeping your AL code properly formatted as follows:

- Use all lowercase letters for reserved language keywords. Built-in methods and types aren't included in this rule because they're written using Pascal case. 
- Use four spaces for indentation. 
- Curly brackets should always start on a new line. If there's only one property, it can be placed on a single line.​

The following example illustrates these formatting rules. 

```al
page 123 PageName
{
    actions
    {
        area(Processing)
        {
            action(ActionName)
            {
                trigger OnAction()
                begin
                end;
            }
        }
    }

    var
        TempCustomer: Record Customer temporary;

    [EventSubscriber(ObjectType::Page, Page::"Item Card", 'OnAfterGetCurrRecordEvent', '', false, false)]
    local procedure OnOpenItemCard(var rec: Record Item)
    var
        OnRecord: Option " ", Item, Contact;
    begin
        EnablePictureAnalyzerNotification(rec."No.", OnRecord::Item);
    end;
}

```

The [!INCLUDE[d365al_ext_md](../includes/d365al_ext_md.md)] offers users the option to automatically format their source code. Learn more in [AL Formatter](../developer/devenv-al-formatter.md).

## Line length

In general, there's no restriction on line length, but lengthy lines can make the code unreadable. We recommend that you keep your code easily scannable and readable.

## Object naming

Object names should be prefixed, starting with the feature or group name, followed by the logical name, as illustrated in the following examples: 

- `Intrastat extension validation codeunit for Denmark`
- `codeunit 123 "IntrastatDK Validation"`

> [!NOTE]  
> The "MS - " prefix isn't required. 

## File structure

Inside an .al code file, the structure for all objects must follow the sequence:

1. Properties
2. Object-specific constructs such as
    - Table fields
    - Page layout
    - Actions
    - Triggers
3. Global variables
    - Labels
    - Global variables
4. Methods

## Referencing 

In AL, objects are referenced by their object name, not by their ID. 

### Example

```al
Page.RunModal(Page::"Customer Card", ...)
 
var
    Customer: Record Customer;
```

## Variable and field naming 

For variables they must:

- Be named using PascalCase
- Have the `Temp` prefix if they're temporary variables
- Include the object name in the name (for objects)

Furthermore:

- Field and variable names shouldn't include wildcard symbols, such as `%` and `&`. This might break features such as export using Excel or RapidStart. 
- Name fields using A–Z, a–z, and 0–9 and use Caption and xliff files to display the field appropriately. For more information, see [Working with translation files](../developer/devenv-work-with-translation-files.md).
- Using English as the language for naming improves the ability to troubleshoot issues that may arise. 


### Example

```al
TempCustomer: Record Customer temporary;
Vendor: Record Vendor; 
```

## Method declaration 

To declare a method, follow these guidelines: 

- Include a space after a semicolon when declaring multiple arguments. 
- Semicolons can be used at the end of the signature/method header. If you use a snippet, the semicolons aren't automatically added.
- Methods should be named using PascalCase, like variables. However, this isn't a mandatory rule.
- There must be a blank line between method declarations. If you format your code using the [AL Formatter](../developer/devenv-al-formatter.md) tool, the autoformatter sets the blank line between procedures. 

### Example
 
```al
local procedure MyProcedure(Customer: Record Customer; Int: Integer)
begin
end;

// Blank line between methods

local procedure MyProcedure2(Customer: Record Customer; Int: Integer)
begin
end;

```

## Calling methods

When calling a method, include one space after each command if you're passing multiple parameters. Parentheses must be specified when you're making a method call or system call such as: `Init()`, `Modify()`, `Insert()`, etc. 

### Example

```al
MyProcedure();
MyProcedure(1);
MyProcedure(1, 2); 
```

## Type definition (colon)

When you declare a variable or a parameter, the name of that variable or parameter must be immediately followed by a colon, then a single space, and then the type of the variable/parameter as illustrated in the example.

```al
var
    Number: Integer;

local procedure MyProcedure(a: Integer; b: Integer): Integer 
```

## Related information

[Checklist for submitting your app](../developer/devenv-checklist-submission.md)  
[Rules and guidelines for AL code](apptest-overview.md)  
[Using the code analysis tool](../developer/devenv-using-code-analysis-tool.md)
