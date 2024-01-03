---
title: "ErrorInfo.SystemId([Guid]) Method"
description: "Specifies the system ID of the record that the error relates to."
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
# ErrorInfo.SystemId([Guid]) Method
> **Version**: _Available or changed with runtime version 8.0._

Specifies the system ID of the record that the error relates to.


## Syntax
```AL
[SystemId := ]  ErrorInfo.SystemId([SystemId: Guid])
```
> [!NOTE]
> This method can be invoked using property access syntax.
## Parameters
*ErrorInfo*  
&emsp;Type: [ErrorInfo](errorinfo-data-type.md)  
An instance of the [ErrorInfo](errorinfo-data-type.md) data type.  

*[Optional] SystemId*  
&emsp;Type: [Guid](../guid/guid-data-type.md)  
The system ID of the ErrorInfo  


## Return Value
*[Optional] SystemId*  
&emsp;Type: [Guid](../guid/guid-data-type.md)  
The current system ID of the ErrorInfo.


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remark

You can use the `SystemId` property to transfer data from the code where an error message is shown to the user to the codeunit and method(s) executed by fix-it/show-it actions or where you handle collected errors. 

For more information about how to develop actionable errors, see [Actionable errors](../../devenv-actionable-errors.md). 

For more information about how to handle multiple collected errors, see [Collecting errors](../../devenv-error-collection.md).


## Example (get the SystemId property)

```AL
procedure myErrorHandlerProc(MyErrorInfo: ErrorInfo)
var 
    TheSystemId: Guid;
begin
    TheSystemId := MyErrorInfo.SystemId();

    // do something with the data (now we now the system ID for the row)
end
```

## Example (set the SystemId property)

```AL

var 
    MyErrorInfo: ErrorInfo;
    MyTableRec: Record "MyTable";
begin
    // setup the error info object: Define Message, DetailedMessage etc.

    // set identifiers for the fix-it action codeunit (or for the AL runtime in case of a show-it action)
    MyErrorInfo.RecordId := MyTableRec.RecordId;
    MyErrorInfo.SystemId := MyTableRec.SystemId;
    MyErrorInfo.TableId := Database::"MyTable";

    // setup fix-it or show-it action(s) for the error info object

    Error(MyErrorInfo);
end
```

## See Also

[ErrorInfo Data Type](errorinfo-data-type.md)  
[Actionable errors](../../devenv-actionable-errors.md)  
[Collecting Errors](../../devenv-error-collection.md)  
[Error handling](../../devenv-al-error-handling.md)   
[Get Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)