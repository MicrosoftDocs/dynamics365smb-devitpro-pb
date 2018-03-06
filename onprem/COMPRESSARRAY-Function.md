---
title: "COMPRESSARRAY Function"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: ce2474f7-3682-47fa-a7bb-29c3204c6c5b
caps.latest.revision: 10
manager: edupont
---
# COMPRESSARRAY Function
Moves all non-empty strings \(text\) in an array to the beginning of the array. The resulting StringArray has the same number of elements as the input array, but empty entries appear at the end of the array.  
  
## Syntax  
  
```  
  
[Count := ] COMPRESSARRAY(StringArray)  
```  
  
#### Parameters  
 *StringArray*  
 Type: Array of strings  
  
 The string array that you want to compress.  
  
## Property Value/Return Value  
 Type: Integer  
  
 The number of non-empty strings that were compressed.  
  
## Remarks  
 When compressing an array of strings, the non-empty strings in the resulting array are sorted just like in the original array.  
  
 The **COMPRESSARRAY** function is useful for printing names and addresses. For instance, you can use this function to remove blank lines in account statements.  
  
 This function compresses an array of Text or Code, but not BigText. The compression is performed by moving empty strings to the end of the array.  
  
 For example, "Redmond", "Copenhagen", "", "Fargo", "Paris" is changed to "Redmond", "Copenhagen", "Fargo", "Paris", "".  
  
 In [!INCLUDE[navnowlong](includes/navnowlong_md.md)], it is not supported to use the **COMPRESSARRAY** function on multidimensional arrays. In earlier versions, **COMPRESSARRAY** works for arrays of arrays.  
  
## Example  
 This example shows how to use the **COMPRESSARRAY** function. The input array has the following values.  
  
||  
|-|  
|Joe Raybon|  
||  
|One Meca Way|  
||  
|Atlanta|  
||  
  
 The output StringArray has the following values.  
  
||  
|-|  
|Joe Raybon|  
|One Meca Way|  
||  
|Atlanta|  
||  
||  
  
 All non-empty entries have been moved to the beginning of the array.  
  
 This example requires that you create the following variable in the **C/AL Globals** window.  
  
|Variable|DataType|Dimension|  
|--------------|--------------|---------------|  
|CustomerData|Text|6|  
  
```  
CustomerData[1] := 'Joe Raybon';  
CustomerData[2] := ''; // Empty string.  
CustomerData[3] :='One Meca Way';  
CustomerData[4] := '  '; // A non-empty string that contains blanks.  
CustomerData[5] := 'Atlanta';  
CustomerData[6] := ''; // Empty string.  
MESSAGE('Before compression the address is: \%1\%2\%3\%4\%5\%6', CustomerData[1], CustomerData[2], CustomerData[3], CustomerData[4], CustomerData[5], CustomerData[6]);  
COMPRESSARRAY(CustomerData); // The empty lines (strings) are removed.  
MESSAGE('After compression the address is: \%1\%2\%3\%4\%5\%6', CustomerData[1], CustomerData[2], CustomerData[3], CustomerData[4], CustomerData[5], CustomerData[6]);  
```  
  
 The first message window displays the following:  
  
 **Before compression, the address is:**  
  
 **Joe Raybon**  
  
 **One Meca Way**  
  
 **Atlanta**  
  
 The second message window displays the following:  
  
 **After compression, the address is:**  
  
 **Joe Raybon**  
  
 **One Meca Way**  
  
 **Atlanta**  
  
 All empty strings, which cause blank lines, are moved to the end of the array.  
  
> [!NOTE]  
>  Empty lines are not printed if they occur on the first or last line in a message window.  
  
## See Also  
 [ARRAYLEN Function](ARRAYLEN-Function.md)   
 [COPYARRAY Function](COPYARRAY-Function.md)