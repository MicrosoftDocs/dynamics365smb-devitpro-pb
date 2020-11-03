---
title: "Direction Property"
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
# Direction Property
Sets the XmlPort to import, export, or import and export data in XML format.

## Applies to
-   Xml Port

## Property Value

|Value|Description|
|-----------|---------------------------------------|
|Import|TODO:Add documentation|
|Export|TODO:Add documentation|
|Both|TODO:Add documentation|
[//]: # (IMPORTANT: END>DO_NOT_EDIT)

> [!NOTE]  
> Request pages show when the XMLport is run from an action page or the `Run` method in AL code. Request pages do not show with Export or Import methods<br /><br /> If the XMLPort does not use a request, then XMLPort defaults to **Import**, unless you specify the direction by Import parameter of the `Run` method.|  
 
## Syntax

```AL
Direction = Import;
```

## See Also  

[Properties](devenv-properties.md)