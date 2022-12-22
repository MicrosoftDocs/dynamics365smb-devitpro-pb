---
title: Troubleshooting profile configuration can't be started
description: Learn how to troubleshoot issues with profile configuration.
author: SusanneWindfeldPedersen
ms.author: solsen
ms.reviewer: solsen
ms.service: dynamics365-business-central
ms.topic: troubleshooting
ms.date: 12/22/2022
ms.custom: bap-template
---

# Troubleshooting profile configuration can't be started

When there are issues preventing the profile configuration in [!INCLUDE [prod_short](includes/prod_short.md)], the user will get an error message, and not be able to start the profile configuration. When the configuration is started, all customization records are loaded and compiled together. If one of these records causes a compilation error, then the profile configuration can't be started.

## Symptoms

The user sees the following error message "Sorry, something went wrong and personalization could not be started. Please try again later, or contact your system administrator."

## Resolution

As a tenant administrator, you can do the following to mitigate the issue. The steps below describe how to remove the profile configurations with errors. The alternative resolution is described in the next section.

> [!NOTE]  
> The following steps will delete records with compilation errors and the specific profile configuration will be deleted. It's recommended to take a screenshot of any configuration done, before deleting them.

1. In [!INCLUDE[prod_short](includes/prod_short.md)], in the **Tell Me** box, enter **Profiles**, and then choose the related link.
1. Select the profile card of the profile that can't be customized, and then choose **Manage customized pages**.
1. Select the **Troubleshoot** button.  
  You'll now get the list of all records that contain errors. These records must be fixed or removed to unblock the user.
1. Select the **Manage** action to delete the profile configurations with errors.

## Alternative resolution

From [!INCLUDE [prod_short](includes/prod_short.md)] version 16.2 it's possible to try to mitigate the issue by forcing and export of the profile, fixing the issue, and then reimport the profile. 

1. In [!INCLUDE[prod_short](includes/prod_short.md)], in the **Tell Me** box, enter **Profiles**, and then choose the related link.
1. Select the **Export Profiles** button, and select **Yes** when prompted.
  This will download the AL code related to **all** profiles on the tenant.
2. Unzip the profile package that you downloaded and open the AL file for the page customization that contains the issue.  
  **Note:** The page customization name follows this pattern: `PageCustomization.<target-page-name>.Configuration<id>.al`. Based on the diagnostics from the troubleshooting page, or by moving the page customization AL code into an AL app in order to benefit from the compiler diagnostic, locate the code block that is causing the issue and remove it.
3. Create a new .zip file with the fixed page customization.
1. Return to the **Profile List** page and select the **Import Profiles** button.
1. Follow the wizard's instruction and, when prompted, select the profile that was fixed in the list of profiles to import.
1. Return to the list of customized pages for this profile and verify that no errors are reported anymore.