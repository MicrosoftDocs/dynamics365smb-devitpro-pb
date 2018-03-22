---
title: "Best Practices for AL code"
description: "Best Practices for writing AL code."
author: SusanneWindfeldPedersen
ms.custom: na
ms.date: 03/06/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.assetid: a0ac492d-e3c8-4a76-87b4-b469e08c58e7
ms.author: solsen
caps.latest.revision: 18
---

 

# Best Practices for AL  
This page defines some of the best practices to follow when writing AL code for [!INCLUDE[d365fin_long_md](../includes/d365fin_long_md.md)]. These best practices are additional to rules and guidelines that are caught during compilation of AL code. We recommend following these best practices when developing extensions in AL to ensure consistency and discoverability on file, object and method naming, as well as better readability of written code.

## Extension structure 
An extension is fully contained in a single folder. This folder often contains multiple files, such as app.json and launch.json files, perhaps an image file representing the extension's logo, various folders for source; "\src", other resources; "\res", and a test folder; "\test" folder. The extension does not need to follow a flat structure, which means that, depending on the amount of application files, additional folders can be used in the "src" or "test" folders to group objects based on their functionality, which can help make maintaining a large .al project easier.   

## File naming 
Each file name must start with the corresponding type and ID, followed by a dot for full objects or a dash for extensions. The name of the object is written only with characters [A-Za-z0-9] and dot al is used for the file type. 

### File naming notation
Follow the syntax for file naming as shown below:

|Full objects|Extensions|
|------|---------------------------|
|`<Type><Id>.<ObjectName>.al`|`<Type><BaseId>-Ext<ObjectId>.<ObjectName>.al`|

### Type map
Use the listed abbreviations for each type of object in the file naming:

|Object    |Abbreviation|
|----------|---------------------------|
|Page      |Pag|
|Page Extension|PageExt|
|Codeunit  |Cod|
|Table     |Tab|
|Table Extension|TabExt|
|XML Port  |Xml|
|Report    |Rep|
|Query     |Que|

### Examples of file naming
The following table illustrates how the file naming should look.

|Object name|File name|
|------|---------------------------|
|codeunit 1000 "Job Calculate WIP"|Cod1000.JobCalculateWIP.al|
|page 21 "Customer Card"|Pag21.CustomerCard.al|
|page 1234 "MyPag" extends "Customer Card"|Pag21-Ext1234.MyPag.al|


## Formatting
We recommend keeping your AL code properly formatted as follows:
- Use all lowercase letters for reserved language keywords. Built-in methods and types are not included in this rule because they are written using Pascal case. 
- Use four spaces for indentation. 
- Curly brackets are always on a new line. If there is one property, put it on a single line. 

The following example illustrates these formatting rules. 

```
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
        TempCustomer: temporary Record Customer;

    [EventSubscriber(ObjectType::Page, Page::"Item Card", 'OnAfterGetCurrRecordEvent', '', false, false)]
    local procedure OnOpenItemCard(var rec: Record Item)
    var
        OnRecord: Option " ", Item, Contact;
    begin
        EnablePictureAnalyzerNotification(rec."No.", OnRecord::Item);
    end;
}

```

The AL Language extension offers users the option to automatically format their source code. For more information on how to use it, see [AL Formatter](../developer/devenv-al-formatter.md).

## Line length
In general there is no restriction on line length, but lengthy lines can make the the code unreadable. We recommend that you keep your code easily scannable and readable.

## Object naming
Object names are prefixed. They start with the feature/group name, followed by the logical name as in these two examples: 

- `Intrastat extension validation codeunit for Denmark`
- `codeunit 123 "IntrastatDK Validation"`


> [!NOTE]  
> The "MS - " prefix is not required. 

## File structure 
Inside an .al code file, the structure for all objects must follow the sequence below:

1. Properties
2. Object-specific constructs such as:
    *  Table fields
    *  Page layout
    *  Actions
3. Global variables
    * Labels (old Text Constants)
    * Global variables
4. Methods

## Referencing 
In AL, objects are referenced by their object name, not by their ID. 

### Example

```
Page.RunModal(Page::"Customer Card", ...)
 
var
Customer: Record Customer;
```

## Variable naming 
All variables remain unchanged when they are named. This means that they can be named using Pascal case, temporary variables have the `Temp` prefix, and objects must include the object name in the name. 

### Example
```
TempCustomer: temporary Record Customer;
Vendor: Record Vendor; 
```

## Method declaration 
To declare a method, follow the guidelines below: 

- Include a space after a semicolon when declaring multiple arguments. 
- Semicolons are used at the end of the signature/method header. If you use a snippet, the semicolons are automatically added.
- Methods are named as variables using Pascal case. However, this is not a mandatory rule. 
- There must be a blank line between method declarations. If you format your code using the [AL Formatter](../developer/devenv-al-formatter.md) tool, the auto-formatter sets the blank line between procedures. 

### Example
 
```
local procedure MyProcedure(Customer: Record Customer; Int: Integer)
begin
end
// space
local procedure MyProcedure2(Customer: Record Customer; Int: Integer)
begin
end
```

## Calling methods
When calling a method, include one space after each command if you are passing multiple parameters. Parentheses must be specified when you are making a method call or system call such as: Init(), Modify(), Insert() etc. 

### Example
```
MyProcedure();
MyProcedure(1);
MyProcedure(1, 2); 
```

## Type definition (colon)
When declaring a variable or a parameter, the name of that variable or parameter must be immediately followed by a colon, then a single space, and then the type of the variable/parameter as illustrated in the example below.

```
Var
Number: Integer;

local procedure MyProcedure(a: Integer; b: Integer): Integer 
```

## See Also
[Checklist for Submitting Your App](../developer/devenv-checklist-submission.md)  
[Rules and Guidelines for AL Code](apptest-overview.md)  
