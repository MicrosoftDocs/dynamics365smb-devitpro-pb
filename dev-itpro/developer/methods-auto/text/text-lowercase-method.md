---
title: "LowerCase Method"
ms.author: solsen
ms.custom: na
ms.date: 09/24/2019
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
# LowerCase Method
Converts all letters in a string to lowercase.


## Syntax
```
NewString :=   Text.LowerCase(String: String)
```
> [!NOTE]  
> This method can be invoked without specifying the data type name.  
## Parameters
*String*  
&emsp;Type: [String](../string/string-data-type.md)  
The string that you want to convert to lowercase. Only letters in the range A to Z and, if applicable, special language characters are converted.  


## Return Value
*NewString*  
&emsp;Type: [String](../string/string-data-type.md)  
The string converted to lowercase.  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Example  
 This example requires that you create the following global variables and text constants.  
  
|Variable name|DataType|Length|  
|-------------------|--------------|------------|  
|Str|Text|60|  
|Lower|Text|60|  
  
|Text constant|ENU value|  
|-------------------|---------------|  
|Text000|The Entries are Sorted by Name.|  
|Text001|The string before LOWERCASE is:>%1\<|  
|Text002|The string after LOWERCASE is:>%1\<|  
  
```  
Str := Text000;  
MESSAGE(Text001, Str);  
Lower := LOWERCASE(Str);  
MESSAGE(Text002, Lower);  
```  
  
 The first message window displays the following:  
  
 **The string before LOWERCASE is:**  
  
 **>The Entries are Sorted by Name.\<**  
  
 The second message window displays the following:  
  
 **The string after LOWERCASE is:**  
  
 **>the entries are sorted by name.\<**  
  

## See Also
[Text Data Type](text-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)