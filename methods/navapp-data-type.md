---
title: "NavApp Data Type"
ms.author: solsen
ms.custom: na
ms.date: 08/07/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .resx files in the ModernDev repo.)
# NavApp Data Type


The following methods are available on the NavApp data type.


|Method name|Description|
|-----------|-----------|
|[GetArchiveRecordRef(Integer, var RecordRef)](navapp-getarchiverecordref-method.md)|Returns a RecordRef for the specified table.|
|[GetArchiveVersion()](navapp-getarchiveversion-method.md)|Returns the version of the extension that the specified table is part of.|
|[RestoreArchiveData(Integer, [Boolean])](navapp-restorearchivedata-method.md)|Restores archived data for a specified table of an extension during installation.|
|[DeleteArchiveData(Integer)](navapp-deletearchivedata-method.md)|Deletes the archived data for a specified table of an extension during installation.|
|[LoadPackageData(Integer)](navapp-loadpackagedata-method.md)|Loads default, or starting, table data into the specified table of an extension during installation.|
|[IsInstalling()](navapp-isinstalling-method.md)||
|[GetCurrentModuleInfo(var ModuleInfo)](navapp-getcurrentmoduleinfo-method.md)||
|[GetModuleInfo(Guid, var ModuleInfo)](navapp-getmoduleinfo-method.md)||


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  