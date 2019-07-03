---
title: "Request Pages"
description: "Introducing how to work with request pages in Business Central."
author: SusanneWindfeldPedersen

ms.custom: na
ms.date: 04/01/2019
ms.reviewer: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.author: solsen
---

# Request Pages
A request page is a page that is run before the report starts to execute. Request pages enable end users to specify options and filters for a report. Request pages are defined as part of designing a [report object](devenv-report-object.md). The syntax is shown further down in this topic. You design the filters on request pages by using the following report properties:

|Property|Description|
|--------|-----------|
|[RequestFilterHeading Property](properties/devenv-requestfilterheading-property.md)|Sets a caption for the request page tab that is related to this data item.|
|[RequestFilterHeadingML Property](properties/devenv-requestfilterheadingml-property.md)|Sets the text used as a RequestFilterHeading Property for a request page tab.|
|[RequestFilterFields Property](properties/devenv-requestfilterfields-property.md)|Sets which fields are automatically included on the tab of the request page that is related to this data item. The user can set filters on these fields.|

In addition to specifying options and filters, users can choose from the following actions on a request page:

- Print
- Preview
- Cancel
- Help

## Filtering on request pages

The fields that you define as `RequestFilterFields` are shown on the request page. In addition, an end user can add more fields on which to filter to the request page. Defining the `RequestFilterFields` property in `dataitem()` part of the report code is done as illustrated in the example below:

```
report 50103 "Customer List"
{
    CaptionML = ENU = 'Customer List';
    RDLCLayout = 'Customer List Report.rdlc'; // if Word use WordLayout property
    dataset
    {
        dataitem(Customer; Customer)
        {
            RequestFilterFields = "No.", "Search Name", "Customer Posting Group";
...
```
For more information about the report object, see [Report Object](devenv-report-object.md).

Set the [SaveValues](properties/devenv-savevalues-property.md) property to `true` in order to save the values that the end user enters on the request page.

> [!NOTE]  
> We recommend that you add fields that the end users of the report will frequently set filters on.

By default, for every data item in the report, a FastTab for defining filters and sorting is created on the request page. To remove a FastTab from a request page, do not define any `RequestFilterFields` for the data item and set the [DataItemTableView](properties/devenv-dataitemtableview-property.md) property to define sorting. The request page is displayed, but there is no tab for this data item.

If a `DataItemTableView` is not defined, then end users can select a sort field and sort order at runtime.

If you set the property `UseRequestPage` to `No`, then the report will start to print as soon as it is run. In this case, end users cannot cancel the report run. It is still possible to cancel the report, but some pages may print.

In a complex report that uses data from several tables, the functionality may depend on a specific key and sort order. Design your reports so that end users cannot change the sort order in a way that affects the functionality of the report.

## See Also
[Report Object](devenv-report-object.md)  
[Reports Overview](devenv-reports.md)  
[Report Design Overview](devenv-report-design-overview.md)  
[RequestFilterHeading Property](properties/devenv-requestfilterheading-property.md)  
[RequestFilterHeadingML Property](properties/devenv-requestfilterheadingml-property.md)  
[RequestFilterFields Property](properties/devenv-requestfilterfields-property.md)  
[DataItemTableView](properties/devenv-dataitemtableview-property.md)  
