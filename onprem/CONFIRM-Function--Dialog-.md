---
title: "CONFIRM Function (Dialog)"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: cb44f98b-c4e6-44f0-a6af-030e7594cc8f
caps.latest.revision: 15
---
# CONFIRM Function (Dialog)
Creates a dialog box that prompts the user for a yes or no answer. The dialog box is centered on the screen.  

## Syntax  

```  

Ok := Dialog.CONFIRM(String [, Default] [, Value1] ,...)  
```  

#### Parameters  
 *String*  
 Type: Code or text constant  

 Specifies the string that is displayed in the dialog box. Use a backslash \(\\\) to indicate a new line. The string can be a text constant that is enabled for multilanguage functionality. For more information, see [Multilanguage Development](Multilanguage-Development.md).  

 *Default*  
 Type: Boolean  

 Specifies the default button. If you do not specify a default button, then **No** is used as the default button.  

 *Value1, …*  
 Type: Any  

 Any type of constant or C/AL variable that you want to insert into *String*. You can insert up to 10 values.  

## Property Value/Return Value  
 Type: Boolean  

 **true** if you entered **Yes**; otherwise, **false**.  

 This return parameter reflects the user's selection.  

## Remarks  
 The message window is automatically sized. The height of the window corresponds to the number of lines and the width corresponds to the length of the longest line.  

 We recommend that you always end CONFIRM messages with a question mark. For more information about best practices for end-user messages, see [Progress Windows, MESSAGE, ERROR, and CONFIRM Functions](Progress-Windows--MESSAGE--ERROR--and-CONFIRM-Functions.md).  

## Example  
 In the following example, the Dialog.CONFIRM function prompts the user for a **Yes** or **No** answer. This code example requires that you create the following variables.  

|Name|DataType|  
|----------|--------------|  
|Question|Text|  
|Answer|Boolean|  
|CustomerNo|Integer|  

 This code example requires that you create the following text constants in the **C/AL Globals** window.  

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

 If you select the default **Yes** value, then the second dialog box is shown:  

 **You selected Yes.**  

## See Also  
 [Dialog Data Type](Dialog-Data-Type.md)
