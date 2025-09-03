---
title: "AllowInCustomizations property"
description: "Specifies whether the fields declared in this object can be used as source expression for new page fields in page customizations, and if they can be made editable."
ms.author: solsen
ms.date: 09/03/2025
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# AllowInCustomizations Property
> **Version**: _Available or changed with runtime version 16.0._

Specifies whether the fields declared in this object can be used as source expression for new page fields in page customizations, and if they can be made editable.

## Applies to
-   Table
-   Table field

## Property value

|Value|Available or changed with|Description|
|-----------|-----------|---------------------------------------|
|**ToBeClassified**|runtime version 16.0|The fields declared in this object have not yet been given a classification. By default, the fields can be used as source expressions for new page fields in page customizations, but they cannot be made editable.|
|**Never**|runtime version 16.0|The fields declared in this object cannot be used as source expressions for new page fields in page customizations.|
|**AsReadOnly**|runtime version 16.0|The fields declared in this object can be used as source expressions for new page fields in page customizations, but they cannot be made editable.|
|**AsReadWrite**|runtime version 16.0|The fields declared in this object can be used as source expressions for new page fields in page customizations, and they can be made editable.|

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