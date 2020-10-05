---
title: "ConstValueML Property"
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.assetid: c20c0f86-3eb9-4b29-ac43-c569614162c8
caps.latest.revision: 6
---

 

# ConstValueML Property
Sets the values of a AL text constant for the different languages that are available in [!INCLUDE[d365fin_long_md](../includes/d365fin_long_md.md)].  

> [!NOTE]  
> To submit an app to AppSource, you must use .xliff translation files. For more information, see [Working with Translation Files](../devenv-work-with-translation-files.md).
  
## Applies to  
 **Local** and **global** text constants in the AL code of objects.  
 
## Syntax
```
ConstValueML = DAN=Navn;ENU=Name;ESP=Nombre;FRA=Nom;
```

## Remarks  
 The **ConstValue** property is enabled for multiple languages. It contains a list of text values for the languages that are available in [!INCLUDE[d365fin_long_md](../includes/d365fin_long_md.md)]. The value that is used is selected according to the user's language settings. For more information, see [Multilanguage Development](../devenv-multilanguage-development.md).  
  
 The **ConstValueML** property has the following format.  
  
 **<Language ID>=<string>**  
  
-   **<Language ID>** is the Windows three-letter language ID.  
  
-   **<string>** is the text string for the language.  
  
 If you have more than one language entry, then separate each consecutive entry with a semicolon.  
  
 The following example illustrates a **ConstValueML** property value.  
  
 **DAN=Navn;ENU=Name;ESP=Nombre;FRA=Nom**  
  
 In this example, values are set for Danish (DAN), English (United States), Spanish Traditional Sort (ESP), and French Standard (FRA).  
  
## See Also  
 <!-- [How to: Change the Language in the User Interface](How-to--Change-the-Language-in-the-User-Interface.md)  --> 
 [Multilanguage Development](../devenv-multilanguage-development.md)