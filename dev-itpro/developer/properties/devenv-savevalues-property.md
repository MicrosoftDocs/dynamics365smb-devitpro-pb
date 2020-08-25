---
title: "SaveValues Property"
ms.custom: na
ms.date: 04/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---

# SaveValues Property
Sets whether user-specific control values are saved for this page.  
  
## Applies to  
  
- Pages
- Report request page  
- XMLport request page
  
## Property Value  

**True** if user-defined control values are saved; otherwise, **false**. The default is **false**.  
  
## Remarks  

This information is saved in the `Page Data Personalization` table.  

The **SaveValues** property enables the *Saved Settings* feature, that is, to save a predefined group of options and filters for a page or request page. You can later use the saved settings to consistently generate the same reports, XMLports, or batch jobs. For more information, see [Manage Saved Settings for Reports and Batch jobs](https://docs.microsoft.com/en-us/dynamics365/business-central/reports-saving-reusing-settings).
  
## See Also

[Properties](devenv-properties.md)  
[Manage Saved Settings for Reports and Batch jobs](https://docs.microsoft.com/en-us/dynamics365/business-central/reports-saving-reusing-settings)  
[Using Saved Settings](https://docs.microsoft.com/en-us/dynamics365/business-central/ui-work-report#SavedSettings)