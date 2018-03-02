---
title: "OPEN Method (Dialog)"
ms.custom: na
ms.date: 07/13/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamics365-financials
ms.assetid: 21a9ac9a-31a7-4b86-b2f0-bb0ea924c5ee
caps.latest.revision: 17
---

[!INCLUDE[newdev_dev_preview](../includes/newdev_dev_preview.md)]

# OPEN Method (Dialog)
Opens a dialog window.  
  
## Syntax  
  
```  
  
Dialog.OPEN(String [, Variable1],...)  
```  
  
#### Parameters  
 *Dialog*  
 Type: Dialog  
  
 After you define this variable, you can open the dialog and then use other dialog methods.  
  
 *String*  
 Type: Text constant or code  
  
 This string contains the text that you want to display in the window. Use a backslash \(\\\) to start a new line. Use number signs \(\#\) to insert variable values into the string. Place the number signs where you want to substitute the variable value. Place a number in the part of the string where a variable value will be substituted \(for example, \#1\#\#\#\#\) to be able to reference this field for updating.  
  
 If you use @ characters instead of \# characters, then the variable value is used as a percentage and both the percentage and a progress indicator are displayed. The percentage value that is displayed is the percentage of the variable value from 0 to 9999.  
  
 The number of \# or @ characters in the string indicates the length of the field or progress indicator.  
  
 <!--NAV You can update the fields using the [UPDATE Method \(Dialog\)](devenv-UPDATE-Method-Dialog.md) or by letting the user edit the values.-->  
  
 *Variable1*  
 Type: Any  
  
 Use these optional parameters to specify variables for field1, field2, and so on in the *String*.  
  
## Remarks  
 Dialog windows that are opened by an object are closed when the object terminates.  
  
 Dialog windows are automatically sized to hold the longest line of text and the total number of lines.  
  
 We recommend the following guidelines:  
  
-   Enter messages as text constants.  
  
-   Write messages using active voice. For example, write “Processing items” instead of writing “Items are being processed.”  
  
-   Align the \# and @ fields to the left with at least one space character between the text and the variable.  
  
## Example  
 This example shows how to use the dialog.OPEN method.  
  
 This code example requires that you create the following variables and text constants.  
  
|Name|DataType|  
|----------|--------------|  
|MyDialog|Dialog|  
|MyNext|Integer|  
  
|Text constant name|Constant value|  
|------------------------|--------------------|  
|Text000|Counting to 4 \#1|  
  
```  
MyNext := 0;  
MyDialog.OPEN(Text000,MyNext);  
REPEAT  
  // Do some processing.  
  SLEEP(1000);  
  MyNext := MyNext + 1;  
  MyDialog.UPDATE(); // Update the field in the dialog.  
UNTIL MyNext = 4;  
SLEEP(1000);  
MyDialog.CLOSE()  
```  
  
 The dialog window opens and displays this text:  
  
 **Counting to 4: 0**  
  
 Every one second, the dialog window updates with the new value of *MyNext* until it reaches 4, then the dialog window closes.  
  
## Example  
 This example shows how to use the dialog.OPEN method to display a progress indicator.  
  
 This code example requires that you create the following variables and text constants.  
  
|Name|Datatype|  
|----------|--------------|  
|MyDialog|Dialog|  
|MyNext|Integer|  
  
|Text constant name|Constant value|  
|------------------------|--------------------|  
|Text000|Progress from 0 to 9999 @1@@@@@|  
  
```  
MyNext := 0;  
MyDialog.OPEN(Text000,MyNext);  
REPEAT  
  // Do some processing.  
  MyNext := MyNext + 1;  
  MyDialog.UPDATE(); // Update the field in the dialog.  
UNTIL MyNext = 9999;  
SLEEP(1000);  
MyDialog.CLOSE()  
```  
  
 The dialog window opens and displays the progress indicator and percentage.  
  
## See Also  
 [Dialog Data Type](../datatypes/devenv-Dialog-Data-Type.md)