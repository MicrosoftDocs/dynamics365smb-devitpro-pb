---
title: "Substituting Reports"
description: "How to substitute reports for other reports."
author: blrobl
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: conceptual
ms.service: "dynamics365-business-central"
---

# Substituting Reports

Contrary to pages and tables, extensibility is not yet supported for report objects in [!INCLUDE[d365_bus_cent_short_md](includes/d365_bus_cent_short_md.md)]. Therefore, if you want to make any changes to the dataset or the layout of a base application report, you must create a new version of the report and apply the changes on the new object. Then you can override the base report with your own customized version by subscribing to the **OnAfterSubstituteReport** event published by **Codeunit 44 – ReportManagement**.

## How to substitute a report for another report

To substitute a report, you create a method and subscribe it to the **OnAfterSubstituteReport** event, as shown in the code below. The `OnSubstituteReport` method replaces the report specified by the `ReportId` with the one given by the `NewReportId` parameter. In this example the `"Customer - List"` report will be substituted for `"My New Customer - List"`.

```AL
codeunit 50100 "Substitute Report"
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::ReportManagement, 'OnAfterSubstituteReport', '', false, false)]
    local procedure OnSubstituteReport(ReportId: Integer; var NewReportId: Integer)
    begin
        if ReportId = Report::"Customer - List" then
            NewReportId := Report::"My New Customer - List";
    end;
}
```

For more information on how to subscribe to events, see [Subscribing to Events](devenv-subscribing-to-events.md). 

When the **OnAfterSubstituteReport** event is raised, the event subscriber method is called and the substitution takes place.

> [!NOTE]  
> The event is called **OnAfterSubstituteReport** to match the pattern followed by other events in the **ReportManagement** codeunit, but the subscriber will be invoked before the substitution takes place.

The **OnAfterSubstituteReport** event is raised when:

1. The user activates a page action that runs the report to be substituted, that is, an action that has the [RunObject Property](properties/devenv-runobject-property.md) set to the report. 
2. The report is invoked from the **Tell Me** window.
3. The report is called by one of the following *static* methods:

    - [Run Method](methods-auto\report\reportinstance-run-method.md)
    - [RunModal Method](methods-auto\report\reportinstance-runmodal-method.md)
    - [SaveAsHtml Method](methods-auto\report\reportinstance-saveashtml-method.md)
    - [SaveAsXml Method](methods-auto\report\reportinstance-saveasxml-method.md)
    - [SaveAsPdf Method](methods-auto\report\reportinstance-saveaspdf-method.md)
    - [SaveAsExcel Method](methods-auto\report\reportinstance-saveasexcel-method.md)
    - [SaveAsWord Method](methods-auto\report\reportinstance-saveasword-method.md)
    - [RunRequestPage Method](methods-auto\report\reportinstance-runrequestpage-method.md)
    - [Execute Method](methods-auto\report\reportinstance-execute-method.md)
    - [Print Method](methods-auto\report\reportinstance-print-method.md)
    - [SaveAs Method](methods-auto\report\reportinstance-saveas-method.md)

For more information about raising events, see [Raising Events](devenv-raising-events.md).

## Good practices

- Consider using the same caption for both reports, given by the [Caption Property](properties/devenv-caption-property.md). Consequently, any links and action captions that lead to the report will match the report itself. This is also relevant for bookmarks linked to a report, since they maintain the caption of the original report, even if it has been substituted for one with another caption.

<!-- - Consider hiding the original report from the TellMe window if it is no longer valuable to all users. You can do this by setting the original report to [UsageCategory Property](properties/devenv-usagecategory-property.md) to **None**. -->

- Consider enhancing the code of the subscriber method to check if the report has already been replaced with another extension. This is done by comparing the `ReportId` and `NewReportId` parameters before making the change, such that if the value of the `NewReportId` parameter is different from the value of the `ReportId` parameter and different from -1, it means that the report has already been substituted for another subscriber of the **OnAfterSubstituteReport** event.

> [!IMPORTANT]  
> Make sure that if a report is called on code, you use a compatible report to replace it to avoid run time errors.

## See Also
[Report Data Type](methods-auto/report/report-data-type.md)   
[Subscribing to Events](devenv-subscribing-to-events.md)   
[Events in AL](devenv-events-in-al.md)  
[GetSubstituteReport Method](methods-auto/report/report-getsubstitutereportid-method.md)   
[Getting Started with AL](devenv-get-started.md)  