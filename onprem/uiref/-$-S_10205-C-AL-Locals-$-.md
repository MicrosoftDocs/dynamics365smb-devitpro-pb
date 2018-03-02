---
title: "C/AL Locals"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 63bae1c8-df42-455f-b07a-1bf6ea52ec2c
caps.latest.revision: 16
manager: eliotgra
---
# C/AL Locals
Declares local variables and text constants in [!INCLUDE[navnow](../includes/navnow_md.md)]. Local variables can only exist in the scope of triggers or functions. For more information about variables, see [C/AL Variables](../C-AL-Variables.md).  

 To open this window, on the **Tools** menu, choose **Object Designer**, choose **Codeunit**, and then on the **View** menu, choose **C/AL Locals**.  

 You can also open the **C/AL Globals** window, choose the **Functions** tab, and then choose the **Locals** button. For more information about how to open the **C/AL Globals** windows, see [C-AL Globals](-$-S_10204-C-AL-Globals-$-.md).  

## Parameters Tab  

|[!INCLUDE[bp_tablefield](../includes/bp_tablefield_md.md)]|[!INCLUDE[bp_tabledescription](../includes/bp_tabledescription_md.md)]|  
|---------------------------------|---------------------------------------|  
|**Var**|The parameter is either passed by value or by reference.|  
|**Name**|The name of the parameter. **Tip:**  When you create a parameter that has the **DataType** of **Codeunit**, **Page**, **Testpage**, **Report**, **Query**, or **XMLport**, you do not have to manually add a value to the **Name** field. If you just set the **DataType** and **SubType** fields, then the **Name** field will be automatically generated when you leave the line. The generated name is based on the name that is assigned to the associated [!INCLUDE[navnow](../includes/navnow_md.md)] object. You can change the generated name as you like.|  
|**DataType**|The data type of the parameter.|  
|**SubType**|Additional information about the parameter. For example, a Page data type may have a table as the subtype.|  
|**Length**|The length of the parameter. For example, if the parameter is a Text DataType, then the text might have a length of 50.|  

## Return Value Tab  

|[!INCLUDE[bp_tablefield](../includes/bp_tablefield_md.md)]|[!INCLUDE[bp_tabledescription](../includes/bp_tabledescription_md.md)]|  
|---------------------------------|---------------------------------------|  
|**Name**|The name of the return value.|  
|**Return Type**|The data type of the return value.|  
|**Length**|The length of the return value. For example, if the return value is a Text DataType, the text might have a length of 50.|  

## Variables Tab  
 You can declare local user-defined variables.  

|[!INCLUDE[bp_tablefield](../includes/bp_tablefield_md.md)]|[!INCLUDE[bp_tabledescription](../includes/bp_tabledescription_md.md)]|  
|---------------------------------|---------------------------------------|  
|**Name**|The name of the variable. **Tip:**  When you create a variable that has the **DataType** of **Codeunit**, **Page**, **Testpage**, **Report**, **Query**, or **XMLport**, you do not have to manually add a value to the **Name** field. If you just set the **DataType** and **SubType** fields, then the **Name** field will be automatically generated when you leave the line. The generated name is based on the name that is assigned to the associated [!INCLUDE[navnow](../includes/navnow_md.md)] object. You can change the generated name as you like.|  
|**DataType**|The data type of the variable. For more information, see [C/AL Data Types](../C-AL-Data-Types.md).|  
|**SubType**|The type of data that is stored in a variable. **SubType** contains additional information about a data type. For example, a Report data type might have the **Customer** table as a subtype.|  
|**Length**|The length of the characters in the field. For example, a Text data type might have a length of 100. This applies to Code and Text data types.|  

## Text Constants Tab  
 A text constant is a character string that is declared to enable translation of messages into other languages.  

|[!INCLUDE[bp_tablefield](../includes/bp_tablefield_md.md)]|[!INCLUDE[bp_tabledescription](../includes/bp_tabledescription_md.md)]|  
|---------------------------------|---------------------------------------|  
|**Name**|The name of the text constant.|  
|**ConstValue**|The value of the character string that is declared as a constant. You can open the **Multilanguage Editor** window by choosing the **AssistEdit** button in the **ConstValue** field.|  

## See Also  
 [C-AL Globals](-$-S_10204-C-AL-Globals-$-.md)
