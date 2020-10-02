---
title: Authoring guide for Business Central
description: Tips and tricks for authoring in MarkDown files for Dynamics 365 Business Central.
author: edupont04
ms.custom: na
ms.reviewer: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.date: 10/01/2020
ms.author: edupont
---

# Authoring Guide for [!INCLUDE[prodlong](../developer/includes/prodlong.md)]

If you are contributing to the [!INCLUDE [prodshort](../developer/includes/prodshort.md)] Help, or if you are customizing and extending the Microsoft content for your own solution, then you will probably want to use the same tools, processes, and style guide that Microsoft uses.  

This page shows tips and tricks for authoring in MarkDown based on what the [!INCLUDE [prodshort](../developer/includes/prodshort.md)] team of technical writers learnt when they started in MarkDown in 2015.

## Resources

- The [Microsoft Style Guide](/style-guide/welcome/) is published online

- [Extend, Customize, and Collaborate on the Help](contributor-guide.md) shows you the basics of collaborating on content for [!INCLUDE [prodshort](../developer/includes/prodshort.md)]

- The [Docs Contributor Guide](/contribute/) has many tips and tricks for authoring in MarkDown

- The [Docs Authoring Pack for Visual Studio Code](/contribute/how-to-write-docs-auth-pack) adds productivity tools to Visual Studio Code  

## Authoring in Markdown

The [!INCLUDE [prodshort](../developer/includes/prodshort.md)] content is styled using a MarkDown syntax as described below. You can also get a lot of guidance in the [MarkDown Reference](/contribute/markdown-reference) section in the Docs Contributor Guide.

### Headings

