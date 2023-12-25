---
title: "Collecting Errors"
description: Learn how to write AL code that returns more than one error and presents users with more detailed error information.
ms.custom: bap-template
ms.date: 06/14/2023
ms.reviewer: na
ms.topic: conceptual
author: jswymer
ms.author: jswymer
ms.service: dynamics365-business-central
---

# Collecting Errors

This article explains how to write AL code that captures multiple errors and displays them in the user interface. Referred to as *collectible errors*, this feature can simplify validation scenarios. Specifically, scenarios where users are presented with a list of things to fix.

## How to use the collectible errors feature

Normally, when an error occurs in a procedure, the procedure stops on the first error it meets. Using collectable errors essentially postpones error handling to the end of the procedure call. AL code execution won't stop on errors. But instead, it continues until the end and gathers errors as they occur.

One use case of the collectible errors feature is for validations of multiple conditions, where you check each condition with a collectible error. Then in the final validation, you can present all errors collected in a single page, instead of stopping the user and present each validation to the user. 

> [!IMPORTANT]
> Is is recommended that you handle all collectible errors from your AL code. If execution of a  procedure ends with any errors still present in the collected list, the user will see an error dialog with a concatenation of all the messages from the errors present in the collected list. But this "uber" error message will not be easy for the user to understand. See the example below of how to do this.


## Collectible errors API

AL includes several methods, properties, and attributes that are designed specifically for the collectable errors feature. For an overview of the API, see [Collecting Errors API](devenv-error-collection-api.md).


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
            errors.Message := GetLastErrorText();
            errors.Insert();
        end;

        // If there are collected errors, iterate through each of them and
        // add them to "Error Message" record.
        if HasCollectedErrors then
            foreach error in system.GetCollectedErrors() do begin
                errors.ID := errors.ID + 1;
                errors.Message := error.Message;
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
        if Rec.Number mod 2 <> 0 then
            Error(ErrorInfo.Create('Number should be equal', true, Rec, Rec.FieldNo(Number)));

        if Rec.Number <= 0 then
            Error(ErrorInfo.Create('Number should be larger than 0', true, Rec, Rec.FieldNo(Number)));

        if Rec.Number mod 3 = 0 then
            Error(ErrorInfo.Create('Number should not be divisible by 10', true, Rec, Rec.FieldNo(Number)));

        // Everything was valid, do the actual posting.
    end;
}
```

## See Also  

[Collecting Errors API](devenv-error-collection-api.md)   
[Error handling overview](devenv-al-error-handling.md)  
[AL Simple Statements](devenv-al-simple-statements.md)  