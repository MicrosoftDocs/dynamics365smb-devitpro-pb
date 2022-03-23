---
title: "Collecting Errors"
description: Learn how to write AL code that returns more than one error and presents users with more detailed error information.
ms.custom: na
ms.date: 11/05/2021
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: conceptual
author: jswymer
---

# Collecting Errors

This article explains how to write AL code that captures multiple errors and displays them in the user interface. Referred to as *collectible errors*, this feature can simplify validation scenarios. Specifically, scenarios where users are presented with a list of things to fix.

Normally, when an error occurs in a procedure, the procedure stops on the first error it meets. Using collectable errors essentially postpones error handling to the end of the procedure call. AL code execution won't stop on errors. But  instead, it continues until the end and gathers errors as they occur.

## Collectible errors API

AL includes several methods, properties, and attributes that are designed specifically for the collectable errors feature.

### Error information
 
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

### Collected errors

The following methods are available on the [System data type](methods-auto/system/system-data-type.md) for handling collected errors. These methods can be invoked using property access syntax.

|Method |Description|
|-------|-----------|
|[System.HasCollectedErrors()](methods-auto/system/system-hascollectederrors-method.md)|Gets a value indicating whether errors have been collected in the current error collection scope.|
|[System.GetCollectedErrors([Boolean])](methods-auto/system/system-getcollectederrors-method.md)|Gets all collected errors in the current collection scope.|
|[System.ClearCollectedErrors()](methods-auto/system/system-clearcollectederrors-method.md)|Clears all collected errors from the current collection scope.|

> [!IMPORTANT]
> If you clear the list of collected errors, any changes performed in the database won't be rolled back. So, in most cases, it makes sense to combine the clear operation with an `if Codeunit.Run then …` statement, as shown in the `PostWithErrorCollectCustomUI` procedure of the example.

### Error behavior

The [ErrorBehavior](attributes/devenv-errorbehavior-attribute.md) specifies the behavior of collectable errors inside the method scope. Adding `[ErrorBehavior(ErrorBehavior.Collect)]` to a procedure ​makes it possible to collect and handle errors that are raised in the scope of the procedure.


## Example 

The following code example illustrates how to use collectable errors. It's built around the `DoPost` codeunit, which sets simple criteria on what can or can't be included in table fields. By itself, this procedure will stop when errors occur. By applying the `ErrorBehavior(ErrorBehavior::Collect)` attribute, the `PostWithErrorCollect ()` and `PostWithErrorCollectCustomUI ()` procedures show you a couple ways to collect and present these errors.

```AL
pageextension 50100 CollectingErrorsExt extends "Customer List"
{
    actions
    {
        addfirst(processing)
        {
            // This action doesn't collect errors. Any procedure will stop on the first error that occurs,
            // and return the error.
            action(Post)
            {
                ApplicationArea = All;
                trigger OnAction()
                var
                    i: Record Integer;
                begin
                    i.Number := -9;
                    Codeunit.Run(Codeunit::DoPost, i);
                end;
            }

            // This action collects errors. The PostWithErrorCollect procedure continues on errors,
            // and displays the errors in a dialog to the user done.
            action(PostWithErrorCollect)
            {
                ApplicationArea = All;
                trigger OnAction()
                begin
                    PostWithErrorCollect();
                end;
            }

            // This action collects errors. The PostWithErrorCollectCustomUI procedure continues on errors,
            // and displays error details in a list page when done.
            // This implementation illustrates how you could design your own UI for displaying and
            // troubleshooting errors.
            action(PostWithErrorCollectCustomUI)
            {
                ApplicationArea = All;
                trigger OnAction()
                begin
                    PostWithErrorCollectCustomUI();
                end;
            }
        }
    }

    [ErrorBehavior(ErrorBehavior::Collect)]
    procedure PostWithErrorCollect()
    var
        i: Record Integer;
    begin
        i.Number := -9;
        Codeunit.Run(Codeunit::DoPost, i);
        // After executing the codeunit, there will be collected errors,
        // and therefore an error dialog will be shown when exiting this procedure.
    end;

    [ErrorBehavior(ErrorBehavior::Collect)]
    procedure PostWithErrorCollectCustomUI()
    var
        errors: Record "Error Message" temporary;
        error: ErrorInfo;
        i: Record Integer;
    begin
        i.Number := -9;
        // By using Codeunit.Run, you ensure any changes to the database within
        // Codeunit::DoPost are rolled back in case of errors.
        if not Codeunit.Run(Codeunit::DoPost, i) then begin
            // If Codeunit.Run fails, a non-collectible error was encountered,
            // add this to the list of errors.
            errors.ID := errors.ID + 1;
            errors.Description := GetLastErrorText();
            errors.Insert();
        end;

        // If there are collected errors, iterate through each of them and
        // add them to "Error Message" record.
        if HasCollectedErrors then
            foreach error in system.GetCollectedErrors() do begin
                errors.ID := errors.ID + 1;
                errors.Description := error.Message;
                errors.Validate("Record ID", error.RecordId);
                errors.Insert();
            end;

        // Clearing the collected errors will ensure the built-in error dialog
        // will not show, but instead show our own custom "Error Messages" page.
        ClearCollectedErrors();

        page.RunModal(page::"Error Messages", errors);
    end;
}


codeunit 50100 DoPost
{
    TableNo = Integer;

    trigger OnRun()
    begin
        if Number mod 2 <> 0 then
            Error(ErrorInfo.Create('Number should be equal', true, Rec, Rec.FieldNo(Number)));

        if Number <= 0 then
            Error(ErrorInfo.Create('Number should be larger than 0', true, Rec, Rec.FieldNo(Number)));

        if Number mod 3 = 0 then
            Error(ErrorInfo.Create('Number should not be divisible by 10', true, Rec, Rec.FieldNo(Number)));

        // Everything was valid, do the actual posting.
    end;
}
```

## See Also  

[AL Simple Statements](devenv-al-simple-statements.md)