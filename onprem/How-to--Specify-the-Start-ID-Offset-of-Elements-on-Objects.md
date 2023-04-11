---
title: "How to: Specify the Start ID Offset of Elements on Objects"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 36384b42-b80e-4d78-9af7-735f47b0f7e2
caps.latest.revision: 5
---
# How to: Specify the Start ID Offset of Elements on Objects
You can specify a start ID for new objects so that elements on these new objects have IDs that are offset by the number that you specified. For example, you can specify a start ID of 1000 and then create a new page. The first element that you create on the page, for example, a Container control, has ID 1000. The next element that you create on the page, for example, a Group control, has ID 1001. The ID of each element on the page is incremented by 1, starting with the offset that you specified. If you create variables or text constants on the page, then the first variable or text constant has ID 1000. The ID of each variable or text constant that you create is incremented by 1, starting with the offset that you specified. If you create functions on the page, then they start with ID 1000. Parameters, return value, local variables, and local text constants of a function start with ID 1000.  
  
> [!NOTE]  
>  In earlier versions of [!INCLUDE[navnow](includes/navnow_md.md)], you specified the start ID offset by using the **GetUidOffset** function in codeunit 1.  
  
 You can use the start ID to identify a set of elements in your application, for example, to identify the elements in a country/region-specific version. When you merge changes from different country/region-specific versions, having different start IDs lets you easily identify the country/region-specific version for each element.  
  
 If you do not specify a start ID, then the IDs are determined by your license.  
  
### To specify the start ID  
  
1.  In the [!INCLUDE[nav_dev_short](includes/nav_dev_short_md.md)], on the **File** menu, choose **Database**, and then choose **Alter**.  
  
2.  In the **Alter Database** window, select the **Advanced** tab.  
  
3.  On the **Advanced** tab, under **Designer**, in the **Start ID \(UidOffset\)** text box, enter an integer, and then choose the **OK** button.  
  
    > [!IMPORTANT]  
    >  We recommend that you specify a start ID that is greater than or equal to 1000. If you specify a start ID that is less than 1000, then variables and text constants on the object have a starting offset of 1000, not the value that you specified. Other elements on the object have the starting offset that you specified.  
  
4.  Create a new table, page, report, codeunit, query, or XMLport. The IDs of the elements on that object are offset by the number that you specified.  
  
    > [!NOTE]  
    >  To view the ID of an element, select the element in the designer, and then on the **View** menu, choose **Properties**.  
  
## See Also  
 [Altering Databases - Advanced Tab](Altering-Databases---Advanced-Tab.md)
