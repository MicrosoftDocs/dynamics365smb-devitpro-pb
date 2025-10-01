---
title: "NavApp data type"
description: "Provides information about a NavApp."
ms.author: solsen
ms.date: 08/08/2025
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# NavApp data type
> **Version**: _Available or changed with runtime version 1.0._

Provides information about a NavApp.


## Static methods
The following methods are available on the NavApp data type.


|Method name|Description|
|-----------|-----------|
|[DeleteArchiveData(Integer)](navapp-deletearchivedata-method.md)|Deletes the archived data for a specified table of an extension during installation.|
|[GetArchiveRecordRef(Integer, var RecordRef)](navapp-getarchiverecordref-method.md)|Returns a RecordRef for the specified table.|
|[GetArchiveVersion()](navapp-getarchiveversion-method.md)|Returns the version of the extension that the specified table is part of.|
|[GetCallerCallstackModuleInfos()](navapp-getcallercallstackmoduleinfos-method.md)|Gets information about extensions on the callstack that contain the method, which called the currently running method. For example, if method 1 (in extension A) calls method 2 (in extension B) calls method 3 (in extension C), which calls GetCallerModuleInfo, then GetCallerModuleInfo will return information about extension A and B.|
|[GetCallerModuleInfo(var ModuleInfo)](navapp-getcallermoduleinfo-method.md)|Gets information about the extension that contains the method that called the currently running method. For example, if method 1 (in extension A) calls method 2 (in extension B), which calls GetCallerModuleInfo, then GetCallerModuleInfo will return information about extension A.|
|[GetCurrentModuleInfo(var ModuleInfo)](navapp-getcurrentmoduleinfo-method.md)|Gets information about the application that contains the AL object that is currently running.|
|[GetModuleInfo(Guid, var ModuleInfo)](navapp-getmoduleinfo-method.md)|Gets information about the specified AL application.|
|[GetResource(Text, var InStream [, TextEncoding])](navapp-getresource-method.md)|Retrieves a resource that was packaged with this app and loads it into the specified InStream|
|[GetResourceAsJson(Text [, TextEncoding])](navapp-getresourceasjson-method.md)|Retrieves the specified resource as a JsonObject|
|[GetResourceAsText(Text [, TextEncoding])](navapp-getresourceastext-method.md)|Retrieves the specified resource as Text|
|[IsEntitled(Text [, Guid])](navapp-isentitled-method.md)|Determines if the current user is entitled to a specific entitlement id for the application.|
|[IsInstalling()](navapp-isinstalling-method.md)|Returns **true** if the application that contains the AL object that is currently running is being installed, otherwise it returns **false**.|
|[IsUnlicensed([Guid])](navapp-isunlicensed-method.md)|Determines if the current user is assigned the Unlicensed entitlement type for the application.|
|[ListResources([Text])](navapp-listresources-method.md)|Gets an optionally filtered list of resources packaged with this app.|
|[LoadPackageData(Integer)](navapp-loadpackagedata-method.md)|Loads default, or starting, table data into the specified table of an extension during installation.|
|[RestoreArchiveData(Integer [, Boolean])](navapp-restorearchivedata-method.md)|Restores archived data for a specified table of an extension during installation.|


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## Related information
[Get Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)  