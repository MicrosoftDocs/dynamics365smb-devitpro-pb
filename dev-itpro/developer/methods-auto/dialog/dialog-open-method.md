---
title: "Dialog.Open Method"
ms.author: solsen
ms.custom: na
ms.date: 11/23/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# Dialog.Open Method
> **Version**: _Available from runtime version 1.0._

Opens a dialog window.


## Syntax
```
 Dialog.Open(String: String [, var Variable1: Any,...])
```
> [!NOTE]
> This method can be invoked without specifying the data type name.
## Parameters
*Dialog*
&emsp;Type: [Dialog](dialog-data-type.md)
An instance of the [Dialog](dialog-data-type.md) data type.

*String*  
&emsp;Type: [String](../string/string-data-type.md)  
This string contains the text that you want to display in the window. Use a backslash (\\) to start a new line. Use number signs (#) to insert variable values into the string. Place the number signs where you want to substitute the variable value. Place a number in the part of the string where a variable value will be substituted (for example, #1####) to be able to reference this field for updating.  The number of # characters in the string indicates the length of the field. You can update the fields using the UPDATE method (Dialog) or by letting the user edit the values.
          
*Variable1*  
&emsp;Type: [Any](../any/any-data-type.md)  
Use these optional parameters to specify variables for field1, field2, and so on in the String.  



[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks
  
Dialog windows that are opened by an object are closed when the object terminates.  
  
 Dialog windows are automatically sized to hold the longest line of text and the total number of lines.  
  
 We recommend the following guidelines:  
  
- Enter messages as text constants.  
- Write messages using active voice. For example, write "Processing items" instead of writing "Items are being processed."  
- Align the \# field to the left with at least one space character between the text and the variable.

> [!NOTE]  
> With the [!INCLUDE[nav_windows_md](../../includes/nav_windows_md.md)], you can use @ characters instead of # characters for the *String* parameter to display the value as percentage and a progress indicator. The percentage value that is displayed is the percentage of the variable value from 0 to 9999. This is not supported in the [!INCLUDE[webclient](../../includes/webclient.md)].  
  
## Example 1

This example shows how to use the dialog.Open method.  
  
```al
var
    MyDialog: Dialog;
    MyNext: Integer;
    Text000: Label 'Counting to 4 #1:';
begin
    MyNext := 0;  
    MyDialog.Open(Text000,MyNext);  
    repeat  
      // Do some processing.  
      Sleep(1000);  
      MyNext := MyNext + 1;  
      MyDialog.Update(); // Update the field in the dialog.  
    until MyNext = 4;  
    Sleep(1000);  
    MyDialog.Close();  
end;
```  
  
The dialog window opens and displays this text:  
  
**Counting to 4: 0**  
  
Every one second, the dialog window updates with the new value of *MyNext* until it reaches 4, then the dialog window closes.  
  
## Example 2

This example shows how to use the dialog.Open method to display a progress indicator in the [!INCLUDE[nav_windows_md](../../includes/nav_windows_md.md)]. The progress indicator will not display in the [!INCLUDE[webclient](../../includes/webclient.md)].
  
```al
var
    MyDialog: Dialog;
    MyNext: Integer;
    Text000: Label 'Progress from 0 to 9999 #1#####';
begin
    MyNext := 0;  
    MyDialog.Open(Text000,MyNext);  
    repeat  
      // Do some processing.  
      MyNext := MyNext + 1;  
      MyDialog.Update(); // Update the field in the dialog.  
    until MyNext = 9999;  
    Sleep(1000);  
    MyDialog.Close();  
end;
```  
  
The dialog window opens and displays the progress indicator and percentage.  

## See Also
[Dialog Data Type](dialog-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)