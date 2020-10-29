---
title: "UpdatePropagation Property"
ms.author: solsen
ms.custom: na
ms.date: 10/29/2020
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
# UpdatePropagation Property
Sets a value that specifies what happens when a main page with a subpage is updated. The UpdatePropagation property is available on part controls and has two options; Subpage and Both. If UpdatePropagation is set to Subpage, an update action will update the subpage only. If UpdatePropagation is set to Both, an update action will update both the main page and the subpage. This is useful if a value on the subpage changes, and you want a main page total to be refreshed automatically.

## Applies to
-   Page Part
-   Page System Part
-   Page Chart Part

## Property Value

|Value|Description|
|-----------|---------------------------------------|
|SubPart|An update action will update the subpage only|
|Both|An update action will update both the main page and the subpage|
[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  