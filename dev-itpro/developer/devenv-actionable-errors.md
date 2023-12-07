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

### Example (error dialog with a Fix-it action)
The following AL code illustrates how to setup an error dialog with a Fix-it action.

```AL
// TODO
```

If the user experience the error, they will see the following error dialog

:::image type="content" source="media/error-dialog-fixit.png" alt-text="Error dialog with fix-it action":::


### Example (validation error with a Fix-it action)

The following AL code illustrates how to setup field validation with a Fix-it action.

```AL
// TODO
```

If the user experience that the field cannot be validated, they will see the following dialog

:::image type="content" source="media/validation-error-fixit.png" alt-text="Validation error with fix-it action":::

### Guidance for button labels for Fix-it actions

To achieve consistency in the user experience of Fix-it actions, please consider following these guidelines for button labels:

[!INCLUDE [fix-it-button-guidance](includes/include-fix-it-button-guidance.md)]


## <a name="show-it-actions"></a> Error messages with Show-it actions

[!INCLUDE [actionable-errors-show-it-actions](includes/include-actionable-errors-show-it-actions.md)]


### Example (error dialog with a Show-it action)
The following AL code illustrates how to setup an error dialog with a Show-it action.

```AL
// TODO
```

If the user experience the error, they will see the following error dialog

:::image type="content" source="media/error-dialog-showit.png" alt-text="Error dialog with show-it action":::

### Example (validation error with one Show-it action)

If the user experience that the field cannot be validated, they will see the following dialog

:::image type="content" source="media/validation-error-showit.png" alt-text="Validation error with show-it action":::

### Guidance for button labels for Show-it actions

To achieve consistency in the user experience of Show-it actions, please consider following these guidelines for button labels:

[!INCLUDE [show-it-button-guidance](includes/include-show-it-button-guidance.md)]



## Error messages with multiple actions - how to use them?

Error messages can have up to two recommended actions. In this section, we show some different examples of how to use multiple actions and why.

### Example (error dialog with two actions)

The following AL code illustrates how to setup an error dialog with two actions.

```AL
// TODO
```

In this error dialog case, the recommended Fix-it action sets the value to blank, meaning that it clears out the field value. 

Notice the error dialog has two actions. In error cases both buttons are styled equally as secondary buttons, to allow users to consider the most suitable way to get unblocked for their case. 

If the user experience the error, they will see the following error dialog

:::image type="content" source="media/error-dialog-multiple.png" alt-text="Error dialog with multiple actions":::

### Example (validation error with two promoted actions)

The following AL code illustrates how to setup field validation with two actions.

```AL
// TODO
```

Here the Show-it action shows the related Comments table, and the Fix-it action rejects the approval.

Users can also get unblocked by refreshing the page or copying the error details for sharing and troubleshooting.

If the user experience that the field cannot be validated, they will see the following dialog

:::image type="content" source="media/validation-error-multiple.png" alt-text="Validation error with multiple  actions":::

## Error messages with no actions (final resort)
When there isn’t any known solution to recommend, the error dialog has one primary OK button. Users can copy and share the full error details needed for troubleshooting and support.

The following AL code illustrates how to setup an error dialog with no actions (this is also the standard behaviour of the Error method)

```AL
// TODO
```

If the user experience the error, they will see the following error dialog

:::image type="content" source="media/error-dialog-nosolution.png" alt-text="Error dialog with no solution":::


## See Also  
[User experience guidelines for errors](devenv-error-handling-guidelines.md)  
[Understanding the error dialog](devenv-error-dialog.md)  
[Dialog.Error(ErrorInfo) Method](methods-auto/dialog/dialog-error-errorinfo-method.md)  
[AL error handling](devenv-al-error-handling.md)  