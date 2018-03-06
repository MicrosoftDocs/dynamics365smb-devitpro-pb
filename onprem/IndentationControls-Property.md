---
title: "IndentationControls Property"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: e2e75702-bc56-4c5b-a3b9-ac7d223808c4
caps.latest.revision: 15
manager: edupont
---
# IndentationControls Property
Sets which columns \(controls\) are indented in a list.  
  
## Applies To  
  
-   Repeater subtype controls on page  
  
## Remarks  
 To access the **Indent Controls** window, select a **Group** container in Page Designer and then view properties. The **Indentation Controls** property lets you choose which columns are indented under a group control on a List page. Choose the **Assistbutton** to open the **Indent Controls** window. In the **Indent Controls** window, you can see all the field controls that are under a **Group** container on a List page.  
  
 Define which columns you want to indent by selecting the appropriate field control in the **Indentation** column. Choose the **OK** button and the selected fields appear as comma-separated values in the **Value** column of the IndentationControls property in the **Properties** window.  
  
> [!IMPORTANT]  
>  When indentation is specified, it is no longer possible to use sorting on the columns in the repeater control.  
  
> [!NOTE]  
>  [!INCLUDE[nav_web](includes/nav_web_md.md)] supports indentation on one column only. If you specify more than one column in the IndentationControls property, only the first column is used when the page is displayed in [!INCLUDE[nav_web](includes/nav_web_md.md)].  
  
## See Also  
 [IndentationColumnName Property](IndentationColumnName-Property.md)