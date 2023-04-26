---
title: "CaptionClass Syntax"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 9396c266-ed85-4cc9-ab5a-d968b01bfbdd
caps.latest.revision: 14
---
# CaptionClass Syntax
This topic describes the syntax of the CaptionClass functionality.  
  
## Syntax  
 If the **CaptionClass** property of a field or a control is defined, the function trigger `CaptionClassTranslate` with ID 15 in Codeunit 1 \(ApplicationManagement\) is called every time that the field or control is shown. This function replaces the caption, as defined in the design of the field or control, with another string. The following code example shows the syntax for this procedure.  
  
 `CaptionClassTranslate (<LANGUAGE>;<CAPTIONEXPR>)`  
  
 `LANGUAGE`  
  
 `<DataType> := [Integer]`  
  
 `<DataValue> := ……`  
  
 `CAPTIONEXPR`  
  
 `<DataType> := [String]`  
  
 `<Length> <= 80`  
  
 `<DataValue> := <CAPTIONAREA>,<CAPTIONREF>`  
  
 Two parameters `LANGUAGE` and `CAPTIONEXPR` are passed to this function.  
  
### LANGUAGE  
 The `LANGUAGE` parameter is automatically mentioned as is the Windows Language ID of the active language in [!INCLUDE[navnow](includes/navnow_md.md)].  
  
 For example, if the active language in [!INCLUDE[navnow](includes/navnow_md.md)] is English \(United States\), `LANGUAGE` will hold the value `1033`.  
  
### CAPTIONEXPR  
 The `CAPTIONEXPR` parameter contains the value of the **CaptionClass** property of the field or control. An example is in table 13 Salesperson/Purchaser, the **Global Dimension 1 Code** field \(Field No. 5050\) has the string `'1,1,1'` as its **CaptionClass**. You can use the debugger to view the value of the `CAPTIONEXPR` parameter. Set a breakpoint on the `CaptionClassTranslate` function in codeunit 1, activate the debugger, and then run page 14, Salespeople/Purchasers. The debugger breaks in the CaptionClassTranslate function. In the debugger, choose **Variables**. In the **Debugger Variable List**, you can see that the `CAPTIONEXPR` parameter holds the string `'1,1,1'`. For more information about the debugger, see [Debugging](Debugging.md).  
  
> [!NOTE]  
>  In the **About This Page** window, you will not find the Global Dimension 1 Code field. Instead you find the Department Code field, which represents the **CaptionClass** property and the `CaptionClassTranslate` function trigger.  
  
## Function Code  
 The function trigger `CaptionClassTranslate` with ID 15 resembles a system trigger. A programmer can intervene here every time that the **CaptionClass** property \(if it is defined\) is evaluated.  
  
 The following example shows the trigger in the [!INCLUDE[demoname](includes/demoname_md.md)] database.  
  
 `CaptionClassTranslate(Language : Integer;CaptionExpr : Text[80] : Text[1024])`  
  
 `CommaPosition := STRPOS(CaptionExpr,',');`  
  
 `IF (CommaPosition > 0) AND (CommaPosition < 80) THEN BEGIN`  
  
 `CaptionArea := COPYSTR(CaptionExpr,1,CommaPosition - 1);`  
  
 `CaptionRef := COPYSTR(CaptionExpr,CommaPosition + 1);`  
  
 `CASE CaptionArea OF`  
  
 `'1' : EXIT(DimCaptionClassTranslate(Language, CaptionRef));`  
  
 `'2' : EXIT(VATCaptionClassTranslate(Language, CaptionRef));`  
  
 `'3' : EXIT(CaptionRef);`  
  
 `END;`  
  
 `END;`  
  
 `EXIT(CaptionExpr);`  
  
 This standard code analyzes and unravels the `CAPTIONEXPR` parameter. This parameter has the following syntax.  
  
 `CAPTIONEXPR := <CAPTIONAREA>,<CAPTIONREF>`  
  
 Depending on the value of the `CAPTIONAREA`, different procedures are called.  
  
### CAPTIONAREA  
 The first part of the `CAPTIONEXPR` parameter, to the first comma, is the `CAPTIONAREA`, and has the following syntax.  
  
 `CAPTIONAREA`  
  
 `<DataType> := [SubString]`  
  
 `<Length> <= 10`  
  
 `<DataValue> := 1..9999999999`  
  
 `// 1 for Dimension Area`  
  
 `// 2 for VAT`  
  
 `// 3 to return only the CaptionExpr string`  
  
