---
title: "ISPATHTEMPORARY Method (File)"
ms.custom: na
ms.date: 14/08/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamics365-financials
author: jswymer
---

# ISPATHTEMPORARY Method (File)

Validates whether the file is located in the current user's temporary folder for the current service.

## Syntax

``` 
[Ok :=] File.IsPathTemporary(FileName);
``` 

#### Parameters  

*FileName*  
Type: Text  

## Return Value  
Type: Boolean
 
**true** if the `FileName` represents a file that located in the current user's temporary folder in the current service; otherwise **false**. 

If you omit the return value, then a run-time error occurs if `false`. If you include a return value, then you must handle the error.

## Remarks  
This method is useful for cloud installations where handling of local files is not allowed. The ISPATHTEMPORARY method returns `false` if the `FileName` parameter contains a file that includes a local or network folder path.

For example, the following code returns `true`: 

```
Ok := FILE.ISPATHTEMPORARY('MyFile.txt');
```

The following code will return `false`:

```
Ok := FILE.ISPATHTEMPORARY('c:\Temp\MyFile.txt');
```

## See Also  
 [File Data Type](../datatypes/devenv-File-Data-Type.md)
