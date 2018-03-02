---
title: Add Function to Codeunit
description: To add a function to a codeunit in Microsoft Dynamics NAV, access the C/AL Editor, and follow the step by step procedure as described in this article.
ms.custom: na
ms.date: 11/02/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: ca45e3a6-48a9-43b2-a6bd-81cf09298c8b
caps.latest.revision: 11
manager: edupont
---
# How to Add a Function to a Codeunit in Dynamics NAV
To add a function to a codeunit, use the following procedure.  
  
### To add a function  
  
1.  Select the C/AL Editor, choose **View**, and then choose **C/AL Globals**.  
  
    > [!NOTE]  
    >  For more information about how to open the C/AL Editor, see [How to: Modify an Existing Codeunit](How-to--Modify-an-Existing-Codeunit.md).  
  
2.  In the **C/AL Globals** window, choose the **Functions** tab.  
  
3.  Enter a name for each function that you want to add.  
  
4.  Choose **Locals** to define the parameters, return value, local variables, and text constants in the **C/AL Locals** window.  
  
5.  In the **C/AL Locals** window, choose the **Parameters** tab and specify the calling method, name, and data type of each parameter. You can also specify a subtype and a length, but this is optional.  
  
     To specify the calling method of a parameter, either select or clear the **Var** check box. If you select the **Var** check box, then the parameter is passed by reference rather than by value. The value of a variable can only be changed by a function when it is passed to the function by reference. When the parameter is not specified as Var, only a copy of the variable is passed to the function. If the function changes that value, the change only affects the copy and not the variable itself.  
  
     If the type that you select corresponds to an application object, then you must also add a subtype, that is, the name of a specific object in the database. If you select Text or Code data types, then you must define a length. The default length is 10 characters for Code and 30 characters for Text.  
  
6.  In the **C/AL Locals** window, choose the **Return Value** tab and specify the return value for your new function. Enter a name for the return value and select a data type from the drop-down list. If the data type is Text or Code, then you can also select a length.  
  
7.  In the **C/AL Locals** window, choose the **Variables** tab and define local variables.  
  
     For each local variable, you must enter a name and select a data type. If the data type that you select corresponds to an application object, then you must also add a subtype, that is, the name of a specific object in the database. If you select Text or Code data types, then you must define a length for the variable. The default length is 10 characters for Code and 30 characters for Text.  
  
8.  In the **C/AL Locals** window, choose the **Text Constants** tab and define text constants for the function.  
  
## See Also  
 [Codeunits](Codeunits.md)