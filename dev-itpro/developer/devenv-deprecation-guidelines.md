---
title: "Guidelines for Deprecation of Code"
description: "Description of best practices and guidelines for deprecating code in AL for Business Central."
author: SusanneWindfeldPedersen
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: solsen
ms.topic: article
ms.service: "dynamics365-business-central"
ms.author: 
---

# Guidelines for Deprecation of Code

This topic provides guidelines that describe what to do when you need to obsolete code. For obsoleting code, preprocessor statements in AL can be used. For more information, see [Directives in AL](directives/devenv-directives-in-al.md).

## Obsoleting Code

Whenever you obsolete code, you need to:

- Add the preprocessor statements `#if`, `#else`, and `#endif` surrounding the code to be obsoleted.
- Use one of the following preprocessor symbols, where the pattern is: pattern is `CLEAN<Version>`, such as `CLEAN15`, `CLEAN16`, `CLEAN17`, and `CLEAN18`. It's important to use these standard symbols.
- The version you use is the same as the <major> of the ObsoleteTag. For example:

    - If a method is to be removed, then use `#if not`
        
        ```al
        #if not CLEAN18
            [Obsolete('Replaced by SetParameters().', '18.0')]
            procedure SetParams(NewAnalysisArea: Option Sales,Purchase,Inventory; NewReportName: Code[10]; NewLineTemplateName: Code[10]; NewColumnTemplateName: Code[10])
            begin
                SetParameters("Analysis Area Type".FromInteger(NewAnalysisArea), NewReportName, NewLineTemplateName, NewColumnTemplateName);
            end;
        #endif
        ```

    - If an action is to be removed, then use `#if not`
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

    - If a table is to be removed, then use `#if #else #endif`
        ```al

        table 1808 "Aggregated Assisted Setup"
        {
            Access = Internal;
            Caption = 'Aggregated Assisted Setup';
        #if CLEAN16
            OsboleteState = Removed;
        #else
            ObsoleteState = Pending;
        #endif
            ObsoleteReason = 'Data available in Assisted Setup already- extensions also register in the same table.';
            ObsoleteTag = '16.0';
        ```        

    - If a table is to be marked as `Temporary`, then use `#if #else #endif`
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

In order to have the compiler take the new ‘clean’ code path, you need to define the symbols. You do this in the `app.json` file with the following setting:
```al
"preprocessorSymbols": [ "CLEAN15", "CLEAN16", "CLEAN17", "CLEAN18" ]
```

A best practice is to change this locally to make sure everything compiles, run tests locally, and submit test jobs.

## Fixing code when objects are removed

If an action or other code element points to a now removed object, then you must:

- Ensure that the action is obsoleted
- Add preprocessor statements to fix the issue. 
    - If code points to an obsoleted method, then use directives to put in the fixed code.
    - If code points to an obsoleted table/field, then use directives to put in the fixed code.

## See Also

[AL Development Environment](devenv-reference-overview.md)  
[Directives in AL](directives/devenv-directives-in-al.md)  
