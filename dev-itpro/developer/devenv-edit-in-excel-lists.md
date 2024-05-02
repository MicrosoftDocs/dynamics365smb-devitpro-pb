---
title: Controlling Edit in Excel on list pages
description: This article explains how to control the Edit in Excel system action on list pages.
ms.date: 05/02/2024
ms.topic: conceptual
ms.reviewer: solsen
ms.author: kennienp
author: kennienp
---

# Controlling Edit in Excel on list pages

This article explains how the system action Edit in Excel appears on list pages. The **Edit in Excel** action is a system action that allows users to open a list page in Excel and edit the data in Excel and then publish the changes back to [!INCLUDE [prod_short](includes/prod_short.md)]. 

## Default behavior for visibility of the Edit in Excel action

For a list page in an app or per-tenant extension, the **Edit in Excel** action is visible for users with the right permissions. The user can select the **Edit in Excel** action from the action bar on the list page by selecting the system action icon :::image type="content" source="media/SystemActionIcon.png" alt-text="The system action icon":::.

## Turning off Edit in Excel with permissions

As an admin, you can exclude permission to the **Edit in Excel** action for users who you don't want to have access to the feature. The following permission sets control Edit in Excel: 

- `EDIT IN EXCEL - VIEW`
- `EDIT IN EXCEL-ADMIN`
- `EXCEL EXPORT ACTION`

## How to set up Edit in Excel for on-premises (and Docker sandbox) environments 

The **Edit in Excel** action isn't enabled by default for on-premises (and Docker sandbox) environments and without extra setup, the **Edit in Excel** action doesn't show on list pages that would usually include the action. 

For more information on how to enable the action for on-premises (and Docker sandbox) environments, see [Setting up the Business Central add-in for Excel (on-premises)](../administration/configuring-excel-addin.md).

## See also

[Setting up the Business Central add-in for Excel (on-premises)](../administration/configuring-excel-addin.md)  