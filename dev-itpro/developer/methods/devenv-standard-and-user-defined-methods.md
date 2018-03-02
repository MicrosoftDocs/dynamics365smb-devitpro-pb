---
title: "Standard and User-Defined Methods"
ms.custom: na
ms.date: 07/13/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamics365-financials
ms.assetid: 6e2a93c7-e6a0-429f-8118-54cd100ea342
caps.latest.revision: 17
manager: edupont
---

[!INCLUDE[newdev_dev_preview](../includes/newdev_dev_preview.md)]

# Standard and User-Defined Methods
To create an application in [!INCLUDE[d365fin_md](../includes/d365fin_md.md)], you must make database objects work together. You can use AL code to bind all the database objects together to form a unified whole.  

 When you design professional applications, you often need specialized methods. AL lets you create methods that extend the functionality of [!INCLUDE[d365fin_md](../includes/d365fin_md.md)]. You can create special methods for use anywhere in the database.  

 AL enables you to do the following:  

-   Design your own methods.  

-   Use standard, built-in methods.  

-   Connect database objects.  

-   Read, write, and modify data.  

## Designing Your Own Methods  
 Although [!INCLUDE[d365fin_md](../includes/d365fin_md.md)] has many built-in methods, you may want to create your own methods. For example, you will have to develop your own methods when the application that you develop repeatedly uses the same nontrivial processing.  

 We recommend the following guidelines when you want to create new methods and when you want to create parameters and local variables for a method:  

-   Do not move a block of code to a new method unless either the code is nontrivial and the new method is afterward called from more than one location, or the move is required to keep the code clear and manageable.  

-   Create only parameters that are required for the method to operate on different data, depending on where it is called from. If a method also changes a global variable, however, then we recommend that you transfer the global variable to the method to indicate that the method will change this variable.  

-   Use additional local variables just like you would use them in other development languages and environments.  

-   When you create a user-defined method, we recommend that you set the [Local Property](../properties/devenv-Local-Property.md) to **Yes** unless you want to access the method from outside the object. This makes the code easier to understand because it is clear that the method is not referenced from other objects.  

    > [!NOTE]  
    >  When you add a method, the Local property is set to **Yes** by default.  

> [!IMPORTANT]  
>  When you define your own methods, you can give two methods the same name. However, if one method is defined in a report or a page and the other is defined in a table that is referenced by the report or page, you cannot directly invoke the method defined in the report or page. By default, a call to the method invokes the method that is defined in the table. This behavior occurs when the method is called from a source expression or a trigger.  

## See Also  
 [Essential AL Methods](../devenv-Essential-AL-Methods.md)   
 [AL Method Reference](devenv-al-method-reference.md)
