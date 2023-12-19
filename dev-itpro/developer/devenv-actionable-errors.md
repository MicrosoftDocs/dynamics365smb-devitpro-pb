---
title: "Actionable errors"
description: Learn how to write AL code that returns error dialogs where users might unblock themselves.
ms.custom: bap-template
ms.date: 11/21/2023
ms.reviewer: na
ms.topic: conceptual
author: samirdal
ms.author: samirdal
ms.service: dynamics365-business-central
---

# Actionable errors

This article describes how to handle error dialogs in AL code, specifically how to use the error handling framework to provide recommended actions to users to resolve errors more effectively. 

For advice on how to design error dialogs that users understand, see [User experience guidelines for errors](devenv-error-handling-guidelines.md). 


## Unblocking users with actionable errors
[!INCLUDE [actionable-errors-overview](includes/include-actionable-errors-overview.md)]

## <a name="fix-it-actions"></a> Error messages with Fix-it actions 

[!INCLUDE [actionable-errors-fix-it-actions](includes/include-actionable-errors-fix-it-actions.md)]

### Guidance for button labels for Fix-it actions

To achieve consistency in the user experience of Fix-it actions, please consider following these guidelines for button labels:

[!INCLUDE [fix-it-button-guidance](includes/include-fix-it-button-guidance.md)]


### Example (error dialog with a Fix-it action)
The following AL code illustrates how to setup an error dialog with a Fix-it action.

```AL
var 
    dimension: Text[30];
    vendorCode: Text[30];
    FixitErrorInfo: ErrorInfo;
begin
    // setup the error info object
    FixitErrorInfo.Title('The line dimension value isn''t valid');
    FixitErrorInfo.Message(
        StrSubstNo('The dimension value must be blank for the dimension %1 for Vendor %2', dimension, vendorCode)
    );
    FixitErrorInfo.DetailedMessage('Add some text to help the person troubleshooting this error.');

    FixitErrorInfo.AddAction(
        'Set value to blank', 
        Codeunit::FixitCodeunit, 
        FixitCodeunitMethodName
    );
    
    Error(FixitErrorInfo);
end
```

If the user experience the error, they will see the following error dialog

:::image type="content" source="media/error-dialog-fixit.png" alt-text="Error dialog with fix-it action":::


### Example (validation error with a Fix-it action)

The following AL code illustrates how to setup field validation with a Fix-it action. 

<!-- the code example is copied from SalesLine.Table.al and adjusted to docs -->
```AL
... 
field(17; "Qty. to Invoice"; Decimal)
{
    // maybe some field properties

    trigger OnValidate()
    var
        CannotInvoiceErrorInfo: ErrorInfo;
        CheckField: Boolean;
    begin
        // some calculations here

        CheckField := // calculate if true or false

        if (CheckField)
        then begin
            // setup the error info object
            CannotInvoiceErrorInfo.Title := 'Qty. to Invoice isn''t valid';
            CannotInvoiceErrorInfo.Message := 
                StrSubstNo('You cannot invoice more than %1 units.', MaxQtyToInvoice());
            CannotInvoiceErrorInfo.DetailedMessage('Add some text to help the person troubleshooting this error.');

            CannotInvoiceErrorInfo.RecordId := Rec.RecordId;
            CannotInvoiceErrorInfo.AddAction(
                StrSubstNo('Set value to %1', MaxQtyToInvoice()), 
                Codeunit::FixitCodeunit, 
                FixitCodeunitMethodName
            );

            Error(CannotInvoiceErrorInfo);
        end;
        // maybe more validation logic here
    end;
}
...
```

If the user experience that the field cannot be validated, they will see the following dialog

:::image type="content" source="media/validation-error-fixit.png" alt-text="Validation error with fix-it action":::


## <a name="show-it-actions"></a> Error messages with Show-it actions

[!INCLUDE [actionable-errors-show-it-actions](includes/include-actionable-errors-show-it-actions.md)]

### Guidance for button labels for Show-it actions

To achieve consistency in the user experience of Show-it actions, please consider following these guidelines for button labels:

[!INCLUDE [show-it-button-guidance](includes/include-show-it-button-guidance.md)]

### Example (error dialog with a Show-it action)
The following AL code illustrates how to setup an error dialog with a Show-it action.

<!-- the code example is copied from GetSourceDocuments.Report.al and adjusted to docs -->
```AL
procedure ShowShipmentDialog()
var
    ErrorNoLinesToCreate: ErrorInfo;
    SomeCheckCondition: Boolean;
begin
    // some business logic 

    SomeCheckCondition := // calculate if true or false        

    if (SomeCheckCondition)
    begin
        // maybe some business logic here 

        // setup the error info object
        ErrorNoLinesToCreate.Title := 'There are no new warehouse shipment lines to create';
        ErrorNoLinesToCreate.Message := 'This usually happens when warehouse shipment lines [...]'; 
        ErrorNoLinesToCreate.DetailedMessage('Add some text to help the person troubleshooting this error.');

        ErrorNoLinesToCreate.PageNo := Page::"Warehouse Shipment List";
        ErrorNoLinesToCreate.AddNavigationAction('Show open lines');,

        Error(ErrorNoLinesToCreate);

        // maybe more business logic here 
    end;

    // some more business logic here

```

If the user experience the error, they will see the following error dialog

:::image type="content" source="media/error-dialog-showit.png" alt-text="Error dialog with show-it action":::

### Example (validation error with one Show-it action)

The following AL code illustrates how to setup a validation error dialog with a Show-it action.

