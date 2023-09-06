---
title: "Using request pages with XMLports"
description: "Introducing how to work with request pages for Business Central XMLports."
author: SusanneWindfeldPedersen
ms.custom: na
ms.date: 08/31/2023
ms.reviewer: na
ms.topic: conceptual
ms.author: solsen
---

# Using request pages with XMLports

A request page is a page that is run before the XMLport starts to execute. Request pages enable end users to specify options and filters for an XMLport. Request pages are defined as part of designing a [XMLport object](devenv-XMLport-object.md). The syntax is shown further down in this article. You design the filters on request pages by using the following XMLport properties:

|Property|Description|
|--------|-----------|
|[RequestFilterHeading Property](properties/devenv-requestfilterheading-property.md)|Sets a caption for the request page tab that is related to a report's data item or an XMLport's table element.|
|[RequestFilterHeadingML Property](properties/devenv-requestfilterheadingml-property.md)|Sets the text used as a RequestFilterHeading Property for a request page tab.|
|[RequestFilterFields Property](properties/devenv-requestfilterfields-property.md)|Specifies which columns are automatically included on the tab of the request page that is related to a report's data item or an XMLport's table element. The user can set filters on these columns. |
|[AboutTitle Property](properties/devenv-abouttitle-property.md)|Specifies the title for a teaching tip on the report. |
|[AboutTitleML Property](properties/devenv-abouttitleml-property.md)|Specifies the multi-language version of the title for a teaching tip on the report. |
|[AboutText Property](properties/devenv-abouttext-property.md)|Specifies the text for a teaching tip on the report. |
|[AboutTextML Property](properties/devenv-abouttextml-property.md)|Specifies the multi-language version of the text for a teaching tip on the report. |
|[ContextSensitiveHelpPage Property](properties/devenv-contextsensitivehelppage-property.md)| Specifies the help topic to show when the user presses Help in the UI. Note that the help server on which this help topic is located, must be defined in the app.json file. |

> [!NOTE]  
> Request pages for XMLports aren't supported by the [!INCLUDE[webclient](includes/webclient.md)] in versions prior to [!INCLUDE[prod_long](includes/prod_long.md)] 2019 release wave 2. If you try to run an XMLport with a request page from the web client in these versions, you receive an error that the XMLport page type is not supported. Alternatively, XMLport request pages do work in the [!INCLUDE[webclient](includes/nav_windows_md.md)].

By default, a request page is displayed, unless the [UseRequestPage](properties/devenv-userequestpage-property.md) is set to `false`; then the XMLport will start immediately. In this case, end users can't cancel the XMLport run. 

By default, without having set anything else, a request page will always display the following buttons:

- Send to
- Print
- Preview
- Cancel

Additionally, you can add more options on the request page to allow the end user to filter the data displayed. 

## <a name="FilteringRequest"></a> Filtering on request pages

The columns that you define as `RequestFilterFields` are shown on the request page and can be used for filtering the data before viewing or printing the report. 


> [!NOTE]  
> It's recommended to add columns that the end users of the report will frequently set filters on.


Defining the `RequestFilterFields` property in the `tableelement()` part of an XMLport is done like this:  

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

By default, for every table element in a XMLport, a FastTab for defining filters and sorting is created on the request page. To remove a FastTab from a request page, don't define any `RequestFilterFields` for the table element and set the [SourceTableView](properties/devenv-sourcetableview-XMLports-property.md) property in an XMLport to define sorting. The request page is displayed, but there's no tab for this data item or table element.

If a `DataItemTableView` or `SourceTableView` isn't defined, then end users can select a sort column and sort order at runtime.

In a complex XMLport that uses data from several tables, the functionality may depend on a specific key and sort order. Design your XMLports so that end-users can't change the sort order in a way that affects their functionality.

For data items and table elements whose source table contains calculated fields, such as amounts and quantities, the **Filter totals by:** section is automatically included on the request page, which allows you to adjust various dimensions that influence calculations.

> [!TIP]  
> For information about how to enter filter criteria on the request page, see [Filtering](/dynamics365/business-central/ui-enter-criteria-filters#-filtering) in the [!INCLUDE[prod_short](../includes/prod_short.md)] application help.

## Defining a `requestpage` section

The following example illustrates how you can define a request page for a XMLport.

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

## Adding teaching tips to your XMLports
The primary purpose of a teaching tip is to increase the user's chance of success with the XMLport. So, the title and description of the teaching tip should answer the following hypothetical user questions:

  - **AboutTitle**: *What is this XMLport about*?
  - **AboutText**: *What can I do with this XMLport?*

Both of these properties (or their equivalent multi-language versions) must be defined on the request page for the teaching tip to appear.

With teaching tips, you can help explain logic that is relevant to the XMLport therefore allowing users to get on with a data task right away without blocking them. After users dismiss a teaching tip, they can choose or hover over the XMLport title in the request page. This action will reopen the teaching tip.

[!INCLUDE[aboutTeachingTips](includes/include-about-teaching-tips.md)]

## Adding help links to your XMLports

A key pillar of helping users help themselves is to give them access to help for the particular part of [!INCLUDE [prod_short](../developer/includes/prod_short.md)] that they're working in. This also applies for XMLports. 

Starting with Business Central 2023 release wave 1 (version 22), you can set the *ContextSensitiveHelpPage* property on XMLport request pages, which will in turn show the report help link in the Help pane.

*Learn more* links are generated based on two configuration settings:

* App-level configuration of the URL
* Request page-level configuration of report-specific article

For more information about configuring context-sensitive help, see [Configure Context-Sensitive Help](../help/context-sensitive-help.md). 

## See Also

[XMLport Object](devenv-XMLport-object.md)  
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
