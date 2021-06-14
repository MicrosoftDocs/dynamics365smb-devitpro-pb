---
title: "Dialog.StrMenu Method"
description: "Creates a menu window that displays a series of options."
ms.author: solsen
ms.custom: na
ms.date: 05/31/2021
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
# Dialog.StrMenu Method
> **Version**: _Available or changed with runtime version 1.0._

Creates a menu window that displays a series of options.


## Syntax
```
OptionNumber :=   Dialog.StrMenu(OptionMembers: String [, DefaultNumber: Integer] [, Instruction: String])
```
> [!NOTE]
> This method can be invoked without specifying the data type name.
## Parameters
*OptionMembers*  
&emsp;Type: [String](../string/string-data-type.md)  
A comma-separated string. Each substring in OptionString specifies an option on the menu. The string can be a text constant that is enabled for multilanguage functionality.
        
*[Optional] DefaultNumber*  
&emsp;Type: [Integer](../integer/integer-data-type.md)  
Use this optional parameter to determine a default option, which is highlighted. The options are numbered 1, 2, 3, 4, and so on. If you omit this optional parameter, the first option (1) is used as the default.
          
*[Optional] Instruction*  
&emsp;Type: [String](../string/string-data-type.md)  
Use this optional parameter to add a description to the option values.  


## Return Value
*OptionNumber*  
&emsp;Type: [Integer](../integer/integer-data-type.md)  
The number of the menu option that the user selected. If the user presses the Esc key to exit the menu, zero (0) is returned.


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Example  

This example shows how to use the Dialog.StrMenu method.  
 
```al
var
    Options: Text[30];
    Selected: Integer;
    Text000: Label 'Save,Delete,Exit,Find';
    Text001: Label 'You selected option %1.';
    Text002: Label 'Choose one of the following options:';
begin
    Options := Text000;  
    // Sets the default to option 3  
    Selected := Dialog.StrMenu(Options, 3, Text002);  
    Message(Text001, Selected);  
end;
```  
  
The menu window displays the following text:  
  
**Choose one of the following options:**  
  
**Save**  
  
**Delete**  
  
**Exit**  
  
**Find**  
  
Option 3, **Exit**, is highlighted. The option that the user selects is stored in the variable *Selected*. The user receives following message:  
  
**You selected option 3.**  

## See Also

[Dialog Data Type](dialog-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)
