---
title: "ErrorInfo.Verbosity([Verbosity]) Method"
description: "Specifies the severity level of the error."
ms.author: solsen
ms.custom: na
ms.date: 07/07/2021
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# ErrorInfo.Verbosity([Verbosity]) Method
> **Version**: _Available or changed with runtime version 3.0._

Specifies the severity level of the error. This can determine whether the error should be sent to telemetry (which is based on the trace level setting of the server).


## Syntax
```AL
[Verbosity := ]  ErrorInfo.Verbosity([Verbosity: Verbosity])
```
> [!NOTE]
> This method can be invoked using property access syntax.
## Parameters
*ErrorInfo*  
&emsp;Type: [ErrorInfo](errorinfo-data-type.md)  
An instance of the [ErrorInfo](errorinfo-data-type.md) data type.  

*[Optional] Verbosity*  
&emsp;Type: [Verbosity](../verbosity/verbosity-option.md)  
The verbosity that the error should be sent with.  


## Return Value
*[Optional] Verbosity*  
&emsp;Type: [Verbosity](../verbosity/verbosity-option.md)  
The current verbosity of the ErrorInfo.


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Example (get the Verbosity property)

```AL
procedure myProc( MyErrorInfo: ErrorInfo )
var 
    ErrorVerbosity: Verbosity;
begin
    ErrorVerbosity := MyErrorInfo.Verbosity();

    // do something 
end
```

## Example (set the Verbosity property)

```AL
procedure myProc( MyErrorInfo: ErrorInfo )
var 
begin
    // set MyErrorInfo to be a critical error
    MyErrorInfo.Verbosity( Verbosity::Critical );

    // do something 
end
```

## See Also

[ErrorInfo Data Type](errorinfo-data-type.md)  
[AL error handling](../../devenv-al-error-handling.md)  
[Get Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)