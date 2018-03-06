---
title: "CaptionClass Functionality"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: f02c5f29-0efd-4e6d-8d9e-02f8e31b5c9c
caps.latest.revision: 9
manager: edupont
---
# CaptionClass Functionality
This section describes the CaptionClass functionality and explains how the CaptionClassTranslate function trigger with ID 15 in Codeunit 1 handles this functionality. The topics in this section describe the syntax and the function code of the CaptionClass.  
  
 When you set the [CaptionClass Property](CaptionClass-Property.md) on a field or control, users can configure the caption of a text box that is connected to a label or the caption of a check box without having to modify code. If you set the CaptionClass property on other controls, such as Buttons or Menu Items, the caption will not be displayed.  
  
 [!INCLUDE[navnow](includes/navnow_md.md)] passes the value of the CaptionClass property to the CaptionClassTranslate function trigger, which has ID 15 on Codeunit 1. This function translates the CaptionClass to a caption that users can see. The following illustration shows this sequence.  
  
 ![Sequence to get value of CaptionClass property](media/CSIDE_CaptionClass.png "CSIDE\_CaptionClass")  
  
 Codeunit 1, function trigger ID 15 is called by using a language and a CaptionClass. The trigger converts the CaptionClass into the specific caption for that language and returns it as a string. Language is specified as an integer. CaptionClass is a text.  
  
## See Also  
 [CaptionClass Syntax](CaptionClass-Syntax.md)