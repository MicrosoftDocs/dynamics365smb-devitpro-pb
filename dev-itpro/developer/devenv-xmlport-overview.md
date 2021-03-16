---
title: "XMLport Overview"
description: "Design a XMLport by defining the schema. The XMLport object is composed of a schema, request page, properties, triggers, and code."
author: blrobl
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: conceptual
ms.service: "dynamics365-business-central"
ms.author: t-blrobl
---

# XMLport Overview
An XMLport is composed of the following items:

- An XMLport object

- An XMLport schema

- A Request page

- Properties, triggers, and code

## XMLport object
You create an XMLport object in the AL Language development environment to define the schema of an XML document. You can export and import data between an external source and [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)] with XMLports. For more information, see [XMLport Object](devenv-xmlport-object.md).

### XMLport schema
In order to define the underlying structure of the imported or exported document, you use the XMLport schema. An XMLport schema determines which data is exported from or imported to [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)] database tables and the format and structure of the files used. You build the XMLport schema by adding nodes. For more information, see [Defining a XMLport Schema](devenv-xmlport-schema.md).

## Request page
Request pages are dialog boxes that enable the user to set a filter on the data, sort the data, or choose whether to export or import the data. For more information, see [Request Pages](devenv-request-pages.md).

Unlike report request pages, XMLport request pages cannot be bookmarked by users from the user interface.

## XMLport properties, triggers, and code
XMLport objects include triggers, methods, and properties that can be used to work with the object. For more information, see [XMLport Data Type](methods-auto/xmlport/xmlport-data-type.md) and [XMLport Triggers](triggers/devenv-xmlport-triggers.md).

When you design XMLports, you must set the value of the [Format Property (XMLports)](properties/devenv-format-property.md) and the [Direction Property](properties/devenv-direction-property.md). The [Format Property (XMLports)](properties/devenv-format-property.md) indicates the type of file that you want to import or export and the [Direction Property](properties/devenv-direction-property.md) value indicates whether the XMLport will be used for import or export.

For more information about data consistency and validation against possible errors when using XMLports, see the blog post [Importing and exporting valid data using XMLports in Dynamics 365 Business Central](https://cloudblogs.microsoft.com/dynamics365/it/2019/05/22/importing-and-exporting-valid-data-using-xmlports-in-dynamics-365-business-central/).

## See Also

[XMLport Object](devenv-xmlport-object.md)  
[Defining a XMLport Schema](devenv-xmlport-schema.md)  
[Using Namespaces with XMLports](devenv-using-namespaces-with-xmlports.md)  
[Request Pages](devenv-request-pages.md)  
[XMLport Data Type](methods-auto/xmlport/xmlport-data-type.md)  
[XMLport Triggers](triggers/devenv-xmlport-triggers.md)
