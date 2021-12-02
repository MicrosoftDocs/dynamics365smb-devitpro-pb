---
title: "TestPage.No() Method"
description: "Gets the No system action."
ms.author: solsen
ms.custom: na
ms.date: 07/07/2021
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
# TestPage.No() Method
> **Version**: _Available or changed with runtime version 1.0._

Gets the No system action.


## Syntax
```AL
Action :=   TestPage.No()
```

## Parameters
*TestPage*  
&emsp;Type: [TestPage](testpage-data-type.md)  
An instance of the [TestPage](testpage-data-type.md) data type.  

## Return Value
*Action*  
&emsp;Type: [TestAction](../testaction/testaction-data-type.md)  
The No system action.


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks

The *No* action is used to dismiss a modal page or test page.

The **No** method just retrieves the *No* system action, but does not execute it. To invoke the *No* action on the test page use the [Invoke Method](../testaction/testaction-invoke-method.md), as shown in the example below. 

## Example

The following example uses a handler method to dismiss the `"Post and Send Confirmation"` modal test page when invoked in code.

```
[ModalPageHandler]
procedure PostandSendPageHandlerNo(var PostandSendConfirmation: TestPage "Post and Send Confirmation")
begin
    PostandSendConfirmation.No.Invoke;
end;
```

## See Also
[TestPage Data Type](testpage-data-type.md)  
[Invoke Method](../testaction/testaction-invoke-method.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)