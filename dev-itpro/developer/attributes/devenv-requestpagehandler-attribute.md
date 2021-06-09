---
title: "RequestPageHandler Attribute"
description: "Specifies that the method is a RequestPageHandler method, which handles the request page of a specific report."
ms.author: solsen
ms.custom: na
ms.date: 06/09/2021
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

# RequestPageHandler Attribute
> **Version**: _Available or changed with runtime version 1.0._

Specifies that the method is a RequestPageHandler method, which handles the request page of a specific report.


## Applies To

- Method

> [!NOTE]
> The RequestPageHandler attribute can only be set inside codeunits with the **SubType property** set to Test.

## Syntax

```
[RequestPageHandler]
procedure RequestPageHandler(var RequestPage: TestRequestPage)
```

### Parameters
*RequestPage*  
&emsp;Type: [TestRequestPage](../methods-auto/testrequestpage/testrequestpage-data-type.md)  
The ID of a specific report.


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  