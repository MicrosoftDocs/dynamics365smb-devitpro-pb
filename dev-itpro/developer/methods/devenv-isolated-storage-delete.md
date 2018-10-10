---
title: "ISOLATEDSTORAGE.DELETE Method"
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

# ISOLATEDSTORAGE.DELETE Method

ISOLATEDSTORAGE.DELETE(KEY, [DATASCOPE]);

## Syntax  

```  

<Method Name="Delete" IsStatic="true" StaticClassName="ALIsolatedStorage" AddArguments="DataError" Compatibility="2.0">

  <Documentation>Deletes the value with the specified key from the isolated storage.</Documentation>

  <Returns Name="Ok" Type="Boolean" IsOptional="true">

    <Documentation>**true** if the value with the given key was successfully deleted from isolated storage, otherwise **false**.</Documentation>

  </Returns>

  <Parameter Name="Key" Type="String">

    <Documentation>The key of the value to remove.</Documentation>

  </Parameter>

  <Parameter Name="DataScope" Type="DataScope" IsOptional="true">

    <Documentation>The scope from which to remove the value with the given key. If a value is not passed in, the default value DataScope::Module will be used.</Documentation>

  </Parameter>

</Method>
```  

#### Parameters

## Property Value/Return Value

## Remarks

## Example

## See Also  
 [GUID Data Type](../datatypes/devenv-GUID-Data-Type.md)
