---
title: Controlling Edit in Excel on list pages
description: This article explains how to control the Edit in Excel system action on list pages.
ms.date: 04/29/2024
ms.topic: conceptual
author: kennienp
---

# Controlling Edit in Excel on list pages and 

This article explains how the system action Edit in Excel appears on list pages.

## Default behaviour for visibility of the Edit in Excel action

For a list page in an app/per-tenant extension, the Edit in Excel action is visible (for users with the right permissions.)


## Turning off Edit in Excel with permissions

As an admin, you can exclude permission to Edit in Excel for users who you don't want to have access to the feature. The following permission sets control Edit in Excel: 

- `EDIT IN EXCEL - VIEW`
- `EDIT IN EXCEL-ADMIN`
- `EDIT IN EXCEL ACTION`


## How to setup Edit in Excel for on-premises (and Docker sandbox) environments 

The *Edit in Excel* feature is not enabled by default for on-premises (and Docker sandbox) environments and without additional setup, the *Edit in Excel* action does not show on list pages that would normally include the action. 

For more information on how to enable the feature for on-premises (and Docker sandbox) environments, see [Setting up the Business Central Add-in for Excel (On-premises)](../administration/configuring-excel-addin.md).


## See Also


[Setting up the Business Central Add-in for Excel (On-premises)](../administration/configuring-excel-addin.md)   