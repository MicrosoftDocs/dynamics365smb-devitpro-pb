---
title: "ModuleInfo data type"
description: "Represents information about an application consumable from AL."
ms.author: solsen
ms.date: 10/01/2026
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# ModuleInfo data type
> **Version**: _Available or changed with runtime version 1.0._

Represents information about an application consumable from AL.



## Instance methods
The following methods are available on instances of the ModuleInfo data type.

|Method name|Description|
|-----------|-----------|
|[AppVersion()](moduleinfo-appversion-method.md)|Gets the version of the specified application's metadata.|
|[ContextSensitiveHelpUrl()](moduleinfo-contextsensitivehelpurl-method.md)|Gets the context sensitive help URL with the user's locale resolved from the application's supported locales.|
|[DataVersion()](moduleinfo-dataversion-method.md)|Gets the version of the specified application's data in the context of a given tenant. This indicates the last version that was installed or successfully upgraded to and will not match the application version if the tenant is in a data upgrade pending state.|
|[Dependencies()](moduleinfo-dependencies-method.md)|Gets the collection of application dependencies.|
|[EULA()](moduleinfo-eula-method.md)|Gets the End User License Agreement (EULA) link of the specified application.|
|[Help()](moduleinfo-help-method.md)|Gets the help link of the specified application.|
|[Id()](moduleinfo-id-method.md)|Gets the ID of the specified application.|
|[Name()](moduleinfo-name-method.md)|Gets the name of the specified application.|
|[PackageId()](moduleinfo-packageid-method.md)|Gets the package ID of the specified application.|
|[PrivacyStatement()](moduleinfo-privacystatement-method.md)|Gets the privacy statement link of the specified application.|
|[Publisher()](moduleinfo-publisher-method.md)|Gets the publisher of the specified application.|

[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## Related information  
[Get Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)  