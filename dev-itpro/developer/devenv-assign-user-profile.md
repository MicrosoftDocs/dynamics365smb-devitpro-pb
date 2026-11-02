---
title: Assign a User Profile in Business Central
description: Assign a profile to a Business Central user to set their Role Center and role-specific customizations. Configure language, region, and other preferences.
author: SusanneWindfeldPedersen
ms.author: solsen
ms.date: 10/29/2026
ms.topic: how-to
ms.reviewer: solsen
---

# Assign a user to a profile

Assign a profile to a user in [!INCLUDE[prod_short](includes/prod_short.md)] to set their default Role Center and role-specific page customizations. Use the **Role** field on the **User Settings** page to select the profile.

## Prerequisites for assigning a profile

- The user must already exist in [!INCLUDE[prod_short](includes/prod_short.md)]. Learn more in [Managing users and permissions](/dynamics365/business-central/ui-how-users-permissions).
- You must have permission to manage users to view and change settings for other users.
- The profile must be enabled to appear in the role lookup.

## Assign a profile to a user

1. Press <kbd>Alt</kbd>+<kbd>Q</kbd>, enter **User Settings**, and then select the related link.
2. Select the user, and then select **Edit**. If the user isn't listed, select **New**, and then use the lookup button in the **User ID** field to select the user.
3. In the **Role** field, use the lookup button to select the profile, and then select **OK**.
4. Optionally, change the other settings described in the following table.
5. Close the **User Settings** page.

The settings apply the next time the user signs in.

## Configure other user preferences

You can also configure these preferences on the **User Settings** page.

You can leave **Language**, **Region**, and **Time Zone** blank to use default values when the user signs in.

| Field | Description |
|-------|-------------|
| **Language** | Select the language used for text in the user interface. |
| **Region** | Select the regional format used for dates, numbers, and currency. |
| **Time Zone** | Select the user's time zone. |
| **Company** | Select the company that the user works in. |
| **Teaching Tips** | Turn short messages about fields and actions on or off. This setting is on by default. |
| **Legacy Action Bar** | Turn on this setting to use the legacy action bar terms and layout. This setting is off by default. |

> [!NOTE]
> Users can change their preferences on the **My Settings** page. **Language** and **Company** store preferences, not enforced settings. Changes users save can replace the values you set. Permissions can restrict whether they can change the role or company.

## Related information

[Profile object](devenv-profile-object.md)  
[Managing users and permissions](/dynamics365/business-central/ui-how-users-permissions)  
[Manage user settings and preferences](/dynamics365/business-central/admin-manage-user-settings-preferences)  
