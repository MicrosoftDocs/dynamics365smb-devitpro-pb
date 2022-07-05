---
title: "SaveValues Property"
description: "Sets whether user-specific control values are saved for this page."
ms.author: solsen
ms.custom: na
ms.date: 06/15/2022
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# SaveValues Property
> **Version**: _Available or changed with runtime version 1.0._

Sets whether user-specific control values are saved for this page.

## Applies to
-   Page
-   Request Page

[//]: # (IMPORTANT: END>DO_NOT_EDIT)


## Property Value  

**True** if user-defined control values are saved; otherwise, **false**. The default is **false**.  
  
## Remarks  

The **SaveValues** property enables the *Saved Settings* feature on the request page, which saves a predefined group of options for a page or request page. When this property is enabled, filters that users set on the request page will be stored in the database, in the `Page Data Personalization` table. As a result, the filters are still set the next time request page is opened.

Filters are only saved when the request page is closed after the user selects either **Print** or an action from the **Send To** menu. The filters aren't saved when the request page closes after the user selects **Preview** or **Cancel**.

You can later use the saved settings to consistently generate the same reports, XMLports, or batch jobs. For more information about users work with saved settings, see [Manage Saved Settings for Reports and Batch jobs](/dynamics365/business-central/reports-saving-reusing-settings) in the business functionality help.

> [!NOTE]
> Together with the [AllowScheduling Property](devenv-allowscheduling-property.md), this property also determines whether the report supports multiple previews. When both the **AllowScheduling** and **SaveValues** properties are set to **true**, users can preview the report from the request page as many times as the like, without having the request page close. This capability lets users change filters, see what the generated report will look like, and then try again. If either property is set to **false**, the report won't support multiple previews and the request page closes once the user previews the report. In this case, the request page includes a **Preview and Close** button instead of **Preview**.

## See Also

[Request Pages](../devenv-request-pages.md)  
[Properties](devenv-properties.md)  
[Manage Saved Settings for Reports and Batch jobs](/dynamics365/business-central/reports-saving-reusing-settings)  
[Using Saved Settings](/dynamics365/business-central/ui-work-report#SavedSettings)  
[AllowScheduling Property](devenv-allowscheduling-property.md) 
