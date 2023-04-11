---
title: Codeunits Functions and Variables
description: A codeunit is a container for C/AL code used for application objects. Place the code in the objects that calls the functions for simple application.
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: ba64befb-057a-4236-98f1-64093d5ef1e0
caps.latest.revision: 9
---
# Understanding Codeunits in Dynamics NAV
A codeunit is a container for C/AL code that you can use in many application objects. In simple applications, you can place the code in the object that calls the functions. For example, if you use C/AL code in pages, you can store the code in the page. However, as your application grows in both size and complexity, you will often find that you use the same functions more than once in many different objects. Instead of declaring the same functions repeatedly, you can use a codeunit to define them one time.  
  
## What You Can Define in Codeunits  
 In codeunits, you can define the following.  
  
|Codeunits|[!INCLUDE[bp_tabledescription](includes/bp_tabledescription_md.md)]|  
|---------------|---------------------------------------|  
|**Functions**|A function is a sequence of C/AL statements that you define to create new functionality.|  
|**Local Variables**|Within each function, you can define variables with scope that is limited to the function in which they are defined. These are known as local variables.|  
|**Global Variables**|A global variable is a variable whose scope covers all the functions in the codeunit.|  
|**Text Constants**|A text constant defines a read-only string that you use in your code. A text constant can have multiple values for different languages. You can define both global and local text constants.|  
  
## Codeunit Sections  
 Each function that you add to a codeunit is shown in a separate section when you view the file in the C/AL Editor. Every codeunit contains two default sections called **Documentation** and **OnRun**. In the **Documentation** section, you can add descriptive information, such as the purpose of the codeunit or a version number. In the **OnRun** section, you can include code that you want to be executed when the codeunit is run.  
  
 In addition to being a container for functions that can be run individually, a codeunit can itself be run by using \<*Codeunitname*>.Run. When you run a codeunit, the code in the **OnRun** section of the codeunit is executed.
