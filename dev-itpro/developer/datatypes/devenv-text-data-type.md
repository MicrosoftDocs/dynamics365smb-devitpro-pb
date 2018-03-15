---
title: "Text Data Type"
ms.custom: na
ms.date: 07/20/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.assetid: fe8419b7-96a2-486e-858d-51f62c66657f
caps.latest.revision: 16
author: SusanneWindfeldPedersen
---
# Text Data Type
This simple data type denotes a text string.  
  
## Remarks  
 [!INCLUDE[d365fin_md](../includes/d365fin_md.md)] does not enforce a limit on the length of a Text variable. You can specify a maximum length when you create the variable, but it is not required. There is no performance impact if you do not specify a length. The maximum length of a Text field in a table is 250 characters. The length of a text variable equals the number of characters in the string. An empty text string has a length of zero (0). A text string cannot be null.  
  
 You can index any character position in a text string, for example A[65]. The resulting value will be a [Char Data Type](devenv-char-data-type.md).  
  
 You cannot assign a char to a position in the code variable greater than the current length of the variable +1. For more information, see [Char Data Type](devenv-char-data-type.md).  
  
 The Text data type supports Unicode.  

## Methods
  
The following methods are **instance** methods, which support the Text data type:  

|Method      |
|------------|
|[CONTAINS Method (Text)](../methods/devenv-contains-method-text.md)|
|[ENDSWITH Method (Text)](../methods/devenv-endswith-method-text.md)|
|[INDEXOFANY Method (Text)](../methods/devenv-indexofany-method-text.md)|
|[INDEXOF Method (Text)](../methods/devenv-indexof-method-text.md)|
|[LASTINDEXOF Method (Text)](../methods/devenv-lastindexof-method-text.md)|
|[PADLEFT Method (Text)](../methods/devenv-padleft-method-text.md)|
|[PADRIGHT Method (Text)](../methods/devenv-padright-method-text.md)|
|[REMOVE Method (Text)](../methods/devenv-remove-method-text.md)|
|[REPLACE Method (Text)](../methods/devenv-replace-method-text.md)|
|[STARTSWITH Method (Text)](../methods/devenv-startswith-method-text.md)|
|[SPLIT Method (Text)](../methods/devenv-split-method-text.md)|
|[SUBSTRING Method (Text)](../methods/devenv-substring-method-text.md)|
|[TOLOWER Method (Text)](../methods/devenv-tolower-method-text.md)|
|[TOUPPER Method (Text)](../methods/devenv-toupper-method-text.md)|
|[TRIMEND Method (Text)](../methods/devenv-trimend-method-text.md)|
|[TRIM Method (Text)](../methods/devenv-trim-method-text.md)|
|[TRIMSTART Method (Text)](../methods/devenv-trimstart-method-text.md)|

The following methods are **static** methods, which support the Text data type:

|Method      | 
|------------|
|[CONVERTSTR Method (Code, Text)](../methods/devenv-convertstr-method-code-text.md)|
|[COPYSTR Method (Code, Text)](../methods/devenv-copystr-method-code-text.md)|
|[DELCHR Method (Code, Text)](../methods/devenv-delchr-method-code-text.md)|
|[DELSTR Method (Code, Text)](../methods/devenv-delstr-method-code-text.md)| 
|[FORMAT Method (Code, Text)](../methods/devenv-format-method-code-text.md)|
|[INCSTR Method (Code, Text)](../methods/devenv-incstr-method-code-text.md)|
|[INSSTR Method (Code, Text)](../methods/devenv-insstr-method-code-text.md)|
|[LOWERCASE Method (Code, Text)](../methods/devenv-lowercase-method-code-text.md)|
|[MAXSTRLEN Method (Code, Text)](../methods/devenv-maxstrlen-method-code-text.md)|
|[PADSTR Method (Code, Text)](../methods/devenv-padstr-method-code-text.md)|
|[SELECTSTR Method (Code, Text)](../methods/devenv-selectstr-method-code-text.md)|
|[STRCHECKSUM Method (Code, Text)](../methods/devenv-strchecksum-method-code-text.md)|
|[STRLEN Method (Code, Text)](../methods/devenv-strlen-method-code-text.md)|
|[STRPOS Method (Code, Text)](../methods/devenv-strpos-method-code-text.md)|
|[STRSUBSTNO Method (Code, Text)](../methods/devenv-strsubstno-method-code-text.md)|
|[UPPERCASE Method (Code, Text)](../methods/devenv-uppercase-method-code-text.md)|

## Example  
 This example shows typical examples of text strings. Here, the text variable has a maximum length of 6.  
  
```  
text := 'ABC';  
// Results in a text variable which contains 'ABC'.  
text := '123456abc';  
// Results in a run-time error because the length (9)  
// exceeds the maximum length of 6.  
```  
  
## See Also  
[AL Data Types](devenv-al-data-types.md)  
[TextBuilder](../api/textbuilder-class.md)  
[AL Method Reference](../methods/devenv-al-method-reference.md)  