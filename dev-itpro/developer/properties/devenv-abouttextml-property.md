---
title: "AboutTextML Property"
description: "Sets the body of text that appears in a teaching tip in the UI."
ms.author: solsen
ms.date: 05/14/2024
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# AboutTextML Property
> **Version**: _Available or changed with runtime version 10.0._

Sets the body of text that appears in a teaching tip in the UI.

## Applies to
-   Page Custom Action
-   Page File Upload Action
-   Query
-   Page
-   Page Action
-   Page Action Group
-   Page Field
-   Page Part
-   Page Group
-   Request Page

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Property Value

Accepts a plain text value. Markdown or any similar formatting are treated as literals.

## Example

```al
AboutTextML = ENU = 'Sales invoices appear in this list until they are finalized and posted. After an invoice is posted, find it again in the Posted Sales Invoices list.', DAN = 'Salgsfakturaer vises i denne liste indtil de er posteret. Når en faktura er posteret, kan den findes igen i listen over posterede salgsfakturaer.';
```

## Remarks 

For more information, see the [AboutText Property](devenv-abouttext-property.md). 

[!INCLUDE[aboutTeachingTips](../includes/include-about-teaching-tips.md)]

## See Also  

[Get Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  
[AboutText Property](devenv-abouttext-property.md)  
[AboutTitleMl Property](devenv-abouttitleml-property.md)  
