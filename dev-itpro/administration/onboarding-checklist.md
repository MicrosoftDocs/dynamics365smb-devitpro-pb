---
title: Get Users Started with the Checklist
description: Learn how to customize the checklist that users can launch from the Welcome banner.
ms.date: 03/26/2021
ms.topic: conceptual
ms.service: dynamics365-business-central
author: sorenfriisalexandersen
ms.author: soalex
manager: edupont
---

# Get Users Started with the Checklist

When the user hits **Get started** on their Home page, a checklist is revealed inside the banner. The checklist provides users with an overview of their onboarding activities, while allowing them to learn and explore at their own pace. The checklist serves as a platform for surfacing page tours, guiding users in the product interface, and teaching users how to use the app in context. The checklist provides a sense of progression, nudging users to complete onboarding activities. Users can navigate between the tasks of the checklist at their own pace. Checklist tasks can point to pages or objects in [!INCLUDE [prod_short](../includes/prod_short.md)] or point to external URLs. Read more about the checklist content in the [Prerequisites for creating checklist items](#prerequisites-for-creating-checklist-items)section.

As the user progresses through the checklist by either completing or skipping the steps, the banner title and status indication will change accordingly to nudge and encourage users to finish. The user can at any point minimize the banner by hitting X and resume when ready.

The following illustration shows the banner with the checklist (2) containing suggested setup and learning material.

:::image type="content" source="../media/onboarding-checklist.png" alt-text="illustration of a banner with checklist providing an overview of the tasks to complete as well as a detailed description of the ongoing task":::

The checklist provides an overview of the tasks to complete as well as a detailed description of the ongoing task.  

The following illustration shows a [!INCLUDE [prod_short](../includes/prod_short.md)] Home page with a collapsed banner (3), which indicates the completion progress as well as providing a clear call-to-action to resume with the checklist activities.

:::image type="content" source="../media/onboarding-banner-collapsed.png" alt-text="illustration of a collapsed banner with progress indication and a clear call-to-action to resume with the checklist activities. ":::

## What should go into a checklist

Checklists are meant to assist users in finalizing setup and help users get started with using the application. Checklists are not meant to provide a full list of tasks necessary to set up [!INCLUDE [prod_short](../includes/prod_short.md)] from scratch. What goes into the checklist depends on several factors, but consider bringing Configuration Packages with as much base setup as possible so the checklist only consists of things where the customer needs to make tweaks and decisions necessary to support their business. Automation APIs can help you with automating the delivery of the setup for a customer's industry or segment and applying your IP from AppSource. Using these APIs you should be able to automate much of the deployment process, including data for the checklist, which enables you to hand over completion of the setup for the customer. Consider bringing Assisted Setup wizards for the things that are added to the checklist.

Based on the configuration choices made by the customer in Assisted Setups, you can download additional modular Configuration Packages necessary to complete the setup. This gives you a lot of flexibility to provide setup based on customer choices at different stages of the implementation, with the key advantage for you and the customer that you can spend less time on the actual implementation.

## Technical background of the checklist

The data model of the checklist consists of the following tables. There are more in the data model but these are the ones you need to know about to provide onboarding experiences to customers.

| ID | Name | Purpose |
|-------------------------|-------------------------|-------------------------|
| 1991 | Checklist Item | Represents the checklist item itself. |
| 1992 | Checklist Item Role | Represents the mapping of checklist items to roles. |
| 1993 | Checklist Item User | Represents the mapping of checklist items to named users. |

## Prerequisites for creating checklist items

Before you can make a checklist item point to an entity or URL you must add a record to the **Guided Experience Item** table that refers to the desired entity.

## Guided Experience Item

From the Dynamics 365 [!INCLUDE [prod_short](../includes/prod_short.md)] 2021 release wave 1 the records in **Manual Setup** and **Assisted Setup** are migrated to a new table, **Guided Experience Item**. This table has a field, **Type**, that determines the type of each record:

- **Assisted Setup**

  This is where all assisted setup wizards now reside.

- **Manual Setup**

  This is where all manual setup records now reside.

- **Learn**

  Records of type **Learn** point to an external URL.

Checklist items can be based on records in the **Guided Experience Item** table, which means that before you surface a task on the checklist, you must first add it to **Guided Experience Item**.

To insert a record in the **Guided Experience Item** table use the façade functions in the `Guided Experience` codeunit:

- `InsertManualSetup`
- `InsertAssistedSetup`
- `InsertLearnLink`

For example, let's say that you have the page **My ISV Solution Setup** where the user can configure your app. You want to invite the business manager to access this page from the checklist. In this example, you must insert a new record in the Guided Experience Item with the type "Manual Setup" and provide the metadata as data (title, descriptions etc.) as described below.

After having created this record, it can now be referenced from and inserted into a checklist.

### Best practices for checklist content creation

Do:

- Keep the list short (preferably 6 items or less) to avoid a scrollbar and to ensure a successful start for users.

- Keep Checklist titles and descriptions short and to the point.

- When writing the description, it's good practice to include the benefit of doing the task. But be brief.

> [!TIP]
> If the task points to a page that comes from the Manual list, the **ShortTitleChecklist** is picked from there. Those title consist of short nouns such as **User permissions**.
>
> If the task points to wizards that comes from the Assisted setup list, the **LongerTitleCard** is picked from there... Those title usually contain a verb such as **Update users**.

Don't:

- Don't overwhelm the user with a long list of checklist tasks

- Don't use too long titles as they're harder to understand and space becomes an issue.

### Maximum character UX guideline

- **Checklist: ShortTitleChecklist**: Max 34 characters before truncation.

- **Checklist: LongerTitleCard**: Max 53 characters before truncation.

- **Checklist: CardDescription:** Max 180 characters before truncation

### Client truncation limits

- **Checklist: ShortTitleChecklist**: Max 34 characters before
    truncation.

- **Checklist: LongerTitleCard**: Max 53 characters before truncation.

- **Checklist: CardDescription:** scrollbar will appear if more than 4 lines...

### Auto completion settings and time estimates

- Add support for auto-completion when possible, such as for wizards, as this automatically makes the checklist move to the next task and provides the user with a good sense of progress.

- Provide a realistic time stamp of the estimated completion time and strive for tasks that take less than 5 minutes to complete.

## See also

[Teaching tips and in-app tours for onboarding users](onboarding-teaching-tips-tours.md)  
[Onboarding experiences in Business Central](onboarding-experiences.md)  
