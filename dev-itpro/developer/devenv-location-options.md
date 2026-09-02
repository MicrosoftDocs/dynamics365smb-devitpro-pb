---
title: LocationOptions Overview for Business Central
ms.date: 08/24/2026
ms.topic: overview
author: SusanneWindfeldPedersen
ms.author: solsen
ms.reviewer: solsen
description: Learn about the LocationOptions that you can pass to RequestLocationAsync in AL, including EnableHighAccuracy, Timeout, and MaximumAge, in Business Central.
---

# LocationOptions overview

When you implement location from AL, you can optionally pass options to `LocationProvider.RequestLocationAsync(options)`. Access the options by using `Microsoft.Dynamics.Nav.Client.Capabilities.LocationOptions`, which is found in the `Microsoft.Dynamics.Nav.ClientExtensions` DLL.

For most scenarios, you don't need to specify options.

## LocationOptions

|Option|Description|
|------|-----------|
|`bool EnableHighAccuracy`|A value that provides a hint to the device that this request must have the best possible location accuracy.|
|`int Timeout`|The maximum length of time, in milliseconds, that is allowed to pass for a location request.|
|`int MaximumAge`|The maximum age, in milliseconds, of a cached location.|

## Related information

[Implementing location in AL](devenv-implement-location-al.md)  
