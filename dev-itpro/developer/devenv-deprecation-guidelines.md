---
title: "Best Practices for Deprecation of Code in the Base App"
description: "Description of best practices and guidelines for deprecating code in the Base App for Business Central."
author: SusanneWindfeldPedersen
ms.custom: na
ms.date: 05/02/2021
ms.reviewer: solsen
ms.topic: article
ms.service: "dynamics365-business-central"
ms.author: grobyns
---

# Best Practices for Deprecation of Code in the Base App

This topic provides guidelines that describe how code in the Base App is obsoleted. The topic describes some best practices that Microsoft is using for obsoleting code, and is meant as a non-enforced guidance and best practice. You can use this topic as an inspiration on how to set up a best practice for your own code. For obsoleting code, preprocessor statements in AL can be used. For more information, see [Directives in AL](directives/devenv-directives-in-al.md).

## Obsoleting Code

When we obsolete code, we:

- Add the preprocessor statements `#if`, `#else`, and `#endif` surrounding the code to be obsoleted.
- Use one of the following preprocessor symbols, where the pattern is `CLEAN<Version>`, such as `CLEAN15`, `CLEAN16`, `CLEAN17`, and `CLEAN18`. 
    > [!NOTE]  
    > These symbols are not shipped with the product.
- The version to use in the symbol matches the `<major>` of the `ObsoleteTag`. For example:

    - If a method is to be removed, then we are using `#if not`
        
        ```al
        #if not CLEAN18
            [Obsolete('Replaced by SetParameters().', '18.0')]
            procedure SetParams(NewAnalysisArea: Option Sales,Purchase,Inventory; NewReportName: Code[10]; NewLineTemplateName: Code[10]; NewColumnTemplateName: Code[10])
            begin
                SetParameters("Analysis Area Type".FromInteger(NewAnalysisArea), NewReportName, NewLineTemplateName, NewColumnTemplateName);
            end;
        #endif
        ```

    - If an action is to be removed, then we are also using `#if not`

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

    - If a table is to be removed, then we'll use `#if #else #endif`

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

    - If a table is to be marked as `Temporary`, then we'll use `#if #else #endif`

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

In order to have the compiler take the new ‘clean’ code path, the symbols must be defined. This is done in the `app.json` file with the following setting. For more information, see [JSON Files](devenv-json-files.md).

```al
"preprocessorSymbols": [ "CLEAN15", "CLEAN16", "CLEAN17", "CLEAN18" ]
```

> [!IMPORTANT]  
> A best practice is to change this locally to make sure everything compiles, run tests locally, and submit test jobs.

## Fixing code when objects are removed

If an action or other code element points to a now removed object, then the guidance is to:

- Ensure that the action is obsoleted.
- Add preprocessor statements to fix the issue.
  - If code points to an obsoleted method, then use directives to put in the fixed code.
  - If code points to an obsoleted table/field, then use directives to put in the fixed code.

## See Also

[AL Development Environment](devenv-reference-overview.md)  
[Directives in AL](directives/devenv-directives-in-al.md)  
[ObsoleteTag Property](properties/devenv-obsoletetag-property.md)  
[ObsoleteState Property](properties/devenv-obsoletestate-property.md)  
[ObsoleteReason Property](properties/devenv-obsoletereason-property.md)  
