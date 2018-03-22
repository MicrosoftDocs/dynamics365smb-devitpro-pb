---
title: "InStream.READ Method"
ms.custom: na
ms.date: 07/13/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamics365-financials
ms.assetid: 1b045348-3ba0-4dbd-80dd-0ff88049f65f
caps.latest.revision: 17
manager: edupont
---

[!INCLUDE[newdev_dev_preview](../includes/newdev_dev_preview.md)]

# InStream.READ Method
Reads a specified number of bytes from an InStream object. Data is read in binary format.  
  
## Syntax  
  
```  
  
[Read := ] InStream.Read(Variable[, Length])  
```  
  
#### Parameters  
 *Variable*  
 Type: Text  
  
 Describes the variable that will receive the data that is read.  
  
 *Length*  
 Type: Integer  
  
 Describes the number of characters to be read. If you do not specify *Length*, the size of the variable is used. In the case of data types other than string, code, and binary, if you specify a length that differs from the size of the variable, you receive an error message.  
  
## Property Value/Return Value  
 Type: Integer  
  
 The return value is the number of characters that were read.  
  
## Remarks  
 If the optional return value \(*READ*\) is not present and the data being read is less than the length requested to be read, then you receive an error message.  
  
 If the return value is present, then you must verify the validity of the data that has been read.  
  
## Example  
 The following example shows how to use the **Instream.READ** method to read data in binary format. The **FIND** method finds the first record from the **Company Information** table. The **CALCFIELDS** method retrieves the **Picture** field, which is a BLOB field. The **CREATEINSTREAM** method uses the recBinaries variable to create an InStream object that is named varInstream. The **varInstream.READ** method then reads three characters from the varInstream variable and stores the binary data in the varChars variable. The number of characters that is read is stored in the numChars variable. The binary data and the number of characters that is read are displayed in a message box. This example requires that you create the following global variables and text constants.  
  
|Variable name|DataType|Subtype|Length|  
|-------------------|--------------|-------------|------------|  
|recBinaries|Record|Company Information|Not applicable|  
|Picture|Binary|Not applicable|100|  
|varInstream|InStream|Not applicable|Not applicable|  
|varChars|Text|Not applicable|50|  
|numChars|Integer|Not applicable|Not applicable|  
  
|Text constant name|ENU value|  
|------------------------|---------------|  
|Text000|Number of characters read: %1. Characters read: %2.|  
  
```  
recBinaries.FIND('-');  
recBinaries.CALCFIELDS(recBinaries.Picture);  
recBinaries.Picture.CREATEINSTREAM(varInstream);  
numChars := varInstream.READ(varChars,3);  
MESSAGE(Text000, numChars, varChars);  
```  
  
## See Also  
 [InStream.EOS Method](devenv-InStream.EOS-Method.md)   
 [InStream.READTEXT Method](devenv-InStream.READTEXT-Method.md)   
 [OutStream.WRITE Method](devenv-OutStream-WRITE-Method.md)   
 [InStream and OutStream Data Types](../datatypes/devenv-InStream-and-OutStream-Data-Types.md)