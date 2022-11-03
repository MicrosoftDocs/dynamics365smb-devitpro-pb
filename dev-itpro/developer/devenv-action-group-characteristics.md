---
title: "Common Action Group Characteristics"
description: "Guidelines for organizing actions in the action bar for Dynamics 365 Business Central"
author: jacobwj
ms.custom: na
ms.date: 11/03/2022
ms.reviewer: 
ms.topic: conceptual
ms.service: "dynamics365-business-central"
ms.author: solsen
---

# Common Action Group Characteristics

[!INCLUDE [prod_short](includes/prod_short.md)]  defines the following common action groups as part of the standard application functionality. The list is not exhaustive, but shows the most common action groups, their typical use, and the recommended use of the split button capability.  


| Common action group | Characteristics | Show as Split Button  |
|---------------------|-----------------|-----------------------|
|Home, or Process | This group has the caption Home in entity-oriented pages (Card, Document, ListPlus) and the caption Process in collection-oriented pages (Worksheet and List). In both cases, the group holds actions that change or update the current entity/entities. This group should have actions that start or end tasks, as the user sees it. | No |
|<Name of an entity> <br>For example Customer and Order | The caption of the “entity” group in page matches that of the business entity represented by the page. For example, on the Customer Card page, the entity group has the caption Customer. Actions in an entity group let the user access information related to the entity on display in the page, and usually has a caption describing the type of information, for example Statistics.  | No | 
| Approve | Has actions to approve, reject, delegate, and view comments. Used in these page types: Document (13), List (3) | No | 
| Entry  | Appears in lists and worksheets that show entries of some sort, often ledger entries, and has actions for finding related entries, and for managing dimensions. Used in these page types: List (15), Worksheet (4) | No | 
| Incoming Document  | Appears in document pages for actions that manage attachments that represent external documents. Used in these page types: Document (12), List (1), Worksheet (2).| No |
| Item Availability by  | Holds the options to view item availability by. Used in these page types: List (3), Worksheet (6) | No | 
| Line | Like the entity group, the Line group has actions that navigate to information related to the current line. The Line group is used instead of an Entity group when the lines in a list or worksheet are not representing an entity. Used in these page types: List (8), Worksheet (38) | No | 
| Navigate  | Has actions to open relevant pages that are not related to the current record or selected line, yet useful to quickly navigate to when at a given place. Used in these page types: Card (8), Document (6), List (14) | No | 
| Page  | Has actions to manage how the page displays columns and rows. Used in these page types: Worksheet (23) | No |
| Posting, or Post/Print  | Has actions that combine posting or previewing with printing or other means of document creation in the process. Used in these page types: Document (17), List (8), Worksheet (23) | Yes |
| Prepare  | Has actions that prepare the current page for further processing. Often, the actions in the prepare group are copying or otherwise pulling in data in preparation for editing, updating, and posting. Used in these page types: Document (20), Worksheet (8) | No |
| Print/Send  | Has actions that prints and/or sends the current page or a related document. The destination of the printing or sending process varies based on the chosen action. Used in these page types: Document (24), List (15) | No |
| Release | For use with documents that have a Release/Reopen action pair. Used in these page types: Document (20), List (15) | Yes  |
| Report or Reports | For placement of relevant reports on a given page. Used in these page types: Card (11), Document (11), List (46) | No |
| Request Approval  | For actions related to sending an approval request and canceling any outstanding approval requests. Used in these page types: Card (3), Document (13), List (3), Worksheet (3).| No |
| Show  | Has actions that manage what information appears on a page with a grid, for example to filter out rows with certain values. Used in these page types: List (2), Worksheet (5). | No |
| Synchronize | For actions that set up data coupling to other systems, and for synchronizing data based on the couplings. Used in these page types: Card (6), Document (2), List (15). | No | 


## See also