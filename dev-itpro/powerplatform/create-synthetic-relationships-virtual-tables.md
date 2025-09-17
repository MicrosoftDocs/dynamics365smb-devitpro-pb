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
# Create virtual table synthetic relationships

This article provides step-by-step instructions on when and how to set up and configure synthetic relationships using virtual tables for
Business Central in Microsoft Dataverse.

## When not to use synthetic relationships

Even though it is possible, we do not recommend creating synthetic relationships between two virtual tables. If you need to do it, please create a [custom API](/dynamics365/business-central/dev-itpro/developer/devenv-develop-custom-api) with right relationships. They’ll be reflected inside Microsoft Dataverse. Read more about [internal APIs relationships transforming into virtual table relationships](/dynamics365/business-central/dev-itpro/powerplatform/powerplat-entity-modeling#native-tabletonative-table-relationships).

## Create synthetic relationship between virtual tables

Consider an example where you want to show sales orders from the **dyn365bc_salesorder_v2_0** virtual table inside **Account** native table in Dataverse.

1. First, you need to create a foreign key inside Account table. Open **Keys** view and add a new key. Choose the column(s) needed for the relation. 1 to 3 columns can be used in the native to virtual table relation.

  :::image type="content" source="media/create-synthetic-relationships-virtual-tables/image1.png" alt-text="Screenshot of the Keys view in Dataverse showing creation of a new key for synthetic relationship.":::

1. Once the key is created, open our app **Business Central Configuration**. Go to **Table Relations** and click on **New**.
1. On the **General** tab, provide:

   - **Relation Name** – it’s your custom name for this synthetic relationship. Let’s call it **dyn365bc_account2salesorder.**

    :::image type="content" source="media/create-synthetic-relationships-virtual-tables/image2.png" alt-text="Screenshot of the Business Central Configuration app General tab for defining a synthetic relationship showing native table and key fields.":::

   - **Native Table** – it’s a logical name of native table you want to use. This can be found on the table properties. Here, it’s **account**.
   - **Native Table Key** which is the name of the key specified before. In our example, it was called **crec7_key_for_relation_with_bc_sales**.
   - **Virtual Table -** it’s a logical name for the virtual table you want to use. This can be found on the table properties. Here, it’s **dyn365bc_salesorder_v2_0**.

  :::image type="content" source="media/create-synthetic-relationships-virtual-tables/image3.png" alt-text="Screenshot of the Business Central Configuration app highlighting the Virtual Table selection for a synthetic relationship.":::

1. On the **Mapping** tab, provide column mapping between the native table and the virtual table column(s). All columns included in the table key (defined in step 1) must be mapped. Please use their logical names.

  :::image type="content" source="media/create-synthetic-relationships-virtual-tables/image4.png" alt-text="Screenshot of the Mapping tab showing column mappings between native Account table and Sales Order virtual table.":::

1. Press **Save**. Validation will be performed on save.
1. You can see the relationship works, for example, by [creating a sub grid](/power-apps/maker/model-driven-apps/form-designer-add-configure-subgrid#add-a-subgrid-component) and choosing the **Sales Orders** as related relationship.

## Known limitations

- Synthetic relationships cannot be edited. You need to remove them first and re-create if changes are needed.
- If you refresh the table that changes columns included in the mapping, it results in the error. You need to remove the synthetic relationship first.