---
title: "Collectible errors API"
description: Master AL programming with collectible error handling
ms.custom: bap-template
ms.date: 12/25/2023
ms.reviewer: na
ms.topic: conceptual
author: jswymer
ms.author: jswymer
ms.service: dynamics365-business-central
---

# Collectible errors API

AL includes several methods, properties, and attributes that are designed specifically for the collectable errors feature. For more information, see [Collecting Errors](devenv-error-collection.md).   


## Error information methods
 
The following methods are available on the [ErrorInfo data type](methods-auto/errorinfo/errorinfo-data-type.md) for defining information about errors. These methods can be invoked using property access syntax.

|Method |Description|
|-------|-----------|
|[ErrorInfo.Create(String [, Boolean] [, var Record] [, Integer] [, Integer] [, String] [, Verbosity] [, DataClassification] [, Dictionary of [Text, Text]])](methods-auto/errorinfo/errorinfo-create-method.md)|Creates a new ErrorInfo object.|
|[ErrorInfo.Callstack()](methods-auto/errorinfo/errorinfo-callstack-method.md)|Specifies a callstack where the ErrorInfo was collected.|
|[ErrorInfo.Collectible([Boolean])](methods-auto/errorinfo/errorinfo-collectible-method.md)|Specifies whether the error is collectible using ErrorBehavior.Collect.|
|[ErrorInfo.CustomDimensions([Dictionary of [Text, Text]])](methods-auto/errorinfo/errorinfo-customdimensions-method.md)|Set of dimensions, specified as a dictionary that relates to the error.|
|[ErrorInfo.FieldNo([Integer])](methods-auto/errorinfo/errorinfo-fieldno-method.md)|Specifies the field ID that the error relates to.|
|[ErrorInfo.PageNo([Integer])](methods-auto/errorinfo/errorinfo-pageno-method.md)|Specifies the page number that the error relates to.|
|[ErrorInfo.RecordId([RecordId])](methods-auto/errorinfo/errorinfo-recordid-method.md)|Specifies the record ID of the record that the error relates to.|
|[ErrorInfo.SystemId([Guid])](methods-auto/errorinfo/errorinfo-systemid-method.md)|Specifies the system ID of the record that the error relates to.|
|[ErrorInfo.TableId([Integer])](methods-auto/errorinfo/errorinfo-tableid-method.md)|Specifies the table ID that the error relates to.|

## Collected errors

The following methods are available on the [System data type](methods-auto/system/system-data-type.md) for handling collected errors. These methods can be invoked using property access syntax.

|Method |Description|
|-------|-----------|
|[System.HasCollectedErrors()](methods-auto/system/system-hascollectederrors-method.md)|Gets a value indicating whether errors have been collected in the current error collection scope.|
|[System.GetCollectedErrors([Boolean])](methods-auto/system/system-getcollectederrors-method.md)|Gets all collected errors in the current collection scope.|
|[System.ClearCollectedErrors()](methods-auto/system/system-clearcollectederrors-method.md)|Clears all collected errors from the current collection scope.|

> [!IMPORTANT]
> If you clear the list of collected errors, any changes performed in the database won't be rolled back. So, in most cases, it makes sense to combine the clear operation with an `if Codeunit.Run then …` statement, as shown in the `PostWithErrorCollectCustomUI` procedure of the example.

## Error behavior

The [ErrorBehavior](attributes/devenv-errorbehavior-attribute.md) specifies the behavior of collectable errors inside the method scope. Adding `[ErrorBehavior(ErrorBehavior.Collect)]` to a procedure ​makes it possible to collect and handle errors that are raised in the scope of the procedure.




## See Also  

[ErrorInfo data type](methods-auto/errorinfo/errorinfo-data-type.md)   
[ErrorBehavior attribute](attributes/devenv-errorbehavior-attribute.md)  
[Collecting Errors](devenv-error-collection.md)   
[AL Simple Statements](devenv-al-simple-statements.md)