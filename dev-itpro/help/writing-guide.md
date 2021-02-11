---
title: Authoring guide for Business Central
description: Tips and tricks for authoring in MarkDown files when you extend or customize the Help for Dynamics 365 Business Central.
author: edupont04
ms.custom: na
ms.reviewer: na
ms.topic: conceptual
ms.service: "dynamics365-business-central"
ms.date: 12/16/2020
ms.author: edupont
---

# Authoring Guide for [!INCLUDE[prod_long](../developer/includes/prod_long.md)]

If you are contributing to the [!INCLUDE [prod_short](../developer/includes/prod_short.md)] Help, or if you are customizing and extending the Microsoft content for your own solution, you will probably want to use the same tools, processes, and style guide that Microsoft uses.  

## Resources

- The [Microsoft Writing Style Guide](/style-guide/welcome/) is published online
  
  The content on the Docs.microsoft.com site generally follows the Microsoft Writing Style Guide. The content for [!INCLUDE [prod_short](../developer/includes/prod_short.md)] varies in certain ways, partly with product-specific terminology, and a generally more conservative approach to contractions, for example.
- [Extend, Customize, and Collaborate on the Help](contributor-guide.md) shows you the basics of collaborating on content for [!INCLUDE [prod_short](../developer/includes/prod_short.md)]

- The [Docs Contributor Guide](/contribute/) has many tips and tricks for authoring in MarkDown

- The [Docs Authoring Pack for Visual Studio Code](/contribute/how-to-write-docs-auth-pack) adds productivity tools to Visual Studio Code  

## Write for accessibility

At Microsoft, we write for accessibility, which also means that the same content applies to interactions with the software across devices, regardless of input method, for example. For more information, see [Describing interactions with UI](/style-guide/procedures-instructions/describing-interactions-with-ui) in the Microsoft Writing Style Guide.  

The accessibility requirements also impacts metadata for illustrations, such as the following:

```markdown
:::image type="content" source="media/illustration.png" alt-text="Text used by screen readers":::
```

Most of Microsoft's articles use a different MarkDown formatting for illustrations, such as the following:

```markdown
![Lightbulb that opens the Tell Me feature](media/ui-search/search_small.png "Tell me what you want to do")
```

