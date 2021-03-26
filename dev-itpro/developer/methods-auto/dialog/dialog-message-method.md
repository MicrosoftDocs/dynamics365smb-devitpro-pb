---
title: "Dialog.Message Method"
ms.author: solsen
ms.custom: na
ms.date: 02/15/2021
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# Dialog.Message Method
> **Version**: _Available or changed with runtime version 1.0._

Displays a text string in a message window.


## Syntax
```
 Dialog.Message(String: String [, Value: Any,...])
```
> [!NOTE]
> This method can be invoked without specifying the data type name.
## Parameters
*String*  
&emsp;Type: [String](../string/string-data-type.md)  
This string contains the text you want the system to display in the message window. Use a backslash (\\) to start a new line. Use percent signs (%) to insert variable values into the string. Place the percent where you want the system to substitute the variable value. The string can be a text constant that is enabled for multilanguage functionality.
        
*Value*  
&emsp;Type: [Any](../any/any-data-type.md)  
Any type of AL variable you want to insert into String. You can insert up to 10 values.  



[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks  

When a message statement in the AL code is executed, the message is not immediately displayed. Instead, it is displayed after the AL code is finished executing or after the AL code pauses to wait for user interaction.  
  
The window is automatically sized to hold the longest line of text and the total number of lines.  
  
For NAS sessions or [!INCLUDE[d365fin_md](../../includes/d365fin_md.md)] sessions \(including NAS\) that are started by the [StartSession Method \(Sessions\)](../../methods-auto/session/session-startsession-method.md), messages are recorded in the event log of the computer that is running [!INCLUDE[d365fin_server_md](../../includes/d365fin_server_md.md)]. The message entries have the ID 100 and type Information.  
  
## Programming Guidelines  

We recommend the following guidelines for messages:  
  
- Always end a message with a period.  
  
- Supply the user with a message when the system has finished performing a task.  
- Write the message in past tense.  
  
For more information, see [Progress Windows, Message, Error, and Confirm Methods](../../devenv-progress-windows-message-error-and-confirm-methods.md).  
  
## Example  

This example shows how to use the `Message` method.  
 
```al
begin
        Message('App published: Hello world');

        Text := 'ABCDE';
        Number := 12345.678;

        // The backslash indicates a new line.  
        // You can concatenate strings using the + operator.  
        // You can insert variable values using the % symbol.  
        Message(Text000 + Text001 + '%1\' + Text002 + '%2\', Number, Text);
    end;


    var
        Text: Text;
        Number: Decimal;
        Text000: Label 'You can use message windows to display text and numbers: \';
        Text001: Label 'The number: ';
        Text002: Label 'The text: ';

```  
  
The message window reads:  
  
**You can use message windows to display text and numbers:**  
  
**The number: 12,345.678**  
  
**The text: ABCDE**  

 
## See Also
[Dialog Data Type](dialog-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)