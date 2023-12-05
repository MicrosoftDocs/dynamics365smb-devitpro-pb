---
title: "Using request pages with reports"
description: "Introducing how to work with request pages with Business Central reports."
author: SusanneWindfeldPedersen
ms.custom: na
ms.date: 12/05/2023
ms.reviewer: na
ms.topic: conceptual
ms.author: solsen
---

# Using request pages with reports

A request page is a page that is run before the report starts to execute. Request pages enable end users to specify options and filters for the report. Request pages are defined as part of designing a [Report object](devenv-report-object.md) or a [Report Extension Object](devenv-report-ext-object.md). The syntax is shown further down in this article. You design the filters on request pages by using the following report properties:

|Property|Description|
|--------|-----------|
|[RequestFilterHeading Property](properties/devenv-requestfilterheading-property.md)|Sets a caption for the request page tab that is related to a report's data item or an XMLport's table element.|
|[RequestFilterHeadingML Property](properties/devenv-requestfilterheadingml-property.md)|Sets the text used as a RequestFilterHeading Property for a request page tab.|
|[RequestFilterFields Property](properties/devenv-requestfilterfields-property.md)|Specifies which columns are automatically included on the tab of the request page that is related to a report's data item or an XMLport's table element. The user can set filters on these columns. |
|[AboutTitle Property](properties/devenv-abouttitle-property.md)|Specifies the title for a teaching tip on the report. |
|[AboutTitleML Property](properties/devenv-abouttitleml-property.md)|Specifies the multi-language version of the title for a teaching tip on the report. |
|[AboutText Property](properties/devenv-abouttext-property.md)|Specifies the text for a teaching tip on the report. |
|[AboutTextML Property](properties/devenv-abouttextml-property.md)|Specifies the multi-language version of the text for a teaching tip on the report. |
|[ContextSensitiveHelpPage Property](properties/devenv-contextsensitivehelppage-property.md)| Specifies the help article to show when the user presses Help in the UI. The help server on which this help article is located, must be defined in the app.json file. |

By default, a request page is displayed, unless the [UseRequestPage](properties/devenv-userequestpage-property.md) is set to `false`; then the report immediately runs. In this case, end users can't cancel the report. It's still possible to cancel the report, but some pages might print.

By default, without having set anything else, a request page will always display the following buttons:

- Send to
- Print
- Preview
- Cancel

Additionally, you can add more options on the request page to allow the end user to filter the data displayed. 

## <a name="FilteringRequest"></a> Filtering on request pages

The columns that you define as `RequestFilterFields` are shown on the request page and can be used for filtering the data before viewing or printing the report. 

Defining the `RequestFilterFields` property in the `dataitem()` part of the report code is done as illustrated in the following code example:  

```AL
report 50103 "Customer List"
{
    // report properties
    ...

    dataset
    {
        dataitem(Customer; Customer)
        {
            RequestFilterFields = "No.", "Search Name", "Customer Posting Group";
...
```

> [!NOTE]  
> It's recommended to add columns that the end users of the report will frequently set filters on.

For more information about the report object, see [Report Object](devenv-report-object.md).

By default, for every data item in the report, a FastTab for defining filters and sorting is created on the request page. To remove a FastTab from a request page, don't define any `RequestFilterFields` for the data item and set the [DataItemTableView](properties/devenv-dataitemtableview-property.md) property to define sorting. The request page is displayed, but there's no tab for this data item or table element.

If a `DataItemTableView` or `SourceTableView` isn't defined, then end users can select a sort column and sort order at runtime.

In a complex report that uses data from several tables, the functionality might depend on a specific key and sort order. Design your reports so that end-users can't change the sort order in a way that affects their functionality.

For data items and table elements whose source table contains calculated fields, such as amounts and quantities, the **Filter totals by:** section is automatically included on the request page, which allows you to adjust various dimensions that influence calculations.

