---
title: "Find Method"
ms.author: solsen
ms.custom: na
ms.date: 04/01/2019
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
# Find Method
Finds a record in a table that is based on the values stored in keys.


## Syntax
```
[Ok := ]  Record.Find([Which: String])
```
## Parameters
*Record*  
&emsp;Type: [Record](record-data-type.md)  
An instance of the [Record](record-data-type.md) data type.  

*Which*  
&emsp;Type: [String](../string/string-data-type.md)  
Specifies how to perform the search. The table is searched until either a record  is found or there are no more records. Each character in this string can be present only one time. You can combine the '=', '\<', and '>' characters. You can use the following characters:
-   =  to search for a record that equals the key values (default)
-  >  to search for a record that is larger than the key values
-   <  to search for a record that is less than the key values
-   +  to search for the last record in the table (+ can only be used alone)
-   -   to search for the first record in the table (- can only be used alone)
If this parameter contains '=', '>' or '<', then you must assign value to all fields of the current and primary keys before you call FIND.
          


## Return Value
*Ok*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
**true** if the operation was successful; otherwise **false**.  If you omit this optional return value and the operation does not execute successfully, a runtime error will occur.    


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[Record Data Type](record-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)