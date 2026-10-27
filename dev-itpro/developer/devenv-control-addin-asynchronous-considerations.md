---
title: Asynchronous Considerations for Control Add-ins
ms.date: 10/21/2026
ms.topic: conceptual
ms.assetid: 6c90376e-b86e-406d-880d-3cc905bf6527
author: SusanneWindfeldPedersen
ms.author: solsen
ms.reviewer: solsen
description: Learn how control add-ins exchange data asynchronously between AL and JavaScript in Business Central without relying on synchronous return values.
---

# Asynchronous considerations

Communication between AL code on the [!INCLUDE[prod_short](../includes/prod_short.md)] server and a control add-in's JavaScript code in the browser is asynchronous. These calls don't provide a synchronous return value across that boundary.

Declare procedures in the AL `controladdin` object without a return value. Exchange results through procedure parameters and event parameters instead.

## Send results from AL to JavaScript

To send a result from AL to JavaScript, declare a procedure in the `controladdin` object with parameters for the result. Implement the corresponding JavaScript function. Call the procedure from AL to pass the result to JavaScript.

The result is sent in a separate procedure call, not returned to the original JavaScript call.

## Send results from JavaScript to AL

To send a result from JavaScript to AL, declare an event in the `controladdin` object with parameters for the result. In JavaScript, call `Microsoft.Dynamics.NAV.InvokeExtensibilityMethod` with the event name and an array of result arguments. Handle the event in the corresponding trigger on the page's `usercontrol`.

The optional `successCallback` for `InvokeExtensibilityMethod` reports completion of the invocation. It doesn't receive a result from AL. To send result data to JavaScript, use a separate control add-in procedure call.

Learn more about invoking AL triggers in [InvokeExtensibilityMethod method](methods/devenv-invokeextensibility-method.md).

## Related information

[Control add-in object](devenv-control-addin-object.md)  
[InvokeExtensibilityMethod method](methods/devenv-invokeextensibility-method.md)  
[GetImageResource method](methods/devenv-getimageresource-method.md)  
[GetEnvironment method](methods/devenv-getenvironment-method.md)  
[Control add-in performance best practices](devenv-control-addin-bestpractices.md)  
[OpenWindow method](methods/devenv-openwindow-method.md)  
