---
title: "HideSubsequentDialogs Function"
ms.custom: na
ms.date: 20/12/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
author: jswymer
ms.prod: "dynamics-nav-2017"
---
# HideSubsequentDialogs Function
Specifies whether to hide other dialogs within the current scope that are not instantiated by this dialog variable. When this is set to **true**, any calls to dialog functions ([OPEN](OPEN-Function--Dialog-.md), [UPDATE](UPDATE-Function--Dialog-.md), and [CLOSE](CLOSE-Function--Dialog-.md)) on other dialog variables are ignored, and the dialogs will not appear in the user interface.

```
[IsHideSubsequentDialogs := ]Dialog.HIDESUBSEQUENTDIALOGS([SetHideSubsequentDialogs])
```
## Parameters
*Dialog*

Type: Dialog

The Dialog variable that you want to open.

*SetHideSubsequentDialogs*

Type: Boolean

**true** hides any subsequent dialogs. **false** is default.

## Return Value
*IsHideSubsequentDialogs*

Type: Boolean

**true** if the HIDESUBSEQUENTDIALOGS set to **true**; otherwise, **false**.

## Remarks
You must call the HIDESUBSEQUENTDIALOGS function on the dialog variable before the OPEN function. Until the OPEN function is called on this variable, calls on other dialog variables will behave as normal.

##  Example
The following code illustrates how the HIDESUBSEQUENTDIALOGS function works with two dialog variables.

This code example requires that you create the following variables.  

|Name|DataType|  
|----------|--------------|  
|MyDialog1|Dialog|  
|MyDialog2|Dialog|  

This code example requires that you create the following text constants in the **C/AL Globals** window.  

|Name|ConstValue|  
|----------|----------------|  
|Text000|additional text|   


```
// The HIDESUBSEQUENTDIALOGS function is used on MyDialog1 dialog.
MyDialog1.HIDESUBSEQUENTDIALOGS := TRUE;

// When MyDialog1 dialog opens, it will register as the root dialog.
MyDialog1.OPEN('Dialog 1');
SLEEP(2000);

// MyDialog2 dialog will not open. However, the code associated with the Open call will run as if it was actually opened.
MyDialog2.OPEN('Dialog 2');
SLEEP(2000);

// Updating MyDialog2 dialog will have no effect
MyDialog2.UPDATE(1, Text000);
SLEEP(2000);

// MyDialog1 dialog will open 
MyDialog1.Update('Dialog 1 #1', Text000);
SLEEP(2000);

// As soon as MyDialog1 dialog is closed, other can be reopened and they will no longer be hidden
MyDialog1.CLOSE;

MyDialog2.OPEN('Dialog 2');
SLEEP(2000);

```

## See Also  
[Dialog Data Type](Dialog-Data-Type.md)  
[OPEN Function (Dialog)](OPEN-Function--Dialog-.md)  
[UPDATE Function (Dialog)](UPDATE-Function--Dialog-.md)  
[CLOSE Function (Dialog)](CLOSE-Function--Dialog-.md)) 
