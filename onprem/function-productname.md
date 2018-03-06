---
title: "PRODUCTNAME Functions"
ms.custom: na
ms.date: 09/20/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
---
# PRODUCTNAME Functions
An application can have a full name, marketing name, and short name. The PRODUCTNAME functions in C/AL enable you to retrieve these name variations.

```
String := PRODUCTNAME.FULL
```
*FULL* returns a text string that contains the application's full name, such as "Microsoft Dynamics NAV".

```
String := PRODUCTNAME.MARKETING
```
*MARKETING* returns a text string that contains the application's marketing name, such as "Microsoft Dynamics NAV 2017".

```
String := PRODUCTNAME.SHORT
```
*SHORT* returns a text string that contains the application's short name, such as "Dynamics NAV".

## Return Value
*String*

Type: Code or text

The product name.

## Remarks
These functions are useful when you have to include the application name in UI text. Instead of using static text for the name, you use one of the PRODUCTNAME functions. This lets you reuse the same text string across different applications, and makes it easier if the application is ever renamed.
