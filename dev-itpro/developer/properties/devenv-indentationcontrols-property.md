---
title: "IndentationControls Property"
ms.custom: na
ms.date: 06/14/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.assetid: e2e75702-bc56-4c5b-a3b9-ac7d223808c4
caps.latest.revision: 15
author: SusanneWindfeldPedersen
---

 

# IndentationControls Property
Sets which columns (controls) are indented in a list.  
  
## Applies To  
  
-   Repeater subtype controls on page  
  
## Remarks  
 The **Indentation Controls** property lets you choose which columns are indented under a group control on a List page.
  
 > [!IMPORTANT]  
>  When indentation is specified, it is no longer possible to use sorting on the columns in the repeater control.  
  
> [!NOTE]  
>  [!INCLUDE[d365fin_web_md](../includes/d365fin_web_md.md)] supports indentation on one column only. If you specify more than one column in the IndentationControls property, only the first column is used when the page is displayed in [!INCLUDE[d365fin_web_md](../includes/d365fin_web_md.md)].  
  
## See Also  
 [IndentationColumnName Property](devenv-indentationcolumnname-property.md)