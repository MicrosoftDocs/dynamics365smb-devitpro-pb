---
title: "Xmlport.ImportFile Method"
ms.author: solsen
ms.custom: na
ms.date: 10/01/2020
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
# Xmlport.ImportFile Method
Gets or sets the ImportFile property.


## Syntax
```
[ImportFile := ]  Xmlport.ImportFile([ImportFile: Boolean])
```
> [!NOTE]  
> This method can be invoked using property access syntax.  
## Parameters
*Xmlport*  
&emsp;Type: [Xmlport](xmlport-data-type.md)  
An instance of the [Xmlport](xmlport-data-type.md) data type.  

*ImportFile*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
The new value of the ImportFile property. If the XmlPort is designed for export only and the new value of this property is **true**, an XmlPortExportDirectionException is thrown. If the XmlPort is designed for import only and the new value of this property **false**, an XmlPortImportDirectionException is thrown.
        


## Return Value
*ImportFile*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
The current value of the ImportFile property.  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[Xmlport Data Type](xmlport-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)