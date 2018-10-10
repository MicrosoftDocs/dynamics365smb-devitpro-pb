---
title: "ISOLATEDSTORAGE.CONTAINS Method"
ms.custom: na
ms.date: 10/10/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamics365-financials
ms.assetid: e536abc9-b0bb-4010-bd77-22e537eb24ba
caps.latest.revision: 14
manager: SorenGP
---


# ISOLATEDSTORAGE.CONTAINS Method

ISOLATEDSTORAGE.CONTAINS(KEY, [DATASCOPE]);

## Syntax  

```  

<Method Name="Contains" IsStatic="true" StaticClassName="ALIsolatedStorage" Compatibility="2.0">

  <Documentation>Determines whether the storage contains a value with the specified key.</Documentation>

  <Returns Name="HasValue" Type="Boolean">

    <Documentation>**true** if a value with the specified key exists in the storage, otherwise **false**.</Documentation>

  </Returns>

  <Parameter Name="Key" Type="String">

    <Documentation>The key to locate in the storage.</Documentation>

  </Parameter>

  <Parameter Name="DataScope" Type="DataScope" IsOptional="true">

    <Documentation>The scope in which to check for the existence of a value with the given key. If a value is not passed in, the default value DataScope::Module will be used.</Documentation>

  </Parameter>

</Method>
```  

#### Parameters

## Property Value/Return Value

## Remarks

## Example

## See Also  
 [GUID Data Type](../datatypes/devenv-GUID-Data-Type.md)
