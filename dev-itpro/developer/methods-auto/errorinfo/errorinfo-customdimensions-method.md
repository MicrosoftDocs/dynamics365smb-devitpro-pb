---
title: "ErrorInfo.CustomDimensions([Dictionary of [Text, Text]]) Method"
description: "Set of additional dimensions, specified as a dictionary that relates to the error."
ms.author: solsen
ms.custom: na
ms.date: 08/24/2021
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# ErrorInfo.CustomDimensions([Dictionary of [Text, Text]]) Method
> **Version**: _Available or changed with runtime version 8.0._

Set of additional dimensions, specified as a dictionary that relates to the error.


## Syntax
```AL
[CustomDimensions := ]  ErrorInfo.CustomDimensions([CustomDimensions: Dictionary of [Text, Text]])
```
> [!NOTE]
> This method can be invoked using property access syntax.
## Parameters
*ErrorInfo*  
&emsp;Type: [ErrorInfo](errorinfo-data-type.md)  
An instance of the [ErrorInfo](errorinfo-data-type.md) data type.  

*[Optional] CustomDimensions*  
&emsp;Type: [Dictionary of [Text, Text]](../dictionary/dictionary-data-type.md)  
The custom dimensions of the ErrorInfo  


## Return Value
*[Optional] CustomDimensions*  
&emsp;Type: [Dictionary of [Text, Text]](../dictionary/dictionary-data-type.md)  
The current custom dimensions of the ErrorInfo.


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remark

You can use the `CustomDimensions` dictionary to transfer data from the code where an error message is shown to the user to the codeunit and method(s) executed by fix-it actions or where you handle collected errors. 

For more information about how to develop actionable errors, see [Actionable errors](../../devenv-actionable-errors.md). 

For more information about how to handle multiple collected errors, see [Collecting errors](../../devenv-error-collection.md).


## Example (get the CustomDimensions dictionary)

```AL
procedure myProc( MyErrorInfo: ErrorInfo )
var 
    TheCustomDimensions: Dictionary of [Text, Text];
begin
    TheCustomDimensions := MyErrorInfo.CustomDimensions();

    // do something with the data
end
```

## Example (set the CustomDimensions dictionary property)

```AL

var 
    MyErrorInfo: ErrorInfo;
    TheCustomDimensions: Dictionary of [Text, Text];
begin
    // setup the error info object: Define Message, DetailedMessage etc.

    // Populate TheCustomDimensions dictionary with data needed by the fix-it action
    TheCustomDimensions.Add('MyKey', 'Some data');
    TheCustomDimensions.Add('MySecondKey', 'Some more data');
    MyErrorInfo.CustomDimensions(TheCustomDimensions);

    // setup actions for the error info object

    Error(MyErrorInfo);
end
```



## See Also

[ErrorInfo Data Type](errorinfo-data-type.md)  
[Actionable errors](../../devenv-actionable-errors.md)  
[Collecting errors](../../devenv-error-collection.md)  
[Error handling](../../devenv-al-error-handling.md)   
[Get Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)