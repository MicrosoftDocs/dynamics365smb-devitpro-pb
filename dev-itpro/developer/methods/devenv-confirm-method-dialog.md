---
title: "CONFIRM Method (Dialog)"
ms.custom: na
ms.date: 07/04/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamics365-financials
ms.assetid: cb44f98b-c4e6-44f0-a6af-030e7594cc8f
author: SusanneWindfeldPedersen
---

[!INCLUDE[newdev_dev_preview](../includes/newdev_dev_preview.md)]

# CONFIRM Method (Dialog)
Creates a dialog box that prompts the user for a **true** or **false** answer. The dialog box is centered on the screen.  

## Syntax  

```  

Ok := Dialog.CONFIRM(String [, Default] [, Value1] ,...)  
```  

#### Parameters  
 *String*  
 Type: Code or text constant  

 Specifies the string that is displayed in the dialog box. Use a backslash \(\\\) to indicate a new line. The string can be a text constant that is enabled for multilanguage functionality. For more information, see [Multilanguage Development](../devenv-multilanguage-development.md).  

 *Default*  
 Type: Boolean  

 Specifies the default button. If you do not specify a default button, then **false** is used as the default button.  

 *Value1, …*  
 Type: Any  

 Any type of constant or AL variable that you want to insert into *String*. You can insert up to 10 values.  

## Property Value/Return Value  
 Type: Boolean  

 **True** if you entered **true**; otherwise, **false**.  

 This return parameter reflects the user's selection.  

## Remarks  
 The message window is automatically sized. The height of the window corresponds to the number of lines and the width corresponds to the length of the longest line.  

 We recommend that you always end CONFIRM messages with a question mark. For more information about best practices for end-user messages, see [Progress Windows, MESSAGE, ERROR, and CONFIRM Methods](../devenv-progress-windows-message-error-and-confirm-methods.md).  

## Example  
 In the following example, the Dialog.CONFIRM method prompts the user for a **true** or **false** answer. This code example requires that you create the following variables.  

|Name|DataType|  
|----------|--------------|  
|Question|Text|  
|Answer|Boolean|  
|CustomerNo|Integer|  

 This code example requires that you create the following text constants.  

|Name|ConstValue|  
|----------|----------------|  
|Text000|Exit without saving changes to customer %1?|  
|Text001|You selected %1.|  

```  
CustomerNo := 01121212;  
Question := Text000;  
Answer := Dialog.CONFIRM(Question, TRUE, CustomerNo);  
MESSAGE(Text001, Answer);  
```  

 The first dialog box shows:  

 **Exit without saving changes to customer 1121212?**  

 If you select the default **true** value, then the second dialog box is shown:  

 **You selected true.**  

## See Also  
 [Dialog Data Type](../datatypes/devenv-Dialog-Data-Type.md)
