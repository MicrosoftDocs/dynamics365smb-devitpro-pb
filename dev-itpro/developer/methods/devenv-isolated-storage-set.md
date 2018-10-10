---
title: "ISOLATEDSTORAGE.SET Method"
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

# ISOLATEDSTORAGE.SET Method

ISOLATEDSTORAGE.SET(KEY,Value,[DATASCOPE]);

## Syntax  

```  

<Method Name="Set" IsStatic="true" AddArguments="DataError" StaticClassName="ALIsolatedStorage" Compatibility="2.0">

  <Documentation>Sets the value associated with the specified key.</Documentation>

  <Returns Name="Ok" Type="Boolean" IsOptional="true">

    <Documentation>**true** if the value was saved successfully, otherwise **false**.</Documentation>

  </Returns>

  <Parameter Name="Key" Type="String">

    <Documentation>The key of the value to set.</Documentation>

  </Parameter>

  <Parameter Name="Value" Type="String">

    <Documentation>The value that will be associated with the specified key.</Documentation>

  </Parameter>

  <Parameter Name="DataScope" Type="DataScope" IsOptional="true">

    <Documentation>The scope of the stored data. If a value is not passed in, the default value DataScope::Module will be used.</Documentation>

  </Parameter>

</Method>   
```  

#### Parameters

## Property Value/Return Value

## Remarks

## Example

## See Also  
 [GUID Data Type](../datatypes/devenv-GUID-Data-Type.md)
