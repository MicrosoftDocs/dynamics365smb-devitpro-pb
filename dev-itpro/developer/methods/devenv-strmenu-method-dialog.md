---
title: "STRMENU Method (Dialog)"
ms.custom: na
ms.date: 07/13/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamics365-financials
ms.assetid: 0fd35393-b2ad-4303-a0e5-9f32d5bd5ca3
caps.latest.revision: 15
manager: edupont
---

[!INCLUDE[newdev_dev_preview](../includes/newdev_dev_preview.md)]

# STRMENU Method (Dialog)
Creates a menu window that displays a series of options.  
  
## Syntax  
  
```  
  
OptionNumber := Dialog.STRMENU(OptionString [, DefaultNumber] [, Instruction])  
```  
  
#### Parameters  
 *OptionString*  
 Type: Code or text constant  
  
 A comma-separated string. Each substring in *OptionString* specifies an option on the menu. The string can be a text constant that is enabled for multilanguage functionality. For more information, see [Multilanguage Development](../devenv-multilanguage-development.md).  
  
 *DefaultNumber*  
 Type: Integer  
  
 Use this optional parameter to determine a default option, which is highlighted. The options are numbered 1, 2, 3, 4, and so on.  
  
 If you omit this optional parameter, the first option \(1\) is used as the default.  
  
 *Instruction*  
 Type: Code or text constant  
  
 Use this optional parameter to add a description to the option values.  
  
## Property Value/Return Value  
 Type: Integer  
  
 The number of the menu option that the user selected. If the user presses the Esc key to exit the menu, zero \(0\) is returned.  
  
## Example  
 This example shows how to use the Dialog.STRMENU method.  
  
 This code example requires that you create the following text constants and global variables.  
  
|Name|ConstValue|  
|----------|----------------|  
|Text000|'Save,Delete,Exit,Find'|  
|Text001|'You selected option%1.'|  
|Text002|'Choose one of the following options:'|  
  
|Name|DataType|Length|  
|----------|--------------|------------|  
|Options|Text|30|  
|Selected|Integer|Not applicable|  
  
```  
Options := Text000  
// Sets the default to option 3  
Selected := Dialog.STRMENU(Options, 3, Text002);  
MESSAGE(Text001, Selected);  
```  
  
 The menu window displays the following text:  
  
 **Choose one of the following options:**  
  
 **Save**  
  
 **Delete**  
  
 **Exit**  
  
 **Find**  
  
 Option 3, Exit, is highlighted. The option that the user selects is stored in the variable *Selected*. The user receives following message:  
  
 **You selected option 3.**  
  
## See Also  
 [Dialog Data Type](../datatypes/devenv-Dialog-Data-Type.md)