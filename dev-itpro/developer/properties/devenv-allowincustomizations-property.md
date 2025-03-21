---
title: "AllowInCustomizations property"
description: "Specifies whether this table field can be used as source expression for new page fields in page customizations."
ms.author: solsen
ms.date: 08/26/2024
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# AllowInCustomizations Property
> **Version**: _Available or changed with runtime version 12.0._

Specifies whether this table field can be used as source expression for new page fields in page customizations.

## Applies to
-   Table field

## Property value

|Value|Available or changed with|Description|
|-----------|-----------|---------------------------------------|
|**Always**|runtime version 12.0|The field can be used as source expression for new page fields in page customizations.|
|**Never**|runtime version 12.0|The field cannot be used as source expression for new page fields in page customizations.|

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks

If you change the property from `Always` to `Never`, then when the new extension version is published, the field is no longer available for adding to a page using customization. Also, it's removed from any existing pages that show it. For more information about page customization, see [Customize pages for profiles](/dynamics365/business-central/ui-personalization-manage).

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

## Related information  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  