---
title: "Programming Best Practices"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 34e38249-0722-41f2-b325-bd59262aea00
caps.latest.revision: 18
manager: edupont
---
# Programming Best Practices
This topic describes best practices for developing [!INCLUDE[navnow](includes/navnow_md.md)] applications.  

## Ensuring Simplicity  
 When you write a solution in [!INCLUDE[navnow](includes/navnow_md.md)], keep it simple. This applies to everything that becomes visible either to other programmers or to any users. The following are a few examples.  

-   If the default value for a property is appropriate for a specific purpose, then do not make the default value explicit.  

-   If a variable can be reset with a statement such as `a := 0;` then do not use a special C/AL function, such as the [CLEAR Function](CLEAR-Function.md), to reset the variable.  

-   If the contents of a record can be copied with a statement such as `MyRec := MyRec2;` then do not use a special C/AL function, such as the [TRANSFERFIELDS Function \(Record\)](TRANSFERFIELDS-Function--Record-.md), to copy the contents.  

-   The Rec global variable references the source table of a page. When you refer to fields or functions of that table, you do not need to qualify them with Rec.\< *field*> or Rec.\< *function*>. You use \<*field*> or \<*function*>  

## Activating Objects  
 If you want to use the value of a field to find a record in a table or if you want to activate an object identified by the field, then ensure that the field contains a value. To do this, use the [TESTFIELD Function \(Record\)](TESTFIELD-Function--Record-.md), as shown in the following example. This produces more informative error messages if the value is zero or blank.  

```  
GLEntry.TESTFIELD("Department Code");  
Dept.GET(GLEntry."Department Code");  
GenJnlTemplate.TESTFIELD("Report ID");  
REPORT.RUN(GenJnlTemplate."Report ID")  
```  

## Setting Properties  
 To set properties from C/AL, use code that is similar to the following code.  

```  
"Customer No.".Visible := TRUE;  
Cust.MARK := TRUE;  

```  

 Do not use the following code.  

```  
Customer." No.".Visible(TRUE);   
Cust.MARK(TRUE);  

```  

## Writing Lookups  
 When writing lookups in C/AL, do not filter records that the user may want to select. Instead, program the record cursor to be positioned on the most relevant record for the search even though it may not be first on the list. When programming the OnLookup trigger for a field, the code in the field’s OnValidate trigger is not called unless you explicitly call Field.VALIDATE. If errors can occur in the validation, then you must operate on a copy of the Rec variable as shown in the following example instead of directly on the Rec variable.  

```  
WITH Cust DO BEGIN  
  Cust := Rec;  
  Dept.Code := "Department Code";  
  IF PAGE.RUNMODAL(O,Dept) = Action::LookupOK THEN BEGIN  
    "Department Code" := Dept.Code;  
    VALIDATE("Department Code");  
    Rec := Cust;  
  END;  
END;  
```  

 To make Lookup work on a field that has a table relation to a system table, you must always explicitly set the [LookupPageID Property](LookupPageID-Property.md) on controls that show the field.  

 Set the [LookupPageID Property](LookupPageID-Property.md) and [DrillDownPageID Property](DrillDownPageID-Property.md) on most tables. You cannot anticipate when a user must activate a Lookup or DrillDown button. For example, if a user creates a report with a filter tab on the table, then the Lookup button on the filter tab will not appear unless the LookupPageID property is set on the table.  

## Designing Journal Pages  
 The default order of fields in journals is:  

-   **Date**  

-   **Document Type**  

-   **Document No.**  

-   **No.**  

-   **Description**  

-   **Amount**  

 The order of fields in ledger entries should be the same. The order of fields in pages and reports should also be the same.  

## Laying Out Fields on Pages  
 This section contains guidelines for which fields to include on the following pages:  

-   Card pages  

-   Worksheet pages.  

 For each type of page, consistency is important. Similar pages in the application areas must be composed the same way.  

### Card Pages  
 Some card pages are related to a table that contains only a few fields. It is not hard to create such pages because it is often obvious where to place the fields on FastTabs on a page and which fields to promote to the FastTab header. Most card pages are related to tables with many fields.  

 Many pages use several FastTabs. How many FastTabs are needed and what to call them are specific to each page. The following FastTab names are commonly used:  

-   **General**, which is the first tab  

-   **Invoicing**  

-   **Posting**  

 All relevant fields must be included on a card page. Even card pages with many tabs have a limited space for fields, so you must carefully consider relevancy. Which fields to include depends on the purpose of each page. We recommend using the following guidelines:  

-   Always include dimensions, such as department, project, or location.  

-   Do not include fields that are automatically filled in and do not need to be changed by the user.  

-   Do not place the same field on a page twice, even on different tabs.  

-   If two or more fields are related according to source or function, then group them.  

 On which FastTab to place a field depends on the specific page. Some fields are used on many pages. For consistency, place the following fields on the **General** FastTab:  

-   **No.**  

-   **Name**  

-   **Search Name**  

