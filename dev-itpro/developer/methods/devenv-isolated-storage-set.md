---
title: "ISOLATEDSTORAGE.SET Method"
ms.custom: na
ms.date: 10/16/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamics365-business-central
ms.assetid: e536abc9-b0bb-4010-bd77-22e537eb24ba
caps.latest.revision: 14
manager: SorenGP
redirect_url: /dynamics365/business-central/dev-itpro/developer/methods-auto/library
---

# ISOLATEDSTORAGE.SET Method
Sets the value that is associated with the specified key.

## Syntax  
[OK=:] ISOLATEDSTORAGE.SET(KEY,Value,[DATASCOPE]);

#### Parameters
*Key*
Type: Text

The key of the value to set.

*Value*
Type: Text

The value that will be associated with the specified key.

*DataScope*
Type: Text

The scope of the stored data. If a value is not passed in, the default value, DataScope::Module will be used. For more information, see [DataScope Data Type](../datatypes/devenv-data-scope-type.md).

## Property Value/Return Value
Type: Boolean

**true** if the value was saved successfully, otherwise **false**.

## See Also  
[ISOLATEDSTORAGE.GET Method](devenv-isolated-storage-get.md)  
[ISOLATEDSTORAGE.DELETE Method](devenv-isolated-storage-delete.md)  
[ISOLATEDSTORAGE.CONTAINS Method](devenv-isolated-storage-contains.md)  
[DataScope Data Type](../datatypes/devenv-data-scope-type.md)  
[Isolated Storage](../../developer/devenv-isolated-storage.md)
