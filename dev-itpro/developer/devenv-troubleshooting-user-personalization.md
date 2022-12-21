---
title: Troubleshooting user personalization can't be started
description: Learn how to troubleshoot issues with user personalization.
author: SusanneWindfeldPedersen
ms.author: solsen
ms.reviewer: solsen
ms.service: dynamics365-business-central
ms.topic: troubleshooting
ms.date: 12/21/2022
ms.custom: bap-template
---

<!--H1. Required. If this is a resource-type article, the title should be "<Product/solution/app> troubleshooting and FAQs." If it's a direct reference-type article, pick an H1 that summarizes the problem from the customer's point of view.-->
# Troubleshooting user personalization can't be started

When there are issues preventing the user personalization in [!INCLUDE [prod_short](includes/prod_short.md)], the user will get an error message, and not be able to start user personalization. 

<!--Include the following sections in a direct reference-type article. Remove them if you're writing a resource troubleshooting article.-->
## Symptoms

The user sees the following error message "Sorry, something went wrong and personalization could not be started. Please try again later, or contact your system administrator."

## Resolution

As a tenant administrator, you can do the following to mitigate the issue.

1. In [!INCLUDE[prod_short](includes/prod_short.md)], in the **Tell Me** box, enter **Personalized Pages**, and then choose the related link.
1. On the **Personalized Pages** page, use the filter pane to show records that belong to the impacted user.
1. Select the **Troubleshoot** button.  
  You will now get a list of all records that contain errors. These records must be removed to unblock the user from starting user personalization.
2. 

Remove the records with errors as documented in Clear user personalizations 

<!--Tell the customer how to fix the problem. Or, if the problem is caused by user error or customer misunderstanding, briefly explain the right way or the feature's proper functioning.-->

<!--Remove all the comments in this template before you sign-off or merge to the main branch.-->