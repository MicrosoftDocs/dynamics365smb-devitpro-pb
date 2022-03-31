---
title: Set Up Company Configuration Packages
description: Streamline your implementation process by turning a set of company types you use with most customers into company configuration packages available for reuse.
author: edupont04
ms.topic: conceptual
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.search.keywords:
ms.date: 03/31/2022
ms.author: edupont

---
# Set Up Company Configuration Packages

As you grow your business as a reseller of [!INCLUDE [prod_short](../includes/prod_short.md)], you will likely come to rely on a set of company types that you use with most of your [!INCLUDE [prod_short](../includes/prod_short.md)] prospects. You can streamline your implementation process by turning these types into *configuration packages* that are available for reuse.  

After you have set up a company in [!INCLUDE [prod_short](../includes/prod_short.md)] that suits your needs, you can create a configuration package that contains relevant setup data from this company. You can then use it when you create a new company that is to be configured in the same way.  

To facilitate the import of master data, such as customer and vendor information, you can use *configuration templates*. Configuration templates contain a set of default settings that are automatically assigned to the records imported into [!INCLUDE[prod_short](../includes/prod_short.md)]. Configuration templates are an alternative to the cloud migration tools that you ca use to migrate customer data from supported products. For more information, see [Migrate On-Premises Data to Business Central Online](migrate-data.md).

> [!TIP]
> Use these capabilities to scale your business as a reseller. Most of the relevant pages apply to both [!INCLUDE [prod_short](../includes/prod_short.md)] online and on-premises. However, some processes rely on access to the underlying database and are too complex to use for [!INCLUDE [prod_short](../includes/prod_short.md)] online. For [!INCLUDE [prod_short](../includes/prod_short.md)] on-premises, you probably want to use Windows PowerShell to help you deploy. For more information, see [Administration of Business Central On-Premises](administration.md) and [Administration of Business Central Online](tenant-administration.md), respectively.  

## Configuration packages

By default, [!INCLUDE [prod_short](../includes/prod_short.md)] online comes with one configuration package for Microsoft's default application, including local functionality. You can copy that and make relevant changes in the copy.  

Many of our reselling partners create a configuration package for each functional area. For example, create a package for the manufacturing functionality and another for sales. That lets you apply and set up new areas in a company as you need them.  

We recommend that you create configuration packages with most of the setup tables already filled in, so that only a few settings must be tweaked for each customer. For example, when you create a new company, the **No. Series** and the **No. Series Line** tables are filled in with a set of number series and starting numbers. The corresponding **No. Series** fields in the setup tables are also filled in automatically. You do not have to do the work of entering number series and other basic setup data. You can also manually change all default data that is used with RapidStart Services by using the *configuration worksheet*.  

Another approach would be to create a package that includes the tables that define setup, such as the following:  

- General Ledger Setup  
- General Posting Setup  
- VAT Posting Setup  
- Inventory Posting Setup  
- Purchases and Payables Setup  
- Sales and Receivables Setup  
- Warehouse Setup  
- Inventory Setup  
- Manufacturing Setup  
- Fixed Asset Setup  
- Marketing Setup  
- Service Setup  

To see a complete list of setup tables in [!INCLUDE [prod_short](../includes/prod_short.md)], choose the :::image type="icon" source="../developer/media/search-icon.png" border="false"::: icon, enter **Manual Setup**, and then choose the related link.  

> [!TIP]
> Optionally, use the configuration worksheet to gather together and categorize the information that you want to use to configure a new company, and arrange tables in a logical way. Formatting in the worksheet is based on a simple hierarchy: *areas* contain *groups*, which in turn contain *tables*. Areas and groups are optional but useful. You can then add the worksheet lines to a new configuration package.  

## Before you create a configuration package

There are some things to consider before you create a configuration package because they will impact you or your customer's ability to import it.  

### Tables that contain posted entries

You cannot import data to tables that contain posted entries, such as the tables for customer, vendor, and item ledger entries, so you should not include this data in your configuration package. You can add entries to these tables after you import the configuration package by using journals to post the entries. For more information, see [Posting Documents and Journals](/dynamics365/business-central/ui-post-documents-journals.md) in the business functionality content.

### Table names that contain special characters

