---
title: "OptionCaptionML Property"
ms.custom: na
ms.date: 06/15/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.assetid: daacd18c-f0d0-4e21-9537-904960280778
caps.latest.revision: 14
author: SusanneWindfeldPedersen
---

 

# OptionCaptionML Property
Sets the strings that are displayed to the user for selecting an option. OptionCaptionML is only used if the field or variable has an [OptionString Property](devenv-optionstring-property.md). The OptionString property contains the set of values that are acceptable choices, and it is one of these values that is saved in the database or used in AL code.  

> [!NOTE] 
> The support for using the ML properties, such as **CaptionML** and **TooltipML**, is being deprecated, so it is recommended to refactor your extension to use the corresponding **Caption** or **Tooltip** property, which is being picked up in the .xliff file. For more information, see [Working with Translation Files](../devenv-work-with-translation-files.md).
  
## Applies To  
  
-   Page Fields  
  
-   Variables  
  
## Remarks  
 OptionCaptionML is multilanguage enabled so it can contain a list of text in different languages. The text that is displayed is selected according to the current language settings of the user. For more information, see [Multilanguage Development](../devenv-multilanguage-development.md).  
  
 The OptionCaptionML property has the following format.  
  
```  
<Language ID>=<optioncaption [,optioncaption]*>  
```  
  
 \<Language ID> is a Windows standard three-letter language ID and `<optioncaption [,optioncaption]*>` is the OptionCaption text(s) for this language. Semicolons are used to separate entries.  
  
 Although you can use OptionCaptionML to limit the number of options displayed to the user, it is recommended that you use [OptionString Property](devenv-optionstring-property.md) to do this. You cannot expand the set of options. If you do, a run-time error will occur when the user selects an option that is outside the option set defined for the field or variable.  
  
 The following is an example of an OptionCaptionML value.  
  
```  
DAN=Resultatopgørelse,Balance;DEU=GuV,Bilanz;ESP=Comercial,Balance  
```  
  
 In this example, values are set up for Danish (DAN), German Standard (DEU), and Spanish Traditional Sort (ESP).  
  
## Examples of Using OptionCaptionML  
The following examples demonstrate the relationship between the [OptionString Property](devenv-optionstring-property.md) and the OptionCaptionML property on fields (or variables) and controls.  
  
1.  An Option field in a table has the following [OptionString Property](devenv-optionstring-property.md) value: opt1,opt2,op3. The value of OptionCaptionML is not set. A page based on this table contains a text box that is based on the Option field. OptionString and OptionCaptionML are not set for the text box.  
  
     **Result** Users see opt1, opt2, and opt3 as the available choices.  
  
2.  An OptionCaptionML property is added to the database field containing DAN=valg1,valg2,valg3;ENG=choice1,choice2,choice3.  
  
     **Result** If a user selects DAN as the language, valg1, valg2, valg3 will be the available choices on the page. If a user selects ENG, choice1, choice2, choice3 will be available. For more information about what happens when the selected language is not available, see [Multilanguage Development](../devenv-multilanguage-development.md).  
  
3.  An OptionCaptionML property is added to the text box containing DAN=valg nummer 1,valg nummer 2,valg nummer 3.  
  
     **Result** If a user sets DAN as the language, the choices are valg nummer 1, valg nummer 2, valg nummer 3. If a user sets the language to ENG, the same set of choices are available.  
  
4.  The OptionCaptionML is removed from the field. The [OptionString Property](devenv-optionstring-property.md) is set on the field; the OptionCaptionML property on the text box is set to DAN. The text strings specified in the OptionCaptionML property are used for all languages.  
  
     **Result** Same result as for example 3. As long as any OptionCaptionML property is set on the text box or the field, the [OptionString Property](devenv-optionstring-property.md) is not used to display choices to the user.  
  
## See Also  
 [Multilanguage Development](../devenv-multilanguage-development.md)