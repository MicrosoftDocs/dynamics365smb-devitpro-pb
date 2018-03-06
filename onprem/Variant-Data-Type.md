---
title: Variant Data Type
description: The C/AL variant data types can contain many C/AL data types or any variants from OCX and Automation objects but not all values can be mapped to C/AL values.
ms.custom: na
ms.date: 10/30/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 98348284-4055-40e2-9bc0-808e95289626
caps.latest.revision: 21
---
# Variant Data Type in Dynamics NAV
The C/AL variant data type can contain many C/AL data types or any variants from OCX and Automation objects. However, not all these values can be mapped to C/AL values. For more information, see [Using COM Technologies in Microsoft Dynamics NAV](Using-COM-Technologies-in-Microsoft-Dynamics-NAV.md).  
  
 The variant data type can contain the following C/AL data types:  
  
-   Action  
  
-   Automation  
  
-   BigInteger  
  
-   BigText  
  
-   Boolean  
  
-   Byte  
  
-   Char  
  
-   Code  
  
-   Codeunit  
  
-   Date  
  
-   DateFormula  
  
-   DateTime  
  
-   Decimal  
  
-   Duration  
  
-   FilterPageBuilder  
  
-   GUID  
  
-   InStream  
  
-   Integer  
  
-   Option  
  
-   OutStream  
  
-   Record  
  
-   RecordRef  
  
-   Text  
  
-   Time  
  
-   TransactionType  
  
 You can use the variant data type to pass Automation variants from one external component \(Automation or OCX\) to another. This requires that the recipient component can accept the original variant. You can also assign a C/AL variable to a variant and pass it to an external component. When you pass C/AL variants ByRef to an external COM component, small conversion differences may occur. Therefore, we recommend that you pass C/AL variants ByVal if you do not have to assign a new value to the C/AL variant in your external component.  
  
## Returning Variants in Internal Function Calls  
 The C/AL variant is a complex data type. To return C/AL variants in function calls, you must pass them in a parameter ByVar \(called ByRef in COM\).  
  
## Passing DateTime variables to Automation  
 It is not possible to pass a C/AL DateTime variable to Automation. However, you can convert the C/AL DateTime to a variant, and then pass it to Automation. The following examples shows how to pass a DateTime to Automation. This example requires that you create the following variables.  
  
|Variable|Data type|  
|--------------|---------------|  
|varAutomation|Automation|  
|varVariant|Variant|  
|varDateTime|DateTime|  
  
```  
varDateTime := CURRENTDATETIME;  
varVariant := varDateTime;  
varAutomation.MethodDateData(varVariant);  
```  
  
## Variants and Approximation  
 A C/AL variant contains two allocation areas: one for C/AL variables and one for Automation and OCX variants. This means every time that you assign a C/AL variable to a variant, the variant will contain the same data as the original variable. The conversion process does not change the data in any way. However, this is not the case with DATI2VARIANT because it is a VT\_VARIANT. When you assign an external variable to a variant, the variant will also contain the same data as the original external variable.  
  
## Assigning Automation Variants to FieldRef Values  
 In [!INCLUDE[navnowlong](includes/navnowlong_md.md)], if an Automation method returns a byte string \(bstr\) in a variant, you cannot assign that variant to a field that is a Code data type. Instead, you must first assign the variant to a code variable, and then assign the code variable to the FieldRef value. For example, the following code assigns a variant from an Automation method to a variable, and then assigns the variable to a field.  
  
```  
CodeVariable := AutomationMetodReturningBStrInVariant();  
FieldRef.Value := CodeVariable;  
```  
  
 In earlier versions of [!INCLUDE[navnow](includes/navnow_md.md)], you could assign the variant to a Code FieldRef value.  
  
## See Also  
 [DATI2VARIANT Function](DATI2VARIANT-Function.md)   
 [ISACTION Function \(Variant\)](ISACTION-Function--Variant-.md)   
 [ISAUTOMATION Function \(Variant\)](ISAUTOMATION-Function--Variant-.md)   
 [ISBINARY Function \(Variant\)](ISBINARY-Function--Variant-.md)   
 [ISBOOLEAN Function \(Variant\)](ISBOOLEAN-Function--Variant-.md)   
 [ISCHAR Function \(Variant\)](ISCHAR-Function--Variant-.md)   
 [ISCODE Function \(Variant\)](ISCODE-Function--Variant-.md)   
 [ISCODEUNIT Function \(Variant\)](ISCODEUNIT-Function--Variant-.md)   
 [ISDATE Function \(Variant\)](ISDATE-Function--Variant-.md)   
 [ISDATEFORMULA Function \(Variant\)](ISDATEFORMULA-Function--Variant-.md)   
 [ISDECIMAL Function \(Variant\)](ISDECIMAL-Function--Variant-.md)   
 [ISFILE Function \(Variant\)](ISFILE-Function--Variant-.md)   
 [ISINSTREAM Function \(Variant\)](ISINSTREAM-Function--Variant-.md)   
 [ISINTEGER Function \(Variant\)](ISINTEGER-Function--Variant-.md)   
 [ISOPTION Function \(Variant\)](ISOPTION-Function--Variant-.md)   
 [ISOUTSTREAM Function \(Variant\)](ISOUTSTREAM-Function--Variant-.md)   
 [ISRECORD Function \(Variant\)](ISRECORD-Function--Variant-.md)   
 [ISTEXT Function \(Variant\)](ISTEXT-Function--Variant-.md)   
 [ISTIME Function \(Variant\)](ISTIME-Function--Variant-.md)   
 [ISTRANSACTIONTYPE Function \(Variant\)](ISTRANSACTIONTYPE-Function--Variant-.md)   
 [VARIANT2DATE Function](VARIANT2DATE-Function.md)   
 [VARIANT2TIME Function](VARIANT2TIME-Function.md)