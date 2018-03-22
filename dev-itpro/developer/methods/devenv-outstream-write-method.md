---
title: "OutStream.WRITE Method"
ms.custom: na
ms.date: 07/13/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamics365-financials
ms.assetid: b8ad5f9c-7e9c-499d-b360-3180845a3b75
caps.latest.revision: 9
---

[!INCLUDE[newdev_dev_preview](../includes/newdev_dev_preview.md)]

# OutStream.WRITE Method
Writes a specified number of bytes to the stream. Data is written in binary format.  
  
## Syntax  
  
```  
  
[Written := ] OutStream.Write(Variable[, Length])  
```  
  
#### Parameters  
 *Variable*  
 Type: Any  
  
 Contains the data to be written  
  
 *Length*  
 Type: Integer  
  
 The number of bytes to be written. In the case of data types other than string, code, and binary, if you specify a length that differs from the size of the variable, an error message is displayed.  
  
## Property Value/Return Value  
 Type: Integer  
  
 The number of bytes that were written.  
  
## Remarks  
 If the optional return value, *Written*, is not specified and it was not possible to write all the data, an error message is displayed.  
  
 If the return value is present, you must verify that all the data was streamed.  
  
## Example  
  
```  
recBinaries.FIND('-');  
recBinaries.Data.CREATEOUTSTREAM(OutStream);  
OutStream.WRITE('Secretary');  
OutStream.WRITE('Alice');  
OutStream.WRITE('Hart');  
OutStream.WRITE(010696D);  
recBinaries.MODIFY();  
```  
  
## See Also  
 [InStream and OutStream Data Types](../datatypes/devenv-InStream-and-OutStream-Data-Types.md)   
 [OutStream.WRITETEXT Method](devenv-OutStream-WRITETEXT-Method.md)