```AL
... 
field(59; "Gen. Prod. Posting Group"; Code[20])
{
    // maybe some field properties

    trigger OnValidate()
    var
        CheckIfFieldIsEmpty: Boolean;
        FieldEmptyErrorInfo: ErrorInfo;
    begin
        CheckIfFieldIsEmpty := // calculate if true or false        

        if (CheckIfFieldIsEmpty)
        then begin
            // setup the error info object
            FieldEmptyErrorInfo.Message := 
                StrSubstNo('Gen. Prod. Posting Group must have a value in item: %1. It can''t be zero or empty.', ItemNo);
            FieldEmptyErrorInfo.DetailedMessage('Add some text to help the person troubleshooting this error.');

            CannotInvoiceErrorInfo.RecordId := ItemRec.RecordId;
            CannotInvoiceErrorInfo.AddNavigationAction(
                StrSubstNo('Show Item %1', ItemNo)
            );
            ChangeNotAllowedErrorInfo.PageNo(Page::"Item Card");

            Error(CannotInvoiceErrorInfo);
        end;

        // maybe more validation logic here
    end;
}
...
```


If the user experience that the field cannot be validated, they will see the following dialog

:::image type="content" source="media/validation-error-showit.png" alt-text="Validation error with show-it action":::

## Error messages with multiple actions - how to use them?

Error messages can have up to two recommended actions. In this section, we show some different examples of how to use multiple actions and why.

### Example (error dialog with two actions)

The following AL code illustrates how to setup an error dialog with two actions.

```AL
var
    ErrorDialogWithTwoActions: ErrorInfo;
    DimensionCode: Code[20];
    VendorCode: Code[20];
begin
    // set values for DimensionCode, VendorCode variables

    // setup the error info object
    ErrorDialogWithTwoActions.Title := 'The line dimension value isn''t valid';
    ErrorDialogWithTwoActions.Message := StrSubstNo('The dimension value must be blank for the dimension %1 for Vendor %2', DimensionCode, VendorCode); 
    ErrorDialogWithTwoActions.DetailedMessage('Add some text to help the person troubleshooting this error.');

    ErrorNoLinesToCreate.AddAction(
        'Set value to blank'
        Codeunit::FirstFixitCodeunit, 
        FirstFixitCodeunitMethodName
    );
    ErrorNoLinesToCreate.AddAction(
        'OK'
        Codeunit::SecondFixitCodeunit, 
        SecondFixitCodeunitMethodName
    );

    Error(ErrorDialogWithTwoActions);
end;
```

In this error dialog case, the recommended Fix-it action sets the value to blank, meaning that it clears out the field value. 

Notice the error dialog has two actions. In error cases both buttons are styled equally as secondary buttons, to allow users to consider the most suitable way to get unblocked for their case. 

If the user experience the error, they will see the following error dialog

:::image type="content" source="media/error-dialog-multiple.png" alt-text="Error dialog with multiple actions":::

### Example (validation error with two promoted actions)

The following AL code illustrates how to setup field validation with two actions.


```AL
field(4; "Account No."; Code[20])
{
    // maybe some field properties

    trigger OnValidate()
    var
        PendingApprovalErrorInfo: ErrorInfo;
    begin
        SomeCheckCondition := // calculate if true or false        

        if (SomeCheckCondition)
        then begin        
            PendingApprovalErrorInfo.Message := 'You can''t modify a record pending approval. Add a comment or reject the approval to modify the record.';
            PendingApprovalErrorInfo.DetailedMessage('Add some text to help the person troubleshooting this error.');
            
            PendingApprovalErrorInfo.PageNo := Page::"Comments";
            PendingApprovalErrorInfo.AddNavigationAction('Show comments');

            PendingApprovalErrorInfo.AddAction(
                'Reject approval'
                Codeunit::SecondFixitCodeunit, 
                SecondFixitCodeunitMethodName
            );

            Error(PendingApprovalErrorInfo);
        end;
    end;
}
```

Here the Show-it action shows the related Comments table, and the Fix-it action rejects the approval.

Users can also get unblocked by refreshing the page or copying the error details for sharing and troubleshooting.

If the user experience that the field cannot be validated, they will see the following dialog

:::image type="content" source="media/validation-error-multiple.png" alt-text="Validation error with multiple  actions":::

## Error messages with no actions (final resort)
When there isn’t any known solution to recommend, the error dialog has one primary OK button. Users can copy and share the full error details needed for troubleshooting and support.

The following AL code illustrates how to setup an error dialog with no actions (this is also the standard behaviour of the Error method)

```AL
var
    ErrorDialogNoActions: ErrorInfo;
begin
    // setup the error info object
    ErrorDialogNoActions.Title := 'The ''Starting Date'' isn''t valid';
    ErrorDialogNoActions.Message := 'The ''Starting Date'' must be the first date of an accounting period. Try changing the date to first date of the month.'; 
    ErrorDialogNoActions.DetailedMessage('Add some text to help the person troubleshooting this error.');

    Error(ErrorDialogNoActions);
end;
```

If the user experience the error, they will see the following error dialog

:::image type="content" source="media/error-dialog-nosolution.png" alt-text="Error dialog with no solution":::


## See Also  
[User experience guidelines for errors](devenv-error-handling-guidelines.md)  
[Understanding the error dialog](devenv-error-dialog.md)  
[Dialog.Error(ErrorInfo) Method](methods-auto/dialog/dialog-error-errorinfo-method.md)  
[AL error handling](devenv-al-error-handling.md)  