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

This article shows how to raise actionable error messages from the `ErrorMessageManagement` codeunit using the **Error Messages with Recommendations** app. 

## Technical implementation details

In the following sections, you find more details on how the **Error messages with recommendations** extension can be used to raise actionable errors.

### Base Application

#### Codeunit `ErrorMessageManagement`

In the Base Application you can find the [ErrorMessageManagement codeunit](/dynamics365/business-central/application/base-application/codeunit/system.utilities.error-message-management). This codeunit can be used to add sub-contextual information and the implementation for the error message action to the last-logged error message, which triggers the `OnAddSubContextToLastErrorMessage` event. 

In the Base Application on the `ErrorMessageManagement` codeunit, you find the `AddSubContextToLastErrorMessage` procedure.

```al
procedure AddSubContextToLastErrorMessage(Tag: Text; VariantRec: Variant)
```

This procedure is used in the `DimensionManagement` codeunit to log `SameCodeWrongDimErr` and `NoCodeFilledDimErr` by passing the sub-contextual information. Dimension Set Entry is the sub-contextual information for these error messages.

Use `Tag` to identify the error message in the subscriber. `VariantRec` can be used to pass the sub-contextual information. `TempErrorMessage` is the error message record under consideration.

### Error messages with recommendations

#### Codeunit (ID 7900) `ErrorMessagesActionHandler`

This codeunit handles the drill-down operation and the **Accept recommended action** on the **Error Messages** page.

It handles drill-down to the recommended action of an error message to run it with a confirmation dialog box. When the user confirms the action, the error message fix implementation is run for the selected error message:

```al
procedure OnActionDrillDown(var ErrorMessage: Record "Error Message")
```

It executes recommended actions for all the selected error messages on the page. Selected error messages are passed from the page and all the error message fix implementations are executed for the selected error messages. The procedure doesn't stop if there's an error in applying fix. Instead, it updates the error message status and continues to apply remaining recommendations for the remaining error messages:

```al
procedure ExecuteActions(var ErrorMessages: Record "Error Message" temporary)
```

#### Codeunit (ID 7901) `"Execute Error Action"`

This codeunit is internally used to execute the error message fix implementation with `ErrorBehavior::Collect`. This allows us to continue applying recommendations for all the selected error messages even if there is an error.

> [!NOTE]
> Commits are ignored inside the implementation of ErrorMessageFix interface.

### The `ErrorMessageFix` interface

Implement the `ErrorMessageFix` interface and extend the `"Error Msg. Fix Implementation"` enum.

- Implement the `ErrorMessageFix` interface  
  Begin by creating a codeunit that implements the **ErrorMessageFix** interface. This interface defines the methods required to provide a fix for specific errors. By implementing this interface, you can define the logic needed to resolve the errors programmatically.

- Extend the enum (ID 7901) `"Error Msg. Fix Implementation"`  
  Extend the enum (ID 7901) named `"Error Msg. Fix Implementation"` to include the implemented codeunit. This enum is used to map specific error messages to their corresponding fix implementations.


## Example usage to fix an error raised from the Base Application

The `ErrorMessagesWithRecommendations` extension is available in the [ALAppExtensions open source repo](https://github.com/microsoft/ALAppExtensions/tree/main/Apps/W1/ErrorMessagesWithRecommendations/app/src/Implementation). Here you can see an example of how the error messages with recommendations framework is implemented and how error messages raised from the Base Application are fixed. The next sections explain the details of the implementation.

### Codeunit (ID 7903) `"Dimension Code Same Error"` and codeunit (ID 7904) `"Dimension Code Must Be Blank"`

Subscribes to the event `OnAddSubContextToLastErrorMessage` and updates the error message record based on the `Tag`.
Sets the `TempErrorMessage."Error Msg. Fix Implementation"` to use the enum value from enum (ID 7901) `"Error Msg. Fix Implementation"`, which has the implementation for the error message action.

## Related information

[ErrorMessageManagement codeunit](/dynamics365/business-central/application/base-application/codeunit/system.utilities.error-message-management)