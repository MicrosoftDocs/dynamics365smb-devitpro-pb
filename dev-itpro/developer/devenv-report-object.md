---
title: "Report Object"
description: "The report object in AL for Business Central allows to create a new report."
author: SusanneWindfeldPedersen
ms.custom: na
ms.date: 09/04/2023
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: conceptual
ms.author: solsen
---

# Report Object

Reports are used to print or display information from a database. You can use a report to structure and summarize information, and to print documents, such as sales quotes and invoices.

The report object is typically used for one of the following three different scenarios: 
- analytical reports, where the output is meant for online consumption of data. 
- document reports, where the output is meant for print. 
- processing-only reports, where there's no output. In this case, the report object is typically used with a request page to let the user set filters/options for the operation.

Creating a report consists of two primary tasks; the first task is to create the underlying data model, and for analytical and document reports, the second task is to define the visual layout that displays the data. The report object defines the underlying data model and specifies, which database tables and fields to pull data from. When the report is run, that data is displayed in a specified layout; the visual layout, which determines the content and format of a report when it's viewed and printed. 

For more information about defining database tables and fields, see [Defining a Report Dataset](devenv-report-dataset.md). For more information about the Report data type, see [Report Data Type](methods-auto/report/report-data-type.md).

If you want to modify an existing report, for example, add new columns, add to the request page, or add a new layout, you can create a report extension instead. For more information, see [Report Extension Object](devenv-report-ext-object.md).

[!INCLUDE[intelli_shortcut](includes/query_as_a_report_datasource.md)]

## Report layouts
You build the layout of a report by arranging data items and columns, and specifying the general format, such as text font and size. There are three types of report layouts; client report definition, also called RDL layouts, Word layouts, and Excel layouts. RDL layouts are defined in Visual Studio Report Designer or Microsoft SQL Server Reporting Services Report Builder. Word layouts are created using Word and are based on a Word document that includes a custom XML part representing the report dataset. Excel layouts are created in Excel based on the report dataset, utilizing the Excel capabilities such as sliders, diagrams, charts, pivot tables, and PowerQuery. One report can contain multiple report layout definitions. For more information, see [Defining Multiple Report Layouts](devenv-multiple-report-layouts.md).

In the following, you can read about properties of the different layout types. 

| Layout type | Properties |
|---------------------------------|-------------|
| Excel | No-code layout experience for end-users. <br> Primary layout type for analytical reports. <br> Does not support printing from the request page. | 
| RDL | Pro-developer layout experience (not for end-users.) <br> Mostly needed for document reports. Use this layout type when you need pixel-perfect outputs for printing. <br> Supports printing from the request page. | 
| Word | Low-code layout experience. Some expert end-users can work with XML and tags. <br> Mostly needed for document reports. <br> Supports printing from the request page.  | 


## Snippet support

Typing the shortcut `treport` will create the basic layout for a report object when using the [!INCLUDE[d365al_ext_md](../includes/d365al_ext_md.md)] in Visual Studio Code.

[!INCLUDE[intelli_shortcut](includes/intelli_shortcut.md)]

## Report example

The following example is a report that prints the list of customers. The report object defines a dataset of columns from the Customer table. This example defines a report that uses an RDL report layout. For more information about creating an RDL report layout, see [Creating an RDL Layout Report](devenv-howto-rdl-report-layout.md). For more information on creating a report that uses Word Layout, see [Creating a Word Layout Report](devenv-howto-report-layout.md). For information about creating an Excel layout, see [Creating an Excel Layout Report](devenv-howto-excel-report-layout.md).

