---
title: "How to: Lock an Object"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: bc2d3bb2-9e29-4cec-8cc6-c12faa9c358e
caps.latest.revision: 11
---
# How to: Lock an Object
You can lock objects so that other developers cannot save changes to the objects. You can either lock objects manually, or you can set an option so that all objects that you open for design are locked.  
  
### To manually lock an object  
  
1.  In the [!INCLUDE[nav_dev_long](includes/nav_dev_long_md.md)], on the **Tools** menu, choose **Object Designer**.  
  
2.  In Object Designer, select one or more objects that are not already locked, and then do one of the following steps:  
  
    -   Right-click the object or objects, and then choose **Lock**.  
  
    -   On the **File** menu, choose **Lock**.  
  
    -   Press Ctrl+Alt+L.  
  
### To automatically lock all objects that you open for design  
  
1.  In the [!INCLUDE[nav_dev_short](includes/nav_dev_short_md.md)], on the **Tools** menu, choose **Options**.  
  
2.  In the **Options** window, in the **Auto-Lock on Design** field, enter **Yes**, and then choose **OK**.  
  
    > [!TIP]  
    >  You cannot automatically unlock objects that you have locked. However, you can filter for locked objects, select all objects that you have locked, and then unlock these objects. For more information, see [How to: Unlock an Object](How-to--Unlock-an-Object.md).  
  
    > [!NOTE]  
    >  If you go to the definition of an object, then the object is opened in design mode. Therefore, if you set the **Auto-Lock on Design** field and then go to the definition of an object, then the object is locked. For more information, see [Viewing the Definition of a Function or Object by Using Go To Definition](Viewing-the-Definition-of-a-Function-or-Object-by-Using-Go-To-Definition.md).  
  
## See Also  
 [How to: Unlock an Object](How-to--Unlock-an-Object.md)   
 [Locking and Unlocking Objects](Locking-and-Unlocking-Objects.md)
