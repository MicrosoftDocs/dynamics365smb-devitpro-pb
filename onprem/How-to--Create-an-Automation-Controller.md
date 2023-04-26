---
title: Automation Controller
description: By using variables that have Automation data type, an Automation controller implements and runs Automation objects from an Automation server.
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: cc53dd13-0c5d-4cea-8b1a-4e32c3188648
caps.latest.revision: 18
---
# Creating Automation Controller in Dynamics NAV
To implement Automation in [!INCLUDE[navnow](includes/navnow_md.md)], create an Automation controller in C/AL code of the [!INCLUDE[navnow](includes/navnow_md.md)] object. By using variables that have an Automation data type, an Automation controller implements and runs Automation objects from an Automation server. This topic outlines the procedure for creating an Automation controller.  
  
### To create an Automation controller that uses an Automation server  
  
1.  Declare the top-level interface of the Automation server as a variable of the data type Automation.  
  
2.  Declare all other objects and interfaces \(classes\) as variables of the Automation data type.  
  
3.  Call the C/AL CREATE function on the variable that you declared in step 1 as shown in the following code:  
  
    ```  
    CREATE(AutomationVariable [,True|False] ,True)  
    ```  
  
     The last parameter must be set to **True** so that the automation controller targets the [!INCLUDE[nav_windows](includes/nav_windows_md.md)].  
  
    > [!NOTE]  
    >  You can also use define a Boolean type variable instead of setting the parameter to **True**. The variable must evaluate to **True** for the controller to be created at run time. If variable evaluates to **False**, then you will see an error at run time.  
  
     For more information, see [CREATE Function \(Automation\)](CREATE-Function--Automation-.md).  
  
4.  Use the methods and properties of the Automation server in your C/AL code.  
  
5.  If needed, use the CLEAR function \(destroy\) for the top-level object. Otherwise, it will be cleared automatically when the variable goes out of scope.  
  
 You write most of your code during step 4 by using the methods and the properties of the Automation server. The syntax and the semantics of these methods and properties are documented in the documentation for each Automation server. Using these methods and properties in C/AL does not require any new or changed syntax.  
  
 For examples of creating an Automation controller, see [Walkthrough: Using Automation to Write a Letter in Microsoft Office Word](Walkthrough--Using-Automation-to-Write-a-Letter-in-Microsoft-Office-Word.md) and [Walkthrough: Using Automation to Create a Graph in Microsoft Excel](Walkthrough--Using-Automation-to-Create-a-Graph-in-Microsoft-Excel.md).  
  
## See Also  
 [Extending Microsoft Dynamics NAV Using COM](Extending-Microsoft-Dynamics-NAV-Using-COM.md)   
 [Using COM Technologies in Microsoft Dynamics NAV](Using-COM-Technologies-in-Microsoft-Dynamics-NAV.md)   
 [COM Overview](COM-Overview.md)   
 [Best Practices for Using Automation with the Microsoft Dynamics NAV Windows Client](Best-Practices-for-Using-Automation-with-the-Microsoft-Dynamics-NAV-Windows-Client.md)
