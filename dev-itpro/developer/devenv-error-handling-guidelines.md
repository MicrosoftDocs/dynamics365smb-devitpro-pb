---
title: User experience guidelines for errors
description: Describes how to handle error dialogs in AL code.
author: SusanneWindfeldPedersen, samirdal, kennienp
ms.author: solsen
ms.reviewer: solsen
ms.service: dynamics365-business-central
ms.topic: conceptual
ms.date: 10/10/2023
ms.custom: bap-template
---

# User experience guidelines for errors

Improving error handling and error messages reduces friction for the users and highly impacts the user experience. Clear, informative error messages help users understand what went wrong and how to correct it, reducing frustration, and improving user satisfaction. 

In this article, you can learn how to use actionable errors to provide recommended actions to users to resolve errors more effectively, what questions error dialogs and validation errors should answer, and recommended voice guidelines for error messages.


## Unblocking users with actionable errors

[!INCLUDE [actionable-errors-overview](includes/include-actionable-errors-overview.md)]

## Error messages with Fix-it actions – when to use them?

[!INCLUDE [actionable-errors-fix-it-actions](includes/include-actionable-errors-fix-it-actions.md)]

:::image type="content" source="media/error-dialog-fixit.png" alt-text="Error dialog with fix-it action":::

For more information, see |[Error messages with Fix-it actions](devenv-actionable-errors.md#fix-it-actions)

## Error messages with Show-it actions – when to use them?

[!INCLUDE [actionable-errors-show-it-actions](includes/include-actionable-errors-show-it-actions.md)]

:::image type="content" source="media/error-dialog-showit.png" alt-text="Error dialog with show-it action":::

For more information, see |[Error messages with Show-it actions](devenv-actionable-errors.md#show-it-actions)


## Error message best practices - what to say?

Error messages are meant to unblock users. The primary purpose of the error dialog is to alert users to the fact that something has gone wrong and that they need to take action to continue. There are essentially two different types of error situations that a user can experience:
1. Error dialogs
2. Validation errors

### Error message best practices (Error dialogs)
Error dialogs should answer the following questions:

**Title:** [What went wrong]  
**Body content:** [Why, if relevant] + [How to fix it]  
**Button label:** [Clear action]  

### Error message best practices (Validation errors)
Validation errors should answer the following questions:

**Title (if needed):** [What went wrong]  
**Body content:** [How to fix it]  
**Button label:** [Clear action]  


## Error message voice guidelines – how to say it?
An error dialog consists of the following elements:
- a title (if needed)
- a body (with the error message)
- one or more buttons

Use the guidelines below to remove friction for the users and positively impact the user experience, even when an error occurs.

For more guidelines, follow Microsoft’s voice guidelines [Microsoft's brand voice: Above all, simple and human](https://learn.microsoft.com/style-guide/brand-voice-above-all-simple-human).


### Titles
The title of an error dialog is the first thing the user sees. Use the title to describe what’s wrong and enable the user to quickly scan the meaning.

- Be concise and describe the issue, not the action to take.
- Be brief. Just one sentence.
- Titles shouldn't end in punctuation.
- Not all validation errors need a title.  
- Keep in mind the relation between the title and the recommended actions. Actions should always respond to the title if there's one. 

### Body content

In the body of the error dialog, use positive cases (telling what the user can do) where possible. Sometimes you need to tell what you can’t do, but for validation errors space is limited, so focus on the solution.

### Button labels (for Fix-it and Show-it actions)
If you can, use a Fix-it action or a Show-it action. 

[!INCLUDE [fix-it-button-guidance](includes/include-fix-it-button-guidance.md)]

[!INCLUDE [show-it-button-guidance](includes/include-show-it-button-guidance.md)]

### Error messages
When writing error messages, consider using these overall rules of thumb:

- Use the word problem instead of error, issue, or technical problem. 
- Refer to the error message as a message and not an error or error message.  
- It’s OK to write "please" when asking the user to resolve a problem that isn’t their fault. 
- Only use "sorry" (and similar wording) in error messages that notify the customer about a serious problem or one that they might find frustrating. For example:
  - Data is lost. 
  - The user can't continue to use the device, service, or application. 
  - The user must get help from a support representative.  
  - A product or service fails. 

### Avoid these words and phrases
Users see your program from the functionality it provides, not how it is constructed. Therefore, you should avoid words and phrases such as

- “There has been an error” or “An error has occurred”  
- “Error,” “Failed,” “Denied,” or “Invalid”
- "Hmmm ..." or "Oops ..." or "Whoops"
- Developer error codes like “WDGeneralNetworkError Error 500”. If you need to include a code, hide it under “details”. 

Remember these rules of thumb
- Don't overwhelm the user with technical terms
- Avoid robotic language and signs such as = “ ()
- Avoid long how-to or instructional guidance in error. That content lives on docs.microsoft.com or in your documentation.

### Use contractions
To write error messages that are simple and feel human, consider using contractions:

- Use common contractions, such as it’s, you’re, that's, and don’t, to create a friendly, informal tone.
- Don't mix contractions and their spelled-out equivalents in UI text. For example, don’t use can’t and cannot in the same UI.
- Never form a contraction from a noun and a verb, such as Microsoft’s developing many new cloud services.
- Avoid ambiguous or awkward contractions, such as there’d, it’ll, and they’d.

### Microsoft’s voice guidelines
For more guidelines on how to communicate to the user in a way they understand, see [Microsoft's brand voice: Above all, simple and human](https://learn.microsoft.com/style-guide/brand-voice-above-all-simple-human).


## See also
[Microsoft’s voice guidelines](https://learn.microsoft.com/style-guide/brand-voice-above-all-simple-human)   
[Actionable errors](devenv-actionable-errors.md)   
[Understanding the error dialog](devenv-error-dialog.md)  
[Dialog.Error(ErrorInfo) Method](methods-auto/dialog/dialog-error-errorinfo-method.md)  
[AL error handling](devenv-al-error-handling.md)  
