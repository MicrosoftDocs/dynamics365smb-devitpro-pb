---
title: "AllowInCustomizations Property"
description: "Specifies whether this table field can be used as source expression for new page fields in page customizations."
ms.author: solsen
ms.custom: na
ms.date: 08/25/2023
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# AllowInCustomizations Property
> **Version**: _Available or changed with runtime version 12.0._

Specifies whether this table field can be used as source expression for new page fields in page customizations.

## Applies to
-   Table Field

## Property Value

|Value|Available or changed with|Description|
|-----------|-----------|---------------------------------------|
|**Always**|runtime version 1.0|The field can be used as source expression for new page fields in page customizations.|
|**Never**|runtime version 1.0|The field cannot be used as source expression for new page fields in page customizations.|

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks

If you change the property from `Always` to `Never`, then when the new extension version is published, the field is removed from any existing pages that show it. For more information about page customization, see [Customize pages for profiles](/dynamics365/business-central/ui-personalization-manage).

## Example

The following table extension example adds a field to the **Customer** table. Because the `AllowInCustomizations` property is set to `Never`, the field can't be added to any pages by using the page customizations feature in the client.  

```AL
tableextension 50100 MyExtension extends Customer
{
    fields
    {
        field(599999; MyField; Blob)
        {
           AllowInCustomizations = Never;
        }
    }
}
```

## See Also  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  