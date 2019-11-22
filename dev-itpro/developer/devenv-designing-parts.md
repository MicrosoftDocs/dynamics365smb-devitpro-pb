---
title: Page Parts Overview
description: "Provides and overview of the parts concept."
author: mikebcMSFT
ms.custom: na
ms.date: 22/11/2019
ms.reviewer: jswymer
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.author: mikebc
---
# Page Parts Overview

Pages can be composed of other pages, known as parts. A part is a special page that is designed to be embedded within another page. This is useful when designing richer user experiences and is also a great way to reuse code across multiple pages. 

Parts can either represent self-contained functionality, or can be contextual and exchange context from the hosting page.

## Hosting Parts on a page

<image1>
<image2>

## Different types of parts
Business Central offers different of parts that serve different purposes.

|PageType|Purpose|Recommended use|
|[ListParts](devenv-designing-listparts.md)|Display a list of records|Role Centers, FactBoxes on Card\Document\worksheet\List, tabular step in Wizard, subpage on Document|
|[CardParts](devenv-designing-cardparts.md)|Flexible canvas that can be used to display almost any page controls|Role Centers, FactBoxes on Card\Document\worksheet\List, step in Wizard|
|[HeadlineParts](devenv-create-role-center-headline.md)|Display business insights|Role Centers only|

## Design considerations

### Part size
The size of a part is automatically determined by the client and will vary depending on where the part has been embedded on the page, other content surrounding the part, and the overall available space of the display target. Developers cannot specify the prefferred, minimum or maximum height and width of a part.

### Good to know
- A part cannot be hosted within another part. Business Central allows a maximum of one level of page nesting.
- Parts cannot be placed within repeater controls.
- Parts can be dynamically enabled.
- Parts are not intended to be displayed on their own without a hosting page.

## ??? Reference to part reference and properties???

## See Also
[AL Development Environment](devenv-reference-overview.md)  
[FactBoxes](devenv-adding-a-factbox-to-page.md)  
[Page Extension Object](devenv-page-ext-object.md)  
[Personalizing Your Workspace](https://docs.microsoft.com/dynamics365/business-central/ui-personalization-user)  
[Using Designer](devenv-inclient-designer.md)  
