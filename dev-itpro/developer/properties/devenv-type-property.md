---
title: "Type Property"
ms.author: solsen
ms.custom: na
ms.date: 01/18/2021
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
# Type Property
> **Version**: _Available from runtime version 7.0._

The type of entitlement. When a user logs into Business Central, it is checked if the user is assigned the given AAD service plan, the given AAD role etc., and if that is the case, the user will be entitled to use the objects covered by this entitlement. The same applies if an application logs into Business Central.

## Applies to
-   Entitlement

## Property Value

|Value|Description|
|-----------|---------------------------------------|
|**PerUserServicePlan**|The entitlement is associated with an AAD service plan which is licensed to specific users.|
|**FlatRateServicePlan**|The entitlement is associated with an AAD service plan which is licensed to an AAD tenant.|
|**Role**|The entitlement is associated with an AAD role.|
|**ConcurrentUserServicePlan**|The entitlement is associated with a named AAD group.|
|**Application**|The entitlement is associated with an AAD application.|
|**ApplicationScope**|The entitlement is associated with an AAD application scope.|
|**Implicit**|Everyone has this license.|

[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  