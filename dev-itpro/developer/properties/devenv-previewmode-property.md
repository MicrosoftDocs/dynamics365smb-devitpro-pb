---
title: "PreviewMode Property"
ms.author: solsen
ms.custom: na
ms.date: 11/12/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# PreviewMode Property
> **Version**: _Available from runtime version 1.0._

Specifies how the report opens when you preview it.

## Applies to
-   Report

## Property Value

|Value|Description|
|-----------|---------------------------------------|
|**Normal**|Specifies that the report opens in the default view mode where you can navigate between entries and so on.|
|**PrintLayout**|Specifies that the report opens in the print layout mode that shows how the report will print on paper.|
[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Syntax

```AL
PreviewMode = Normal;
```

## Remarks  

In the **Report – Properties** window, in the **PreviewMode** field, specify how the report must open in preview mode. The default mode can be different to how the report prints on paper. If you want to make sure that users see the report as it will look on paper, choose **PrintLayout**.  

Regardless of your choice, users can change the display mode in the **Print Preview** window. For example, if you choose the default mode, users can choose the **Print Layout** button. However, if the AL code for the report uses the PREVIEW function to disable printing from the preview, then users cannot change the display mode to print layout.  

## See Also  

[Preview Method (Report)](../methods-auto/report/reportinstance-preview-method.md)
