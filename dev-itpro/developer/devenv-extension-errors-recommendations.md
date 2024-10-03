---
title: Extending error messages with recommendations
description: Overview of how you can extend the error messages with recommendations framework to reduce friction for users of Business Central.
author: SusanneWindfeldPedersen
ms.date: 10/03/2024
ms.topic: conceptual
ms.author: solsen
ms.reviewer: solsen
---

# Error messages with recommendations

Improving error handling and error messages reduces friction for users and highly impacts the user experience. Being able to resolve an error message by following a clear, informative error message helps users understand what went wrong and how to correct it, which reduces frustration, and improves user satisfaction.

In [!INCLUDE [prod_short](includes/prod_short.md)], the user can use the actionable error messages displayed on the **Error Messages** page to resolve issues and continue working. The **Error Messages** page serves as a centralized location for all error notifications, making it easier to manage and resolve multiple issues efficiently.

## How to add error messages with fix implementation?

To allow users effectively handle and resolve errors in your extension, you can follow the sections to learn how to implement and use the error message handling framework. The framework allows you to provide actionable recommendations and automated fixes for common issues, improve the overall user experience, and reduce the time spent troubleshooting. The key steps are:

1. Implement the interface `ErrorMessageFix` and extend the enum 7901 `"Error Msg. Fix Implementation"`.
2. Make sure that the extended fields (`tableextension 7900 "Error Message Ext."`) for the logged error message record have been populated.
3. In [!INCLUDE [prod_short](includes/prod_short.md)] users should now be able to use the drill-down feature in the **Recommended actions** column or the **Accept recommended action** on the **Error Messages** page to fix the errors in bulk.

## Technical details and usage

> In the following sections, you find more detail on how the actionable error messages framework works in the Base Application.

### The `ErrorMessageFix` interface

To enable logic for fixing errors, follow these steps:

- Implement the `ErrorMessageFix` interface  
  Begin by creating a codeunit that implements the **ErrorMessageFix** interface. This interface defines the methods required to provide a fix for specific errors. By implementing this interface, you can define the logic needed to resolve the errors programmatically.

- Extend the enum (ID 7901) `"Error Msg. Fix Implementation"`  
  Extend the enum (ID 7901) named `"Error Msg. Fix Implementation"` to include the implemented codeunit. This enum is used to map specific error messages to their corresponding fix implementations.

### The `ErrorMessageManagement.Codeunit.al` codeunit in the Base Application
move to the top before steps
<!-- what is the context here?? https://learn.microsoft.com/en-us/dynamics365/business-central/application/base-application/codeunit/system.utilities.error-message-management --> introduction

In the Base Application you can find the `ErrorMessageManagement` codeunit. The codeunit can be used to add sub-contextual information and the implementation for the error message action to the last-logged error message, which then triggers the `OnAddSubContextToLastErrorMessage` event.

<!-- example context?? -->

```al
procedure AddSubContextToLastErrorMessage(Tag: Text; VariantRec: Variant)
```

### Usage in the Base Application

Likewise, in the Base Application the on the `ErrorMessageManagement` codeunit, you find the `AddSubContextToLastErrorMessage` procedure. 

<!-- the following names cannot be verified -> -->
This procedure is used in the `DimensionManagement` codeunit to log `SameCodeWrongDimErr` and `NoCodeFilledDimErr` by passing the sub-contextual information. Dimension Set Entry is the sub-contextual information for these error messages.

#### Event `OnAddSubContextToLastErrorMessage(Tag, VariantRec, TempErrorMessage)`

Use `Tag` to identify the error message in the subscriber. `VariantRec` can be used to pass the sub-contextual information. `TempErrorMessage` is the error message record under consideration.

<!-- move up -->

### Usage in the **Error messages with recommendations** extension

<!-- what is the context here? is it an open source extension? can we link -->

#### Codeunit (ID 7903) `"Dimension Code Same Error"` and codeunit (ID 7904) `"Dimension Code Must Be Blank"`

Subscribe to the event `OnAddSubContextToLastErrorMessage`. Update the error message record based on the `Tag`.
Set the `TempErrorMessage."Error Msg. Fix Implementation"` to use enum value from `enum 7901 "Error Msg. Fix Implementation"` which has the implementation for the error message action.

### Codeunit (ID 7900) `ErrorMessagesActionHandler`

This handles the drill-down operation and the **Accept recommended action** on the **Error Messages** page.

```al
procedure OnActionDrillDown(var ErrorMessage: Record "Error Message")
```

Drill-down to the recommended action of an error message to run it with a confirmation dialog box. When the user confirms the action, the error message fix implementation is run for the selected error message.

```al
procedure ExecuteActions(var ErrorMessages: Record "Error Message" temporary)
```

Execute recommended actions for all the selected error messages on the page.
Selected error messages are passed from the page and all the error message fix implementations are executed for the selected error messages.
The procedure does not stop if there is an error in applying fix. Instead, it updates the error message status and continues to apply remaining recommendations for the remaining error messages.

### Codeunit (ID 7901) `"Execute Error Action"`

This codeunit is internally used to execute the error message fix implementation with ErrorBehavior::Collect. This allows us to continue applying recommendations for all the selected error messages even if there is an error.
**Note:** Commits will be ignored inside the implementation of ErrorMessageFix interface.

## Related information
