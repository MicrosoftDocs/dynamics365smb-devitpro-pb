---
title: CameraOptions Overview for Business Central
description: Learn about the CameraOptions that you can pass to RequestPictureAsync in AL, including picture quality, source type, media type, and encoding type.
ms.date: 08/24/2026
ms.reviewer: solsen
ms.topic: overview
author: SusanneWindfeldPedersen
ms.author: solsen
---

# CameraOptions overview

When you implement camera access from AL, you can use `Microsoft.Dynamics.Nav.Client.Capabilities.CameraOptions`, which is found in the `Microsoft.Dynamics.Nav.ClientExtensions` DLL, to specify picture quality, source type, and so on. You can optionally pass these options to `CameraProvider.RequestPictureAsync(options)`. Some of the options described in this article are implemented in the example in [Implementing the camera in AL](devenv-implement-camera-al.md).

For most scenarios, you don't need to specify options.

## CameraOptions  

|Option|Description|
|------|-----------|
|`int Quality`|The quality of the saved image expressed as a range from 0 to 100, where 100 is typically full resolution without loss from file compression. Default is 50. If you call `RequestPictureAsync` without a `CameraOptions` object, the client uses 100. `Quality` is only used if `EncodingType` is `JPEG`.|  
|`string SourceType`|The source of the picture. Possible values are `Camera` and `PhotoLibrary`. Default is `Camera`. The options `Quality`, `EncodingType`, and `AllowEdit` are only used if `SourceType` is `Camera`.|  
|`string MediaType`|The type of media to select from. The `SourceType` option must be `PhotoLibrary`. Possible values are `Picture`, `Video`, and `AllMedia`. The `PhotoLibrary` option picks an existing picture on the device.|  
|`string EncodingType`|The encoding of the returned image file. Supported values are as follows: `JPEG`, `PNG`. Default is `JPEG`.|  
|`bool AllowEdit`|A value that indicates whether to enable simple editing of the image before selection. Default is `false`.|  

## Related information

[Implementing the camera in AL](devenv-implement-camera-al.md)
