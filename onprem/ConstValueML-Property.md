---
title: "ConstValueML Property"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: c20c0f86-3eb9-4b29-ac43-c569614162c8
caps.latest.revision: 6
---
# ConstValueML Property
Sets the values of a C/AL text constant for the different languages that are available in [!INCLUDE[navnow](includes/navnow_md.md)].  
  
## Applies To  
 **Local** and **global** text constants in the C/AL code of objects.  
  
## Remarks  
 The **ConstValue** property is enabled for multiple languages. It contains a list of text values for the languages that are available in [!INCLUDE[navnow](includes/navnow_md.md)]. The value that is used in the [!INCLUDE[rtc](includes/rtc_md.md)] is selected according to the user's language settings. For more information, see [Multilanguage Development](Multilanguage-Development.md).  
  
 The **ConstValueML** property has the following format.  
  
 **\<Language ID>=\<string>**  
  
-   **\<Language ID>** is the Windows three-letter language ID.  
  
-   **\<string>** is the text string for the language.  
  
 If you have more than one language entry, then separate each consecutive entry with a semicolon.  
  
 The following example illustrates a **ConstValueML** property value.  
  
 **DAN=Navn;ENU=Name;ESP=Nombre;FRA=Nom**  
  
 In this example, values are set for Danish \(DAN\), English \(United States\), Spanish Traditional Sort \(ESP\), and French Standard \(FRA\).  
  
### To specify values for languages  
  
1.  In the **ConstValueML** value field, choose the **AssistEdit** button.  
  
     The **Multilanguage Editor** opens and displays two columns: **Language** and **Value**. The **Language** column is populated with all languages that are defined by Windows.  
  
2.  To specify the value for a language, enter the value in the **Value** column for that language.  
  
3.  To save the changes, choose the **OK** button.  
  
## See Also  
 [How to: Change the Language in the User Interface](How-to--Change-the-Language-in-the-User-Interface.md)   
 [Multilanguage Development](Multilanguage-Development.md)