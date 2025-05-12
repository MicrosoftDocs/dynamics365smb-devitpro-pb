---
title: Obsoleting reports
description: Learn about how to obsolete Business Central reports
author: KennieNP
ms.custom: bap-template
ms.reviewer: jswymer
ms.topic: concept-article
ms.author: kepontop
ms.date: 03/13/2025
---

# Obsoleting reports

If you plan to deprecate reports in your AppSource apps or per-tenant extensions, you might want to communicate the deprecation to other developers and to your users before you remove the reports.

> [!NOTE]  
> The article describes some best practices that Microsoft uses for obsoleting reports and layouts, and is meant as a nonenforced guidance and best practices. You can use this article as inspiration for how to set up your own best practices for deprecating your reports.

## How to communicate report deprecation to developers

The report object supports the following properties for deprecations:

- ObsoleteReason
- ObsoleteTag
- ObsoleteState

Use these properties to communicate why and when the report is deprecated. With compiler preprocessor statements and preprocessor symbols, you can even write code that caters for the different deprecation stages in a uniform way. Starting in 2025 release wave 1 (runtime 15), you can define the obsoletion properties at the layout level. When these properties are set, the layout appears as deprecated on the **Report Layouts** page in the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] client.

```al 
// Example of how to set obsoletion properties on a report
report 50100 MyReport
{
#if Version3
    ObsoleteState = Removed;
    ObsoleteTag = '19.0';
#else
    ObsoleteState = Pending;
    ObsoleteTag = '16.0';
#endif
    ObsoleteReason = 'The MyReport has been replaced by MyReport2.';
}
#endif
```

To learn more, go to [Best practices for deprecation of AL code](devenv-deprecation-guidelines.md).

## How to communicate report obsoletion to users: Tell-me search results

The Tell-Me search in [!INCLUDE[prod_short](../includes/prod_short.md)] uses the report caption and the search terms defined in the report object to find reports that match search criteria. Tell-Me search results also display the report caption. You can use the caption to communicate the upcoming change when people use Tell-Me.

You can gradually introduce more severe warning texts by using compiler preprocessor statements and preprocessor symbols.

```al 
report 50100 MyReport
{
    // Other report properties here ...

    // Consider adding obsolete to the caption
    // This will help users to identify the report as obsolete when they use Tell-me search
    // and when they open the request page for the report.

    #if Version3
        Caption = 'MyReport (Now removed)';
    #else 
        #if Version2
            Caption = 'MyReport (Obsolete. Will soon be removed)';
        #else
            #if Version1
                Caption = 'MyReport (Obsolete)';
            #else
                Caption = 'MyReport';
            #endif
        #endif
    #endif

    // Consider adding explicit search terms
    AdditionalSearchTerms = 'Obsolete, Deprecated';

    // More report here ...
}
```

## How to communicate report deprecation to users: The request page

The request page in [!INCLUDE[prod_short](../includes/prod_short.md)] displays the following report elements from the report object:

- Report Caption
- AboutTitle
- AboutText
- Layout Caption

You can use any of these properties to communicate the upcoming change to people who run reports through the request page.

```al 
report 50100 MyReport
{
    // Other report properties here ...

    // Consider adding obsolete to the caption
    // This will help users to identify the report as obsolete when running the report through the request page.

    Caption = 'MyReport (Obsolete)';
    
    dataset{ ... }

    requestpage
    {
        // Consider adding obsolete to the teaching tip properties (AboutTitle and AboutText).
        // This will help users to identify the report as obsolete if they have teaching tips enabled. 
        // The same information will also be shown in the help pane of the request page.

        AboutTitle = 'About myOldReport (obsolete)';
        AboutText = 'Teaching tip content. **This report is obsolete and will be removed in the v3 release.**';
    }

    rendering
    {
        layout(myOldLayout)
        {
            // Other layout properties here...

            // Consider adding obsolete to the layout caption
            // This will help users to identify the layout as obsolete when they use the request page. 
            // The same information will also be shown on the Report Layouts page.

            Caption = 'MyOldLayout (Obsolete)';
        }
}
```

## How to communicate report deprecation to users: The help pane for the request page

The Help pane for the request page in [!INCLUDE[prod_short](../includes/prod_short.md)] displays the following report elements from the report object:

- AboutTitle
- AboutText
- ContextSensitiveHelpPage

You can use any of these properties to communicate the upcoming change to people who have the Help pane open when the request page displays.

```al 
report 50100 MyReport
{

    // Other report properties here ...
  
    dataset{ ... }

    requestpage
    {
        // Consider adding obsolete to the teaching tip properties
        // This will help users to identify the report as obsolete if they have teaching tips enabled. 
        // The same information will also be shown in the help pane of the request page.
 
        AboutTitle = 'About myOldReport (obsolete)';
        AboutText = 'Teaching tip content. **This report is obsolete and will be removed in the v26 release.**';

        // Consider updating your documentation for the report:
        //   Mention that the report is obsolete and will be removed in the v26 release
        //   Explain which alternative reports or features that users can use instead of this report.
 
        ContextSensitiveHelpPage = 'report-50100';
    }

    // More report code here ...
}
```

## How to communicate report obsoletion to users: The Report Layouts page

The **Report Layouts** page in [!INCLUDE[prod_short](../includes/prod_short.md)] displays the following report elements from the report object:

- Report Caption
- Layout Caption
- Layout Summary
- Layout ObsoleteReason, ObsoleteState, and ObsoleteTag (introduced in 2025 release wave 1 (runtime 15))

You can use any of these properties to communicate the upcoming change to people who open the Help pane for the request page.

```al 
report 50100 MyReport
{
    // Other report properties here ...

    // Consider adding obsolete to the caption
    // This will help users to identify the report as obsolete when they use Tell-me search
    // and when they open the request page for the report.

    Caption = 'MyReport (Obsolete)';
    
    dataset{ ... }

    requestpage{ ... }

    rendering
    {
        layout(myOldLayout)
        {
            // Other layout properties here...

            // Consider adding obsolete to the layout caption
            // This will help users to identify the layout as obsolete when they use the request page. 
            // The same information will also be shown on the Report Layouts page.

            Caption = 'MyOldLayout (Obsolete)';

            // Consider adding obsolete text to the layout description
            // This will be shown on the Report Layouts page.

            Summary = 'MyOldLayout is used for showing data about XYZ. **Note that this layout is obsolete and will be removed in the v2 release**';

            ObsoleteReason = 'This layout is obsolete and will be removed in the v28 release';
            ObsoleteState = Pending;
            ObsoleteTag = 'myObsoleteLayoutTag';

        }
}
```

## Tracking usage of a deprecated report or layout

Report telemetry gathers data about which, and when, reports are run in environments. Among many other details, it provides information about who ran the report, which layout was used, and how the output was consumed. For example, whether the reports were printed, previewed, or downloaded.

Tenant administrators and app publishers can use this data to gather statistics on report and layout use. The information lets you communicate to organizations and users that they're using reports or layouts that won't be unavailable in the future.

To learn more, go to [Report telemetry](../administration/telemetry-reports-trace.md).

## Related information

[Obsoleting report layouts](devenv-multiple-report-layouts.md#obsoleting-layouts)  
[Best practices for deprecation of AL code](devenv-deprecation-guidelines.md)  
[Report telemetry](../administration/telemetry-reports-trace.md)  
