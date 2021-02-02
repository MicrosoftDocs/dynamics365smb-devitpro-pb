---
title: "TestPage.OpenEdit Method"
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
# TestPage.OpenEdit Method
> **Version**: _Available from runtime version 1.0._

Opens a test page in edit mode.


## Syntax
```
 TestPage.OpenEdit()
```

## Parameters
*TestPage*
&emsp;Type: [TestPage](testpage-data-type.md)
An instance of the [TestPage](testpage-data-type.md) data type.


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks  
 If *TestPage* is already open, then a run-time error occurs, and the outcome of the test method is FAILURE.  
  
 If the page to which *TestPage* refers is a card page, then the data that is loaded on the page is from the first row in the dataset.  
  
## Example  
 This example requires that you create a TestPage variable named CustTestPage with a Subtype of Customer List and that the codeunit in which you write the code is a test codeunit.  
  
```al
// Opens the TestPage in edit mode.  
CustTestPage.OpenEdit()  
  
```

## See Also
[TestPage Data Type](testpage-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)