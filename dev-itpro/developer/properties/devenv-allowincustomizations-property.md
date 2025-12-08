---
title: "AllowInCustomizations property"
description: "Specifies whether the fields declared in this object can be used as source expression for new page fields in page customizations, and if they can be made editable."
ms.author: solsen
ms.date: 09/19/2025
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
|**ToBeClassified**|runtime version 16.0|The field has not yet been given a classification. By default, the field can be used as source expressions for new page fields in page customizations, but it cannot be made editable.|
|**Always**|runtime version 12.0|The field can be used as source expression for new page fields in page customizations, but it cannot be made editable.|
|**Never**|runtime version 12.0|The field cannot be used as source expression for new page fields in page customizations.|
|**AsReadOnly**|runtime version 16.0|The field can be used as source expression for new page fields in page customizations, but it cannot be made editable.|
|**AsReadWrite**|runtime version 16.0|The field cannot be used as source expression for new page fields in page customizations.|

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks

From runtime 12.0, it is possible to add page fields in page customizations. The value `Never` was introduced to prevent sensitive fields from being added in customizations, including using the in-client designer for [page customizations](/dynamics365/business-central/ui-personalization-manage).

From runtime version 16.0, it is possible to make page fields defined in page customizations **editable**. Previously, such fields were always read-only. By default, fields have the value `ToBeClassified` and are read-only. The values `AsReadOnly` and `AsReadWrite` define explicitly whether the field can be made editable.

The value `Always` has been deprecated since it does not capture the developer intent regarding editability. It behaves similarly to `AsReadOnly`.

If you change the property to `Never`, then when the new extension version is published, the field is no longer available for adding to a page using customization. Also, it's removed from any existing pages that show it. Learn more in [Customize pages for profiles](/dynamics365/business-central/ui-personalization-manage).

If you change the property from `AsReadWrite` to `AsReadOnly`, then after publishing the new extension version, any page fields defined in page customizations that use the field as a source expression will no longer be editable.

## Example

The following example shows how to extend a table by adding three new fields. At the table level, the `AllowInCustomizations` property is set to `AsReadWrite`, which means that, by default, fields from this table extension can be made editable in customization scenarios.

For the field **MySensitiveField**, the property is explicitly overridden to `AsReadOnly`, ensuring that it remains read-only even though the table default allows edits.

```AL
tableextension 50100 MyTable
{    
    AllowInCustomizations = AsReadWrite;

    fields
    {
        field(1; MyField; Integer)
        {
        }
        field(2; MyOtherField; Integer)
        {
        }
        field(3; MySensitiveField; Integer)
        {
            AllowInCustomizations = AsReadOnly;
        }
    }
}
```

The following table extension example adds two fields to the **Customer** table. Because the `AllowInCustomizations` property is set to `Never` on the table extension level, the fields can't be added to pages through customization in the client.  

> [!IMPORTANT]
> `AllowInCustomizations` on the table extension level only applies to fields declared in the table extension and doesn't affect the base table fields.


```AL
tableextension 50100 MyExtension extends Customer
{
    AllowInCustomizations = Never;

    fields
    {
        field(599998; MyField; Blob)
        {
        }
        field(599999; MyOtherField; Blob)
        {
        }
    }
}
```

## Related information  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  
