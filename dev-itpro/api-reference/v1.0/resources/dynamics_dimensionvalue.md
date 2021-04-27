---
title: dimensionValues resource type
description: A dimension value in Dynamics 365 Business Central.
 
author: SusanneWindfeldPedersen

ms.service: "dynamics365-business-central"
ms.topic: reference
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 04/01/2019
ms.author: solsen
---

# dimensionValues resource type

[!INCLUDE[d365_api_newversion](../../includes/d365_api_newversion.md)]

Represents a dimension value in [!INCLUDE[prod_short](../../../includes/prod_short.md)].

> [!NOTE]  
> For information about enabling APIs for [!INCLUDE[prod_short](../../../includes/prod_short.md)] see [Enabling the APIs for Dynamics 365 Business Central](../enabling-apis-for-dynamics-nav.md).

## Methods

| Method       | Return Type  |Description                   |
|:-------------|:-------------|:-----------------------------|
|[GET dimensionValues](../api/dynamics_dimensionvalue_get.md)|dimensionValues|Gets a dimension value object.|


## Properties

| Property           | Type                  |Description                                        |
|:-------------------|:----------------------|:--------------------------------------------------|
|id                  |GUID                   |The unique ID of the item.                         |
|code                |string, maximum size 20|The dimension value code.                          |
|displayName         |string                 |Specifies the dimension value's name. This name will appear where the dimension value is used.|
|lastModifiedDateTime|datetime               |The last datetime the dimension value was modified.|  


## JSON representation

Here is a JSON representation of the resource.


```json
{

    "id": "GUID",
    "code": "string",
    "displayName": "string",
    "lastModifiedDateTime": "datetime"
}
```

## See also
  
[Get Dimension Value](../api/dynamics_dimensionvalue_get.md)  
