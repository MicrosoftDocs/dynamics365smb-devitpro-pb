---
title: Apply Company Configuration Packages
description: Streamline your implementation process by using configuration packages with standard settings and to migrate customer data.
author: edupont04
ms.topic: conceptual
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.search.form: 1799, 1807, 8632, 1800, 1340, 8610, 8614, 8615, 8620, 8632
ms.date: 04/07/2022
ms.author: edupont

---
# Apply Company Configuration Packages

When you onboard a prospect, you can use [configuration packages](set-up-standard-company-configuration-packages.md) to set up [!INCLUDE [prod_short](../includes/prod_short.md)] according to your best practices and their requirements. Apply the relevant configuration packages to an empty company in the customer's tenant. Use the questionnaires to tweak things for individual customers of yours. Optionally, use configuration templates to import existing customer data.  

Start by setting up a company in a sandbox so that users can practice before they start using [!INCLUDE [prod_short](../includes/prod_short.md)] in production. 

If the customer needs more than one company in [!INCLUDE [prod_short](../includes/prod_short.md)], you can copy commonly used values from an existing company to a new one, as long as both companies are in the same tenant. For example, if you have a standard list of symptom codes that is common to all your service management implementations, you can copy the codes easily from one company to another. You can do this from the **Configuration Worksheet** page.  

## Migrate customer data

In many cases, to migrate customer data to [!INCLUDE [prod_short](../includes/prod_short.md)] online, use the built-in migration tools to migrate data from specific product versions. For more information, see [Migrate On-Premises Data to Business Central Online](migrate-data.md).  

Alternatively, you can migrate to [!INCLUDE [prod_short](../includes/prod_short.md)] on-premises using Excel or the data migration tools of RapidStart Services, and then switch to the cloud.  

