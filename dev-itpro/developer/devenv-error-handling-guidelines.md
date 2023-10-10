---
title: Error handling guidelines
description: Describes how to handle error dialogs in AL code.
author: SusanneWindfeldPedersen
ms.author: solsen
ms.reviewer: solsen
ms.service: dynamics365-business-central
ms.topic: conceptual
ms.date: 10/09/2023
ms.custom: bap-template
---

# Error handling guidelines

This article describes how to handle error dialogs in AL code. It also describes how to use the error handling framework to provide recommended actions to users to resolve errors more effectively.

## Why should you deliver great error messages?

Improving error handling and error messages reduces friction for the users and highly impacts the user experience. Clear, informative error messages help users understand what went wrong and how to correct it, reducing frustration, and improving user satisfaction. 

## Unblocking users with actionable errors

With [!INCLUDE [prod_short](includes/prod_short.md)] 2023 release wave 2, the error handling framework has been enhanced to include promoted actions in both error dialogs and validation errors. These promoted actions are designed to assist users in resolving errors more effectively. There are currently two main scenarios to keep in mind when deciding how to use recommended actions: [Fix-it](devenv-error-handling-guidelines.md#error-messages-with-fix-it-actions--when-to-use-them) actions are recommended for scenarios where the system knows the correct value that should be used to resolve the error. [Show-it](devenv-error-handling-guidelines.md#error-messages-with-show-it-actions--when-to-use-them) actions are recommended for scenarios when the system can identify the location where the error may be fixed by the user.

Here are some quick guidelines on when to use each type of error message and its accompanying recommended actions. However, it's essential to begin by considering whether the error could have been avoided in the first place.

| Error type | Description |
|------------|-------------|
|Task dialogs |	Task dialogs are used when an error can be mitigated by the user choosing between two (sometimes three) different options to continue their task without encountering an error.|
|[Error messages with Fix-it actions](devenv-error-handling-guidelines.md#error-messages-with-fix-it-actions--when-to-use-them) | Fix-it actions can be used when the cause and solution to the error is known and can be solved by users with just one step.|
|[Error messages with Show-it actions](devenv-error-handling-guidelines.md#error-messages-with-show-it-actions--when-to-use-them) | Show-it actions can be used when an error must be corrected on a related table. A Show-it action can then offer a shortcut to the related table, enabling users to correct the error by themselves with one or multiple steps, while keeping the context of their current task.|

## Error messages with Fix-it actions – when to use them?

**Fix-it actions** are for when the correct value is known. If all the following four statements are true for your error case, then consider adding a recommended Fix-it action in your error message to enable users to easily unblock themselves from the error.

1. Is the solution to the error known?
2. Is the error location on the current page?
3. Can the error (value) be corrected with one action?
4. Does the user have permission to make the required correction?

Example of an error dialog with a Fix-it action

:::image type="content" source="media/error-dialog-fixit.png" alt-text="Error dialog with fix-it action":::

Example of a validation error with a Fix-it action

:::image type="content" source="media/validation-error-fixit.png" alt-text="Validation error with fix-it action":::

## Error messages with Show-it actions – when to use them?

**Show-it actions** are for when the error location is known. A shortcut can then be provided to show the related page to enable users to easily unblock themselves from the error. If all the following four statements are true for your error case, then consider adding a recommended Show-it action in your error message.

1. Is the solution to the error known?
2. Is the error correction location known and is it on a related table?
3. Can you show the related table with one action?
4. Does the user have permission to make the required correction?

Example of an error dialog with a Show-it action

:::image type="content" source="media/error-dialog-showit.png" alt-text="Error dialog with show-it action":::

Example of a validation error with one Show-it action

:::image type="content" source="media/validation-error-fixit.png" alt-text="Validation error with show-it action":::

## Error messages with multiple actions - how to use them?

Error messages can have up to two recommended actions.

|Description|
|-----------|
|In this error dialog case the recommended Fix-it action sets the value to blank, meaning that it clears out the field value. <br><br> Notice the error dialog has two actions. In error cases both buttons are styled equally as secondary buttons, to allow users to consider the most suitable way to get unblocked for their case. <br><br>:::image type="content" source="media/error-dialog-multiple.png" alt-text="Error dialog with multiple actions":::|
|Example of validation error with two promoted actions. Here the Show-it action shows the related Comments table, and the Fix-it action rejects the approval.<br><br> Users can also get unblocked by refreshing the page or copying the error details for sharing and troubleshooting.<br><br>:::image type="content" source="media/validation-error-multiple.png" alt-text="Validation error with multiple  actions":::|
|When there isn’t any known solution to recommend, the error dialog has one primary OK button.<br>Users can copy and share the full error details needed for troubleshooting and support.<br><br> :::image type="content" source="media/error-dialog-nosolution.png" alt-text="Error dialog with no solution":::|

<!--
|Description|Example|
|-----------|-------|
|In this error dialog case the recommended Fix-it action sets the value to blank, meaning that it clears out the field value. <br><br> Notice the error dialog has two actions. In error cases both buttons are styled equally as secondary buttons, to allow users to consider the most suitable way to get unblocked for their case.| :::image type="content" source="media/error-dialog-multiple.png" alt-text="Error dialog with multiple actions"::: |
|Example of validation error with two promoted actions. Here the Show-it action shows the related Comments table, and the Fix-it action rejects the approval.<br><br> Users can also get unblocked by refreshing the page or copying the error details for sharing and troubleshooting.| :::image type="content" source="media/validation-error-multiple.png" alt-text="Validation error with multiple  actions":::|
|When there isn’t any known solution to recommend, the error dialog has one primary OK button.<br>Users can copy and share the full error details needed for troubleshooting and support.| :::image type="content" source="media/error-dialog-nosolution.png" alt-text="Error dialog with no solution"::: | -->

## Error message best practices - what to say?

Error messages are meant to unblock users. The primary purpose of the error dialog is to alert users to the fact that something has gone wrong and that they need to take action to continue. 

### Error dialog content

Error dialogs should answer the following questions:

**Title:** [What went wrong]  
**Body content:** [Why, if relevant] + [How to fix it]  
**Button label:** [Clear action]  

### Validation errors content

Validation errors should answer the following questions:

**Title (if needed):** [What went wrong]  
**Body content:** [How to fix it]  
**Button label:** [Clear action]  


## Error message voice guidelines – how to say it?

### Titles

- Use the title to describe what’s wrong and enable the user to quickly scan the meaning.
- Be concise and describe the issue, not the action to take.
- Be brief. Just one sentence.
- Titles shouldn't end in punctuation.
- Not all validation errors need a title.  
- Keep in mind the relation between the title and the recommended actions. Actions should always respond to the title if there's one. 

### Body content

- Use positive cases (telling what the user can do) where possible, sometimes you need to tell what you can’t do, but for validation errors space is limited so focus on the solution.
Button labels
- Fix-it actions are often phrased: “Set value to...”. 
  - Such as: “Set value to 10”, “Set Status to Open”, or “Set value to HOME”.
- Fix-it action tooltips are often phrased: “Sets the value...”.
- Value states are capitalized such as: Yes, Open, Released. Avoid signs for values such as = ,“”, ().

- Show-it actions are phrased: “Show...”.
  - Such as: “Show User Setup”, “Show Items list” or “Show Item 70062”. 
- Show-it action tooltips are often phrased: “Opens page:..”.
  - Note: Avoid using “Open” for the button label, as it can be confused with opening the status of the document. Instead use “Show” and use the tooltip to write out “Opens Page:...”.
- Captions are capitalized, such as: Item, Direct Posting and G/L Account.

### Error messages

- Use the word problem instead of error, issue, or technical problem. 
- Refer to the error message as a message and not an error or error message.  
- It’s OK to use please when asking the user to resolve a problem that isn’t their fault. 
- Only use sorry (and similar wording) in error messages that notify the customer about a serious problem or one that they might find frustrating. For example:
  - Data is lost. 
  - The customer can't continue to use the device, service, or application. 
  - The customer must get help from a support representative.  
  - A product or service fails. 

### Avoid these words and phrases

- “There has been an error” or “An error has occurred”  
- “Error,” “Failed,” “Denied,” or “Invalid”
- "Hmmm ..." or "Oops ..." or "Whoops"
- Developer error codes like “WDGeneralNetworkError Error 500”. If you need to include a code, hide it under “details”. 
- Don't overwhelm the user with technical terms
- Avoid robotic language and signs such as = “ ()
- Avoid long how-to or instructional guidance in error. That content lives on docs.microsoft.com or in your documentation.

### Use contractions

- Use common contractions, such as it’s, you’re, that's, and don’t, to create a friendly, informal tone.
- Don't mix contractions and their spelled-out equivalents in UI text. For example, don’t use can’t and cannot in the same UI.
- Never form a contraction from a noun and a verb, such as Microsoft’s developing many new cloud services.
- Avoid ambiguous or awkward contractions, such as there’d, it’ll, and they’d.

For more guidelines, follow Microsoft’s voice guidelines [Microsoft's brand voice: Above all, simple and human](https://learn.microsoft.com/style-guide/brand-voice-above-all-simple-human).

## See also

[AL error handling](devenv-al-error-handling.md)  
[Understanding the error dialog](devenv-error-dialog.md)  
[Dialog.Error(ErrorInfo) Method](methods-auto/dialog/dialog-error-errorinfo-method.md)
