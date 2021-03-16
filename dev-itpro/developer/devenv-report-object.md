---
title: "Report Object"
description: "Reports are used to print or display information from a database."
author: SusanneWindfeldPedersen
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: conceptual
ms.service: "dynamics365-business-central"
ms.author: solsen
---

# Report Object

Reports are used to print or display information from a database. You can use a report to structure and summarize information, and to print documents, such as sales quotes and invoices.

Creating a report consists of two primary tasks; the first task is to create the underlying data model and the next is to define the visual layout that displays the data. The report object defines the underlying data model and specifies which database tables and fields to pull data from. When the report is run, that data is displayed in a specified layout; the visual layout, which determines the content and format of a report when it is viewed and printed. 

For more information about defining database tables and fields, see [Defining a Report Dataset](devenv-report-dataset.md). For more information about the Report data type, see [Report Data Type](methods-auto/report/report-data-type.md).

You build the layout of a report by arranging data items and columns, and specifying the general format, such as text font and size. There are two types of report layouts; client report definition, also called RDL layouts and Word layouts. RDL layouts are defined in Visual Studio Report Designer or Microsoft SQL Server Reporting Services Report Builder. Word layouts are created using Word. Word layouts are based on a Word document that includes a custom XML part representing the report dataset. 

If you want to modify an existing report, for example, add new columns, add to the request page, or simply add a new layout, you can create a report extension instead. For more information, see [Report Extension Object](devenv-report-ext-object.md).

> [!NOTE]  
> Extension objects can have a name with a maximum length of 30 characters. 

## Snippet support

Typing the shortcut `treport` will create the basic layout for a report object when using the [!INCLUDE[d365al_ext_md](../includes/d365al_ext_md.md)] in Visual Studio Code.

[!INCLUDE[intelli_shortcut](includes/intelli_shortcut.md)]

## Report example
The following example is a report that prints the list of customers. The report object defines a dataset of columns from the Customer table. For more information on creating a Word Layout report, see [Creating a Report](devenv-howto-report-layout.md).

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
    ContextSensitiveHelpPage = 'my-feature';
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

## See Also

[Report Extension Object](devenv-report-ext-object.md)  
[Request Pages](devenv-request-pages.md)  
[Creating an RDL Layout Report](devenv-howto-rdl-report-layout.md)  
[Creating a Word Layout Report](devenv-howto-report-layout.md)  
[Adding Help Links from Pages, Reports, and XMLports](devenv-adding-help-links-from-pages-tables-xmlports.md)  
[Page Extension Object](devenv-page-ext-object.md)  
[Page Properties](properties/devenv-page-property-overview.md)  
[Developing Extensions](devenv-dev-overview.md)  
[AL Development Environment](devenv-reference-overview.md)  
