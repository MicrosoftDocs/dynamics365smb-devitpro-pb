## Microsoft Open Source Code of Conduct
This project has adopted the [Microsoft Open Source Code of Conduct](https://opensource.microsoft.com/codeofconduct/).
For more information see the [Code of Conduct FAQ](https://opensource.microsoft.com/codeofconduct/faq/) or contact [opencode@microsoft.com](mailto:opencode@microsoft.com) with any additional questions or comments.

# dynamics365smb-devitpro
Welcome to the repository for developer and IT-pro content for Dynamics 365 Business Central! This product is aimed at small and midsized businesses, and the repo is currently private.
If you have any questions, please contact us through the navua alias.  


======================================
## Getting started with Open Publishing

Start contributing to the repo docs using the following steps:

## Set up your account
1. Get a GitHub account
2. Link it to your work account at https://repos.opensource.microsoft.com/
3. Join the MicrosoftDocs org at https://repos.opensource.microsoft.com/MicrosoftDocs
4. Join the Everyone team here: https://repos.opensource.microsoft.com/microsoftdocs/teams/everyone

For more information, see [Open Source at Microsoft docs](https://docs.opensource.microsoft.com/github/).

### Contributing
Unless you are a member of Dynamics 365 SMB Content Experience, you do not have write access to the master repo MicrosoftDocs/dynamics365smb-devitpro. Any changes that you make must go through UA first. This means that to make changes, you must commit the changes, and then create a pull request to include the changes. A writer (UA) will then review the pull request and pull the content into the master repo.

To work with the repo, you can fork the repo and then work in the fork.

When you are done in the fork you commit your changes and make a pull request to the master repo. UA will then pick up the changes as needed. This method is good for making changes to existing articles or creating new articles when you cannot get your changes done right away and you want to save them as a work in progress.

Work locally by downloading the GitHub Desktop application from here: [https://desktop.github.com/](https://desktop.github.com/).

This lets you clone the repo on your machine. You can then make changes, sync with the master repo on GitHub, and create a Pull Request. This is useful for working on new content that stretches over a few sessions. This is how UA works.

The general flow is as follows:

1. Make changes to an existing file or add a new one.
2. Commit proposed changes.
3. Create Pull Request to have the changes included in the master repo.

### Working in a fork

1. Fork the repo using a browser window or Git Shell. Here is the address of the repo: https://github.com/MicrosoftDocs/dynamics365smb-devitpro
2. Clone your fork so you have a local copy, and then edit the Markdown files using your favorite Markdown editor, such as Atom.io or Visual Studio Code.
3. Commit and push your changes using GitHub Desktop or Git Shell. Here is the command for Git Shell:
   ```
   git add -u
   git commit -m "update doc"
   git push
   ```

4. Wait for a moment and your changes will be automatically published to staging.
> If you don't have the permission to push to this repo, fork it to your own account and use pull request to submit your changes back.

## Validation and Preview

You can build and preview your content in local to discover and fix problems early, before pushing your changes to the GitHub repo:

1. To validate your changes, just run `..openpublishing.build.ps1` under the root of the repo.
2. To preview your changes:
   * Run `..openpublishing.build.ps1 -parameters:targets=serve` under the root of the repo.
   * Open `http://localhost:8080` in your browser.


## Authoring in Markdown
The content is styled using a Markdown syntax as described below. You don't have to worry too much about the Markdown syntax, because it will go through UA.

### General info:
[Getting started with writing and formatting on GitHub](https://help.github.com/articles/getting-started-with-writing-and-formatting-on-github/)

### Authoring tools:
If you want to work locally, you can edit using any text editor. Just save the file as a .md type. Here are a couple good tools that provide you with some nice features, such as Preview.  
- [Visual Studio Code](https://code.visualstudio.com/)
- [Atom](https://atom.io/) (this has spell check and is good for managing many files)

### Properties and tags
All topics must start with a YAML header with the following set of attributes.

```
---
title: 'Short title with a couple of buzzwords for the feature. Not the same as your heading for the topic. | Microsoft Docs'
description: 'A longer description that identifies the topic in search results.'
author: MyGitHubAccount
ms.author: MyDomainAccount
ms-service: dynamics365-financials
ms.topic: article
ms.search.keywords:keyword1, keyword2
ms.date: MM/DD/YYYY

---
```

The author attribute is used for the GitHub association, while the ms.author attribute is used in OPS and SkyEye. Remember to specify your own accounts...

The ms.date tag must be updated to the date when you make the change. The ms.date property must follow the US date format of MM/DD/YYYY.

Some articles will have a different value for the ms.topic tag. For more information, see https://opsdocs.azurewebsites.net/en-us/opsdocs/partnerdocs/metadata?branch=master.

### Headings
Use ```#``` for headings.

Examples:
```#``` Heading 1, looks like:
# Heading 1

```##``` Heading 2, looks like:
## Heading 2

```###``` Heading 3, looks like:
### Heading 3


### Bulleted lists
Use - to create bullets, for example:

The following options are available:
```
- first option
- second option
- third option
```

### Ordered lists
Use numbers for ordered lists. No space between the lines, we'll let the template take care of that.

```
1. Choose the ![Search for Page or Report](media/ui-search/search_small.png "Search for Page or Report icon") icon, enter **Payment Journal**, and then choose the related link.
2. In the **Payment Journal** window, on the first journal line, enter the relevant information about the payment entry.
3. To apply a single vendor ledger entry:
4. In the **Applies-to Doc. No.** field, choose the field to open the **Apply Vendor Entries** window.
```

### Bold and italics syntax
Use ```**bold**``` and ```*italics*```

### Tables
- For tables in the body, use the markdown syntax.

```
| To   | See                       |
|------|---------------------------|
|<text>|<link>|
| | |
| | |
```

- For nested tables in ordered and unordered lists use HTML-syntax. Markdown does not support tables very well. If you use the markdown syntax the list will be broken, the table will align left and list will be renumbered.

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
    - conManagePayables.md

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

### Line breaks (soft return)
In the editor, add two blank spaces at the end of the sentence and hit return. This is used in the See Also list. (See Also must be heading 2.)

### Continue steps after a non-step para
Enter four spaces in front of the non-step para. Otherwise, the non-step para will restart the step sequence.

### TOC
The TOC structure of the TOC file is as follows:

```
#[Overview](overview.md)
 ##[Topic 1](topic-1.md)
 ##[Topic 2](topic-2.md)
 ##[Topic 3](topic-3.md)
 ##[Topic 4](topic-4.md)
```

### Standard Phrases
All fields in [!INCLUDE[d365fin](includes/d365fin_md.md)] have tooltips. Therefore, do not document fields in Help. To refer readers to the tooltips, use this standard phrase where relevant:    
"Choose a field to read a short description of the field or link to more information."

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
|Changing Role Center|ui-change-role-center.md|
|Sales|sales-manage-sales.md|
|Set Up Currencies|finance-setup-currencies.md|
|Set Up Purchasers|purchases-how-setup-purchasers.md|
|Understanding Session Timeouts|admin-understand-session-timeouts.md|
|Manage Data Encryption|admin-manage-data-encryption.md|
