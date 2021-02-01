---
title: "LinksAllowed Property"
ms.author: solsen
ms.custom: na
ms.date: 01/26/2021
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# LinksAllowed Property
> **Version**: _Available or changed with runtime version 1.0._

Sets whether links are allowed.

## Applies to
-   Page
-   Request Page

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Property Value

**True** if links are allowed; otherwise, **false**. The default value is **true**.  

## Syntax

```AL
LinksAllowed = false;
```  

## Remarks

If LinksAllowed is set to **true**, then you can add links or notes to a page. The links can be a links to web sites, files stored on the local computer or on a remote computer, or links to pages.  
  
On a page, the links and notes are displayed in FactBoxes. If LinksAllowed is set to **true**, then the **Actions** menu has a **Notes** item and a **Links** item. You use these to create and modify notes and links.  
  
## See Also

[Properties](devenv-properties.md)