> [!TIP]  
> For information about how to enter filter criteria on the request page, see [Filtering](/dynamics365/business-central/ui-enter-criteria-filters#-filtering) in the [!INCLUDE[prod_short](../includes/prod_short.md)] application help.

## Defining a `requestpage` section

On reports, in addition to defining the filter options by setting the `RequestFilterFields` property, you can add a `requestpage` section. In this section, you can set the [SaveValues](properties/devenv-savevalues-property.md) property to `true` in order to save the values that the end user enters on the request page. When the report is run again, the end user has the option to use previously defined filters. 

You can also add a `layout` to the request page, specifying an **Options** section to perform checks.

> [!NOTE]  
> You can use the `SaveValues` property together with the [AllowScheduling](properties/devenv-allowscheduling-property.md) property to set up the request page to support multiple previews. When both properties are `true`, users can preview the report from the request page as many times as the like, without having the request page close. This capability lets users change filters, see what the generated report will look like, and then try again. If either property is set to **false**, the report won't support multiple previews and the request page closes once the user previews the report. In this case, the request page includes a **Preview and Close** button instead of **Preview**.

```AL
...
requestpage
    {
        SaveValues = true;

        // These properties control the title and content of the teaching tip.
        AboutTitle = 'Awesome report';
        AboutText = 'This is an awesome report. Use it to be awesome';
        // Use the multi-language versions AboutTitleML and AboutTextML if you need that.

        // This property defines the help page for this report.
        // Remember to also set contextSensitiveHelpUrl in the app.json
        ContextSensitiveHelpPage = 'business-central/sales-reports';

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
    }
...
```

## Adding teaching tips to your reports
The primary purpose of a teaching tip is to increase the user's chance of success with the report. So, the title and description of the teaching tip should answer the following hypothetical user questions:

  - **AboutTitle**: *What is this report about*?
  - **AboutText**: *What can I do with this report?*

Both of these properties (or their equivalent multi-language versions) must be defined on the request page for the teaching tip to appear.

With teaching tips, you can help explain logic that is relevant to the report therefore allowing users to get on with a reporting task right away without blocking them. After users dismiss a teaching tip, they can choose or hover over the report title in the request page. This action reopens the teaching tip.

[!INCLUDE[aboutTeachingTips](includes/include-about-teaching-tips.md)]

## Adding help links to your reports

A key pillar of helping users help themselves is to give them access to help for the particular part of [!INCLUDE [prod_short](../developer/includes/prod_short.md)] that they're working in. This also applies for reports. 

Starting with Business Central 2023 release wave 1 (version 22), you can set the *ContextSensitiveHelpPage* property on report request pages, which will in turn show the report help link in the Help pane.

*Learn more* links are generated based on two configuration settings:

* App-level configuration of the URL
* Request page-level configuration of report-specific article

For more information about configuring context-sensitive help, see [Configure Context-Sensitive Help](../help/context-sensitive-help.md). 

## Saving settings on the request page
When running reports, users can use one or more *saved settings* that they can apply to the report from the request page. For more information on this article, see [Manage Saved Settings for Reports and Batch jobs](/dynamics365/business-central/reports-saving-reusing-settings.md)


## Request page and preview triggers and operations

The following diagram illustrates the main trigger and operation sequence related to request page invocation and button actions. 

[![Report trigger main flow.](media/report-trigger-main-flow.png)](media/report-trigger-main-flow.png#lightbox)

For a more detailed discussion on these concepts, see [Report triggers and operations](devenv-report-triggers.md#requestpage)

## See Also

[Report Object](devenv-report-object.md)  
[Report Extension Object](devenv-report-ext-object.md)  
[Reports Overview](devenv-reports.md)  
[Report Design Overview](devenv-report-design-overview.md)  
[RunRequestPage Method](methods-auto/report/reportinstance-runrequestpage-method.md)  
[Configure Context-Sensitive Help for reports](../help/context-sensitive-help.md)  
[AboutTitle Property](properties/devenv-abouttitle-property.md)   
[AboutTitleML Property](properties/devenv-abouttitleml-property.md)   
[AboutText Property](properties/devenv-abouttext-property.md)   
[AboutTextML Property](properties/devenv-abouttextml-property.md)   
[ContextSensitiveHelpPage Property](properties/devenv-contextsensitivehelppage-property.md)   
[RequestFilterHeading Property](properties/devenv-requestfilterheading-property.md)  
[RequestFilterHeadingML Property](properties/devenv-requestfilterheadingml-property.md)  
[RequestFilterFields Property](properties/devenv-requestfilterfields-property.md)  
[DataItemTableView](properties/devenv-dataitemtableview-property.md)  
[Request page triggers and operations](devenv-report-triggers.md)   