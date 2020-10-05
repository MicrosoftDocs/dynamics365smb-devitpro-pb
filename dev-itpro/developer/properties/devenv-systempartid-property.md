---
title: "SystemPartID Property"
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.assetid: 9260df18-1ba9-415d-8f6e-18b601564ffa
caps.latest.revision: 5
author: SusanneWindfeldPedersen
---

# SystemPartID Property
Sets pre-defined system parts.  
  
## Applies to  
  
-   Part control on a page  

## Property Value  

|  Value | Description |
|--------|-------------|
|  Links | Allows the user to add links to a URL or path on the record shown in the page. For example, on an Item card, a user can add a link to the supplier's item catalog. The links will appear with the record when it is viewed. When a user chooses a link, the target file opens.|
|  Notes | Allows the user to write a note on a record shown in the page. For example, when creating a sales order, a user can add a note about the order. The note will appear with the item when it is viewed.|
|  MyNotes | Displays notes to the current user that were targeted by other user's.|
|  Outlook | Displays the user's Outlook inbox.|

> [!NOTE] 
> The `Outlook` and `MyNotes` values are only supported by the [!INCLUDE[nav_windows_md](../includes/nav_windows_md.md)] (which has been deprecated after [!INCLUDE[prodshort](../includes/prodshort.md)] Spring 2019). These values are ignored in the [!INCLUDE[nav_web_md](../includes/nav_web_md.md)].

## Remarks

You add system parts to a FactBox on a page. For more information, see [Adding a FactBox to a Page](../devenv-adding-a-factbox-to-page.md).

## See Also

 [PartType Property](devenv-parttype-property.md)   
 [PagePartID Property](devenv-pagepartid-property.md)   
 [ChartPartID Property](devenv-chartpartid-property.md)  
 [Manage Attachments, Links, and Notes on Cards and Documents](/dynamics365/business-central/ui-how-add-link-to-record)