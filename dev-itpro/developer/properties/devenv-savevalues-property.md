---
title: "SaveValues Property"
ms.author: solsen
ms.custom: na
ms.date: 05/03/2021
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
ms.service: "dynamics365-business-central"
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

This information is saved in the `Page Data Personalization` table.  

The **SaveValues** property enables the *Saved Settings* feature, that is, to save a predefined group of options for a page or request page. Filters are only saved for request pages. You can later use the saved settings to consistently generate the same reports, XMLports, or batch jobs. For more information, see [Manage Saved Settings for Reports and Batch jobs](/dynamics365/business-central/reports-saving-reusing-settings).
  
## See Also

[Properties](devenv-properties.md)  
[Manage Saved Settings for Reports and Batch jobs](/dynamics365/business-central/reports-saving-reusing-settings)  
[Using Saved Settings](/dynamics365/business-central/ui-work-report#SavedSettings)  
