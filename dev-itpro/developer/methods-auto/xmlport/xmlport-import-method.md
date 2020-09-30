---
title: "Xmlport.Import Method"
ms.author: solsen
ms.custom: na
ms.date: 09/15/2020
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
# Xmlport.Import Method
Reads and parses an incoming XML data stream (XML document).


## Syntax
```
[Ok := ]  Xmlport.Import(Number: Integer, var InStream: InStream [, var Record: Record])
```
## Parameters
*Number*  
&emsp;Type: [Integer](../integer/integer-data-type.md)  
The ID of the XmlPort that you want to run. If the XmlPort that you specify does not exist, a run-time error occurs.
          
*InStream*  
&emsp;Type: [InStream](../instream/instream-data-type.md)  
The source from which the import XmlPort object will read the XML data stream.
          
*Record*  
&emsp;Type: [Record](../record/record-data-type.md)  
The record to use in the XmlPort. Any filters that are attached to the record will be used. This parameter is optional. If this parameter is omitted, all records in the table are imported. For example, you can use this parameter to change the values of properties such as FieldSeparator or TextEncoding, depending on each record that is imported.
          


## Return Value
*Ok*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
**true** if the operation was successful; otherwise **false**.   If you omit this optional return value and the operation does not execute successfully, a runtime error will occur.    


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[Xmlport Data Type](xmlport-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)