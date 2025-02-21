---
title: Deprecating reports
description: Learn about how to deprecate Business Central reports
author: KennieNP
ms.custom: bap-template
ms.reviewer: jswymer
ms.topic: conceptual
ms.author: kepontop
ms.date: 02/21/2025
---

# Deprecating reports

If you plan to deprecate reports in your Appsource apps or per-tenant extensions, you might want to communicate this to other developers and to your users prior to just removing the report from the app/extension.

> [!NOTE]  
> The article describes some best practices that Microsoft is using for obsoleting reports and layouts, and is meant as a non-enforced guidance and best practice. You can use this article as an inspiration on how to set up a best practice for deprecating your own reports.

## Communicate report deprecation to developers

The report object supports the obsoletion properties 
- ObsoleteReason,
- ObsoleteTag, and 
- ObsoleteState.

You use these to communicate why and when the report has been deprecated. With compiler preprocessor statements and preprocessor symbols, you can even write code that caters for the different deprecation stages in a uniform way.

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


## Communicate report deprecation to users: Tell-me search results

The Tell-me search in [!INCLUDE[prod_short](../includes/prod_short.md)] uses the report caption and additional search terms defined in the report object for finding reports that match search criteria from users. Furthermore, the report caption is shown when displaying the search results to the user. You can therefore utilize this for communicating the upcoming change to users that use Tell-me.

Note that you can gradually roll out more and more severe warning texts by using compiler preprocessor statements and preprocessor symbols.

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

## Communicate report deprecation to users: The request page

The request page in [!INCLUDE[prod_short](../includes/prod_short.md)] displays the the following report elements from the report object:
- Report Caption,
- AboutTitle,
- AboutText, and
- Layout Caption

You can therefore utilize any of these properties for communicating the upcoming change to users that run reports through the request page.

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

## Communicate report deprecation to users: The help pane for the request page 

The help pane for the request page in [!INCLUDE[prod_short](../includes/prod_short.md)] displays the the following report elements from the report object:
- AboutTitle,
- AboutText, and
- ContextSensitiveHelpPage.

You can therefore utilize any of these properties for communicating the upcoming change to users that have the help pane opened when the request page is displayed.

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


## Communicate report deprecation to users: The Report Layouts page 

The Report Layouts page in [!INCLUDE[prod_short](../includes/prod_short.md)] displays the the following report elements from the report object:
- Report Caption,
- Layout Caption, and
- Layout Summary.

You can therefore utilize any of these properties for communicating the upcoming change to users that open the help pane for the request page.

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

            Summary = 'MyOldLayout is used for showing data about XYZ. **Note that this layout is obsolete and will be removed in the v26 release**';

        }
}
```

## Tracking usage of a deprecated report or layout

Report telemetry gathers data about which reports are run on environments and when. Among many other details, it provides information about who ran the report, which layout was used, and how the output was consumed (printed, previewed, or downloaded).

As a tenant administrator or an app publisher, you can use this data to gather statistics on report and layout usage and communicate to organizations and users that they are using reports or layouts that will be unavailable in the future.

To learn more, go to [Report telemetry](../administration/telemetry-reports-trace.md).


## Related information

[Best practices for deprecation of AL code](devenv-deprecation-guidelines.md)  
[Report telemetry](../administration/telemetry-reports-trace.md)   
