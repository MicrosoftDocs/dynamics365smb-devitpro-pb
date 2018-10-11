---
title: "Isolated Storage"
ms.custom: na
ms.date: 10/11/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.assetid: b179c72d-48ea-4015-bb76-c60a3b459c70
caps.latest.revision: 21
author: SorenGP
---
# Isolated Storage
Isolated Storage is a data storage that provides isolation between extensions, so that you can keep values in one extension from being accessed from other extensions. Data in the Isolated Storage is accessible through an API. The involved data type is DataScope.

The methods supported for the DataScope data type are:

|Method|Description|For more information, see|  
|--------------|-----------------|-------------------------------|  
|ISOLATEDSTORAGE.SET|Sets the value associated with the specified key.|[ISOLATEDSTORAGE.SET Method](methods/devenv-isolated-storage-set.md)|  
|ISOLATEDSTORAGE.GET|Gets the value associated with the specified key.|[ISOLATEDSTORAGE.GET Method](methods/devenv-isolated-storage-get.md)|  
|ISOLATEDSTORAGE.CONTAINS|Determines whether the storage contains a value with the specified key.|[ISOLATEDSTORAGE.CONTAINS Method](methods/devenv-isolated-storage-contains.md)|  
|ISOLATEDSTORAGE.DELETE|Deletes the value with the specified key from the isolated storage.|[ISOLATEDSTORAGE.DELETE Method](methods/devenv-isolated-storage-delete.md)|  

## See Also  
[DataScope Data Type](datatypes/devenv-data-scope-type.md)  
[AL Data types](devenv-al-data-types.md)  
