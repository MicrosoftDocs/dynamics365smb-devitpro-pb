---
title: Naming Conventions in Dynamics NAV
description: This topic contains guidelines for naming objects, table fields, and variables, and know demo database rules for naming and abbreviating objects.
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 59b6506d-8123-41b4-8fd4-288e70eea201
caps.latest.revision: 19
---
# Naming Objects, Fields and Variables
Precise and consistent terminology helps the end user work with the application. Rules for naming and abbreviating objects also help developers to understand the [!INCLUDE[demolong](includes/demolong_md.md)] and develop new features faster. This topic contains guidelines for naming objects, table fields, and variables. These guidelines describe naming conventions in English \(United States\).  

 The following general guidelines apply throughout your application:  

-   Use existing terminology, if possible.  

-   Name everything in a set of objects in the same language.  

-   When you review the terminology in a set of objects, use the **Translate Export** and **Translate Import** items on the **Tools** menu in the [!INCLUDE[nav_dev_short](includes/nav_dev_short_md.md)]. Export the text strings to a text file to review them, and then import the text file back into the application.  

-   Most names in a [!INCLUDE[navnow](includes/navnow_md.md)] application have a limit of 128 characters. This limit applies to the names of objects, functions, variables, properties, COM methods, and text constants. Table field names have a limit of 30 characters.  

## Visible Named Items  
 This section describes naming all visible items in an application, such as table fields. This includes all items that are presented to an end user.  

-   When you develop your application, set the application language to English \(United States\) so that the [Name Property](Name-Property.md) is the same as the caption in English \(United States\). This will make it easier to upgrade and reuse modifications. The end user sees the value of the [Caption Property](Caption-Property.md) but not the **Name** property.  

-   You must follow the naming convention both for the name in English \(United States\) and for the caption in your local language.  

-   Two objects of the same type must not have the same name.  

-   Each object must be named in a way that leaves no doubt as to what it applies to. For example, an object can be specifically related to customers, items, or resources. Do not give a table the name “Status,” because the word Status is too general and could refer to something in most tables.  

### Table Objects  
 Always make the names of table objects singular. The table name corresponds to what one record in the table is called.  

### Page Objects  
 The name of a page depends on the page type. Use the singular form of the table name for a card page. Use the plural form of the table name for a tabular page. This informs end users about the type of page. If you can access a table with both a card page and a tabular page, then the page names should explicitly describe the types. For example, the **Item Card** and **Item List** pages both access the **Item** table and describe the page types. This tells the user that there is more than one way to access the table. Other page types, such as statistics pages, are given names that are as descriptive as possible.  

### Report Objects  
 Make the English caption and name of a report descriptive and do not include abbreviations. End users see the caption of a report object in the following instances:  

-   On the request page.  

-   When they modify a report.  

-   When they want to identify an item, such as a sales invoice.  

 We recommend that you make the caption the same as the heading in the report.  

### Table Fields  
 Make the name and caption of a field descriptive. The end user should not have to see the caption in the context of other fields to understand what it is.  

 Describe the field contents and the field type in the caption. We recommend the following guidelines.  

