---
title: "Version Data Type"
ms.author: solsen
ms.custom: na
ms.date: 12/09/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# Version Data Type
> **Version**: _Available from runtime version 1.0._

Represents a version matching the format: Major.Minor.Build.Revision .


The following methods are available on the Version data type.


|Method name|Description|
|-----------|-----------|
|[Create(String)](version-create-string-method.md)|Creates a version object from the provided string. The string should be in the format W.X.Y.Z, where W, X, Y and Z represent positive integers and where Y and Z are optional. If the input string is not in the expected format, an exception is thrown.|
|[Create(Integer, Integer [, Integer] [, Integer])](version-create-integer-integer-integer-integer-method.md)|Creates a version object from the major, minor, build and revision numbers provided.|

The following methods are available on instances of the Version data type.

|Method name|Description|
|-----------|-----------|
|[Build()](version-build-method.md)|Gets the build number of the version.|
|[Major()](version-major-method.md)|Gets the major number of the version.|
|[Minor()](version-minor-method.md)|Gets the minor number of the version.|
|[Revision()](version-revision-method.md)|Gets the revision number from the version.|

[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)  