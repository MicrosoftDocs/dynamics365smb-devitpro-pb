---
title: "Locking and Unlocking Objects"
ms.custom: na
ms.date: 04/01/2021
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.assetid: 295f6231-82dd-4265-9942-97e7a3a5ee9f
caps.latest.revision: 10
manager: edupont
---
# Locking and Unlocking Objects
You can lock an object in Object Designer so that other developers cannot save design changes to the object. After you lock an object, the **Locked** field in Object Designer is selected, and the **Locked By** column shows the user who locked the object.  
  
 When an object is locked, another user can still do the following:  
  
-   Open the object in the designer, make changes, and compile the object. However, another user cannot save the object. The locked object is marked as **Read Only** when another user opens it in the designer.  
  
-   Run the object. For example, a user can run a table and can add or delete records in the table even if it is locked for design changes.  
  
 When you finish making design changes to an object, you can unlock it in Object Designer. The **Locked** and **Locked By** fields are cleared, and other users can now lock the object or save changes to the object.  
  
 You can select one object or multiple objects at the same time to lock or unlock. You can also set the **Auto-Lock on Design** option to automatically lock all objects that you open for designing.  
  
## Object Table  
 The information in the **Locked** and **Locked By** columns is stored in table 2000000001, the **Object** table. The **Object** table is a system table that stores information about objects in the application.  
  
## Concurrency Considerations  
 Even though you can lock objects, it is still possible for developers to have concurrency issues, as shown in the following examples.  
  
-   A developer opens an object in the designer but does not lock it. The developer makes several changes to the object and saves the changes periodically. At the same time, a second developer locks the object, and the first developer cannot save design changes to the object. The first developer gets an error message that the object is locked by the second developer.  
  
-   A developer locks an object. A second developer opens the locked object in read-only mode, and then the first developer unlocks the object. The second developer still cannot save design changes to the object even though the object is now unlocked because it is open in read-only mode. 

## To lock an object  
  
1.  In the [!INCLUDE[nav_dev_long](../developer/includes/nav_dev_long_md.md)], on the **Tools** menu, choose **Object Designer**.  
  
2.  In Object Designer, select one or more objects that are not already locked, and then do one of the following steps:  
  
    -   Right-click the object or objects, and then choose **Lock**.  
  
    -   On the **File** menu, choose **Lock**.  
  
    -   Press Ctrl+Alt+L.  

### To unlock an object  
  
1.  In the [!INCLUDE[nav_dev_long](../developer/includes/nav_dev_long_md.md)], on the **Tools** menu, choose **Object Designer**.  
  
2.  In Object Designer, select one or more objects that you have locked, and then do one of the following steps:  
  
    -   Right-click the object or objects, and then choose **Unlock**.  
  
    -   On the **File** menu, choose **Unlock**.  
  
    -   Press Ctrl+Alt+U.  
  
### To force unlock an object  
  
1.  In the [!INCLUDE[nav_dev_short](../developer/includes/nav_dev_short_md.md)], on the **Tools** menu, choose **Object Designer**.  
  
2.  In Object Designer, select one or more objects that you want to force unlock, and then do one of the following steps:  
  
    -   Right-click the object or objects, and then choose **Force Unlock**.  
  
    -   On the **File** menu, choose **Force Unlock**.  
  
3.  Confirm that you want to force unlock the object.  
  
    > [!NOTE]  
    >  You must have the SUPER user permission set to force unlock an object.  
  
### To unlock all objects that you have locked  
  
1.  In the [!INCLUDE[nav_dev_short](../developer/includes/nav_dev_short_md.md)], on the **Tools** menu, choose **Object Designer**.  
  
2.  In Object Designer, choose **All**.  
  
3.  On the **View** menu, choose **Table Filter**.  
  
4.  In the **Table Filter** window, enter **Locked By** in the **Field** field, enter your user name in the **Filter** field, and then choose **OK**.  
  
5.  On the **Edit** menu, choose **Select All**, and then do one of the following steps:  
  
    -   Right-click the object or objects, and then choose **Unlock**.  
  
    -   On the **File** menu, choose **Unlock**.  
  
    -   Press Ctrl+Alt+U.   