Use caution if you have tables or fields that have the same temporal name but are differentiated by special characters, such as %, &, <, >, and ,. For example, a table might contain the **Field 1** and **Field 1%** fields.

The XML processor that generates the .rapidstart files accepts only some special characters, and will remove those it does not. If removing a special character, such as the % sign in "Field 1%," results in two or more tables or fields with the same name an error will occur when you export or import a configuration package.  

### Permissions

The process of creating and importing a configuration package involves the following effective permissions for all tables in the package:  

- The user who exports data for the configuration package must have **Read** effective permissions.
- The user who imports the configuration package must have **Insert** and **Modify** effective permissions.

### Database schema

When exporting and importing configuration packages between two company databases, the databases must have the same schema to ensure that all data is transferred successfully. This means that the databases should have the same table and field structure, in which the tables have the same primary keys and fields have the same IDs and data types. In practical terms, that means that your configuration package must be based on the same version of [!INCLUDE [prod_short](../includes/prod_short.md)] as the customer environments that you intend to apply it to.  

You can import a configuration package that has been exported from a database that has a different schema than that target database. However, any tables or fields in the configuration package that are missing in the target database will not be imported. Tables with different primary keys and fields with different data types will also not successfully import. For example, if the configuration pack includes table **50000, Customer** that has primary key **Code20** and the database to which you import the pack includes table **50000, Customer Bank Account** that has the primary key **Code20 + Code 20**, then data will not be imported.  

## To create a custom company configuration package

1. Create a new company. For more information, see [Create New Companies in Business Central](/dynamics365/business-central/about-new-company) in the business functionality content.  
2. Set up the new company in the way you need. Fill in all required setup tables.  

    Optionally, use the default configuration package in the Cronus demonstration company to set up the base application. Then, add your own best practices on top.  

    Next, you'll add this setup to a configuration package. You can set up the tables that you want to add to the package in the **Configuration Worksheet** page and then add a configuration package to the lines in that worksheet. Or you can add the tables directly to the package in the **Configuration Package** page. In the following steps, we assume that you prefer to set things up in the worksheet, but you don't have to.
3. Open the **Configuration Worksheet** page.  
4. Add a new line of the type **Area**, and then add groups and the tables that you want to transfer to another company to the package. [!INCLUDE [tooltip-inline-tip_md](../includes/tooltip-inline-tip_md.md)]  

    > [!TIP]  
    > Take a look at the default configuration package for the demonstration company for inspiration for how to set up the configuration.

    1. Choose the **Get Tables** action. On the **Get Config. Tables** request page, specify the types of tables that you want to add to the configuration, and set the relevant filters. Then choose the **OK** button.  

        To exclude the configuration questionnaires, configuration templates, and configuration worksheet tables from the package, select the **Exclude Configuration Tables** check box on the **Config Package Card** page. Otherwise, these tables will be added to the list of package tables automatically when you export the package.  

    2. To add related tables, choose the **Get Related Tables** action.  

        > [!NOTE]  
        > Related tables will not be added with the **Get Related Tables** action if either of the following is true:
        >
        > - The relation is conditional.  
        >     Example: If you get related tables for the **Customer** table, then the **Location** table will not be added, since it is only conditionally related to the **Customer** table, namely if the **Location Code** field in the **Customer** table is filled in.  
        > - The related table is filtered.  
        >     Example: A field in the related table has a WHERE clause. The reason for this is that the involved relations information is stored in the **Field** system table, which is not fully accessible to the application.  
        > You must add such types of tables manually.

        For each table, you can specify which fields to exclude, and you can modify the default processing order for each field. [!INCLUDE [prod_short](../includes/prod_short.md)] checks if there are related fields that you must configure in the **Config. Package Fields** page.
    3. Optionally, for each table, modify which fields must be included in the package.

        Select a table for which you want to specify field information, and on the **Actions** tab, in the **Show** group, choose **Fields**.

        - To select just the fields you want to include, choose the **Clear Included** action. To add all fields, choose the **Set Included** action.  
        - To specify that the field data should not be validated, clear the **Validate Field** check box for the field.  