Both formats are valid MarkDown, and both formats are supported by DocFx.exe. For more information, see [Images](/contribute/markdown-reference#images) in the Docs Contributor Guide.  

## Authoring in MarkDown

The [!INCLUDE [prod_short](../developer/includes/prod_short.md)] content is styled using a MarkDown syntax as described below. Extended guidance is available in the [MarkDown Reference](/contribute/markdown-reference) section in the Docs Contributor Guide.

### Headings

Use `#` for headings. For more information, see [Headings](/contribute/markdown-reference#headings) in the Docs Contributor Guide.  

In the source files for the [!INCLUDE [prod_short](../developer/includes/prod_short.md)] content, which publishes as English (US) on the Docs.microsoft.com site, the title of an article is expected to use Title Case (capitalize each word, except prepositions) whereas subsequent headings use Sentence case (capitalize the first word, only). The Microsoft Writing Style Guide recommends a different approach.

### Metadata

The content on the Docs.microsoft.com site includes metadata that is used by the site and feeds our internal telemetry dashboards. The metadata is required for Microsoft's content but not necessarily for content that extends or customizes Microsoft's content.

However, some metadata is recommended as a best practice as outlined in the following table.

|Metadata tag  |Description  |
|---------|---------|
|title |Used by search engines. Recommended length of 60-70 characters, including spaces. We recommend that the title metadata is the same as the first heading in the article.|
|description|Used by search engines. Recommended length of 100-160 characters, including spaces. |
|author     |GitHub account of the main contributor to the article. |
|ROBOTS|Please apply this tag if you customize one of Microsoft's articles and deploy that to your website. By applying the metadata `ROBOTS: NOINDEX, NOFOLLOW`, you help make sure that search engines will find the original article rather than your customized version. Users of your Help will still be able to find the customized article through context-sensitive Help links and other links.  |

### Bulleted lists

Use `-` or `*` to create bullets as shown in the following example:

```MarkDown
The following options are available:

- first option
- second option
- third option
```

> [!TIP]
> It doesn't matter if you use `-` or `*`, but the current version of the Docs Authoring Pack requires each article to use one or the other and not mix them up.

As a best practice, the MarkDown validation in the current version of the Docs Authoring Pack recommends a blank line between options in a bulleted list for better readability in MarkDown.

### Ordered lists

Use numbers for ordered lists. Do not add spaces between the lines.

```MarkDown
1. Choose the ![Lightbulb that opens the Tell Me feature](media/ui-search/search_small.png "Tell me what you want to do") icon, enter **Payment Journal**, and then choose the related link.
2. In the **Payment Journal** window, on the first journal line, enter the relevant information about the payment entry.
3. To apply a single vendor ledger entry:
4. In the **Applies-to Doc. No.** field, choose the field to open the **Apply Vendor Entries** window.
```

### Bold and italics syntax

Use ```**bold**``` and ```*italics*```

### Tables

For tables in the body, use the markdown syntax. The Docs Authoring Pack for Visual Studio Code has a shortcut for adding a table, and you can also use [Tables Generator](https://tablesgenerator.com/markdown_tables).

```MarkDown
| To   | See                       |
|------|---------------------------|
|<text>|<link>|
| | |
| | |
```

MarkDown syntax for nested tables is limited, so we recommend using HTML-syntax for nested tables in ordered and unordered lists use HTML-syntax.

### Placeholders

Rather than repeating text in two or more articles, use *includes*. For more information, see [Included Markdown files](/contribute/markdown-reference#included-markdown-files).  

For [!INCLUDE [prod_short](../includes/prod_short.md)], we use includes for boilerplate text, for content that is repeated in more than one article, and for the product name. That way, we can make changes in just one location - and so can you.  

> [!TIP]
> In the [dynamics365smb-docs](https://github.com/MicrosoftDocs/dynamics365smb-docs) repo, the includes are in the `business-central\includes` subfolder.
>
> In December 2020, the two placeholders for the product name, prodshort.md and prodlong.md, were renamed to prod_short.md and prod_long.md. The change solved a problem internally at Microsoft, because we have a tool that helps identify spelling error, and that tool generated warnings for prodshort.md and prodlong.md.

### Comment syntax

Useful for sections that are not ready and will not pass build checks.

```MarkDown
<!-- Comments -->
```

Examples:

```MarkDown
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

*targetarticlename* is the file name of the article, including the .md file type.
target-heading is the text of the heading that you want to link to, except it is all lowercase and spaces between words are replaced with hyphens.

For example, to link to the heading "How autoscaling works" in the article Autoscaling.md, add the following code:
```[How autoscaling works](Autoscaling.md#how-autoscaling-works)```

### <a name="anchorlink"></a>Links to anchors across languages

[!INCLUDE [docslinkanchor](../developer/includes/docslinkanchor.md)]

### Line breaks (soft return)

In the editor, add two blank spaces at the end of the sentence and hit return. This is used in the See Also list. (See Also must be heading 2.)

### Continue steps after a non-step para

Enter four spaces in front of the non-step para. Otherwise, the non-step para will restart the step sequence.

### TOC

The TOC structure of the TOC.md file is as follows:

```MarkDown
#[Overview](overview.md)
 ##[Topic 1](topic-1.md)
 ##[Topic 2](topic-2.md)
 ##[Topic 3](topic-3.md)
 ##[Topic 4](topic-4.md)
```

### Standard phrases

All fields in Business Central have tooltips; therefore, do not document fields in Help. To refer readers to the tooltips, use this standard phrase where relevant:

> "Choose a field to read a short description of the field or link to more information."

For more information, see [Business Central User Assistance Model](../user-assistance.md).

### Recycle content

Rather than copy-pasting content that you want to surface in two or more places, use *includes*. For more information, see [Included Markdown files](/contribute/markdown-reference#included-markdown-files) in the Docs Contributor Guide.  

### Topic titles

- Use imperative verb form for step-based topics ("Pay vendors").
- Use gerund verb form for conceptual, non-step topics. ("Paying Vendors")
- Use nouns for highest-level topics. ("Sales")

### File naming

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
