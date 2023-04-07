---
title: "Developing Multilanguage-Enabled Applications"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 1d887bde-09e2-4e7e-a553-85d8630a78f9
caps.latest.revision: 21
---
# Developing Multilanguage-Enabled Applications
[!INCLUDE[navnow](includes/navnow_md.md)] is enabled for multilanguage development by default. If you make sure that the names of objects are in English and all objects have values in the CaptionML property, your solution can be translated to other languages if you deploy your solution to other markets. Even if you do not have customers outside your own country/region, it is easier for you to upgrade to a new version of [!INCLUDE[navnow](includes/navnow_md.md)] if your code follows the same multilanguage-enabled structure as the standard version of [!INCLUDE[navnow](includes/navnow_md.md)].  

 When you compile application objects that include multilanguage captions, [!INCLUDE[navnow](includes/navnow_md.md)] converts each CaptionML value into Unicode based on the specified language. For example, a text constant has the following CaptionML values: `DAN=Danish text;ENU=English text`. The Danish caption is converted based on code page 865, and the English \(United States\) caption is converted based on code page 437. If you have text that is not stored as a multilanguage caption, the text will be converted using the code page for the language that is specified for non-Unicode programs in the regional settings on the computer. Similarly, because [!INCLUDE[navnow](includes/navnow_md.md)] assumes that object names are English \(United States\), if you specify names in other languages, they may not display correctly after you compile the object.  

 When you are developing in a multilanguage-enabled environment, we recommend that you:  