### CAPTIONREF  
 The second part of the `CAPTIONEXPR` parameter, after the first comma, is the `CAPTIONREF`, and has the following syntax.  
  
 `CAPTIONREF`  
  
 `<DataType> := [SubString]`  
  
 `<Length> <= 10`  
  
 `<DataValue> :=`  
  
 `IF (<CAPTIONAREA> = 1)`  
  
 `<DIMCAPTIONTYPE>,<DIMCAPTIONREF>`  
  
 `IF (<CAPTIONAREA> = 2)`  
  
 `<VATCAPTIONTYPE>,<VATCAPTIONREF>`  
  
 Depending on the value of the `CAPTIONAREA`, `CAPTIONREF` can consist of one \(`VATCAPTIONTYPE`\) or two references \(`VATCAPTIONTYPE,VATCAPTIONREF` or `DIMCAPTIONTYPE,DIMCAPTIONREF`.  
  
> [!NOTE]  
>  This is how the standard functionality in [!INCLUDE[navnow](includes/navnow_md.md)] deals with the **CaptionClass** property. Every field or control with a defined **CaptionClass** has a string in this property that uses the syntax described earlier. For new functionality, a programmer could define other syntax and add code to the function trigger `CaptionClassTranslate` with ID 15 to handle this syntax.  
  
### Syntax for CAPTIONREF  
 As described earlier, the `CAPTIONREF` part of the `CAPTIONEXPR` parameter can have the following syntax. If `CAPTIONAREA` equals 1:  
  
 `CAPTIONREF := < DIMCAPTIONTYPE >,< DIMCAPTIONREF >`  
  
 Or if `CAPTIONAREA` equals 2:  
  
 `CAPTIONREF := < VATCAPTIONTYPE >,< VATCAPTIONREF >`  
  
## Dimension Area  
 If the `CAPTIONAREA` equals 1, the caption of the field or control should be retrieved from the dimensions information.  
  
### DIMCAPTIONTYPE  
 This reference determines where the main part of the new caption should be retrieved from, as shown in the following syntax.  
  
 `DIMCAPTIONTYPE`  
  
 `<DataType> := [SubString]`  
  
 `<Length> <= 10`  
  
 `<DataValue> := 1..6`  
  
 `// 1 to retrieve Code Caption of Global Dimension`  
  
 `// 2 to retrieve Code Caption of Shortcut Dimension`  
  
 `// 3 to retrieve Filter Caption of Global Dimension`  
  
 `// 4 to retrieve Filter Caption of Shortcut Dimension`  
  
 `// 5 to retrieve Code Caption of any kind of Dimensions`  
  
 `// 6 to retrieve Filter Caption of any kind of Dimensions`  
  
### DIMCAPTIONREF  
 `DIMCAPTIONREF` consists of several sub references:  
  
 `DIMCAPTIONREF:= < number >,< DIMOPTIONALPARAM1>,`  
  
 `< DIMOPTIONALPARAM2 >`  
  
 The following syntax describes what `< number >` can be and what `<DIMOPTIONALPARAM1>` and `<DIMOPTIONALPARAM2>` are:  
  
 `DIMCAPTIONREF`  
  
 `<DataType> := [SubString]`  
  
 `<Length> <= 10`  
  
 `<DataValue> :=`  
  
 `IF (<DIMCAPTIONTYPE> = 1)`  
  
 `1..2,<DIMOPTIONALPARAM1>,<DIMOPTIONALPARAM2>`  
  
 `IF (<DIMCAPTIONTYPE> = 2)`  
  
 `1..8,<DIMOPTIONALPARAM1>,<DIMOPTIONALPARAM2>`  
  
 `IF (<DIMCAPTIONTYPE> = 3)`  
  
 `1..2,<DIMOPTIONALPARAM1>,<DIMOPTIONALPARAM2>`  
  
 `IF (<DIMCAPTIONTYPE> = 4)`  
  
 `1..8,<DIMOPTIONALPARAM1>,<DIMOPTIONALPARAM2>`  
  
 `IF (<DIMCAPTIONTYPE> = 5)`  
  
 `[Table]Dimension.[Field]Code, <DIMOPTIONALPARAM1>,`  
  
 `<DIMOPTIONALPARAM2>`  
  
 `IF (<DIMCAPTIONTYPE> = 6)`  
  
 `[Table]Dimension.[Field]Code, <DIMOPTIONALPARAM1>,`  
  
 `<DIMOPTIONALPARAM2>`  
  
### DIMOPTIONALPARAM1  
 `DIMOPTIONALPARAM1`  
  
 `<DataType> := [SubString]`  
  
 `<Length> <= 30`  
  
 `<DataValue> := [String]`  
  
 `// A string added before the dimension name.`  
  
### DIMOPTIONALPARAM2  
 `DIMOPTIONALPARAM2`  
  
 `<DataType> := [SubString]`  
  
 `<Length> <= 30`  
  
 `<DataValue> := [String]`  
  
 `// A string added after the dimension name.`  
  
## VAT  
 If the `CAPTIONAREA` equals 2, the caption of the field or control should be replaced by its original caption plus an extra string. This string should state either 'Excl. VAT' or 'Incl. VAT'. The syntax is described in the following section.  
  
## VATCAPTIONTYPE  
 `VATCAPTIONTYPE`  
  
 `<DataType> := [SubString]`  
  
 `<Length> := 1`  
  
 `<DataValue> := '0' -> <field caption + 'Excl. VAT'>`  
  
 `'1' -> <field caption + 'Incl. VAT'>`  
  
## VATCAPTIONREF  
 VATCAPTIONREF contains the caption of the field or control.  
  
 `VATCAPTIONREF`  
  
 `<DataType> := [SubString]`  
  
 `<Length> <= 30`  
  
 `<DataValue> := field caption`  
  
## See Also  
 [CaptionClass Functionality](CaptionClass-Functionality.md)   
 [CaptionClass Property](CaptionClass-Property.md)
