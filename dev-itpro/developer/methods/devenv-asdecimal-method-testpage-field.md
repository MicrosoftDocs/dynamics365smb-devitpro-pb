---
title: "ASDECIMAL Method (TestPage Field)"
ms.custom: na
ms.date: 04/01/2019
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamics365-business-central
ms.assetid: 05375a96-3aa0-41e2-a141-99dcacff37dc
author: SusanneWindfeldPedersen
manager: edupont
redirect_url: /dynamics365/business-central/dev-itpro/developer/methods-auto/library
---

 

# ASDECIMAL Method (TestPage Field)
Converts the value in a field on a test page to a **DECIMAL** data type.  
  
## Syntax  
  
```  
Decimal := TestPage.Field.ASDECIMAL  
```  
  
#### Parameters  
 *TestPage*  
 Type: TestPage  
  
 The test page variable that you use to refer to the test page.  
  
 *Field*  
 Type: Field  
  
 The field that contains the value that you want to convert.  
  
## Property Value/Return Value  
 Type: Decimal  
  
 The converted value.  
  
## See Also  
 [TestPage Field Methods](devenv-TestPage-Field-Methods.md)