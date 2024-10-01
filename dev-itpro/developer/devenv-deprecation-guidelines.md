---
title: Best Practices for Deprecation of AL Code
description: Description of best practices and guidelines for deprecating code in the Base App for Business Central.
author: SusanneWindfeldPedersen
ms.date: 04/30/2024
ms.reviewer: jswymer
ms.topic: conceptual
ms.author: grobyns
---

# Best practices for deprecation of AL code

This article provides guidelines that describe how code in the Base App is obsoleted. The article describes some best practices that Microsoft is using for obsoleting code, and is meant as a nonenforced guidance and best practice. You can use this article as an inspiration on how to set up a best practice for your own code. For obsoleting code, preprocessor statements in AL can be used. For more information, see [Directives in AL](directives/devenv-directives-in-al.md).

## Obsoleting code

When we obsolete code, we:

- Add the preprocessor statements `#if`, `#else`, and `#endif` surrounding the code to be obsoleted.
- Use one of the following preprocessor symbols, where the pattern is `CLEAN<Version>`, such as `CLEAN15`, `CLEAN16`, `CLEAN17`, and `CLEAN18`. 
    > [!NOTE]  
    > These symbols aren't shipped with the product.
- For tables and fields, we also use `CLEANSCHEMA` in a second phase to delete the SQL schema.
- The version to use in the symbol matches the `<major>` of the `ObsoleteTag`. For example:

    - If a method is to be removed, then we use `#if not`
        
        ```al
        #if not CLEAN18
            [Obsolete('Replaced by SetParameters().', '18.0')]
            procedure SetParams(NewAnalysisArea: Option Sales,Purchase,Inventory; NewReportName: Code[10]; NewLineTemplateName: Code[10]; NewColumnTemplateName: Code[10])
            begin
                SetParameters("Analysis Area Type".FromInteger(NewAnalysisArea), NewReportName, NewLineTemplateName, NewColumnTemplateName);
            end;
        #endif
        ```

    - If an action is to be removed, then we also use `#if not`

        ```al
        
        #if not CLEAN17
            action("Social Listening Setup")
            {
                ApplicationArea = All;
                Caption = 'Social Engagement Setup';
                RunObject = page "Social Listening Setup";
                Visible = false;
                ObsoleteState = Pending;
                ObsoleteReason = 'Microsoft Social Engagement has been discontinued.';
                ObsoleteTag = '17.0';
            }
        #endif
        ```

    - If a table or table field is to be removed, then we use `#if #else #endif`

        ```al

        #if not CLEANSCHEMA19
        table 1808 "Aggregated Assisted Setup"
        {
            Access = Internal;
            Caption = 'Aggregated Assisted Setup';
        #if CLEAN16
            ObsoleteState = Removed;
            ObsoleteTag = '19.0';
        #else
            ObsoleteState = Pending;
            ObsoleteTag = '16.0';
        #endif
            ObsoleteReason = 'Data available in Assisted Setup already- extensions also register in the same table.';
        }
        #endif

        ```        

        ```al
        #if not CLEANSCHEMA20
        field(11701; "Bank Account No."; Text[30])
        {
            Caption = 'Bank Account No.';
            Editable = false;
        #if CLEAN17
            ObsoleteState = Removed;
            ObsoleteTag = '20.0';
        #else
            ObsoleteState = Pending;
            ObsoleteTag = '17.0';
        #endif
            ObsoleteReason = 'Moved to Core Localization Pack for Czech.';
        }
        #endif
        ```
    - If a table is to be marked as `Temporary`, then we use `#if #else #endif`

        ```al
        
        table 5503 "Acc. Schedule Line Entity"
        {
            Caption = 'Acc. Schedule Line Entity';
            // TableType = Temporary;
        #if CLEAN17
            TableType = Temporary;
        #else
            ObsoleteState = Pending;
            ObsoleteReason = 'Table will be marked as TableType=Temporary. Make sure you are not using this table to store records';
            ObsoleteTag = '17.0';
        #endif
        ```

In order to have the compiler take the new ‘clean’ code path, symbols must be defined. The symbols are defined in the `app.json` file with the following setting. For more information, see [JSON Files](devenv-json-files.md).

```al
"preprocessorSymbols": [ "CLEAN15", "CLEAN16", "CLEAN17", "CLEAN18" ]
```

> [!IMPORTANT]  
> A best practice is to change this locally to make sure everything compiles, run tests locally, and then submit test jobs.

## Fixing code when objects are removed

If an action or other code element points to a now removed object, then the guidance is to:

- Ensure that the action is obsoleted.
- Add preprocessor statements to fix the issue.
  - If code points to an obsoleted method, then use directives to put in the fixed code.
  - If code points to an obsoleted table/field, then use directives to put in the fixed code.

## See also

[AL development environment](devenv-reference-overview.md)  
[Directives in AL](directives/devenv-directives-in-al.md)  
[Microsoft timeline for deprecating code in Business Central](devenv-deprecation-timeline.md)  
[ObsoleteTag property](properties/devenv-obsoletetag-property.md)  
[ObsoleteState property](properties/devenv-obsoletestate-property.md)  
[ObsoleteReason property](properties/devenv-obsoletereason-property.md)  
[Obsolete attribute](/dynamics365/business-central/dev-itpro/developer/attributes/devenv-obsolete-attribute)