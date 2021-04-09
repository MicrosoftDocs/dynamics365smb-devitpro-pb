---
title: Teaching tips and in-app tours for onboarding users
description: Learn about the teaching tips that you can apply to your Business Central to help users get started.
author: sorenfriisalexandersen
manager: edupont
ms.topic: conceptual
ms.service: dynamics365-business-central
ms.date: 04/01/2021
ms.author: soalex
---

# Teaching tips and in-app tours for onboarding users

A key element in educating users about [!INCLUDE [prod_short](../includes/prod_short.md)] pages and concepts is the *tour*. A tour is a sequence of *teaching tips*.  

Teaching tips can be defined at the page level, the *page teaching tip*, and be followed by teaching tips at the control level, the *control teaching tips*. Both types of teaching tips are defined by the .AL properties **AboutTitle** and **AboutText**, and an extension can overwrite teaching tips in the default version.

## Page teaching tips

- The primary purpose is to increase the user's chance of success with the page. Therefore, the title and description of the page teaching tip should answer the following hypothetical user questions:

  - **AboutTitle**: *What is this page about*?

  - **AboutText**: *What can I do with this page?*

- Teaching tips explain [!INCLUDE [prod_short](../includes/prod_short.md)] logic that is relevant to the page.

- Teaching tips let users discover and initiate the related tour whenever they are ready for it.

- Allow users to get on with a task right away without blocking them.

- A teaching tip can be defined for any page in [!INCLUDE [prod_short](../developer/includes/prod_short.md)], except the role center, dialogs, and request pages for reports.

- After the users dismisses a teaching tip and tour, they can at any point hit or hover over the page title. This will reopen the teaching tip, and the user can re-take the tour, for example.

- On a page that is opened from the checklist, the tour is considered an invited tour, and the page teaching tip has a **Go back** button that takes the user back to the checklist.

The following illustration shows a page teaching tip <sup>4</sup> that explains what the page is about and can invite the user to take a tour. The teaching tip renders in the lower left corner.  

:::image type="content" source="../media/onboarding-teaching-tip-page.png" alt-text="A page in Business Central with a page teaching tip at the lower left corner":::

The following illustration shows how choosing the page title <sup>5</sup> will reopen the teaching tip so that the user can re-take the tour.  

:::image type="content" source="../media/onboarding-teaching-tip-title.png" alt-text="Illustration of page with a teaching tip pointing to the page title":::

## How to write page teaching tips

There are different rules for teaching tips for lists versus cards and documents.

| List page with teaching tip | Card page with teaching tip |
|-------------------------|-------------------------|
| :::image type="content" source="../media/onboarding-teaching-tip-list.png" alt-text="illustration of List Page with teaching tip":::| :::image type="content" source="../media/onboarding-teaching-tip-card.png" alt-text="illustration of Entity Page with teaching tip":::|
|**AboutTitle**: About sales invoices</br>**AboutText**: Sales invoices appear in this list until they are finalized and posted. After an invoice is posted, find it again in the Posted Sales Invoices list. |**AboutTitle**: About sales invoice details</br>**AboutText**: You can update and add to the sales invoice until you post it. If you leave the invoice without posting, you can return to it later from the list of ongoing invoices. |
| Answers the following questions:</br><ul></br><li>What can I do on this page in general?</li></br><li>Is there a related entity I should know about?</li></br><li>The title for a list page teaching tip will typically use the plural form, such as *About sales invoices*</li></br></ul> | Answers the following questions:</br><ul></br><li>What can I do on this page with this particular field or action?</li></br><li>What is the desired outcome of the task in this page?</li></br><li>The title for a card or document page teaching tip will typically be [entity name] + *details*,  such as *About sales invoice details*</li></br></ul> |

## What you should know about tours

- Tours are sequential teaching tips describing functionality while pointing to elements in the UI.

- The tour guides the user around the page.

- Tours can be initiated from the page teaching tip

- During a tour, a page with input fields will be in read mode.

- Tours show where to find something, what it is, what it means, what you can do with it, and what it affects.

- A control teaching tip can point out a value that the user must check to know their next step.

  - Example: The **Status** field on an invoice. When the status is open, the user can edit the invoice.

- A control teaching tip can describe the relevant timing for when to use a field or action.

  - Example: The **Post** action: when done editing, then post and send.

## How to write teaching tips for controls

There are different rules for teaching tips for input fields and actions.

| Teaching tip pointing to an input field | Teaching tip pointing to an action |
|-------------------------|-------------------------|
| :::image type="content" source="../media/onboarding-teaching-tip-field.png" alt-text="Illustration of teaching tip pointing to an input field"::: | :::image type="content" source="../media/onboarding-teaching-tip-action.png" alt-text="Illustration of teaching tip pointing to an action":::|
|**AboutTitle:** Who you are selling to</h3></br>**AboutText:** This can be an existing customer, or you can register a new from here. Customers can have special prices and discounts that are automatically used when you enter the sales lines.|Content example for the **Post** action:</br>**AboutTitle:** When all is set, you post</br>**AboutText:** After entering the sales lines and other information, you post the invoice to make it count.​ After posting, the sales invoice is moved to the Posted Sales Invoices list. |
| <ul></br><li>The teaching tip can point to a field that may or may not have data.</li></br><li>A control teaching tip can explain an important value's meaning, such as what leaving the field blank does.</li></br><li>Avoid stating the obvious and avoid action language that tell users to do something that isn't active during the tour. For example, don't say *Enter the customer name here.* Instead, explain what to be aware of when adding a customer.</li></br></ul> | <ul></br><li>With multiple similar actions,such as **Post** and **Post & New**, call out the simplest version only.</li></br><li>Avoid action language that tell users to do something that isn't active during the tour. Don't say: *Now post the invoice*. Instead, explain what to be aware of when posting.</li></br></ul> |

## Tooltips and control teaching tips are complementary

[!INCLUDE [ua-tooltips-teachingtips](../includes/ua-tooltips-teachingtips.md)]

For more information about tooltips, see [Help users get unblocked](../user-assistance.md#help-users-get-unblocked).  

## Best practices for teaching tips and tours

- Not all pages in [!INCLUDE [prod_short](../includes/prod_short.md)] need teaching tips and tours. Use teaching tips where they provide value.

- A teaching tip says *what can be done* (outcome), not *how to do it* (steps)

- A teaching tip is short, and easily read. Usually just two or three short sentences.

### Do

- Use easy to understand titles that are relevant to the element being pointed to.

- Be concise with the information you provide inside of a teaching tip. Short sentences or sentence fragments are best.

- keep the tour as short as possible 1-4 steps.

- Titles with a question is ok but use sparingly.

- Use positive cases, *don't tell what you can't do*.

- Follow [Microsoft voice guidelines](/style-guide/welcome/)

### Don't

- Don't provide how-to (steps) or instructional guidance in teaching tips. That content lives on docs.microsoft.com or in your own documentation.

- Don't use large, unformatted blocks of text in a teaching tip.

- Don't put obvious tip text, or text that simply repeats what is already on the screen.

- If you can't find anything to say, maybe re-evaluate if this teaching tip is needed.

## See also

[Get Users Started with the Checklist](onboarding-checklist.md)  
[Guidelines for tooltip text](../user-assistance.md#guidelines-for-tooltip-text)  
[Onboarding experiences in Business Central](onboarding-experiences.md)  
[AboutTitle Property](../developer/properties/devenv-abouttitle-property.md)  
[AboutText Property](../developer/properties/devenv-abouttext-property.md)  