|Guideline|Examples|  
|---------------|--------------|  
|Include **Date** when you include a date field. **Note:**  Do not include **Date** for a date interval field.|-   **Posting Date** field<br />-   **Allow Posting From** field|  
|Include a percent sign when the field contains a percentage.|**Profit %** field|  
|Include **Quantity** or **Qty.** when you name a quantity field. Replace **Quantity** with **No.** when you refer to the number of entries.|-   **Quantity Shipped** field<br />-   **No. Printed** field<br />-   **No. of New Records** field|  
|Include **Amount** or **Amt.** when you name an amount field.|**Debit Amount** field|  
|Distinguish between amount and cost or price. Cost and price are typically used when naming an amount per unit, while amount is cost or price multiplied by quantity.|-   **Unit Cost** field<br />-   **Unit List Price** field<br />-   **Line Amount** field|  
|Omit **Amount** when you include the following words in the caption:<br /><br /> -   **Adj. \(LCY\)**<br />-   **Balance**<br />-   **Base**<br />-   **Charge**<br />-   **COGS**<br />-   **Discounts**<br />-   **Fee**<br />-   **Net Charge**<br />-   **Payments**<br />-   **Profit**<br />-   **Purchases**<br />-   **Sales**<br />-   **Usage**|-   **Balance at Date** field<br />-   **Additional Fee \(LCY\)** field<br />-   **Additional-Currency Net Change** field|  
|Use **Amounts** instead of **Amount** in FlowFields.|**Invoice Amounts** field|  
|Name fields in local currency with the ISO currency code for the country/region in parentheses at the end. If a country/region currency has a symbol, use the symbol instead. **Note:**  In the [!INCLUDE[demolong](includes/demolong_md.md)], the abbreviation LCY, which means *local currency*, is used.|-   **Sales \(DKK\)** field<br />-   **Sales \(LCY\)** field in the **Cust. Ledger Entry** table<br />-   **Sales \($\)** field|  
|If a field contains parentheses, then put a space before the opening parenthesis.|**Usage \(Price\)** field|  
|Formulate names for Boolean fields as positive questions or statements.|**Cost is Adjusted** field|  
|If the primary key of a table is a code, then use **Code** as the name of the field that contains the code.<br /><br /> When the end user typically uses numeric values as keys, the field is called **No.** even though the field type is code. The following tables are exceptions where the primary key field is **No.**:<br /><br /> -   **G/L Account**<br />-   **Customer**<br />-   **Vendor**<br />-   **Item**<br />-   **Item Group**<br />-   **Resource**<br />-   **Resource Group**<br />-   **Job**<br />-   **Purchase Header**<br />-   **Sales Header**|**Code** field in the **Location** table|  
|Base the field name on the related table and its primary key when you work with table relations.<br /><br /> The following instances are exceptions:<br /><br /> -   If a field refers to a general ledger account, end the name with **Account** or **Acc.** but not with **G/L Account No.** unless the field refers to the actual general ledger account.<br />     For example, in table 5813, **Inventory Posting Setup**, field 6 has the TableRelation property set to the **G/L Account** table. The primary key of the **G/L Account** table is **No.** However, field 6 in table 5813 is named **Inventory Account**. In table 17, **G/L Entry**, field 3 has the TableRelation property set to the **G/L Account** table. In this case, field 3 is referring to the actual general ledger account, so the name of field 3 in table 17 is **G/L Account No.**<br />-   If a field has a table relation to a posting group table, then call the field **Posting Group**.|In table 38, **Purchase Header**, field 4 has the TableRelation property set to the **Vendor** table. The primary key of the **Vendor** table is **No.**, and the name of field 4 in table 38 is **Pay-to Vendor No.**|  
|Use **From** or **To** when you refer to a line number in a ledger entry table.|**From Entry No.** field|  
|Use **Starting Date** to specify the date from which something is valid. Use **Ending Date** to specify the date until something is valid.|**Starting Date** field in the **Accounting Period** table|  
|Use **First** to mean earliest. Use **Last** to mean latest.|**Last Sales Inv. No.** field|  
|Use **Before** with an amount before a calculation. Use **After** with an amount after a calculation.|**Amount Added Before** field|  

### Page Buttons and Menu Items  
 Captions for command buttons, menu buttons, and menu items depend on whether the control is used as a routing choice to open another page or as a control to activate something.  

 When a control is used to open another page, its name signifies the page that the control opens. The first menu button on a card, tabular, or list page typically has the name of the corresponding table. We recommend that you name menu items on the menu button with the second part of the full name of the page that will be opened when a user selects the item.  

 For example, the caption for a menu button on a **Customer** card page is "Customer.” The caption for one of the menu items is on the **Customer** menu button is “Statistics.” The **Statistics** menu item opens the **Customer Statistics**  page. When option buttons are used on the main menu page with the Border property set to **Yes**, the caption for these controls is the name of the application module.  

 When a control is used to activate something, the caption for it must be an imperative verb. An example is a control with the caption **Check**. If a page has many action controls, then they can be gathered as menu items on one menu button, such as **Function** or **Posting**.  

