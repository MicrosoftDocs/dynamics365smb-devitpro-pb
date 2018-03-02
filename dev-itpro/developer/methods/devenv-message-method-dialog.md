---
title: "MESSAGE Method (Dialog)"
ms.custom: na
ms.date: 07/13/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamics365-financials
ms.assetid: 68a78e4f-d6f2-4286-8e7b-d5ba27705f9e
caps.latest.revision: 14
manager: edupont
---

[!INCLUDE[newdev_dev_preview](../includes/newdev_dev_preview.md)]

# MESSAGE Method (Dialog)
Displays a text string in a message window.  
  
## Syntax  
  
```  
  
MESSAGE(String [, Value1, …])  
```  
  
#### Parameters  
 *String*  
 Type: Code or text constant  
  
 This string contains the text you want the system to display in the message window. Use a backslash \(\\\) to start a new line. Use percent signs \(%\) to insert variable values into the string. Place the percent where you want the system to substitute the variable value. The string can be a text constant that is enabled for multilanguage functionality. For more information, see [Multilanguage Development](../devenv-multilanguage-development.md).  
  
 *Value1, …*  
 Type: Any  
  
 Any type of AL variable you want to insert into String. You can insert up to 10 values.  
  
## Remarks  
 When a message statement in the AL code is executed, the message is not immediately displayed. Instead, it is displayed after the AL code is finished executing or after the AL code pauses to wait for user interaction.  
  
 The window is automatically sized to hold the longest line of text and the total number of lines.  
  
 For NAS sessions or [!INCLUDE[d365fin_md](../includes/d365fin_md.md)] sessions \(including NAS\) that are started by the [STARTSESSION Method \(Sessions\)](devenv-STARTSESSION-Method-Sessions.md), messages are recorded in the event log of the computer that is running [!INCLUDE[d365fin_server_md](../includes/d365fin_server_md.md)]. The message entries have the ID 100 and type Information.  
  
## Programming Guidelines  
 We recommend the following guidelines for messages:  
  
-   Always end a message with a period.  
  
-   Supply the user with a message when the system has finished performing a task.  
  
-   Write the message in past tense.  
  
 For more information, see [Progress Windows, MESSAGE, ERROR, and CONFIRM Methods](../devenv-progress-windows-message-error-and-confirm-methods.md).  
  
## Example  
 This example shows how to use the MESSAGE method.  
  
 This code requires you to create the following variables.  
  
|Variable|DataType|  
|--------------|--------------|  
|Text|Text|  
|Number|Decimal|  
  
 This code requires you to create the following text constants.  
  
|Text constant|ENU value|  
|-------------------|---------------|  
|Text000|You can use message windows to display text and numbers: \\|  
|Text001|The number:|  
|Text002|The text:|  
  
```  
Text := 'ABCDE';  
Number := 12345.678;  
// The backslash indicates a new line.  
// You can concatenate strings using the + operator.  
// You can insert variable values using the % symbol.  
MESSAGE(Text000 + Text001 + '%1\' +Text002 + '%2', Number, Text);  
```  
  
 The message window reads:  
  
 **You can use message windows to display text and numbers:**  
  
 **The number: 12,345.678**  
  
 **The text: ABCDE**  
  
## See Also  
 [Dialog Data Type](../datatypes/devenv-Dialog-Data-Type.md)   
 <!--NAV [Configuring NAS Services](Configuring-NAS-Services.md)-->