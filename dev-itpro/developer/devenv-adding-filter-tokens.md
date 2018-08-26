---
title: "Adding custom filter tokens"
ms.custom: na
ms.date: 26/08/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: mikebcMSFT
---

# Adding filter tokens

When filtering lists using the filter pane, users can enter filter tokens which are special words that resolve to one or more values. This powerful feature makes filtering easier by reducing the need to navigate to other pages to look up values to enter as filter criteria.

There are several useful filter tokens available in [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)]. For example, entering **%mycustomers** in a **Customer No.** field will resolve to the set of customers in the user's **My Customers** list such as 1001|1002, making it easy to find relevant sales orders for customers 1001 and 1002.

You can add custom filter tokens and make these available in any language and across the application. To add your custom filter token, you need to define the token word that users will enter as filter criteria, and define a handler that resolves the token to a concrete value at runtime.

## Defining the token word

In Codeunit object 41 **Text Management**, define a multilanguage text string for your word.
Subscribe to the OnBefore or OnAfter events for the MakeTextFilter function or similar functions that convert filter string into the final filter criteria.

Inspect the string parameter and detect whether your word appears in the filter string.

<!-- detial needed -->

## Defining the handler

If the word appears in the filter string, you must now replace the word with the equivalent value. If the word resolves to multiple values, you must handle the operators that join them together, such as inserting an OR '|' filter symbol.

<!-- detial needed -->

> [!TIP] Filter criteria will often contain symbols along with filter tokens. Modifying the rest of text parameter could result in undesirable filter criteria.

<!--
## Filter token example
This example extends the application with a new token word "%mysalesperson" representing my salesperson code as defined in the user table.
-->


## See Also 
 [Sorting, Searching and Filtering Lists](https://docs.microsoft.com/en-us/dynamics365/business-central/ui-enter-criteria-filters)