5. Assign the worksheet lines to an existing package.  

    1. Select the relevant lines, choose the **Assign Package** action, and then, in the **Configuration Packages** page, choose the relevant package, or create a new one.

        If a table is not already included in the package, it will now be added. The package code field on the worksheet line will be filled in with the code of the package that the table is assigned to.  
        If you choose an existing package, you can see how many tables are already in the package by reviewing the information in the **No. of Tables** field.
6. Optionally, create a questionnaire for the most frequently used setup tables so that you can get specific information from your prospects and customers that will help you set up their [!INCLUDE [prod_short](../includes/prod_short.md)].  

    1. On the **Configuration Questionnaire** page, add a new questionnaire, and then choose the **Questions Areas** action.  
    2. In the **Config. Question Area** page, in the **Table ID** field, choose the ID of the table for which you want to collect information. The **Table Name** field is automatically filled in.  
    3. Choose the **Update Questions** action. Each field in the table is added to the questionnaire with a question mark following its caption in the **Question** field.

        You can rephrase the question to make it clear that it is a question that should be answered. For example, if a field is called **Name**, you could edit the related question to state *What is the name of the account.* You can also provide guidance in the **Reference** field, including a URL to a page that provides additional information for example.  

        You can also delete any questions that you do not want to include in the questionnaire.  

        > [!NOTE]  
        > The **Answer Option** field describes the format that the answer to the question must meet, such as *Code* or *Text*.
        >
        >  As needed, you can also define default answers in the **Answer** field. These values are used by default for custom setup. However, the person filling in the questionnaire can modify and update the answer.  

    4. Repeat steps 2 and 3 for any additional areas that you want to add to the questionnaire, and then return to the **Configuration Questionnaire** page.

        Optionally, export the questionnaire to Excel. Then, you can use the Excel workbook to get answers from your prospects and customers. There are worksheets for each of the question areas that have been created for the questionnaire.  

        > [!NOTE]  
        > You may encounter the following error when you run an English version of Excel, but have your regional settings configured for a non-English language: *Old format or invalid type library.* To fix this error, make sure that the language pack for the non-English language is installed.
7. Optionally, create configuration templates to make it easier to import master data, such as customers, vendors, contacts, or items.  

    Use the built-in configuration templates, or create your own templates in the **Configuration Templates** page. This is mainly useful if you're going to migrate customer data to [!INCLUDE [prod_short](../includes/prod_short.md)] on-premises and then switch to the cloud. For more information, see the [Migrate customer data](#migrate-customer-data) section.  

    You can export the templates as Excel workbooks so that you can work with customer data in Excel.  
8. Export your package as a .rapidstart file, or export it to Excel.  

## Apply the configuration packages

When you onboard a prospect, you can use the configuration packages to set up [!INCLUDE [prod_short](../includes/prod_short.md)] according to your best practices and their requirements. Apply the relevant configuration packages to an empty company in the customer's tenant. Use the questionnaires to tweak things for individual customers of yours. Optionally, use configuration templates to import existing customer data.  

If the customer needs more than one company in [!INCLUDE [prod_short](../includes/prod_short.md)], you can copy commonly used values from an existing company to a new one, as long as both companies are in the same tenant. For example, if you have a standard list of symptom codes that is common to all your service management implementations, you can copy the codes easily from one company to another. You can do this from the **Configuration Worksheet** page.  




## Migrate customer data

Now that the customer's production or sandbox is set up, you can migrate their existing data. In many cases, to migrate customer data to [!INCLUDE [prod_short](../includes/prod_short.md)] online, use the built-in migration tools to migrate data from specific product versions. For more information, see [Migrate On-Premises Data to Business Central Online](migrate-data.md).  

Alternatively, you can migrate to [!INCLUDE [prod_short](../includes/prod_short.md)] on-premises using Excel or the data migration tools of RapidStart Services, and then switch to the cloud.  