-   [Set the language in the development environment to English \(United States\)](#App)  

-   [Specify the Name property in English \(United States\)](#Name)  

-   [Use text constants in your code instead of using hardcoded text strings](#Text)  

-   [Verify that everything that is displayed to the user has a Caption property](#Caption)  

-   [Use the DateFormula data type instead of Text or Code for date formulas](#Date)  

##  <a name="App"></a> Setting the Language to English \(United States\)  
 Before you start working in a multilanguage-enabled database, you should set the language to English \(United States\). In the [!INCLUDE[nav_dev_long](includes/nav_dev_long_md.md)], on the **Tools** menu, choose **Language**, choose **English \(United States\)**, and then choose **OK**.  

##  <a name="Name"></a> Name Property  
 In [!INCLUDE[navnow](includes/navnow_md.md)], the code base is in English \(United States\). This means that the [Name Property](Name-Property.md) of objects must always be in English \(United States\).  

 The code base in English \(United States\) includes the following:  

-   Object names  

-   Field names  

-   Function and variable names  

-   Comments  

-   Option strings  

-   Control names  

##  <a name="Text"></a> Text Constants  
 In a multilanguage application, you must use text constants to define strings that you use in your code. A text constant can have multiple values for different languages.  

 The most common use of text constants is to define the strings that are used as parameters in the following functions:  

-   [ERROR Function \(Dialog\)](ERROR-Function--Dialog-.md)  

-   [MESSAGE Function \(Dialog\)](MESSAGE-Function--Dialog-.md)  

-   [CONFIRM Function \(Dialog\)](CONFIRM-Function--Dialog-.md)  

-   [STRMENU Function \(Dialog\)](STRMENU-Function--Dialog-.md)  

 You define text constants in the **C/AL Globals** or **C/AL Locals** window. When you enter a string in the **ConstValue** field, this value is automatically entered as the **ConstValueML** value for the currently selected language. You can enter a string for other languages by choosing the **AssistEdit** button in the **ConstValue** field. This opens the Multilanguage Editor. For more information, see [How to: Enter Text in the Multilanguage Editor](How-to--Enter-Text-in-the-Multilanguage-Editor.md).  

 Text constants are automatically assigned unique IDs according to the number ranges listed in [Number Ranges for Text Constants](Number-Ranges-for-Text-Constants.md). To see the ID for a text constant, open the **C/AL Globals** or **C/AL Locals** window where the text constant is defined, and select the text constant. On the **View** menu, choose **Properties**.  

 When you are working in the C/AL Editor, if you place the cursor on a text constant, then the value of the text constant in the current language is shown in the message line in the language that you have selected as the language.  

##  <a name="Caption"></a> Caption and CaptionML Properties  
 Everything that is displayed to the user must have a [Caption Property](Caption-Property.md). The **Name** property must always be English \(United States\), but you use the **Caption** property to show the name in the language of the [!INCLUDE[nav_dev_short](includes/nav_dev_short_md.md)]. The **Caption** property copies the value for the language that you have specified for the [!INCLUDE[nav_dev_short](includes/nav_dev_short_md.md)] from the [CaptionML Property](CaptionML-Property.md).  

 The **CaptionML** property allows you to add captions in multiple languages. An example is table 37, field 1, which has the following **CaptionML** values:  

 `ENU=Document Type;` `ESM=Tipo documento;FRC=Type de document;ENC=Document Type`  

 These correspond to values for English \(United States\), Spanish \(Mexico\), French \(Canada\), and English \(Canada\).  

 If the language in the [!INCLUDE[nav_dev_short](includes/nav_dev_short_md.md)] is English \(United States\), then the value of the **Caption** property is `Document Type`. If the language is Spanish \(Mexico\), then the value of the **Caption** field is `Tipo documento`.  

 To add captions in different languages, you can either enter values directly in the **Value** field of the **CaptionML** property, or you can choose the **AssistEdit** button to open the Multilanguage Editor. For more information, see [How to: Enter Text in the Multilanguage Editor](How-to--Enter-Text-in-the-Multilanguage-Editor.md).  

> [!NOTE]  
>  You must choose the **OK** button to save the information when you exit the **Multilanguage Editor** window.  

> [!NOTE]  
>  If you create a new field on a page and you enter a **CaptionML** value, which is copied to the **Caption** property, then the value of the **Caption** property is not shown on the page in Page Designer until you compile, close, and reopen the page. If you enter the caption directly in the **Value** field of the **Caption** property, then you do not have to compile, close, and reopen the page to see the **Caption** property. If you modify the **CaptionML** property on an existing field in a page, then the new value of the **Caption** property is shown on the page even in Page Designer.  

### Option Buttons  
 The value in the **OptionValue** field is always in English because this value is used by the corresponding global variable and code must always be in English \(United States\). You must make sure that the value for English \(United States\) in the **CaptionML** field is the same as in the **OptionValue** field.  

### Option Strings  
 For option strings, such as a control in a request page, the **Name** property must remain the number of the control, such as Control 9.  

### Option Variables  
 For option variables, such as in a source expression for a `FORMAT`, `STRSUBSTNO`, `ERROR`, `MESSAGE`, or `CONFIRM` statement, create a text constant that contains the options, and then use a `SELECTSTR` statement to select an option from the text constant.  

 For example, you have the following text constants and variables.  

|Text constant name|Value|  
|------------------------|-----------|  
|Text000|Test %1.|  

|Variable name|Data type|Length|  
|-------------------|---------------|------------|  
|NewStr|Text|30|  
|OptionVar|Option||  

 OptionVar has an OptionString value of **Option1,Option2**. In an application that is not multilanguage-enabled, you can have the following code.  

```  
NewStr := STRSUBSTNO(Text000, OptionVar);  
```  

 In a multilanguage-enabled application, the OptionVar values are not translated. Instead of using the Option variable, create the following text constants and variables.  

|Text constant name|English \(US\) value|Croatian \(Croatia\) value|  
|------------------------|--------------------------|--------------------------------|  
|Text000|Test %1.|Test %1.|  
|Text001|Option1,Option2|Opcija1, Opcija2|  

|Variable name|Data type|Length|  
|-------------------|---------------|------------|  
|NewStr|Text|30|  
|SelStr|Text|30|  

 To select an option, you use the SELECTSTR function.  

```  
SelStr := SELECTSTR(1,Text001);  
```  

 When you call the STRSUBSTNO function and use the SelStr variable instead of the OptionVar variable, the result string is in the language of the application.  

```  
NewStr := STRSUBSTNO(Text000, SelStr);  
```  

##  <a name="Date"></a> Date Formulas  
 In a multilanguage application, if a table contains a date formula field, then you should verify that the field is of the [DateFormula Data Type](DateFormula-Data-Type.md) and not the [Text Data Type](Text-Data-Type.md) or [Code Data Type](Code-Data-Type.md). A date formula that is stored as a DateFormula data type is converted to a non-language-dependent format.  

 Similarly, in a multilanguage application, if you use the [CALCDATE Function \(Date\)](CALCDATE-Function--Date-.md) and if you use a variable for the *DateExpression* parameter, then you should verify that the variable is of the DateFormula data type so that it is stored in a non-language-dependent format. If you specify a string for the *DateExpression* parameter, then you should use angle brackets \(\< >\) around the date formula so that date formula is stored in a non-language dependent format. In this way, the calculation will be the same regardless of which application language the user has selected.  

 For example, if a user who has the application language set to English \(United States\) enters a date formula '1W+1D' into a field that is of the DateFormula data type, then to a different user who has the application language set to French \(France\), that field is displayed as '1S+1J'.  

## See Also  
 [Multilanguage Development](Multilanguage-Development.md)   
 [How to: View Names and Captions](How-to--View-Names-and-Captions.md)   
 [Multiple Document Languages](Multiple-Document-Languages.md)
