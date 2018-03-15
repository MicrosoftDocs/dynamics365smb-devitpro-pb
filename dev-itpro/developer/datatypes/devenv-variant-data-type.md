---
title: "Variant Data Type"
ms.custom: na
ms.date: 06/08/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.assetid: 98348284-4055-40e2-9bc0-808e95289626
caps.latest.revision: 21
author: SusanneWindfeldPedersen
---
# Variant Data Type
The AL variant data type can contain many AL data types <!--NAV or any variants from OCX and Automation objects-->. However, not all these values can be mapped to AL values. 
<!-- For more information, see [Using COM Technologies in Microsoft Dynamics NAV](../../dynamics-nav/Using-COM-Technologies-in-Microsoft-Dynamics-NAV.md). --> 

 The variant data type can contain the following AL data types:  

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

 You can use the variant data type to pass Automation variants from one external component (Automation or OCX) to another. This requires that the recipient component can accept the original variant. You can also assign a AL variable to a variant and pass it to an external component. When you pass AL variants ByRef to an external COM component, small conversion differences may occur. Therefore, we recommend that you pass AL variants ByVal if you do not have to assign a new value to the AL variant in your external component.  

## Returning variants in internal method calls  
 The AL variant is a complex data type. To return AL variants in method calls, you must pass them in a parameter ByVar.  

## Passing DateTime variables to Automation  
 It is not possible to pass an AL DateTime variable to Automation. However, you can convert the AL DateTime to a variant, and then pass it to Automation. The following examples shows how to pass a DateTime to Automation. This example requires that you create the following variables.  

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

## Variants and approximation  
 An AL variant contains two allocation areas: one for AL variables and one for Automation and OCX variants. This means every time that you assign an AL variable to a variant, the variant will contain the same data as the original variable. The conversion process does not change the data in any way. However, this is not the case with DATI2VARIANT because it is a VT_VARIANT. When you assign an external variable to a variant, the variant will also contain the same data as the original external variable.  

  
## Assigning Automation variants to FieldRef values  
 In [!INCLUDE[d365fin_md](../includes/d365fin_md.md)], if an Automation method returns a byte string (bstr) in a variant, you cannot assign that variant to a field that is a Code data type. Instead, you must first assign the variant to a code variable, and then assign the code variable to the FieldRef value. For example, the following code assigns a variant from an Automation method to a variable, and then assigns the variable to a field.  
  
```  
CodeVariable := AutomationMetodReturningBStrInVariant();  
fieldref.Value := CodeVariable;  
```  
## Methods
The following methods are supported for the Variant data type:

[ISACTION method (Variant)](../methods/devenv-isaction-method-variant.md)   
[ISAUTOMATION method (Variant)](../methods/devenv-isautomation-method-variant.md)   
[ISBINARY method (Variant)](../methods/devenv-isbinary-method-variant.md)   
[ISBOOLEAN method (Variant)](../methods/devenv-isboolean-method-variant.md)   
[ISCHAR method (Variant)](../methods/devenv-ischar-method-variant.md)   
[ISCODE method (Variant)](../methods/devenv-iscode-method-variant.md)   
[ISCODEUNIT method (Variant)](../methods/devenv-iscodeunit-method-variant.md)   
[ISDATE method (Variant)](../methods/devenv-isdate-method-variant.md)   
[ISDATEFORMULA method (Variant)](../methods/devenv-isdateformula-method-variant.md)   
[ISDECIMAL method (Variant)](../methods/devenv-isdecimal-method-variant.md)   
[ISFILE method (Variant)](../methods/devenv-isfile-method-variant.md)   
[ISINSTREAM method (Variant)](../methods/devenv-isinstream-method-variant.md)   
[ISINTEGER method (Variant)](../methods/devenv-isinteger-method-variant.md)   
[ISOPTION method (Variant)](../methods/devenv-isoption-method-variant.md)   
[ISOUTSTREAM method (Variant)](../methods/devenv-isoutstream-method-variant.md)   
[ISRECORD method (Variant)](../methods/devenv-isrecord-method-variant.md)   
[ISTEXT method (Variant)](../methods/devenv-istext-method-variant.md)   
[ISTIME method (Variant)](../methods/devenv-istime-method-variant.md)   
[ISTRANSACTIONTYPE method (Variant)](../methods/devenv-istransactiontype-method-variant.md)   
[VARIANT2DATE method](../methods/devenv-variant2date-method.md)   
[VARIANT2TIME method](../methods/devenv-variant2time-method.md)

## See Also  
[AL Data Types](devenv-al-data-types.md)  
[AL Method Reference](../methods/devenv-al-method-reference.md)  
 <!--NAV [DATI2VARIANT method](../methods/devenv-DATI2VARIANT-method.md)-->   
 