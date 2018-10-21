---
title: "ExportFile Method"
ms.author: solsen
ms.custom: na
ms.date: 10/17/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# ExportFile Method
Exports the media objects in the current media set of a record to individual files on your computer or network. In the record, the media set is referenced in a MediaSet data type field.

## Syntax
```
[Count := ]  MediaSet.ExportFile(FilenamePrefix: String)
```
## Parameters
*MediaSet*  
&emsp;Type: [MediaSet](mediaset-data-type.md)  
An instance of the [MediaSet](mediaset-data-type.md) data type.  

*FilenamePrefix*  
&emsp;Type: [String](../string/string-data-type.md)  
Specifies the location and name of the exported media files. Each exported media file is given a name that consists of a prefix that you specify, plus an index number that is automatically assigned. The file name has the format prefix-index.type, for example, Image-1.jpg, Image-2.jpg, and Image-3.jpg. To set the parameter value, use the format: path\prefix.type.
-   path is the folder path where you want to store the files.
-   prefix is the text that you want before the index number.
-   type is the media type extension.
          


## Return Value
*Count*  
&emsp;Type: [Integer](../integer/integer-data-type.md)  
The number of exported elements.If you omit this optional return value and the operation does not execute successfully, a runtime error will occur.    


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[MediaSet Data Type](mediaset-data-type.md)  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)