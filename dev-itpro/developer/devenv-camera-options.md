---
title: CameraOptions overview
description: Article about implementing camera access from AL for Business Central.
ms.date: 03/08/2024
ms.reviewer: solsen
ms.topic: overview
author: blrobl
---

# CameraOptions overview

When implementing camera access from AL, there are some options; `Microsoft.Dynamics.Nav.Client.Capabilities.CameraOptions` found in the `Microsoft.Dynamics.Nav.ClientExtensions` dll, that you can use to additionally specify picture quality, source type, and so on. These can optionally be passed to `CameraProvider.RequestPictureAsync(options)`. Some of the options described in this article have been implemented in the example in the [Implementing the Camera in AL](devenv-implement-camera-al.md) topic.  

 For most scenarios it is not necessary to specify options.  

## CameraOptions  

|Option|Description|
|------|-----------|
|`int Quality`|The quality of the saved image expressed as a range from 0 to 100, where 100 is typically full resolution without loss from file compression. Default is 100. `Quality` is only used if `EncodingType` is `JPEG`.|  
|`string SourceType`|The source of the picture. Possible values are as follows: `Camera` and `PhotoLibrary`. Default is Camera. The options `Quality`, `EncodingType`, and `AllowEdit` are only used if `SourceType` is `Camera`.|  
|`string MediaType`|The type of media to select from. The `SourceType` option must be `PhotoLibrary`. Possible values are as follows: `Picture`, `Video`, `AllMedia`. The `PhotoLibrary` option will pick an already existing picture on the device.|  
|`string EncodingType`|The encoding of the returned image file. Supported values are as follows: `JPEG`, `PNG`. Default is `JPEG`.|  
|`bool AllowEdit`|A value indicating whether to enable simple editing of image before selection. Default is `FALSE`.|  

## Related information

[Implementing the camera in AL](devenv-implement-camera-al.md)