```AL
report 50103 "Customer List"
{
  CaptionML=ENU='Customer List';
  DefaultLayout = RDLC; // if Word use WordLayout property
  RDLCLayout = 'MyRDLReport.rdl';

  dataset
  {
    dataitem(Customer;Customer)
    {
      RequestFilterFields="No.","Search Name","Customer Posting Group";
      column(CompanyName;CompanyName)
      {
      }
      column(CurrReport_PageNo;Customer."no.")
      {
      }
      column(Customer_TableCaption_CustFilter;TableCaption + ': ' + CustFilter)
      {
      }
      column(CustFilter;CustFilter)
      {
      }
      column(Customer_No;"No.")
      {
      }
      column(Customer_Customer_Posting_Group;"Customer Posting Group")
      {
      }
      column(Customer_Customer_Disc_Group;"Customer Disc. Group")
      {
      }
      column(Customer_Invoice_Disc_Code;"Invoice Disc. Code")
      {
      }
      column(Customer_Customer_Price_Group;"Customer Price Group")
      {
      }
      column(Customer_Fin_Charge_Terms_Code;"Fin. Charge Terms Code")
      {
      }
      column(Customer_Payment_Terms_Code;"Payment Terms Code")
      {
      }
      column(Customer_Salesperson_Code;"Salesperson Code")
      {
      }
      column(Customer_Currency_Code;"Currency Code")
      {
      }
      column(Customer_Credit_Limit_LCY;"Credit Limit (LCY)")
      {
        DecimalPlaces=0:0;
      }
      column(Customer_Balance_LCY;"Balance (LCY)")
      {
      }
      column(CustAddr_1;CustAddr[1])
      {
      }
      column(CustAddr_2;CustAddr[2])
      {
      }
      column(CustAddr_3;CustAddr[3])
      {
      }
      column(CustAddr_4;CustAddr[4])
      {
      }
      column(CustAddr_5;CustAddr[5])
      {
      }
      column(Customer_Contact;Contact)
      {
      }
      column(Customer_Phone_No;"Phone No.")
      {
      }
      column(CustAddr_6;CustAddr[6])
      {
      }
      column(CustAddr_7;CustAddr[7])
      {
      }
      column(Customer_ListCaption;Customer_ListCaptionLbl)
      {
      }
      column(CurrReport_PageNoCaption;CurrReport_PageNoCaptionLbl)
      {
      }
      column(Customer_NoCaption;FieldCaption("No."))
      {
      }
      column(Customer_Customer_Posting_GroupCaption;Customer_Customer_Posting_GroupCaptionLbl)
      {
      }
      column(Customer_Customer_Disc_GroupCaption;Customer_Customer_Disc_GroupCaptionLbl)
      {
      }
      column(Customer_Invoice_Disc_CodeCaption;Customer_Invoice_Disc_CodeCaptionLbl)
      {
      }
      column(Customer_Customer_Price_GroupCaption;Customer_Customer_Price_GroupCaptionLbl)
      {
      }
      column(Customer_Fin_Charge_Terms_CodeCaption;FieldCaption("Fin. Charge Terms Code"))
      {
      }
      column(Customer_Payment_Terms_CodeCaption;Customer_Payment_Terms_CodeCaptionLbl)
      {
      }
      column(Customer_Salesperson_CodeCaption;FieldCaption("Salesperson Code"))
      {
      }
      column(Customer_Currency_CodeCaption;Customer_Currency_CodeCaptionLbl)
      {
      }
      column(Customer_Credit_Limit_LCYCaption;FieldCaption("Credit Limit (LCY)"))
      {
      }
      column(Customer_Balance_LCYCaption;FieldCaption("Balance (LCY)"))
      {
      }
      column(Customer_ContactCaption;FieldCaption(Contact))
      {
      }
      column(Customer_Phone_NoCaption;FieldCaption("Phone No."))
      {
      }
      column(Total_LCY_Caption;Total_LCY_CaptionLbl)
      {
      }

      trigger OnAfterGetRecord();
      begin
        CalcFields("Balance (LCY)");
        FormatAddr.FormatAddr(
          CustAddr,Name,"Name 2",'',Address,"Address 2",
          City,"Post Code",County,"Country/Region Code");
      end;
     
    }
  }

  requestpage
  {
    SaveValues=true;

    // These properties control the title and content of the teaching tip.
    AboutTitle = 'Awesome report';
    AboutText = 'This is an awesome report. Use it to be awesome';
    // Use the multi-language versions AboutTitleML and AboutTextML if you need that.

    // This property defines the help page for this report.
    // Remember to also set contextSensitiveHelpUrl in the app.json
    ContextSensitiveHelpPage = 'my-feature.html';

    layout
    {
    }

    actions
    {
    }
  }

  labels
  {
      LabelName = 'Label Text', Comment = 'Foo', MaxLength = 999, Locked = true;
  }

  trigger OnPreReport();
  var
    CaptionManagement : Codeunit 42;
  begin
    CustFilter := CaptionManagement.GetRecordFiltersWithCaptions(Customer);
  end;

  var
    FormatAddr : Codeunit 365;
    CustFilter : Text;
    CustAddr : ARRAY [8] OF Text[50];
    Customer_ListCaptionLbl : Label 'Customer - List';
    CurrReport_PageNoCaptionLbl : Label 'Page';
    Customer_Customer_Posting_GroupCaptionLbl : Label 'Customer Posting Group';
    Customer_Customer_Disc_GroupCaptionLbl : Label 'Cust./Item Disc. Gr.';
    Customer_Invoice_Disc_CodeCaptionLbl : Label 'Invoice Disc. Code';
    Customer_Customer_Price_GroupCaptionLbl : Label 'Price Group Code';
    Customer_Payment_Terms_CodeCaptionLbl : Label 'Payment Terms Code';
    Customer_Currency_CodeCaptionLbl : Label 'Currency Code';
    Total_LCY_CaptionLbl : Label 'Total (LCY)';
}

```

[!INCLUDE [send-report-excel](includes/send-report-excel.md)]

## Schedule reports

It's possible to schedule a report to run at your desired date and time by using **AllowScheduling** property. By setting the property to *true*, you'll get the **Schedule** action button to set the date and time for your report. To learn more about scheduling a report, see [AllowScheduling Property](../developer/properties/devenv-allowscheduling-property.md) and [Schedule a report](/dynamics365/business-central/ui-work-report#ScheduleReport.md).

## See also
[Report Properties](../developer/properties/devenv-report-properties.md)  
[Report Extension Object](devenv-report-ext-object.md)  
[Schedule a report](/dynamics365/business-central/ui-work-report#ScheduleReport.md)  
[Defining a Report Dataset](devenv-report-dataset.md)  
[Request Pages](devenv-request-pages.md)  
[Adding Help Links from Reports](devenv-adding-help-links-from-pages-tables-xmlports.md)  
[Creating an Excel Layout Report](devenv-howto-excel-report-layout.md)  
[Creating an RDL Layout Report](devenv-howto-rdl-report-layout.md)  
[Creating a Word Layout Report](devenv-howto-report-layout.md)  
[Developing Extensions](devenv-dev-overview.md)  
[AL Development Environment](devenv-reference-overview.md)  
