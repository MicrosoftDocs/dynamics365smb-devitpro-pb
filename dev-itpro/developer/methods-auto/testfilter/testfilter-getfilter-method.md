---
title: "TestFilter.GetFilter Method"
ms.author: solsen
ms.custom: na
ms.date: 11/23/2020
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
# TestFilter.GetFilter Method
> **Version**: _Available from runtime version 1.0._

Gets the filter that is applied to the specified field in a data set that is displayed on a test page.


## Syntax
```
String :=   TestFilter.GetFilter(Field: TestFilterField)
```
## Parameters
*TestFilter*
&emsp;Type: [TestFilter](testfilter-data-type.md)
An instance of the [TestFilter](testfilter-data-type.md) data type.

*Field*  
&emsp;Type: [TestFilterField](../testfilterfield/testfilterfield-data-type.md)  
The field that you want to get the filter from.
          


## Return Value
*String*
&emsp;Type: [String](../string/string-data-type.md)



[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[TestFilter Data Type](testfilter-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)