Use ```#``` for headings. For more information, see [Headings](/contribute/markdown-reference#headings) in the Docs Contributor Guide.

### Bulleted lists

Use ```-``` to create bullets, for example:

The following options are available:

```
- first option
- second option
- third option
```

> [!TIP]
> The Markdown validation in the current version of the Docs Authoring Pack recommends a blank line between options in a bulleted list.

### Ordered lists

Use numbers for ordered lists. No space between the lines, we'll let the template for the documentation website take care of that.

```
1. Choose the ![Lightbulb that opens the Tell Me feature](media/ui-search/search_small.png "Tell me what you want to do") icon, enter **Payment Journal**, and then choose the related link.
2. In the **Payment Journal** window, on the first journal line, enter the relevant information about the payment entry.
3. To apply a single vendor ledger entry:
4. In the **Applies-to Doc. No.** field, choose the field to open the **Apply Vendor Entries** window.
```

### Bold and italics syntax

Use ```**bold**``` and ```*italics*```

### Tables

For tables in the body, use the markdown syntax. The Docs Authoring Pack for Visual Studio Code has a shortcut for adding a table, and you can also use [Tables Generator](https://tablesgenerator.com/markdown_tables).

```
| To   | See                       |
|------|---------------------------|
|<text>|<link>|
| | |
| | |
```

For nested tables in ordered and unordered lists use HTML-syntax. Markdown does not support tables very well. If you use the markdown syntax the list will be broken, the table will align left and list will be renumbered.

### Comment syntax

Useful for sections that are not ready and will not pass the build check.
```
<!-- Comments -->
```
Examples
```
<!-- [Managing Payables](payables-manage-payables.md)-->
<!-- This is a paragraph that spans more lines and I can just put the comment tag
at the beginning and end of it -->
```

### Links

Ordinary link to a different topic in the same folder

These links have the format ```[link text](filename.md)```.

Example:
```[Managing Payables](payables-manage-payables.md)```

### Link to a topic in a subfolder of the source topic

These links have the format ```[link text](subfolder/filename.md)```.

For example, you want to link to payables-manage-payables.md from ui-work-general-journals.md, where the folder structure is as follows:

- articles
    - ui-work-general-journals.md
- ManagePayables
    - payables-manage-payables.md

Here is the link:
```[Manage Payables](ManagePayables/payables-manage-payables.md)```

### Link to a topic in a different folder than source topic

These links have the format ```[link text](../folder/filename.md)```.

For example, you want to link to payables-manage-payables.md from receivables-manage-receivables.md, where the folder structure is as follows:

- articles
  - ManageReceivables
    - receivables-manage-receivables.md
    - ui-work-general-journals.md
    - ManagePayables
      - payables-manage-payables.md

Here is the link:
```[Manage Payables](../ManagePayables/payables-manage-payables.md)```

### Link to a place in the same article

From within an article, you can create a link to a specific heading in the same article. You can create the link like other links except with the following format:

```[link text](#target-heading)```

target-heading is the text of the heading that you want to link to, except it is all lowercase and spaces between words are replaced with hyphens. For example, here is the link:
```[How Autoscaling Works](#how-autoscaling-works)```

To the heading:
```## How Autoscaling Works```

### Link to a place in a different article

From an article, you can create a link to a specific heading in another article. You can create the link like other links except with the following format:

```[link text](targetarticlename#target-heading)```

targetarticlename is the file name of the article, including the .md file type.
target-heading is the text of the heading that you want to link to, except it is all lowercase and spaces between words are replaced with hyphens.

For example, to link to the heading "How Autoscaling Works" in the article Autoscaling.md", add the following code:
```[link text](Autoscaling.md#how-autoscaling-works)```

### <a name="anchorlink"></a>Links to anchors across languages

[!INCLUDE [docslinkanchor](../developer/includes/docslinkanchor.md)]

### Line breaks (soft return)

In the editor, add two blank spaces at the end of the sentence and hit return. This is used in the See Also list. (See Also must be heading 2.)

### Continue steps after a non-step para

Enter four spaces in front of the non-step para. Otherwise, the non-step para will restart the step sequence.

### TOC

The TOC structure of the TOC.md file is as follows:

```
#[Overview](overview.md)
 ##[Topic 1](topic-1.md)
 ##[Topic 2](topic-2.md)
 ##[Topic 3](topic-3.md)
 ##[Topic 4](topic-4.md)
```

### Standard Phrases

All fields in Business Central have tooltips. Therefore, do not document fields in Help. To refer readers to the tooltips, use this standard phrase where relevant:

> "Choose a field to read a short description of the field or link to more information."

For more information, see [Business Central User Assistance Model](../user-assistance.md).

### Topic Titles

- Use imperative verb form for step-based topics ("Pay vendors").
- Use gerund verb form for conceptual, non-step topics. ("Paying Vendors")
- Use nouns for highest-level topics. ("Sales")

### File Naming

#### Rules

- No spaces or punctuation characters. Use hyphens to separate the words in the file name.
- Use all lowercase letters
- No more than 80 characters - this is a publishing system limit
- Use action verbs that are specific such as develop, buy, build, troubleshoot. No -ing words.
- No small words - don't include a, and, the, in, or, etc.
- All files must be in markdown and use the .md file extension.

#### Examples

|Topic title |Naming  |
|------------|--------|
|Select a Company|ui-how-select-company.md|
|Enter Criteria in Filters|ui-enter-criteria-filters.md|
|Troubleshooting: Record Locked by Another User|ui-troubleshoot-record-locked-another-user.md|
|Changing Basic Settings|ui-change-basic-settings.md|
|Sales|sales-manage-sales.md|
|Set Up Currencies|finance-setup-currencies.md|
|Set Up Purchasers|purchases-how-setup-purchasers.md|
|Understanding Session Timeouts|admin-understand-session-timeouts.md|
|Manage Data Encryption|admin-manage-data-encryption.md|

### Country-specific content

To simplify content localization and translation, country-specific articles live in country-specific folders. The TOC entries live under the "Local Functionality" parent node.

## See also

[Business Central User Assistance Model](../user-assistance.md)  
[Extend, Customize, and Collaborate on the Help](contributor-guide.md)  
[Configuring the Help Experience](../deployment/configure-help.md)  
[Docs Contributor Guide](/contribute/)  
[Docs Authoring Pack for Visual Studio Code](/contribute/how-to-write-docs-auth-pack)  
[Getting started with writing and formatting on GitHub](https://help.github.com/articles/getting-started-with-writing-and-formatting-on-github/)  
[Visual Studio Code](https://code.visualstudio.com/)  
[Atom](https://atom.io/)  
[DocFx](https://dotnet.github.io/docfx/)  
[Blog post: Extending and customizing the Help](https://cloudblogs.microsoft.com/dynamics365/it/2019/08/14/extending-and-customizing-the-help-in-dynamics-365-business-central)  
[Blog post: Collaborate on content for Business Central](https://cloudblogs.microsoft.com/dynamics365/it/2019/08/14/collaborate-on-content-for-dynamics-365-business-central/)  
