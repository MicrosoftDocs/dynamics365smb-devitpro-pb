---
title: "RequestFilterFields Property"
ms.author: solsen
ms.custom: na
ms.date: 11/24/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# RequestFilterFields Property
> **Version**: _Available from runtime version 1.0._

Sets which fields are automatically included on the tab of the request page that is related to this data item. The user can set filters on these fields.

## Applies to
-   Xml Port Table Element
-   Report Data Item


[//]: # (IMPORTANT: END>DO_NOT_EDIT)


## Property Value

A comma-separated list of field names.  

## Example

```AL
RequestFilterFields="No.","Search Name","Customer Posting Group";
```
  
## Remarks

We recommend that you use this property for common filter fields.
  
If you do not want users to add filters on fields, then use one of the following methods:  

- Remove the request page completely by using the [UseRequestPage Property](devenv-userequestpage-property.md) of the report or XMLport. 

- Do not specify the **RequestFilterFields** property, then the request page will display with only the actions: **Send to**, **Print**, **Preview**, and **Cancel** will display. And you can instead specify a key field on which to sort in the [DataItemTableView Property](devenv-dataitemtableview-property.md) for a report and in the [SourceTableView (XMLports) Property](devenv-sourcetableview-XMLports-property.md) for an XMLport.  

> [!NOTE]  
> On the Windows client, users can specify filters, even if **RequestFilterFields** is not specified.

## See Also

[Request Pages](../devenv-request-pages.md)  