You can choose to use the configuration package approach to migrating customer data, such as if the customer is coming from a product that is not supported by the [Migrate On-Premises Data to Business Central Online](migrate-data.md) tools, nor by an app for [!INCLUDE [prod_short](../includes/prod_short.md)] online, such as [Microsoft's own apps to migrate from QuickBooks app](/dynamics365/business-central/across-quickbooks-to-business-edition).  

From both the **Configuration Worksheet** page and the **Configuration Package** page, you can import data from Excel or a .rapidstart file. If you prefer to use Excel, the data must be in an Excel workbook that is exported from the **Configuration Packages** page. This way, the Excel workbook complies with the [!INCLUDE [prod_short](../includes/prod_short.md)] data structure. In the **Configuration Package** page, you can map tables and fields if the data structure is different between where the data came from and where it's going. [!INCLUDE[prod_short](../includes/prod_short.md)] treats and handles the mapping based on table relations:  

- If you define a mapping directly for a field in a table, then [!INCLUDE[prod_short](../includes/prod_short.md)] uses it.  

- If the field has a relation to another table, [!INCLUDE[prod_short](../includes/prod_short.md)] searches for the mapping defined for the primary key field in the related table. The related table, however, must be part of the configuration package.  

- If mapping information is defined in both places, for the field directly and for the primary key in the related table, then [!INCLUDE[prod_short](../includes/prod_short.md)] will search for the mapping in both places.  

- If the same mappings are defined directly for a field and in the related table, but have different new values, the mapping that is defined directly for the field takes priority over the mapping that is defined for the table that the field is referencing.  

1. Use your configuration questionnaires and templates to map the existing data to [!INCLUDE [prod_short](../includes/prod_short.md)] in Excel. Especially, make sure you capture master data about customers, items, vendors, and the general ledger.  

    If the customer comes from [!INCLUDE [prod_short](../includes/prod_short.md)] or [!INCLUDE [navnow_md](../developer/includes/navnow_md.md)], then you can export the customer's data to a .rapidstart file and then import it into the new company. But in many cases, you'll want to work in Excel so that you can tweak or map data.
2. Open the **Configuration Worksheet** page or the **Configuration Package** page and import the customer's master data.  

    In the **No. of Package Errors** field, see if there are any errors reported. If there are, drill down to see the errors. The **Config. Package Records** page opens.

    1. Choose the **Show Error** action. You will receive an error such as the following: *XX is not a valid option. Valid options are: XX*. Choose the **OK** button.  
    2. To apply the mapping that you have set up, choose the **Apply Data** action.  

3. Validate the migration

    1. On the **Migration Overview** page, review the **No. of Migration Errors** field to see whether any errors occurred during import.  
    2. If there are errors, select the migration table, and then, on the **Tables** tab, choose the **Errors** action. The **Invalid** check box is selected for each record that has an error.  
    3. To review errors, select a line, and then choose the **Show Error** action.  

    The **Error Text** field contains the reason for the error. The **Field Caption** field contains the caption of the field that contains the error.  
    4. To correct an error or otherwise make an update, on the **Migration Overview** page, choose the **Migration Record** action, and then, on the **Migration Record** page, correct the record with the error.  

    Now, you have master data in place. Next, you add the opening balances. The following steps describe how to create journal lines for G/L accounts, but the same apply to creating journal lines for customers, vendors, and items.  
4. Choose the **Create G/L Acct. Journal Lines** action.  
5. Fill in the **Options** FastTab as appropriate, and set filters as needed. For example, in the **Journal Template** field, enter a name.  
6. Choose the **OK** button. The records are now in the journal, but the amounts are empty.  
7. Export the journal table to Excel and manually enter the posting and balancing account information from the legacy data.
8. Import and apply the table information into the new company. The journal lines are ready for posting.  
9. In the configuration worksheet, select the journal line table, and then choose the **Database Data** action.  
10. Review the information, and then choose the **Post** action.  
11. Repeat the steps to import and post any other opening balances.  

> [!IMPORTANT]
> Specifically for opening balances for bank accounts, do not follow the steps in this article to post directly to the G/L accounts that are associated with the relevant bank accounts. For more information, see [Set Up Bank Accounts](/dynamics365/business-central/bank-how-setup-bank-accounts).  

## See Also

[Migrate On-Premises Data to Business Central Online](migrate-data.md)  
[FAQ about Migrating to Business Central Online from On-Premises Solutions](faq-migrate-data.md)  
[Administration of Business Central Online](tenant-administration.md)  
[Administration of Business Central On-Premises](administration.md)
[Get Started as a Reseller of Business Central Online](get-started-online.md)  
[Onboarding experiences in Business Central](onboarding-experiences.md)  
