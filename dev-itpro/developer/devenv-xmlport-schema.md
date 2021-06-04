---
title: "Defining an XMLport schema"
description: "An XMLport schema determines which data is exported from or imported to Dynamics 365 Business Central database tables and the format and structure of the files used."
author: blrobl
ms.custom: na
ms.date: 04/01/2021
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: conceptual
ms.service: "dynamics365-business-central"
ms.author: t-blrobl
---


# Defining an XMLport schema
You use an XMLport object to export and import data between an external source and [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)]. The schema determines which and how data is extracted from or inserted into the [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)] database tables through an XMLport. For more information, see [XMLport Object](devenv-xmlport-object.md).

You build the XMLport schema from nodes. A node can be: 

- A text element

- A text attribute

- A table element

- A field element

- A field attribute

You nest nodes inside other nodes in order to define the structure of the XMLport schema. Use the following keywords to define the structure.

|Keyword|Description|
|-------|-----------|
|`textelement`|Defines a new text element in the XMLport. It is used for XML elements that do not map to a database item or when the database does not need the information.|
|`textattribute`|Defines a new text attribute in the XMLport. It is used for XML attributes that do not map to a database item or when the database does not need the information.|
|`tableelement`|Defines a new table element in the XMLport. It is used for XML elements that map to a table in the database, which is specified in the [SourceTable Property](properties/devenv-sourcetable-property.md). When the XMLport is run, the code nested inside the table element is iterated for all records in the underlying table.|
|`fieldelement`|Defines a new field element in the XMLport. It is used for XMLport elements that map to a field in the database, which is specified in the [SourceField Property](./properties/devenv-properties.md). You must specify it inside the parent table element of the field. |
|`fieldattribute`|Defines a new field attribute in the XMLport. It is used for XMLport attributes that map to a field in the database, which is specified in the [SourceField Property](./properties/devenv-properties.md).|

> [!NOTE]  
> There can only be one `<root>` node, which must be an element. If the [Format Property](properties/devenv-format-property.md) is set to **Xml**, it must be a `textelement` node.

There can be several attributes for a single element and their order does not matter. Attribute nodes must be specified inside the element nodes they refer to and before other element nodes. They cannot have nested element nodes.

## Snippet support
Typing the shortcut `txmlport` will create the basic layout for an XMLport object when using the [!INCLUDE[d365al_ext_md](../includes/d365al_ext_md.md)] in Visual Studio Code. 

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

For more information about designing XMLports, see [XMLport Overview](devenv-xmlport-overview.md).

For more information about data consistency and validation against possible errors when using XMLports, see the blog post [Importing and exporting valid data using XMLports in Dynamics 365 Business Central](https://cloudblogs.microsoft.com/dynamics365/it/2019/05/22/importing-and-exporting-valid-data-using-xmlports-in-dynamics-365-business-central/). 

For information about the use of namespaces in XMLports see [Using Namespaces with XMLports](devenv-using-namespaces-with-xmlports.md).

## See Also
[XMLport Object](devenv-xmlport-object.md)  
[XMLport Data Type](methods-auto/xmlport/xmlport-data-type.md)  
[Using Namespaces with XMLports](devenv-using-namespaces-with-xmlports.md)  
[XMLport Triggers](triggers-auto/xmlport/devenv-oninitxmlport-xmlport-trigger.md)
[Request Pages](devenv-request-pages.md)  
[XMLport Overview](devenv-xmlport-overview.md)