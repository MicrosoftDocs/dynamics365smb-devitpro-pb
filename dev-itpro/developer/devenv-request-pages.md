---
title: "Request Pages"
description: "Introducing how to work with request pages in Business Central."
author: SusanneWindfeldPedersen
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: na
ms.topic: conceptual
ms.service: "dynamics365-business-central"
ms.author: solsen
---

# Request Pages

A request page is a page that is run before the report or XMLport starts to execute. Request pages enable end users to specify options and filters for a report and an XMLport. Request pages are defined as part of designing a [Report object](devenv-report-object.md), a [Report Extension Object](devenv-report-ext-object.md), or an [XMLport object](devenv-XMLport-object.md). The syntax is shown further down in this topic. You design the filters on request pages by using the following report and XMLport properties:

|Property|Description|
|--------|-----------|
|[RequestFilterHeading Property](properties/devenv-requestfilterheading-property.md)|Sets a caption for the request page tab that is related to a report's data item or an XMLport's table element.|
|[RequestFilterHeadingML Property](properties/devenv-requestfilterheadingml-property.md)|Sets the text used as a RequestFilterHeading Property for a request page tab.|
|[RequestFilterFields Property](properties/devenv-requestfilterfields-property.md)|Specifies which columns are automatically included on the tab of the request page that is related to a report's data item or an XMLport's table element. The user can set filters on these columns. |

> [!NOTE]  
> Request pages for XMLports are not supported by the [!INCLUDE[webclient](includes/webclient.md)] in versions prior to [!INCLUDE[prod_long](includes/prod_long.md)] 2019 release wave 2. If you try to run an XMLport with a Request page from the web client in these versions, you receive an error that the XMLport page type is not supported. Alternatively, XMLport request pages do work in the [!INCLUDE[webclient](includes/nav_windows_md.md)].

By default, a request page is displayed, unless the [UseRequestPage](properties/devenv-userequestpage-property.md) is set to `false`; then the report or XMLport will start to print as soon as it is run. In this case, end users can't cancel the report or XMLport run. It is still possible to cancel the report or XMLport, but some pages may print.

By default, without having set anything else, a request page will always display the following buttons:

- Send to
- Print
- Preview
- Cancel

Additionally, you can add more options on the request page to allow the end user to filter the data displayed. 

## <a name="FilteringRequest"></a> Filtering on request pages

The columns that you define as `RequestFilterFields` are shown on the request page and can be used for filtering the data before viewing or printing the report. 

> [!NOTE]  
> Only on the Windows client, filtering is possible even if `RequestFilterFields` is not set.

Defining the `RequestFilterFields` property in the `dataitem()` part of the report code is done as illustrated in the following code example:  

```AL
report 50103 "Customer List"
{
    CaptionML = ENU = 'Customer List';
    RDLCLayout = 'Customer List Report.rdl'; // if Word use WordLayout property
    dataset
    {
        dataitem(Customer; Customer)
        {
            RequestFilterFields = "No.", "Search Name", "Customer Posting Group";
...
```

> [!NOTE]  
> It is recommended to add columns that the end-users of the report will frequently set filters on.

For more information about the report object, see [Report Object](devenv-report-object.md).

Defining the `RequestFilterFields` property in the `tableelement()` part of an XMLport is done in a similar way:  

```AL
XMLport 50104 "Export Customer List"
{
    CaptionML = ENU = 'Export customer List';
    Direction = Export;
    schema
    {
        textelement(root)
        {
            XmlName = 'Root';
            tableelement(Customer; Customer)
            {
                RequestFilterFields = "No.", "Search Name", "Customer Posting Group";
...
```

For more information about the XMLport object, see [XMLport Object](devenv-XMLport-object.md).

By default, for every data item in the report and table element in a XMLport, a FastTab for defining filters and sorting is created on the request page. To remove a FastTab from a request page, do not define any `RequestFilterFields` for the data item or table element and set the [DataItemTableView](properties/devenv-dataitemtableview-property.md) property in a report or the [SourceTableView](properties/devenv-sourcetableview-XMLports-property.md) property in an XMLport to define sorting. The request page is displayed, but there is no tab for this data item or table element.

If a `DataItemTableView` or `SourceTableView` is not defined, then end-users can select a sort column and sort order at runtime.

In a complex report or XMLport that uses data from several tables, the functionality may depend on a specific key and sort order. Design your reports and XMLports so that end-users can't change the sort order in a way that affects their functionality.

For data items and table elements whose source table contains calculated fields, such as amounts and quantities, the **Filter totals by:** section is automatically included on the request page, which allows you to adjust various dimensions that influence calculations.

> [!TIP]
> For information about how to enter filter criteria on the request page, see [Filtering](/dynamics365/business-central/ui-enter-criteria-filters#-filtering) in the [!INCLUDE[prod_short](../includes/prod_short.md)] application help.


## Defining a `requestpage` section

On reports, in addition to defining the filter options by setting the `RequestFilterFields` property, you can add a `requestpage` section. In this section, you can set the [SaveValues](properties/devenv-savevalues-property.md) property to `true` in order to save the values that the end user enters on the request page. When the report is run again, the end user will have the option to use previously defined filters. You can also add a `layout` to the request page, specifying an **Options** section to perform checks.

> [!NOTE]
> With request pages that have `SaveValues = true`, users can preview the report multiple times in the client and the request page remains open. If `SaveValues = false` or omitted, a **Preview & Close** action appears on the request page. In this case, the request page closes once the report has been previewed. 

```AL
...
requestpage
    {
        SaveValues = true;

        layout
        {
            area(content)
            {
                group(Options)
                {
                    Caption = 'Options';
                    field(PostingDate; PostingDateReq)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Posting Date';
                        ToolTip = 'Specifies the posting date for the invoice(s) that the batch job creates. This field must be filled in.';
                    }
                }
            }
        }

        trigger OnOpenPage()
        begin
            if PostingDateReq = 0D then
                PostingDateReq := WorkDate;
        end;

        var
            PostingDateReq: Date;
    }
...
```

## See Also

[Report Object](devenv-report-object.md)  
[Report Extension Object](devenv-report-ext-object.md)  
[XMLport Object](devenv-XMLport-object.md)  
[Reports Overview](devenv-reports.md)  
[Report Design Overview](devenv-report-design-overview.md)  
[RunRequestPage Method](methods-auto/report/reportinstance-runrequestpage-method.md)  
[RequestFilterHeading Property](properties/devenv-requestfilterheading-property.md)  
[RequestFilterHeadingML Property](properties/devenv-requestfilterheadingml-property.md)  
[RequestFilterFields Property](properties/devenv-requestfilterfields-property.md)  
[DataItemTableView](properties/devenv-dataitemtableview-property.md)  
