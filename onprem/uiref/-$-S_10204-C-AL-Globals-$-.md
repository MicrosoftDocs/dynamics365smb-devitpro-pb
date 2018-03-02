---
title: "C/AL Globals"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 13a27442-9682-4007-97dd-bbea133d0996
caps.latest.revision: 17
manager: edupont
---
# C/AL Globals
Declares global variables, text constants, and functions in [!INCLUDE[navnow](../includes/navnow_md.md)]. The scope of the global variables, text constants, and functions is limited to the object.  

 To open this window, on the **Tools** menu, choose **Object Designer**. In Object Designer, choose **Table**, **Page**, **Report**, **Codeunit**, **Query** or **XMLport**, choose the **Design** button, and then on the **View** menu, choose **C/AL Globals**.  

## Variables Tab  
 You can declare global user-defined variables or system-defined variables. For more information about variables, see [C/AL Variables](../C-AL-Variables.md).  

|[!INCLUDE[bp_tablefield](../includes/bp_tablefield_md.md)]|[!INCLUDE[bp_tabledescription](../includes/bp_tabledescription_md.md)]|  
|---------------------------------|---------------------------------------|  
|**Name**|The name of the variable. **Tip:**  When you create a variable that has the **DataType** of **Codeunit**, **Page**, **Testpage**, **Report**, **Query**, or **XMLport**, you do not have to manually add a value to the **Name** field. If you just set the **DataType** and **SubType** fields, then the **Name** field will be automatically generated when you leave the line. The generated name is based on the name that is assigned to the associated [!INCLUDE[navnow](../includes/navnow_md.md)] object. You can change the generated name as you like.|  
|**DataType**|The data type that is applied to the variable. For more information, see [C/AL Data Types](../C-AL-Data-Types.md).|  
|**SubType**|The type of data that is stored in a variable. **SubType** contains additional information about a data type. For example, a Report data type might have the **Customer** table as a subtype.|  
|**Length**|The length of the characters in the field. This applies to Code and Text. For example, a Text data type might have a length of 100.|  

## Text Constants Tab  
 A text constant is a character string that is declared to enable translation of messages into other languages.  

|[!INCLUDE[bp_tablefield](../includes/bp_tablefield_md.md)]|[!INCLUDE[bp_tabledescription](../includes/bp_tabledescription_md.md)]|  
|---------------------------------|---------------------------------------|  
|**Name**|The name of the text constant.|  
|**ConstValue**|The value of the character string that is declared as a constant. You can open the **Multilanguage Editor** window by choosing the **AssistEdit** button in the **ConstValue** field.|  

## Functions Tab  

|[!INCLUDE[bp_tablefield](../includes/bp_tablefield_md.md)]|[!INCLUDE[bp_tabledescription](../includes/bp_tabledescription_md.md)]|  
|---------------------------------|---------------------------------------|  
|**Name**|The name of the function.|  
|**Locals** button|Opens the **C/AL Locals** window. The window contains parameters, return values, variables, and text constants that are declared for local functions or triggers. For more information, see [C-AL Locals](-$-S_10205-C-AL-Locals-$-.md).|  

## See Also  
 [C-AL Locals](-$-S_10205-C-AL-Locals-$-.md)
