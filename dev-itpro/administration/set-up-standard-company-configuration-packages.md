---
title: Set Up Company Configuration Packages
description: Streamline your implementation process by turning a set of company types you use with most customers into company configuration packages available for reuse.
author: edupont04
ms.topic: conceptual
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.search.keywords:
ms.date: 03/29/2022
ms.author: edupont

---
# Set Up Company Configuration Packages

As you grow your business, you will likely come to rely on a set of company types that you use with most of your [!INCLUDE [prod_short](../includes/prod_short.md)] customers. You can streamline your implementation process by turning these types into *configuration packages* that are available for reuse.  

After you have set up a company in [!INCLUDE [prod_short](../includes/prod_short.md)] that suits your needs, you can create a configuration package that contains relevant data from this company. You can then use it when you create a new company that is to be configured in the same way.  

To facilitate the import of master data, such as customer and vendor information, you can use *configuration templates*. Configuration templates contain a set of default settings that are automatically assigned to the records imported into [!INCLUDE[prod_short](../includes/prod_short.md)].  

> [!TIP]
> Use these capabilities to scale your business as a reseller. Most of the relevant pages apply to both [!INCLUDE [prod_short](../includes/prod_short.md)] online and on-premises. However, some processes rely on access to files on disk and are too complex to use for [!INCLUDE [prod_short](../includes/prod_short.md)] online. For [!INCLUDE [prod_short](../includes/prod_short.md)] on-premises, you probably want to use Windows PowerShell to help you deploy. For more information, see [Administration of Business Central On-Premises](administration.md) and [Administration of Business Central Online](tenant-administration.md), respectively.  

## Configuration packages

In general, create a configuration package for each functional area. For example, create a package for your manufacturing functionality. That lets you apply and set up new areas in a company as you need them  

We recommend that you create configuration packages with most of the setup tables already filled in, so that customers only have to change a few settings after the package is applied. For example, when you create a new company, the **No. Series** and the **No. Series Line** tables are filled in with a set of number series and starting numbers. The corresponding **No. Series** fields in the setup tables are also filled in automatically. You do not have to do the work of entering number series and other basic setup data. You can also manually change all default data that is used with RapidStart Services by using the configuration worksheet.  

Another approach would be to create a package that includes the tables that define setup, such as the following:  

- Fixed Asset Setup  
- General Ledger Setup  
- Inventory Setup  
- Manufacturing Setup  
- Purchases and Payables Setup  
- Marketing Setup  
- Service Setup  
- Sales and Receivables Setup  
- Warehouse Setup  
- General Posting Setup  
- VAT Posting Setup  
- Inventory Posting Setup  

To see a complete list of setup tables, choose the :::image type="icon" source="../developer/media/search-icon.png" border="false"::: icon, enter **Manual Setup**, and then choose the related link.  


## Before you create a configuration package

There are some things to consider before you create a configuration package because they will impact you or your customer's ability to import it.  

### Tables that contain posted entries

You cannot import data to tables that contain posted entries, such as the tables for customer, vendor, and item ledger entries, so you should not include this data in your configuration package. You can add entries to these tables after you import the configuration package by using journals to post the entries. For more information, see [Posting Documents and Journals](/dynamics365/business-central/ui-post-documents-journals.md) in the business functionality content.

### Table names that contain special characters

Use caution if you have tables or fields that have the same temporal name but are differentiated by special characters, such as %, &, <, >, (, and ). For example, table "XYZ" might contain the "Field 1" and "Field 1%" fields.

The XML processor accepts only some special characters, and will remove those it does not. If removing a special character, such as the % sign in "Field 1%," results in two or more tables or fields with the same name an error will occur when you export or import a configuration package.  

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
3. Open the **Configuration Worksheet** page.  
4. Add the tables that you want to transfer to another company to the worksheet.  

    1. Choose the **Get Tables** action. On the **Get Config. Tables** request page, specify the types of tables that you want to add to the configuration, and set the relevant filters. then choose the OK button.  
    2. Review the information in the **Related Tables** FactBox to see whether there are missing tables. To add related tables, choose the **Get Related Tables** action.  

        > [!NOTE]  
        > Related tables will not be added with the **Get Related Tables** action if either of the following is true:
        >
        > - The relation is conditional.  
        >     Example: If you get related tables for the **Customer** table, then the **Location** table will not be added, since it is only conditionally related to the **Customer** table, namely if the **Location Code** field in the **Customer** table is filled in.  
        > - The related table is filtered.  
        >     Example: A field in the related table has a WHERE clause. The reason for this is that the involved relations information is stored in the **Field** system table, which is not fully accessible to the application.  
        > You must add such types of tables manually.

1. Assign the worksheet lines to the package.  
1. Create a questionnaire for the most frequently used setup tables.  
1. Create configuration templates to make it easier to create master data, such as customers or items.  
1. Export your package as a .rapidstart file.  

## Apply the configuration packages

When you onboard a prospect, use the configuration packages to set up [!INCLUDE [prod_short](../includes/prod_short.md)] according to your best practices and their requirements. Apply the configuration package to an empty company in the customer's tenant.

## Migrate customer data

Now that the customer's production or sandbox is set up, you can migrate their existing data. In many cases, to migrate customer data to [!INCLUDE [prod_short](../includes/prod_short.md)] online, use the built-in migration tools to migrate data from specific product versions. For more information, see [Migrate On-Premises Data to Business Central Online](migrate-data.md).  

## See Also

[Setting Up a Company With RapidStart Services](/dynamics365/business-central/admin-set-up-a-company-with-rapidstart)  
[Administration](administration.md)
