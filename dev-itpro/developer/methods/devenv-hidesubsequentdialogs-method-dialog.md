---
title: "HideSubsequentDialogs Function"
ms.custom: na
ms.date: 03/15/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
author: jswymer
ms.service: "dynamics365-business-central"
---
# HideSubsequentDialogs Function
Specifies whether to hide other dialogs within the current scope that are not instantiated by this dialog variable. When this is set to **true**, any calls to dialog methods ([OPEN](devenv-open-method-dialog.md), [UPDATE](), and [CLOSE](devenv-close-method-dialog.md)) on other dialog variables are ignored, and the dialogs will not appear in the user interface.

```
[IsHideSubsequentDialogs := ]Dialog.HIDESUBSEQUENTDIALOGS([SetHideSubsequentDialogs])
```
## Parameters
*Dialog*

Type: Dialog

The Dialog variable that you want to open.

*SetHideSubsequentDialogs*

Type: Boolean

**True** hides any subsequent dialogs. **false** is default.

## Return Value
*IsHideSubsequentDialogs*

Type: Boolean

**True** if the HIDESUBSEQUENTDIALOGS set to **true**; otherwise, **false**.

## Remarks
You must call the HIDESUBSEQUENTDIALOGS method on the dialog variable before the OPEN method. Until the OPEN method is called on this variable, calls on other dialog variables will behave as normal.

##  Example
The following code illustrates how the HIDESUBSEQUENTDIALOGS method works with two dialog variables.

```
var
  MyDialog1 : Dialog;
  MyDialog2 : Dialog;
  Text000 : TextConst ENU='additional text';
  begin

    // The HIDESUBSEQUENTDIALOGS method is used on MyDialog1 dialog.
    MyDialog1.HIDESUBSEQUENTDIALOGS := true;

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

  end;  
```  

## See Also  
[Dialog Data Type](../datatypes/devenv-dialog-data-type.md)  
[OPEN Method](devenv-open-method-dialog.md)  
[CLOSE Method](devenv-close-method-dialog.md)  
<!-- [UPDATE Method](devenv-update-method-dialog.md) -->
