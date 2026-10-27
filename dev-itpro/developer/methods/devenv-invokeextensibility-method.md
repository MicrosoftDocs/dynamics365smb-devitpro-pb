---
title: InvokeExtensibilityMethod Method
description: Use InvokeExtensibilityMethod to raise AL control add-in events from JavaScript in Business Central and coordinate calls with completion callbacks.
ms.author: solsen
ms.date: 10/22/2026
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---

# InvokeExtensibilityMethod method

Raises an event declared in an AL `controladdin` object. The corresponding trigger in the page's `usercontrol` handles the event on the [!INCLUDE[prod_short](../../includes/prod_short.md)] server.

Learn more about declaring events and handling them on a page in [Control add-in object](../devenv-control-addin-object.md).

## Method signature

`void Microsoft.Dynamics.NAV.InvokeExtensibilityMethod(name, arguments, skipIfBusy, successCallback, errorCallback)`

The method returns no value. Communication with AL is asynchronous.

## Method parameters

|Parameter|Description|
|---------|-----------|
|`name`|Type: `String`<br /><br />The name of an event declared in the AL `controladdin` object. Implement the corresponding trigger in the page's `usercontrol`. Required.|
|`arguments`|Type: `Array`<br /><br />An array of arguments to pass to the event's AL trigger, including when the event takes only one argument. Optional. For an event with no parameters, omit this argument or pass `[]`.|
|`skipIfBusy`|Type: `Boolean`<br /><br />Controls whether to skip the invocation when the client is busy. Optional. The default is `false`. Learn more in [Behavior when the client is busy](#behavior-when-the-client-is-busy).|
|`successCallback`|Type: `function`<br /><br />An optional function called when the client completes the invocation. It receives no arguments.<br /><br />Syntax: `function successCallback()`|
|`errorCallback`|Type: `function`<br /><br />An optional function called when the client skips the invocation or the invocation fails. It receives no arguments.<br /><br />Syntax: `function errorCallback()`|

## Behavior when the client is busy

The table describes the busy-state decision after the page is open and the client session is initialized. When `skipIfBusy` is `true`, the containing page must also be the topmost page. Calls that proceed can still wait for client readiness or fail for other reasons.

|`skipIfBusy`|Client is busy|Action|
|------------|--------------|------|
|`false`|No|The call proceeds when the client is ready.|
|`false`|Yes|The call is queued until the client is no longer busy.|
|`true`|No|The call proceeds if the containing page is topmost. Otherwise, it is skipped.|
|`true`|Yes|The call is skipped.|

If a call is skipped, the client calls `errorCallback` if you supplied it. A skipped call isn't automatically retried when the client is no longer busy.

## Coordinate calls with callbacks

Use the callbacks to sequence calls, such as sending the next data block after the previous invocation completes. This helps avoid issuing too many concurrent calls.

> [!IMPORTANT]
> These callbacks report the outcome of the client invocation. They don't provide an AL return value or exception details. Don't use them alone to determine whether AL business logic succeeded.

To send result data from AL to JavaScript, use a separate control add-in procedure call. Learn more in [Asynchronous considerations](../devenv-control-addin-asynchronous-considerations.md).

Learn more about limiting concurrent requests in [Control add-in performance best practices](../devenv-control-addin-bestpractices.md).

## JavaScript example

This example sends a customer number to AL. It assumes that the `controladdin` object declares a `CustomerSelected` event with one `Text` parameter and that the page's `usercontrol` implements the corresponding trigger. Run the script in the control add-in.

```javascript
Microsoft.Dynamics.NAV.InvokeExtensibilityMethod(
    "CustomerSelected",
    ["10000"],
    false,
    function () {
        console.log("The client completed the invocation.");
    },
    function () {
        console.error("The invocation was skipped or failed.");
    });
```

## Related information

[AL method reference](../methods-auto/library.md)  
[GetEnvironment method](devenv-getenvironment-method.md)  
[GetImageResource method](devenv-getimageresource-method.md)  
[OpenWindow method](devenv-openwindow-method.md)  
[Asynchronous considerations](../devenv-control-addin-asynchronous-considerations.md)  
