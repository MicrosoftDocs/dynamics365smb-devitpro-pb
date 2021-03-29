---
author: edupont04
ms.service: dynamics365-business-central
ms.topic: include
ms.date: 03/11/2021
ms.author: edupont
---
The Microsoft user assistance model requires a tooltip for all controls of type Action and Field that exist on page objects. Follow these guidelines:

- If the control is a field, begin with the verb *Specifies*.
- If the control is an action, begin with a verb in the imperative form , such as *Calculate* or *View*.
- Include the most valuable information that users need to perform the task(s) that the field or action supports.

    For example, for the **Post** action, do not write *Post the document*. Write, for example, *Update ledgers with the amounts and quantities on the document or journal lines*.  
- Describe complex options in tooltips for option fields.

    Use a colon to call out the option name and its description. See example 3 below.
- Try to not exceed 200 characters including spaces.

    This makes the tooltip easier to scan so the user can get unblocked quickly. However, the UI will render longer tooltip text if you want to provide more detailed user assistance.  
- Do not use line breaks in the tooltip text.

    The tooltip cannot render formatting or line breaks.
