---
title: "Recommended Usage of GridLayout and FixedLayout"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 808b24d8-8db4-49fb-a057-518b96ac220b
caps.latest.revision: 5
---
# Recommended Usage of GridLayout and FixedLayout
This topic explains some important guidelines for working with the GridLayout and FixedLayout controls. For more information about GridLayout, see [How to: Arrange Fields in Rows and Columns Using the GridLayout Control](How-to--Arrange-Fields-in-Rows-and-Columns-Using-the-GridLayout-Control.md). For more information about FixedLayout, see [Arranging Fields in Rows and Columns Using a FixedLayout Control](Arranging-Fields-in-Rows-and-Columns-Using-a-FixedLayout-Control.md).  
  
## Required Structure Using a GridLayout or FixedLayout Control  
 For both the GridLayout and the FixedLayout controls, the following illustration shows the structure that is required to get the layout results that you expect.  
  
 ![The required structure of a GridLayout control](media/PageGridLayout_structure.png "PageGridLayout\_structure")  
  
-   The GridLayout and the FixedLayout control must be placed in a Group control in a ContentArea subtype. The Group control does not have to be the first group under the ContentArea.  
  
    > [!IMPORTANT]  
    >  If the GridLayout or FixedLayout control is not placed in a Group control, it will inherit properties as if it were a typical Group control and none of the GridLayout or FixedLayout properties will apply to it.  
  
-   The GridLayout or FixedLayout control must have Group controls as direct children and Field controls as children of those Group controls.  
  
    > [!IMPORTANT]  
    >  If this structure is not in place, the Field controls will not be displayed.  
  
### Supported Control Types for a GridLayout Control  
 The GridLayout control is supported on all page types and for a selected range of control types. The following table lists the types of controls that can be nested in a GridLayout control.  
  
> [!TIP]  
>  Although nesting groups such as Group, FixedLayout, and GridLayout is possible, we do not recommend it because of lower UI performance and less optimal layout.  
  
|Control Type|Control Subtype|  
|------------------|---------------------|  
|Fields||  
|Groups|Group|  
||Repeater|  
||CueGroups|  
||FixedLayout|  
||GridLayout|  
|Part|Page|  
  
 The following table lists the types of controls that are not supported in a GridLayout control.  
  
|Control Type|Control Subtype|  
|------------------|---------------------|  
|Add-Ins||  
|Parts|Chart Parts|  
||System Parts|  
|Containers \(level 0 is supported\)||  
  
## See Also  
 [How to: Arrange Fields in Rows and Columns Using the GridLayout Control](How-to--Arrange-Fields-in-Rows-and-Columns-Using-the-GridLayout-Control.md)   
 [How to: Arrange Page Fields in Rows and Columns Using a FixedLayout Control](How-to--Arrange-Page-Fields-in-Rows-and-Columns-Using-a-FixedLayout-Control.md)