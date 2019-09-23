---
title: "TopNumberOfRows Method"
ms.author: solsen
ms.custom: na
ms.date: 09/16/2019
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
# TopNumberOfRows Method
Specifies the maximum number of rows to include in the resulting data set of a query.


## Syntax
```
[CurrentRows := ]  Query.TopNumberOfRows([NewRows: Integer])
```
> [!NOTE]  
> This method can be invoked using property access syntax.  
## Parameters
*Query*  
&emsp;Type: [Query](query-data-type.md)  
An instance of the [Query](query-data-type.md) data type.  

*NewRows*  
&emsp;Type: [Integer](../integer/integer-data-type.md)  
The number of rows to include in the resulting data set. If you do not set the NewRows parameter, then the resulting data set will include all rows. If you set the value to 0, then there is no limit and all rows of the data set are returned.
          


## Return Value
*CurrentRows*  
&emsp;Type: [Integer](../integer/integer-data-type.md)  
Gets the current maximum number of rows included in the resulting data set  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[Query Data Type](query-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)