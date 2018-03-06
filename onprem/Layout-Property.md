---
title: "Layout Property"
ms.custom: na
ms.date: 15/02/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
author: jswymer
---
# Layout Property
The Layout property serves two purposes:

-   In a field GridLayout, it specifies whether the fields in Group controls are arranged horizontally (as a row) or vertically (as a column). For more information, see  [How to: Arrange Fields in Rows and Columns Using the GridLayout Control](How-to--Arrange-Fields-in-Rows-and-Columns-Using-the-GridLayout-Control.md).

-   In a Cue group, it specifies whether the Cues are displayed in the wide layout. With the wide layout, instead of displaying as tiles, Cues display as large numbers, where each Cue group extends the entire with of the workspace. For more, see  [Creating and Customizing Cues](Creating-and-Customizing-Cues.md). 
  
## Applies To  
  
-   **Group** controls that have the subtype **GridLayout** or **CueGroups** on pages.  
  
## Property Values  

**GridLayout subtype control**  
|Value|[!INCLUDE[bp_tabledescription](includes/bp_tabledescription_md.md)]|  
|-----------|---------------------------------------|  
|**Rows**|Arranges fields within Group controls in rows.|  
|**Columns**|Arranges fields within Group controls in columns. |  
|**Undefined**|This is the default setting, and does the same as the **Columns** setting.|  

**CueGroup subtype control**  
|Value|[!INCLUDE[bp_tabledescription](includes/bp_tabledescription_md.md)]|  
|-----------|---------------------------------------|  
|**Undefined**|Cues in the group display as tiles. This is the default setting.|
|**Wide**|Cues in the group display in the wide layout.<br /><br />**Note:** This is only supported in the [!INCLUDE[nav_web](includes/nav_web_md.md)]. |  

## Remarks
The **Wide** value has no effect on CueGroups that contain only Actions. 
  
## See Also  
[How to: Arrange Fields in Rows and Columns Using the GridLayout Control](How-to--Arrange-Fields-in-Rows-and-Columns-Using-the-GridLayout-Control.md)   
[Creating and Customizing Cues](Creating-and-Customizing-Cues.md)  