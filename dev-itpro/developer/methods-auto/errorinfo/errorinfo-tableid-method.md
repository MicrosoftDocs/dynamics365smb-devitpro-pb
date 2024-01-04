---
title: "ErrorInfo.TableId([Integer]) Method"
description: "Specifies the table ID that the error relates to."
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
# ErrorInfo.TableId([Integer]) Method
> **Version**: _Available or changed with runtime version 8.0._

Specifies the table ID that the error relates to.


## Syntax
```AL
[TableId := ]  ErrorInfo.TableId([TableId: Integer])
```
> [!NOTE]
> This method can be invoked using property access syntax.
## Parameters
*ErrorInfo*  
&emsp;Type: [ErrorInfo](errorinfo-data-type.md)  
An instance of the [ErrorInfo](errorinfo-data-type.md) data type.  

*[Optional] TableId*  
&emsp;Type: [Integer](../integer/integer-data-type.md)  
The table ID of the ErrorInfo  


## Return Value
*[Optional] TableId*  
&emsp;Type: [Integer](../integer/integer-data-type.md)  
The current table ID of the ErrorInfo.


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remark

You can use the `TableId` property to transfer data from the code where an error message is shown to the user to the codeunit and method(s) executed by fix-it/show-it actions or where you handle collected errors. 

For more information about how to develop actionable errors, see [Actionable errors](../../devenv-actionable-errors.md). 

For more information about how to handle multiple collected errors, see [Collecting errors](../../devenv-error-collection.md).


## Example (get the TableId property)

```AL
procedure myErrorHandlerProc(MyErrorInfo: ErrorInfo)
var 
    TheTableId: Integer;
begin
    TheTableId := MyErrorInfo.TableId();

    // do something with the data (now we now the table ID for the row)
end
```

## Example (set the TableId property)

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