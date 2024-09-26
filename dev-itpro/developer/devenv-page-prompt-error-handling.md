---
title: Error handling in prompt dialogs
description: Learn how errors are handled in pages of the PromptDialog type in Business Central.
author: SusanneWindfeldPedersen
ms.author: solsen
ms.topic: overview
ms.collection:
  - bap-ai-copilot
ms.date: 09/26/2024
ms.reviewer: solsen
---

# Error handling in prompt dialogs

[!INCLUDE [2024-releasewave2-changed](../includes/2024-releasewave2-changed.md)]

With [!INCLUDE [prod_short](includes/prod_short.md)] 2024 release wave 2, errors and messages that are thrown by the code logic in Copilot prompt dialogs surface directly inside the dialog instead of in a separate popup dialog. The `Dialog.Error()`, `Dialog.Message()`, and `ErrorInfo` error patterns are all supported. When you use the `ErrorInfo` type, both the title and description will be shown inside the dialog.

If the code throws more than one message, only the last message will be shown, but the user is informed about the total number of issues. If an error is thrown, any subsequent message is suppressed. If the error or message contains line breaks, these line breaks are ignored, as opposed to when they are rendered in dialogs.

## Example 1: Rendering multiple messages thrown by `Message()` in the prompt dialog

The following code snippet illustrates throwing multiple messages, using `Message()`, when the user chooses the **Generate** button in a prompt dialog.

```al
page 50110 PromptDialog
{
    PageType = PromptDialog;

    layout
    { ... }

    actions
    {
        area(SystemActions)
        {
            systemaction(Generate)
            {
                trigger OnAction()
                begin
                    Message('First message, which isn't shown in the prompt dialog');
                    Message('Last message, which is shown in the prompt dialog');
                end;
            }
        }
    }
}
```

As a result, when invoking the **Generate** action in the Copilot prompt dialog, the last message is rendered inline in the Copilot prompt dialog, along with an indication that there were more messages.

:::image type="content" source="media/rendering-message-prompt-dialog-s.png" alt-text="Example of rendering a message in the prompt dialog":::

## Example 2: Rendering an error thrown by `Error()` in the prompt dialog

In this example, an `Error()` is thrown when the user chooses the **Generate** button in a prompt dialog.

```al

page 50110 PromptDialog
{
    PageType = PromptDialog;

    layout
    { ... }

    actions
    {
        area(SystemActions)
        {
            systemaction(Generate)
            {
                trigger OnAction()
                begin
                    Error('This is an example of rendering an error that happens in the prompt dialog, e.g. during Generate');
                end;
            }
        }
    }
}
```

In this case, the error is rendered inline.

:::image type="content" source="media/rendering-error-prompt-dialog-s2.png" alt-text="Example of rendering error thrown in prompt dialog":::

## Example 3: Rendering an error thrown by ErrorInfo in the prompt dialog

The last example illustrates using the `ErrorInfo` type when the user chooses the **Generate** button in a prompt dialog.

```al
page 50110 PromptDialog
{
    PageType = PromptDialog;

    layout
    { ... }

    actions
    {
        area(SystemActions)
        {
            systemaction(Generate)
            {
                trigger OnAction()
                var
                    ErrorInfo: ErrorInfo;
                begin
                    ErrorInfo.Title('Error info title');
                    ErrorInfo.Message('Error message');
                    ErrorInfo.DetailedMessage('Detailed error');

                    Error(ErrorInfo);
                end;
            }
        }
    }
}
```

In this case, the `ErrorInfo` message part is rendered inline, and the title part is used for the tooltip. The detailed message is ignored. 

:::image type="content" source="../media/prompt-dialog-error-info-s.png" alt-text="Example of rendering a message in the prompt dialog":::

## Related information

[The PromptDialog page type](devenv-page-type-promptdialog.md)  
[Prompting using a floating action bar](devenv-page-prompting-floating-actionbar.md)  
[Prompting using a prompt guide](devenv-page-promptguide.md)  
[User experience guidelines for errors](devenv-error-handling-guidelines.md)