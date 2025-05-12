---
title: Defining an XMLport schema
description: An XMLport schema determines which data is exported from or imported to Dynamics 365 Business Central database tables and the format and structure of the files used.
author: blrobl
ms.date: 01/30/2025
ms.topic: concept-article
ms.author: brobledodiaz
ms.reviewer: solsen
ms.custom: evergreen
---

# Defining an XMLport schema

You use an XMLport object to export and import data between an external source and [!INCLUDE [prod_short](includes/prod_short.md)]. The schema determines which data and how that data is extracted from or inserted into the [!INCLUDE [prod_short](includes/prod_short.md)] database tables through an XMLport. Learn more in [XMLport object](devenv-xmlport-object.md) and about designing XMLports in [XMLport overview](devenv-xmlport-overview.md).

You build the XMLport schema from nodes. A node can be one of the following elements:

- A text element
- A text attribute
- A table element
- A field element
- A field attribute

You nest nodes inside other nodes to define the structure of the XMLport schema. Use the following keywords to define the structure.

|Keyword|Description|
|-------|-----------|
|`textelement`|Defines a new text element in the XMLport. It's used for XML elements that don't map to a database item or when the database doesn't need the information.|
|`textattribute`|Defines a new text attribute in the XMLport. It's used for XML attributes that don't map to a database item or when the database doesn't need the information.|
|`tableelement`|Defines a new table element in the XMLport. It's used for XML elements that map to a table in the database, which is specified in the [SourceTable property](properties/devenv-sourcetable-property.md). When the XMLport is run, the code nested inside the table element is iterated for all records in the underlying table.|
|`fieldelement`|Defines a new field element in the XMLport. It's used for XMLport elements that map to a field in the database, which is specified in the [SourceField property](./properties/devenv-properties.md). You must specify it inside the parent table element of the field. |
|`fieldattribute`|Defines a new field attribute in the XMLport. It's used for XMLport attributes that map to a field in the database, which is specified in the [SourceField property](./properties/devenv-properties.md).|

> [!NOTE]  
> There can only be one `<root>` node, which must be an element. If the [Format property](properties/devenv-format-property.md) is set to **Xml**, it must be a `textelement` node.

There can be several attributes for a single element and their order doesn't matter. Attribute nodes must be specified inside the element nodes they refer to and before other element nodes. They can't have nested element nodes.

## Snippet support

Typing the shortcut `txmlport` creates the basic layout for an XMLport object when using the [!INCLUDE[d365al_ext_md](../includes/d365al_ext_md.md)] in Visual Studio Code. 

### Example

The following example adds the `Customer` table as a table element, the `Address` field as a field element and the `County` and `City` fields as field attributes.

```AL
schema
{
    textelement(Customers)
    {
        tableelement(Customer; Customer)
        {
            fieldelement(Address; Customer.Address)
            {
                fieldattribute(County; Customer.County){}
                fieldattribute(City; Customer.City){}
            }
        }
    }
}
```

Learn more about designing XMLports in [XMLport overview](devenv-xmlport-overview.md).

Learn more about data consistency and validation against possible errors when using XMLports in the blog post [Importing and exporting valid data using XMLports in Dynamics 365 Business Central](https://cloudblogs.microsoft.com/dynamics365/it/2019/05/22/importing-and-exporting-valid-data-using-xmlports-in-dynamics-365-business-central/). 

Learn more about the use of namespaces in XMLports see [Using namespaces with XMLports](devenv-using-namespaces-with-xmlports.md).

## Related information

[XMLport object](devenv-xmlport-object.md)  
[XMLport data type](methods-auto/xmlport/xmlport-data-type.md)  
[Using namespaces with XMLports](devenv-using-namespaces-with-xmlports.md)  
[XMLport triggers](triggers-auto/xmlport/devenv-oninitxmlport-xmlport-trigger.md)
[Request pages](devenv-request-pages.md)  
[XMLport overview](devenv-xmlport-overview.md)
