---
title: "Multiplicity property"
description: "Specify the multiplicity of the part."
ms.author: solsen
ms.date: 08/26/2024
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# Multiplicity Property
> **Version**: _Available or changed with runtime version 6.3._

Specify the multiplicity of the part.

## Applies to
-   Page Part

## Property value

|Value|Available or changed with|Description|
|-----------|-----------|---------------------------------------|
|**ZeroOrOne**|runtime version 6.3|Zero or one entity|
|**Many**|runtime version 6.3|Any number of entities.|

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

## Remarks

This property is used on page parts on API pages. For more information, see [API Page Type](../devenv-api-pagetype.md). By default multiplicity for parts is defined as 1:N. For more in-depth examples and information, see [Developing a Custom API](../devenv-develop-custom-api.md).


## Related information

[Get Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  
