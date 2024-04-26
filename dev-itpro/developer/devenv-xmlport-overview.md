---
title: XMLport overview
description: Describes the XMLport object in AL, which is composed of a schema, request page, properties, triggers, and code.
author: blrobl
ms.custom: evergreen
ms.date: 04/18/2024
ms.reviewer: solsen
ms.topic: overview
ms.author: brobledodiaz
---

# XMLport overview

An XMLport is composed of the following items:

- An XMLport object
- An XMLport schema
- A Request page
- Properties, triggers, and code

## XMLport object

You create an XMLport object in the AL Language development environment to define the schema of an XML document. You can export and import data between an external source and [!INCLUDE [prod_short](includes/prod_short.md)] with XMLports. For more information, see [XMLport Object](devenv-xmlport-object.md).

### XMLport schema

In order to define the underlying structure of the imported or exported document, you use the XMLport schema. An XMLport schema determines which data is exported from or imported to [!INCLUDE [prod_short](includes/prod_short.md)] database tables and the format and structure of the files used. You build the XMLport schema by adding nodes. For more information, see [Defining an XMLport schema](devenv-xmlport-schema.md).

## Request page

Request pages are dialog boxes that enable the user to set a filter on the data, sort the data, or choose whether to export or import the data. For more information, see [Request pages](devenv-request-pages.md).

Unlike report request pages, XMLport request pages can't be bookmarked by users from the user interface.

## XMLport properties, triggers, and code

XMLport objects include triggers, methods, and properties that can be used to work with the object. For more information, see [XMLport data type](methods-auto/xmlport/xmlport-data-type.md) and [XMLport triggers](triggers-auto/xmlport/devenv-oninitxmlport-xmlport-trigger.md).

When you design XMLports, you must set the value of the [Format property (XMLports)](properties/devenv-format-property.md) and the [Direction property](properties/devenv-direction-property.md). The [Format property (XMLports)](properties/devenv-format-property.md) indicates the type of file that you want to import or export and the [Direction property](properties/devenv-direction-property.md) value indicates whether the XMLport will be used for import or export.

For more information about data consistency and validation against possible errors when using XMLports, see the blog post [Importing and exporting valid data using XMLports in Dynamics 365 Business Central](https://cloudblogs.microsoft.com/dynamics365/it/2019/05/22/importing-and-exporting-valid-data-using-xmlports-in-dynamics-365-business-central/).

## See also

[XMLport object](devenv-xmlport-object.md)  
[Defining an XMLport schema](devenv-xmlport-schema.md)  
[Using namespaces with XMLports](devenv-using-namespaces-with-xmlports.md)  
[Request pages](devenv-request-pages.md)  
[XMLport data type](methods-auto/xmlport/xmlport-data-type.md)  
[XMLport triggers](triggers-auto/xmlport/devenv-oninitxmlport-xmlport-trigger.md)
