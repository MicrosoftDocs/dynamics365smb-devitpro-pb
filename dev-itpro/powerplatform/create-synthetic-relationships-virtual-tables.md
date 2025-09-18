---
title: Create Synthetic Virtual Table Relationships in Business Central
description: Learn to configure and validate links between Dataverse native tables and Business Central virtual tables.
author: jswymer
contributors:
ms.topic: concept-article
ms.date: 09/17/2025
ms.author: jswymer
ms.reviewer: jswymer
---
# Create synthetic table relationships

This article provides step-by-step instructions on when and how to set up and configure synthetic relationships using virtual tables for
Business Central in Microsoft Dataverse.

## When not to use synthetic relationships

Even though it's possible, we don't recommend creating synthetic relationships between two virtual tables. If you need to do it, create a [custom API](/dynamics365/business-central/dev-itpro/developer/devenv-develop-custom-api) with the right relationships. They're reflected inside Microsoft Dataverse. Learn more about how internal API relationships transform into virtual table relationships [here](/dynamics365/business-central/dev-itpro/powerplatform/powerplat-entity-modeling#native-tabletonative-table-relationships).

## Create synthetic relationship between native and virtual table

Consider an example where you want to show sales orders from the **dyn365bc_salesorder_v2_0** virtual table inside the native **Account**  table in Dataverse.

1. Sign in to [Power Apps](https://make.powerapps.com/) and switch to the environment that contains the table.
1. Create a foreign key in **Account** table:

   1. Select **Tables** > **Account** > **Keys**.
   1. Select **New key**, then enter a name and display name for the key the **Key** pane.
   1. Select the columns needed for the relation. You can select one, two, or three columns to use in the native to virtual table relation.
   1. Select **Save** to create the key.

  :::image type="content" source="media/create-synthetic-relationships-virtual-tables/image1.png" alt-text="Screenshot of the Keys view in Dataverse showing creation of a new key for synthetic relationship.":::

1. Open Business Central Configuration app (from the navigation pane, select **Apps** > **Business Central Configuration**).
1. Select **Table Relations** > **New** to open the **New Business Central Table Relation** page.

    :::image type="content" source="../developer/media/dataverse-table-releationship-bc-configuration-app.png" alt-text="Screenshot of the Business Central Configuration app General tab for defining a synthetic relationship showing native table and key fields.":::

1. On the **General** tab, provide the following information:

   |Field|Description|Example|
   |-|-|-|
   |Relation Name|A custom name for this synthetic relationship.|dyn365bc_account2salesorder|
   |Native Table|The logical name of native table you want to use. Find this value in the table properties.|Account|
   |Native Table Key|The name of the key |crec7_key_for_relation_with_bc_sales|
   |Virtual Table|The logical name for the virtual table you want to use. Find this value in the table properties.|dyn365bc_salesorder_v2_0|

   > [!TIP]
   > To view the logical name in the table properties, open the table, select **Properties**, and then expand **Advanced options** in the **Edit table** pane.

   <!-- :::image type="content" source="media/create-synthetic-relationships-virtual-tables/image3.png" alt-text="Screenshot of the Business Central Configuration app highlighting the Virtual Table selection for a synthetic relationship.":::-->

1. On the **Mapping** tab, provide column mapping between the native table and one or more virtual table columns. All columns included in the table key (defined in step 1) must be mapped. Use their logical names.

  :::image type="content" source="../developer/media/dataverse-table-releationship-bc-configuration-app-mappings.png" alt-text="Screenshot of the Business Central Configuration app General tab for defining a synthetic relationship showing native table and key fields.":::

1. Select **Save** to validate and save the relationship.
1. Test the relationship. For example, [create a sub grid](/power-apps/maker/model-driven-apps/form-designer-add-configure-subgrid#add-a-subgrid-component) and choose the **Sales Orders** as related relationship.

## Known limitations

- You can't edit an existing synthetic table relationship. You must remove it and then recreate it with the changes.
- If you refresh a table that changes columns included in the mapping, an error occurs. You must remove the synthetic relationship first.

## Related information

[Use synthetic relationships to expose more Business Central data in Dataverse](/dynamics365/release-plan/2024wave1/smb/dynamics365-business-central/use-virtual-tables-expose-more-business-central-data-dataverse)
[Overview - Integrating Business Central with Microsoft Dataverse](../developer/dataverse-integration-overview.md)  
[Microsoft Power Platform Integration with Business Central](powerplat-overview.md)  
[Application Lifecycle Management for Solutions that use Virtual tables](powerplat-app-lifecycle-management.md)  
[Business Central and [!INCLUDE[dataverse](../includes/dataverse_short.md)] Admin Reference](powerplat-admin-reference.md)  
[FAQ](powerplat-faq.md)  
