---
title: "Locking and Unlocking Objects"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
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
  
## See Also  
 [How to: Lock an Object](How-to--Lock-an-Object.md)   
 [How to: Unlock an Object](How-to--Unlock-an-Object.md)