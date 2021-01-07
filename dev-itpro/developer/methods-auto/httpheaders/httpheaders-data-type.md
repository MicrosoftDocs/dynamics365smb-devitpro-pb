---
title: "HttpHeaders Data Type"
ms.author: solsen
ms.custom: na
ms.date: 12/09/2020
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
# HttpHeaders Data Type
> **Version**: _Available from runtime version 1.0._

Is a collection of headers and their values.



The following methods are available on instances of the HttpHeaders data type.

|Method name|Description|
|-----------|-----------|
|[Add(String, String)](httpheaders-add-method.md)|Adds the specified header and its value into the HttpHeaders collection. Validates the provided value.|
|[Clear()](httpheaders-clear-method.md)|Sets the HttpHeaders variable to the default value.|
|[Contains(String)](httpheaders-contains-method.md)|Checks if the specified header exists in the HttpHeaders collection.|
|[GetValues(String, Array of [Text])](httpheaders-getvalues-method.md)|Gets the values for the specified key.|
|[Remove(String)](httpheaders-remove-method.md)|Removes the specified header from the HttpHeaders collection.|
|[TryAddWithoutValidation(String, String)](httpheaders-tryaddwithoutvalidation-method.md)|Adds the specified header and its value into the HttpHeaders collection. Doesn't validate the provided value.|

[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)  