---
title: "Dialog.HideSubsequentDialogs Method"
description: "Specifies that subsequent child dialogs are not shown."
ms.author: solsen
ms.custom: na
ms.date: 06/23/2021
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
# Dialog.HideSubsequentDialogs Method
> **Version**: _Available or changed with runtime version 1.0._

Specifies that subsequent child dialogs are not shown.


## Syntax
```AL
[HideSubsequentDialogs := ]  Dialog.HideSubsequentDialogs([HideSubsequentDialogs: Boolean])
```
> [!NOTE]
> This method can be invoked using property access syntax.
> [!NOTE]
> This method can be invoked without specifying the data type name.
## Parameters
*Dialog*  
&emsp;Type: [Dialog](dialog-data-type.md)  
An instance of the [Dialog](dialog-data-type.md) data type.  

*[Optional] HideSubsequentDialogs*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
A value specifying whether to hide subsequent dialogs.  


## Return Value
*[Optional] HideSubsequentDialogs*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
**True** if HideSubsequentDialogs is set to true; otherwise, false.


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks

You must call the `HideSubsequentDialogs` method on the dialog variable before the [Open Method](../../methods-auto/dialog/dialog-open-method.md). Until the [Open Method](../../methods-auto/dialog/dialog-open-method.md) is called on this variable, calls on other dialog variables will behave as normal.

## Example

The following code illustrates how the `HideSubsequentDialogs` method works with two dialog variables.

```al
var
  MyDialog1 : Dialog;
  MyDialog2 : Dialog;
  Text000 : Label 'additional text';
  begin

    // The HideSubsequentDialogs method is used on MyDialog1 dialog.
    MyDialog1.HideSubsequentDialogs := true;

    // When MyDialog1 dialog opens, it will register as the root dialog.
    MyDialog1.Open('Dialog 1');
    Sleep(2000);

    // MyDialog2 dialog will not open. However, the code associated with the Open call will run as if it was actually opened.
    MyDialog2.Open('Dialog 2');
    Sleep(2000);

    // Updating MyDialog2 dialog will have no effect
    MyDialog2.Update(1, Text000);
    Sleep(2000);

    // MyDialog1 dialog will open 
    MyDialog1.Open('Dialog 1 #1', Text000);
    Sleep(2000);

    // As soon as MyDialog1 dialog is closed, other can be reopened and they will no longer be hidden
    MyDialog1.Close;

    MyDialog2.Open('Dialog 2');
    Sleep(2000);

  end;  
```  

## See Also
[Dialog Data Type](dialog-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)