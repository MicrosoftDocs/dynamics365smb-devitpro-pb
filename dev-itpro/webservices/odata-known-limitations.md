---
title: "Known OData Limitations "
description: Learn about known limitations with Business Central OData.
ms.date: 04/01/2022
ms.topic: conceptual
---

# Known Limitations with Business Central OData
The Open Data Protocol \(OData\) implementation in [!INCLUDE[prod_short](../developer/includes/prod_short.md)] does not implement all features in the OData specification. On this page you can read more about the known limitations with Business Central OData.

## PATCH and collection properties

PATCH is not possible for collection properties in OData. This is not a limitation imposed by Business Central but is specified in section 11.4.9.4 of the OData v4 standard.

## Filters

You can specify filters in OData web services in general that are not supported in [!INCLUDE[prod_short](../developer/includes/prod_short.md)] , such as using an OR operator to filter on two different fields. In those cases, you will see the following error:  
  
```  
An error occurred while processing this request.   
 The 'OR' operator is not supported on distinct fields on an OData filter.  
```  

## Lambda operators

Lambda operators are not supported by [!INCLUDE[prod_short](../developer/includes/prod_short.md)] OData APIs. If lambda operators are used, the filter expression will be ignored.

## UI pages
If you use Web services that are based on UI pages, you must expect the same behavior from the Web service as from the UI page. If you want to have full control and separation of concern it is recommended to use the Business Central APIs instead.

## Deep insert and patching

[!INCLUDE[prod_short](../developer/includes/prod_short.md)] supports deep insert on API page types. It's not supported on pages exposed as ODataV4 web services. Although ODataV4 web services might work in some cases, it's not a recommended.

[!INCLUDE[prod_short](../developer/includes/prod_short.md)] doesn't support deep patching. Multiple requests will need to be issued when patching nested entities.

## Related information

[OData Web Services overview](odata-web-services.md)   
