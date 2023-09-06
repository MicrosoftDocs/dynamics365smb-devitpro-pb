---
title: Align Table Definitions #Required; page title displayed in search results. Don't enclose in quotation marks.
description: Concept description #Required; article description that's displayed in search results. Don't enclose in quotation marks. Do end with a period.
author: jswymer #Required; your GitHub user alias, with correct capitalization.
ms.author: jswymer #Required; your Microsoft alias; optional team alias.
ms.reviewer: jswymer #Required; Microsoft alias of content publishing team member.
ms.service: dynamics365-business-central #Required; per approved Microsoft taxonomy (https://taxonomy.docs.microsoft.com/TaxonomyServiceAdminPage/#/taxonomy/detail/2022-04-07T09:00:02.5587920Z!a892accc-6925-4c06-8723-fb5e30ba7ca3/product).
ms.topic: conceptual #Required; don't change.
ms.date: 11/25/2022
ms.custom: bap-template #Required; don't change.
---

# Align Table Definition

For cloud migration to succeed, the on-premises tables object and their online counterparts must have the same definitions for the following properties: 

- Primary keys
- Field names and data types

Other properties of tables aren't required to match or the difference can be handled by cloud migration.

- Different table names

  If the on-premises and online tables have different names, you can use table mapping during the cloud migration to handle this discrepancy. 
- Different table IDs
  
  Table IDs aren't used in SQL databases, so the IDs are ignored in cloud migration.

- Secondary keys

  Secondary keys are ignored in cloud migration.

## Section heading

<!--add your content here-->

<!--Next steps - Required. Provide at least one next step and no more than three. Include some context so the customer can determine why they would click the link.-->
## Next steps

<!--Remove all the comments in this template before you sign-off or merge to the main branch.-->
