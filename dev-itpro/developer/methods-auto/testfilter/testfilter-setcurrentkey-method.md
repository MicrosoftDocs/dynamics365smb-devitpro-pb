---
title: "TestFilter.SetCurrentKey Method"
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
# TestFilter.SetCurrentKey Method
Sets the specified fields in a data set on a test page as the current key.


## Syntax
```
[Ok := ]  TestFilter.SetCurrentKey(Field1: TestFilterField [, Field2: TestFilterField,...])
```
## Parameters
*TestFilter*  
&emsp;Type: [TestFilter](testfilter-data-type.md)  
An instance of the [TestFilter](testfilter-data-type.md) data type.  

*Field1*  
&emsp;Type: [TestFilterField](../testfilterfield/testfilterfield-data-type.md)  
The field that you want to set as the current key.
          
*Field2*  
&emsp;Type: [TestFilterField](../testfilterfield/testfilterfield-data-type.md)  
Additional field that you want to set as the current key. This parameter is optional.
          


## Return Value
*Ok*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
**true** if the operation was successful; otherwise **false**.   If you omit this optional return value and the operation does not execute successfully, a runtime error will occur.    


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[TestFilter Data Type](testfilter-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)