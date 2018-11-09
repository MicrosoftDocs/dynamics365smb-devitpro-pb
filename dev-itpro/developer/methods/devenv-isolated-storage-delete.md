---
title: "ISOLATEDSTORAGE.DELETE Method"
ms.custom: na
ms.date: 10/16/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamics365-financials
ms.assetid: e536abc9-b0bb-4010-bd77-22e537eb24ba
caps.latest.revision: 14
manager: SorenGP
redirect_url: /dynamics365/business-central/dev-itpro/developer/methods-auto/library
---

# ISOLATEDSTORAGE.DELETE Method
Deletes the value with the specified key from the isolated storage.

## Syntax  
[OK=:] ISOLATEDSTORAGE.DELETE(KEY, [DATASCOPE]);

#### Parameters
*Key*
Type: Text

The key of the value to remove.

*Value*
Type: Text

The value that will be associated with the specified key.

*DataScope*
Type: Text

The scope in which to check for the existence of a value with the given key. If a value is not passed in, the default value, DataScope::Module will be used. For more information, see [DataScope Data Type](../datatypes/devenv-data-scope-type.md).

## Property Value/Return Value
Type: Boolean

**true** if the value with the given key was successfully deleted from isolated storage, otherwise **false**.

## See Also  
[ISOLATEDSTORAGE.SET Method](devenv-isolated-storage-set.md)  
[ISOLATEDSTORAGE.GET Method](devenv-isolated-storage-get.md)  
[ISOLATEDSTORAGE.CONTAINS Method](devenv-isolated-storage-contains.md)  
[DataScope Data Type](../datatypes/devenv-data-scope-type.md)  
[Isolated Storage](../../developer/devenv-isolated-storage.md)  
