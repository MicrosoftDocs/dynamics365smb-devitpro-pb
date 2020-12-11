---
title: "Direction Property"
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
# Direction Property
> **Version**: _Available from runtime version 1.0._

Sets the XmlPort to import, export, or import and export data in XML format.

## Applies to
-   Xml Port

## Property Value

|Value|Description|
|-----------|---------------------------------------|
|**Import**|The XMLPort only imports data.|
|**Export**|The XMLPort only exports data.|
|**Both**|The XMLPort can import and export data.<br /><br /> If the XMLPort uses a request page, as specified by the **UseRequestPage Property**, then an option appears on the request page that enables the users to choose to import or export data. This is the default value.|

[//]: # (IMPORTANT: END>DO_NOT_EDIT)


> [!NOTE]  
> Request pages show when the XMLport is run from an action page or the `Run` method in AL code. Request pages do not show with Export or Import methods<br /><br /> If the XMLPort does not use a request, then XMLPort defaults to **Import**, unless you specify the direction by Import parameter of the `Run` method.|  
 
## Syntax

```AL
Direction = Import;
```

## See Also  

[Properties](devenv-properties.md)