-   **Blocked**  

-   **Last Date Modified**  

-   Other information about the account  

 Place the following fields on the Posting or Invoicing FastTab:  

-   **General Business Posting Group**  

-   **General Product Posting Group**  

-   Posting group from the actual application area  

-   **Department Code**  

-   **Project Code**  

### Worksheet Pages  
 In general, all fields are included on worksheet pages. Some exceptions are mentioned in the following section. The fields are shown or hidden depending on how relevant they are and what the layout of the page is. You must consider the following points when you create worksheet pages:  

-   Always include dimensions, such as department or project. The fields should be hidden.  

-   Do not include FlowFields on worksheet pages unless the page is seldom used or the field is essential. FlowFields are calculated even when they are hidden.  

-   Do not include more than about 25 fields on a page because this can affect performance. Consider carefully which fields, both hidden and visible, that you will include on a page. Because of performance considerations, worksheet pages should not include fields that may be informative but cannot be changed, such as **Posting Group**, **Journal Name**, **Weights**, and **Source Type**.  

-   Never include fields that are used internally in the program, such as **Closed by Entry No**.  

-   Use worksheet pages for all page in the **Setup** menu. Creating these page does not typically cause problems because they often contain only a code and a few information fields.  

 Pages such as journals, sales/purchase lines, and ledgers are difficult to create and maintain properly because the related tables contain a lot of functionality and many fields. In an uncustomized application, the same template is used to compose these pages so that they look similar. The following table shows the template. It is divided into sections according to functionality. In each section, the most common field names are mentioned.  

> [!NOTE]  
>  The table does not include all functionality. Additionally, the order that is indicated in the table does not always indicate the order in pages.  

|Section|Example fields|  
|-------------|--------------------|  
|**Dates**|-   **Posting Date**<br />-   **Document Date**|  
|**Document**|-   **Entry Type**<br />-   **Document Type**<br />-   **Document No.**|  
|**No. \(of Account\)**|**No.**|  
|**Posting Description**|**Description**|  
|**Dimensions**|-   **Department Code**<br />-   **Project Code**<br />-   **Business Unit Code**<br />-   **Location Code**<br />-   **Salesperson/Purchaser Code**<br />-   **Work Type Code**<br />-   **Phase Code**<br />-   **Task Code**<br />-   **Step Code**|  
|**Currency**|-   **Currency Code**<br />-   **Exchange Rate**|  
|**General Posting Setup**|-   **General Posting Type**<br />-   **General Business Posting Group**<br />-   **General Product Posting Group**|  
|**Quantity**|-   **Quantity**<br />-   **Invoiced Quantity**<br />-   **Remaining Quantity**<br />-   **Unit of Measure Code**|  
|**Prices/Cost**|-   **Direct Unit Cost**<br />-   **Indirect Cost %**<br />-   **Unit Cost**<br />-   **Total Cost**<br />-   **Profit %**<br />-   **Unit Price**<br />-   **Total Price**<br />-   **Price Group Code**<br />-   **Chargeable** **Note:**      The exact name and order depend on the application area.|  
|**Amounts**|-   **Amount**<br />-   **Amount Including VAT**<br />-   **VAT Amount**<br />-   **Remaining Amount** **Note:**      Amounts in LCY must follow each amount type.|  
|**Balancing Account**|**Balancing Account Type**<br /><br /> **Balancing Account No.**<br /><br /> **Balancing General Posting Type**<br /><br /> **Balancing General Business Posting Group**<br /><br /> **Balancing General Product Posting Group**|  
|**Sales/Purchase and Discount**|-   **Sales/Purchase \(LCY\)**<br />-   **Profit \(LCY\)**<br />-   **Line Discount %**<br />-   **Line Discount Amount**<br />-   **Allow Invoice Discount**<br />-   **Invoice Discount Amount**|  
|**Payment Terms**|-   **Payment Terms Code**<br />-   **Due Date**<br />-   **Payment Discount Date**<br />-   **Payment Discount %**|  
|**Application**|-   **Serial No.**<br />-   **Applies-To Document Type**<br />-   **Applies-To Document No.**<br />-   **Applies-To ID**<br />-   **Applies-To Item Entry**<br />-   **Applies-To Entry**<br />-   **Apply and Close \(Job\)**<br />-   **Open**|  
|**Miscellaneous Information**|-   **Cost Is Adjusted**<br />-   **Cost Posted to G/L**<br />-   **On Hold**<br />-   **Bank Payment Type**|  
|**Intrastat**|-   **Transaction Type**<br />-   **Transport Method**<br />-   **Country/Region Code**|  
|**Posting Information**|-   **Quantity to Ship**<br />-   **Quantity Shipped**<br />-   **Quantity to Invoice**<br />-   **Quantity Invoiced**|  
|**Audit Information**|-   **User ID**<br />-   **Source Code**<br />-   **Reason Code**<br />-   **Entry No.**|  

## See Also  
 [Programming in C/AL](Programming-in-C-AL.md)
