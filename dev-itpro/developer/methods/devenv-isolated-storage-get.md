---
title: "ISOLATEDSTORAGE.GET Method"
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

# ISOLATEDSTORAGE.GET Method

ISOLATEDSTORAGE.GET(KEY, [DATASCOPE],VAR Value);

## Syntax  

```  

<Method Name="Get" IsStatic="true" StaticClassName="ALIsolatedStorage" AddArguments="DataError" Compatibility="2.0">

  <Documentation>Gets the value associated with the specified key.</Documentation>

  <Returns Name="Ok" Type="Boolean" IsOptional="true">

    <Documentation>**true** if the value was retrieved successfully, otherwise **false**.</Documentation>

  </Returns>

  <Parameter Name="Key" Type="String">

    <Documentation>The key of the value to get. If the specified key is not found an error will be reported.</Documentation>

  </Parameter>

  <Parameter Name="DataScope" Type="DataScope" IsOptional="true">

    <Documentation>The scope of the data to retrieve. If a value is not passed in, the default value DataScope::Module will be used.</Documentation>

  </Parameter>

  <Parameter Name="Value" IsVar="true" Type="Text">

    <Documentation>The value that is associated with the specified key.</Documentation>

  </Parameter>

</Method>    
```  

#### Parameters

## Property Value/Return Value

## Remarks

## Example

## See Also  
 [GUID Data Type](../datatypes/devenv-GUID-Data-Type.md)
