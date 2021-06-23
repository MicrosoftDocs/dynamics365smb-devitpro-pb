---
title: "Multiplicity Property"
description: "Specify the multiplicity of the part."
ms.author: solsen
ms.custom: na
ms.date: 06/23/2021
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# Multiplicity Property
> **Version**: _Available or changed with runtime version 6.3._

Specify the multiplicity of the part.

## Applies to
-   Page Part

## Property Value

|Value|Description|
|-----------|---------------------------------------|
|**ZeroOrOne**|Zero or one entity|
|**Many**|Any number of entities.|

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Syntax

```al

    part(carModels; "API Car Model")
    {
        Caption = 'Car Models';
        Multiplicity = Many;
        EntityName = 'carModel';
        EntitySetName = 'carModels';
        SubPageLink = "Brand Id" = Field(SystemId);
    }

    part(vendor; "API Vendor")
    {
        Caption = 'Vendor';
        Multiplicity = ZeroOrOne;
        EntityName = 'vendor';
        SubPageLink = "id" = Field(SystemId);
    }
        
```

## See Also  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  