## Other Named Items  
 This section describes naming of internal items that are not visible to an end user. Because they are never shown to users, they do not have captions.  

### Codeunit Objects  
 The name of a codeunit starts with the object that the codeunit processes. The object is usually a record abbreviated as a variable. You can follow the object name with a dash and a description. Write the description of the codeunit in imperative voice without abbreviations. An example is the **Purch-Explode BOM** codeunit.  

### Variables  
 We recommend the following guidelines for naming variables.  

|Guideline|Examples|  
|---------------|--------------|  
|Omit spaces, periods, and other characters such as parentheses that make quotation marks around a variable necessary.|GenJnlBatch|  
|Replace currency unit signs such as $ with the corresponding currency unit code. **Note:**  This may not make a variable unique. To be unique, it must be different from the corresponding field name. Also, the variable is not necessarily unique when translated to another language.|AmountUSD|  
|Start variables with uppercase letters.||  
|If a variable is a compound of two or more words or abbreviations, then start each word or abbreviation with an uppercase letter.||  
|Describe the variable usage wherever possible. If possible, start with the table name. If there are several variables in an object that would otherwise have the same name, then use appropriate prefixes or suffixes to differentiate them.|CustInvDiscAmountLCY<br /><br /> EnteredPostingDate \(where the prefix is Entered\)|  
|Follow country/region-specific rules for abbreviations.||  
|When you set up table and field variables, give the variable the same name as the table or field as described in the Table Fields section.||  
|If a variable with the same name already exists, then add the number 2 to the variable name. If a variable with this name also exists, then use 3, and so on. Use these numbers only if you cannot establish a unique variable in another way.|CustLedgEntry2, NewCustLedgEntry \(better than CustLedgEntry2\)|  
|Note that parameters and local variables have their own number series. Do not name a parameter GenJnlLine4 because a global variable named GenJnlLine3 already exists.||  
|To use a variable to store a value temporarily, start the variable name with "Temp".|TempType|  
|Use "Old" and "New" as prefixes for record variables when you have old tables and new tables.||  
|Do not use "x" as a prefix. This is used only in table triggers when the record variable is created automatically by the development environment.||  
|Include "Total" in the name of a variable that is used for totaling.||  
|Use "From" or "To" when you are copying from or to a table.||  
|Use "Starting" or "Ending" with dates and positions.||  
|Use "First" or "Last" with the first or last record in a table or line in a journal. You can also use it as a flag to indicate that this is the first record that is processed.|FirstOrder|  
|When a variable is a Record, Page, Report, XMLport, Query, or Codeunit data type and the object has a name that also functions as a field name or local function name, add the suffix Rec, Page, Report, XMLport, Query, or Codeunit.|SourceCodeRec \(for a record variable from the **Source Code** table\) **Note:**  Because "Source Code" is the name of a table and the name of a field in other tables, you should not use "SourceCode" for variables that hold the two different types of information.|  

### User-Defined Functions  
 When you name user-defined functions, start with an imperative verb, such as ApplyCustLedgEntry. Use the following function name prefixes:  

-   If the code posts something, then use “Post” as a prefix.  

-   If the code makes something, then use “Make” as a prefix.  

-   If the code inserts something, then use “Insert” as a prefix.  

-   If something is selected, then use “Check” as a prefix.  

### Page Controls  
 Do not give a page control a name unless you want to refer to it in your C/AL code. If you name a page control, then add a prefix to the name with the abbreviated name of the associated table or page.  

## See Also  
 [Object Numbering Conventions](Object-Numbering-Conventions.md)
