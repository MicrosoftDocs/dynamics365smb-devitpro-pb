---
title: Substituting Reports in Business Central
description: Learn how to substitute one report for another in Business Central by handling the OnAfterSubstituteReport event, and how report extensions compare.
author: SusanneWindfeldPedersen
ms.author: solsen
ms.reviewer: solsen
ms.date: 08/24/2026
ms.topic: how-to
---

# Substituting reports

In versions prior to [!INCLUDE[prod_short](includes/prod_short.md)] 2021 release wave 1, extensibility isn't supported for report objects. Therefore, if you want to make any changes to the dataset or the layout of a base application report, you must create a new version of the report and apply the changes on the new object. Then you can override the base report with your own customized version by subscribing to the **OnAfterSubstituteReport** event published by **Codeunit 44 – ReportManagement**. 

From [!INCLUDE[prod_short](includes/prod_short.md)] 2021 release wave 1, it's possible to extend reports. With a report extension object, you can extend existing report objects, similar to how you extend tables and pages. With report extensions, you can extend an existing report by:

- Adding columns to existing data items in the report dataset
- Adding new data items
- Adding trigger implementations
- Adding to request pages
- Adding more report layouts, either to reflect new fields that are added with an extension, or simply adding new report layouts on an existing report dataset.

Using a report extension, you might not need to use the report substitution feature.

Learn more about report extensibility in [Report extension object](devenv-report-ext-object.md).

## How to substitute a report for another report

To substitute a report, create a method and subscribe it to the **OnAfterSubstituteReport** event, as shown in the following code. The `OnSubstituteReport` method replaces the report specified by the `ReportId` parameter with the report specified by the `NewReportId` parameter. In this example, the `"Customer - List"` report is substituted for `"My New Customer - List"`.

```al
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

Learn more about subscribing to events in [Subscribing to events](devenv-subscribing-to-events.md).

When the **OnAfterSubstituteReport** event is raised, the event subscriber method is called and the substitution takes place.

> [!NOTE]  
> The event is called **OnAfterSubstituteReport** to match the pattern followed by other events in the **ReportManagement** codeunit, but the subscriber is invoked before the substitution takes place.

The **OnAfterSubstituteReport** event is raised when:

1. The user activates a page action that runs the report to be substituted, that is, an action that has the [RunObject property](properties/devenv-runobject-property.md) set to the report. 
2. The report is invoked from the **Tell Me** window.
3. The report is called by one of the following *static* methods:

    - [Run method](methods-auto/report/reportinstance-run-method.md)
    - [RunModal method](methods-auto/report/reportinstance-runmodal-method.md)
    - [SaveAsHtml method](methods-auto/report/reportinstance-saveashtml-method.md)
    - [SaveAsXml method](methods-auto/report/reportinstance-saveasxml-method.md)
    - [SaveAsPdf method](methods-auto/report/reportinstance-saveaspdf-method.md)
    - [SaveAsExcel method](methods-auto/report/reportinstance-saveasexcel-method.md)
    - [SaveAsWord method](methods-auto/report/reportinstance-saveasword-method.md)
    - [RunRequestPage method](methods-auto/report/reportinstance-runrequestpage-method.md)
    - [Execute method](methods-auto/report/reportinstance-execute-method.md)
    - [Print method](methods-auto/report/reportinstance-print-method.md)
    - [SaveAs method](methods-auto/report/reportinstance-saveas-method.md)

Learn more about raising events in [Raising events](devenv-raising-events.md).

## Good practices

- Use the same caption for both reports, set by the [Caption property](properties/devenv-caption-property.md). This way, all links and action captions that lead to the report match the report itself. This practice also applies to bookmarks linked to a report, since they keep the caption of the original report even if you replace it with another caption.

<!-- - Consider hiding the original report from the TellMe window if it is no longer valuable to all users. You can do this by setting the original report to [UsageCategory Property](properties/devenv-usagecategory-property.md) to **None**. -->

- Consider enhancing the code of the subscriber method to check if the report is already replaced with another extension. This is done by comparing the `ReportId` and `NewReportId` parameters before making the change, such that if the value of the `NewReportId` parameter is different from the value of the `ReportId` parameter and different from -1, it means that the report is already substituted for another subscriber of the **OnAfterSubstituteReport** event.

> [!IMPORTANT]  
> Ensure that if a report is called on code, you use a compatible report to replace it to avoid runtime errors.

## Related information

[Report data type](methods-auto/report/report-data-type.md)  
[Subscribing to events](devenv-subscribing-to-events.md)  
[Events in AL](devenv-events-in-al.md)  
[GetSubstituteReportId method](methods-auto/report/report-getsubstitutereportid-method.md)  
[Get started with AL](devenv-get-started.md)  
