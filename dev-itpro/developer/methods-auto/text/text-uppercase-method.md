---
title: "UpperCase Method"
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
# UpperCase Method
Converts all letters in a string to uppercase.


## Syntax
```
NewString :=   Text.UpperCase(String: String)
```
> [!NOTE]  
> This method can be invoked without specifying the data type name.  
## Parameters
*String*  
&emsp;Type: [String](../string/string-data-type.md)  
The string that you want to convert to uppercase.  


## Return Value
*NewString*  
&emsp;Type: [String](../string/string-data-type.md)  
The string converted to uppercase.  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Example  
 The following example shows how to use the **UPPERCASE** method.  
  
 This example requires that you create the following text constants.  
  
|Text constant|ConstValue|  
|-------------------|----------------|  
|Text000|Outstanding Order Status|  
|Text001|The test string before UPPERCASE is called:\\%1|  
|Text002|The string after UPPERCASE is called:\\%1|  
  
```  
Lower := Text000;  
MESSAGE(Text001, Lower);  
Upper := UPPERCASE(Lower);  
MESSAGE(Text002, Upper);  
```  
  
 The first message window displays the following:  
  
 **The test-string before UPPERCASE is called:**  
  
 **Outstanding Order Status**  
  
 The second message window displays the following:  
  
 **The string after UPPERCASE is called:**  
  
 **OUTSTANDING ORDER STATUS**  

## See Also
[Text Data Type](text-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)