---
title: "OnPreXmlItem (Xml Port Table Element) Trigger"
description: "Runs after the table is initialized and before you start exporting data to an XML object. This trigger only applies to XMLPort elements that have a source type of Table."
ms.author: solsen
ms.custom: na
ms.date: 04/27/2021
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

# OnPreXmlItem (Xml Port Table Element) Trigger
> **Version**: _Available or changed with runtime version 1.0._

Runs after the table is initialized and before you start exporting data to an XML object. This trigger only applies to XMLPort elements that have a source type of Table.


## Syntax
```
trigger OnPreXmlItem()
begin
    ...
end;
```



[//]: # (IMPORTANT: END>DO_NOT_EDIT)

  
## Remarks  
 This trigger is only used to export data. It is typically used to set filters on the data and to initialize variables before finding the first record.  

## See Also  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)  
