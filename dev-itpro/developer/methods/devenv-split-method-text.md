---
title: "SPLIT Method"
ms.author: SusanneWindfeldPedersen
ms.custom: na
ms.date: 11/28/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.assetid: 620f0e32-eadc-43e9-8f6e-8fc0b12c3aaf
caps.latest.revision: 1
manager: edupont
author: SusanneWindfeldPedersen
---

# SPLIT Method

The SPLIT method is an instance method that splits the text into a list of sub-texts based on the texts provided as arguments.
```
Substrings := Value.SPLIT(Separators)
```
## Parameters
*Separators*    
&emsp;Type: List of [Text]  
A list of text values that delimits the substrings in text.

## Return Value
*Substrings*  
&emsp;Type: List of [Text]  
A list whose elements represent the substrings from this instance that are delimited by one or more strings in the list of separators.

## Remarks 

### Return value details
Delimiter strings are not included in the elements of the returned list. For example, if the separator list includes the string '-' and the value of the current text instance is 'aa-bb-cc', the method returns a list that contains three elements: 'aa', 'bb', and 'cc'.
If this instance does not contain any of the strings in the list of separators, the returned list consists of a single element that contains this instance.

## Example
The following snippet shows how to split the text 'a-aa;aaa' on the separators '-' and ';'. Running this procedure will show three prompts containing 'a', 'aa', and 'aaa' respectively.

```  
procedure MySplit()
var 
    t : text;
    separators : List of [Text];
    splitTexts : List of [Text];
    temp : Text;
begin
    t := 'a-aa;aaa';
    separators.Add('-');
    separators.Add(';');
    splitTexts := t.Split(separators);
    foreach temp in splitTexts do
        Message(temp);
end;
``` 


## See Also
[Text Data Type](../datatypes/devenv-text-data-type.md)  
[Getting Started with AL](../devenv-get-started.md)  
[Development in AL](../devenv-dev-overview.md)  