---
title: "PRODUCTNAME Methods"
ms.custom: na
ms.date: 09/20/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamics365-financials
---

[!INCLUDE[newdev_dev_preview](../includes/newdev_dev_preview.md)]

# PRODUCTNAME Methods
An application can have a full name, marketing name, and short name. The PRODUCTNAME methods in AL enable you to retrieve these name variations.

```
String := PRODUCTNAME.FULL
```
*FULL* returns a text string that contains the application's full name, such as "[!INCLUDE[d365fin_long_md](../includes/d365fin_md.md)]".

```
String := PRODUCTNAME.MARKETING
```
*MARKETING* returns a text string that contains the application's marketing name, such as "[!INCLUDE[d365fin_long_md](../includes/d365fin_md.md)]".

```
String := PRODUCTNAME.SHORT
```
*SHORT* returns a text string that contains the application's short name, such as "[!INCLUDE[d365fin_md](../includes/d365fin_md.md)]".

## Return Value
*String*

Type: Code or text

The product name.

## Remarks
These methods are useful when you have to include the application name in UI text. Instead of using static text for the name, you use one of the PRODUCTNAME methods. This lets you reuse the same text string across different applications, and makes it easier if the application is ever renamed.