You can choose to use the configuration package approach to migrating customer data, such as if the customer is coming from a product that is not supported by the [Migrate On-Premises Data to Business Central Online](migrate-data.md) tools, nor by an app for [!INCLUDE [prod_short](../includes/prod_short.md)] online, such as [Microsoft's own apps to migrate from QuickBooks app](/dynamics365/business-central/across-quickbooks-to-business-edition).  

From both the **Configuration Worksheet** page and the **Configuration Package** page, you can import data from Excel or a .rapidstart file. If you prefer to use Excel, the data must be in an Excel workbook that is exported from the **Configuration Packages** page. This way, the Excel workbook complies with the [!INCLUDE [prod_short](../includes/prod_short.md)] data structure. In the **Configuration Package** page, you can map tables and fields if the data structure is different between where the data came from and where it's going. [!INCLUDE[prod_short](../includes/prod_short.md)] treats and handles the mapping based on table relations:  

- If you define a mapping directly for a field in a table, then [!INCLUDE[prod_short](../includes/prod_short.md)] uses it.  

- If the field has a relation to another table, [!INCLUDE[prod_short](../includes/prod_short.md)] searches for the mapping defined for the primary key field in the related table. The related table, however, must be part of the configuration package.  

- If mapping information is defined in both places, for the field directly and for the primary key in the related table, then [!INCLUDE[prod_short](../includes/prod_short.md)] will search for the mapping in both places.  

- If the same mappings are defined directly for a field and in the related table, but have different new values, the mapping that is defined directly for the field takes priority over the mapping that is defined for the table that the field is referencing.  

### Import data from Excel

Use your configuration questionnaires and templates to map the existing data to [!INCLUDE [prod_short](../includes/prod_short.md)] in Excel. Especially, make sure you capture master data about customers, items, vendors, and the general ledger.  

If the customer comes from [!INCLUDE [prod_short](../includes/prod_short.md)] or [!INCLUDE [navnow_md](../developer/includes/navnow_md.md)], then you can export the customer's data to a .rapidstart file and then import it into the new company. But in many cases, you'll want to work in Excel so that you can tweak or map data.

### To validate the configuration questionnaire

It is important to validate the configuration questionnaire before you apply it to the [!INCLUDE[prod_short](../includes/prod_short.md)] format. It is also a way to make sure that data formatting is preserved during the import from Excel.  

A common validation task is to check that text strings are not entered in date fields. This review process is necessary because the format of the answer in the questionnaire is not validated automatically when you run the **Apply Answers** function.  

> [!NOTE]  
> In general, validation of the configuration questionnaire is a manual process. However, there are checks for regional formatting inconsistencies. In addition, you will get errors if the structure of your [!INCLUDE[prod_short](../includes/prod_short.md)] database does not match the structure of the migration database.  

1. On the **Configuration Questionnaire** page, select the relevant questionnaire, and then choose the **Question Areas** action.  
2. Open the relevant question area.  
3. For each question, validate that the value in the **Answer** field corresponds to the format provided in the **Answer Option** field. For example, validate that the address of a company is in text format.  
4. If you find errors, you can troubleshoot and make corrections in Excel by exporting the questionnaire, and then importing it again. Alternatively, you can correct errors directly in [!INCLUDE[prod_short](../includes/prod_short.md)] as you review the answers on the **Config. Question Area** page.  
5. Repeat these steps for each question area.  

When you have completed your validation, the data is ready to be applied to the database.  

### To apply answers from the configuration questionnaire

After you have imported and validated information from a configuration questionnaire, you can transfer, or apply the setup data to the corresponding tables in the [!INCLUDE[prod_short](../includes/prod_short.md)] database.  

1. Choose the ![Lightbulb that opens the Tell Me feature 4.](../media/search_small.png "Tell me what you want to do") icon, enter **Configuration Questionnaire**, and then choose the related link. The **Config. Questionnaire** page opens.  
2. Select a configuration questionnaire from the list, and then choose the **Edit List** action.  
3. You can apply answers in one of two ways.  

- To apply the whole questionnaire, choose the **Apply Answers** action.  
- To apply answers for a specific **Question Area** only, choose the **Question Areas** action, select a **Question Area** in the list, and then choose the **Apply Answers** action.  

### To verify that answers have been applied successfully

1. Check setup pages for the various functional areas of [!INCLUDE[prod_short](../includes/prod_short.md)]. To locate the page, choose the ![Lightbulb that opens the Tell Me feature 5](../media/search_small.png "Tell me what you want to do") icon, enter the name of the setup page, and then choose the related link.  
2. Verify that the fields have been populated with the correct data from the various question areas in the configuration questionnaire.  

You have now configured setup with the customer’s business information and rules.

### To import customer data

1. Open the **Configuration Worksheet** page or the **Configuration Package** page and import the customer's master data.  

    In the **No. of Package Errors** field, see if there are any errors reported. If there are, drill down to see the errors. The **Config. Package Records** page opens.

    1. Choose the **Show Error** action. You will receive an error such as the following: *XX is not a valid option. Valid options are: XX*. Choose the **OK** button.  
    2. To apply the mapping that you have set up, choose the **Apply Data** action.  

2. Validate the migration

    1. On the **Migration Overview** page, review the **No. of Migration Errors** field to see whether any errors occurred during import.  
    2. If there are errors, select the migration table, and then, on the **Tables** tab, choose the **Errors** action. The **Invalid** check box is selected for each record that has an error.  
    3. To review errors, select a line, and then choose the **Show Error** action.  

    The **Error Text** field contains the reason for the error. The **Field Caption** field contains the caption of the field that contains the error.  
    4. To correct an error or otherwise make an update, on the **Migration Overview** page, choose the **Migration Record** action, and then, on the **Migration Record** page, correct the record with the error.  

    Now, you have master data in place. Next, you add the opening balances. The following steps describe how to create journal lines for G/L accounts, but the same apply to creating journal lines for customers, vendors, and items.  
3. Choose the **Create G/L Acct. Journal Lines** action.  
4. Fill in the **Options** FastTab as appropriate, and set filters as needed. For example, in the **Journal Template** field, enter a name.  
5. Choose the **OK** button. The records are now in the journal, but the amounts are empty.  
6. Export the journal table to Excel and manually enter the posting and balancing account information from the legacy data.
7. Import and apply the table information into the new company. The journal lines are ready for posting.  
8. In the configuration worksheet, select the journal line table, and then choose the **Database Data** action.  
9. Review the information, and then choose the **Post** action.  
10. Repeat the steps to import and post any other opening balances.  

> [!IMPORTANT]
> Specifically for opening balances for bank accounts, do not follow the steps in this article to post directly to the G/L accounts that are associated with the relevant bank accounts. For more information, see [Set Up Bank Accounts](/dynamics365/business-central/bank-how-setup-bank-accounts).  

## See Also

[Set Up Company Configuration Packages](set-up-standard-company-configuration-packages.md)  
[Migrate On-Premises Data to Business Central Online](migrate-data.md)  
[FAQ about Migrating to Business Central Online from On-Premises Solutions](faq-migrate-data.md)  
[Administration of Business Central Online](tenant-administration.md)  
[Administration of Business Central On-Premises](administration.md)
[Get Started as a Reseller of Business Central Online](get-started-online.md)  
[Onboarding experiences in Business Central](onboarding-experiences.md)  
