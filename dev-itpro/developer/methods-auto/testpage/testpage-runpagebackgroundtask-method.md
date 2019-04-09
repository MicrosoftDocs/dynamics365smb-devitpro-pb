---
title: "RunPageBackgroundTask Method"
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
# RunPageBackgroundTask Method
Runs the page background task codeunit in the current session. Note that no triggers are invoked at this point.

> [!NOTE]
> This method is supported only in Business Central on-premises.

## Syntax
```
Results :=   TestPage.RunPageBackgroundTask(CodeunitId: Integer, [var Parameters: Dictionary of [Text, Text]])
```
## Parameters
*TestPage*  
&emsp;Type: [TestPage](testpage-data-type.md)  
An instance of the [TestPage](testpage-data-type.md) data type.  

*CodeunitId*  
&emsp;Type: [Integer](../integer/integer-data-type.md)  
Specifies the ID of the codeunit to run.  
*Parameters*  
&emsp;Type: [Dictionary of [Text, Text]](../dictionary/dictionary-data-type.md)  
Specifies a collection of keys and values that are passed to the OnRun trigger of the codeunit that runs when the page background task session is started.  


## Return Value
*Results*  
&emsp;Type: [Text](../text/text-data-type.md)  
The dictionary of results for the page background task.  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[TestPage Data Type](testpage-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)