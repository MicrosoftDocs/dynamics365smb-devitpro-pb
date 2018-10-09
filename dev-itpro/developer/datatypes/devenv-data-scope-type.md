---
title: "DateScope Data Type"
ms.custom: na
ms.date: 10/10/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.assetid: b179c72d-48ea-4015-bb76-c60a3b459c70
caps.latest.revision: 21
author: SorenGP
---
# DataScope Data Type
The scope from which to remove the value with the given key.  

## DATASCOPE::Module

Values are accessible within the extension across the companies and users on one tenant  

## DATASCOPE::User

Values are accessible within the extension for the specific user that sets the value, across the companies on one tenant  

## DATASCOPE::Company

Values are accessible within the extension for the specific Company that sets the value, for all the users on one tenant  

## DATASCOPE::CompanyAndUser

Values are accessible within the extension for the specific Company and specific User that sets the value, on one tenant   

## Methods  
The methods supported for the DataScope data type are:

[ISOLATEDSTORAGE.SET](../methods/devenv-isolated-storage-set.md)   
[ISOLATEDSTORAGE.GET](../methods/devenv-isolated-storage-get.md)
[ISOLATEDSTORAGE.CONTAINS](../methods/devenv-isolated-storage-contains.md)
[ISOLATEDSTORAGE.DELETE](../methods/devenv-isolated-storage-delete.md)  

## See Also  
[AL Data types](devenv-al-data-types.md)  
[AL Method Reference](../methods/devenv-al-method-reference.md)  
