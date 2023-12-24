---
title: "ErrorInfo.RecordId([RecordId]) Method"
description: "Specifies the record ID of the record that the error relates to."
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
# ErrorInfo.RecordId([RecordId]) Method
> **Version**: _Available or changed with runtime version 8.0._

Specifies the record ID of the record that the error relates to.


## Syntax
```AL
[RecordId := ]  ErrorInfo.RecordId([RecordId: RecordId])
```
> [!NOTE]
> This method can be invoked using property access syntax.
## Parameters
*ErrorInfo*  
&emsp;Type: [ErrorInfo](errorinfo-data-type.md)  
An instance of the [ErrorInfo](errorinfo-data-type.md) data type.  

*[Optional] RecordId*  
&emsp;Type: [RecordId](../recordid/recordid-data-type.md)  
The record ID of the ErrorInfo  


## Return Value
*[Optional] RecordId*  
&emsp;Type: [RecordId](../recordid/recordid-data-type.md)  
The current record ID of the ErrorInfo.


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remark

You can use the `RecordId` property to transfer data from the code where an error message is shown to the user to the codeunit and method(s) executed by fix-it/show-it actions or where you handle collected errors. 

For more information about how to develop actionable errors, see [Actionable errors](../../devenv-actionable-errors.md). 

For more information about how to handle multiple collected errors, see [Collecting errors](../../devenv-error-collection.md).


## Example (get the RecordId property)

```AL
procedure myErrorHandlerProc(MyErrorInfo: ErrorInfo)
var 
    TheRecordId: RecordId;
begin
    TheRecordId := MyErrorInfo.RecordId();

    // do something with the data
end
```

## Example (set the RecordId property)

```AL

var 
    MyErrorInfo: ErrorInfo;
    MyRecordId: RecordId;
begin
    // setup the error info object: Define Message, DetailedMessage etc.

    MyRecordId := // set the variable to the record ID you want to transfer
    MyErrorInfo.RecordId(MyRecordId);

    // setup actions for the error info object

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