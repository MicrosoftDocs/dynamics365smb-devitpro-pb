---
title: "Defining multiple report layouts"
description: "Describes how to define multiple layouts for one report in Business Central using AL."
author: SusanneWindfeldPedersen
ms.custom: na
ms.date: 02/10/2022
ms.reviewer: na
ms.topic: conceptual
ms.service: "dynamics365-business-central"
ms.author: solsen
---

# Defining multiple report layouts

In AL you have the option of defining multiple layouts for one report. This applies to both report objects, and report extension objects. The layouts can be of different types, meaning that you can have, for example, a Word layout and an Excel layout for one report, or multiple Excel layouts for one report.

To enable multiple layouts, you must use the `rendering` section of a report object. Inside the `rendering` section, you define one more more `layout` sections. In each of the `layout` sections, you specify details about the layout file path and name, you provide a caption and a summary which will be displayed to the user in the **Report Layout Selection** <!--check--> page in [!INCLUDE[prod_short](../developer/includes/prod_short.md)]. If you do not specify a caption, the layout name will be displayed to the user. <!-- localizable-->

The `defaultLayout` property does not apply to the multiple layouts functionality. Instead, you must use the `defaultRenderingLayout` property to specify which of the defined layouts is the default.

## Layout definition in AL

```al

```

<!-- not use old and new at same time -->
<!-- new code action-->
<!-- allows packaging as extensions -->

## See also