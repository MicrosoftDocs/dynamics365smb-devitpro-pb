---
title: "Using COM Technologies in Microsoft Dynamics NAV"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 032fac86-f68a-4871-a08f-3c87f193d2d4
caps.latest.revision: 17
manager: edupont
---
# Using COM Technologies in Microsoft Dynamics NAV
[!INCLUDE[navnow](includes/navnow_md.md)] supports COM technologies in two ways: using custom controls \(OCXs\) and as an automation controller.  
  
## Limitations  
 The COM support has the following limitations:  
  
-   Only non-visual controls are supported. A control cannot be used to add graphical elements to a [!INCLUDE[navnow](includes/navnow_md.md)] object. For example, you cannot add a third-party control to a page. However, the control can display information and interact with the user in a window of its own.  
  
-   Exception handling is not supported. Information about exceptions cannot be retrieved from a control or automation server through the Invoke method of the IDispatch interface and the EXCEPINFO structure.  
  
-   Unlike [!INCLUDE[nav2009](includes/nav2009_md.md)], automation objects in [!INCLUDE[navnowlong](includes/navnowlong_md.md)] cannot target the computer that is running the [!INCLUDE[nav_server](includes/nav_server_md.md)]. Only client-side automation objects are supported. Instead of implementing server-side automation object, you can use Microsoft .NET Framework Interoperability. For more information, see [Extending Microsoft Dynamics NAV Using Microsoft .NET Framework Interoperability](Extending-Microsoft-Dynamics-NAV-Using-Microsoft-.NET-Framework-Interoperability.md).  
  
## Parameters, Return Values, and Data Types  
 The mechanisms for calling methods in a control, passing parameters, and receiving return values are somewhat complex. Using tools such as the wizards in Microsoft Visual C++ shields you from most of the complexities. However, there is no one-to-one relationship between the data types that you can use when you implement methods in, for example, Visual C++ and the data types in C/AL. Some of the COM data types are not supported in C/AL and some have a limitation imposed on their usage.  
  
 When you use the **C/AL Symbol Menu**, you can see the syntax for a method or property that has the return value and the parameters shown with the COM data types.  
  
### Mapping C/AL Data Types to COM Data Types  
 The following table shows how C/AL data types map to COM data types.  
  
|C/AL data type|COM data type|Comment|  
|---------------------|-------------------|-------------|  
|[Boolean Data Type](Boolean-Data-Type.md)|VARIANT\_BOOL \(VT\_BOOL\)||  
|[Option Data Type](Option-Data-Type.md)|long \(VT\_I4\)||  
|[Integer Data Type](Integer-Data-Type.md)|long \(VT\_I4\)||  
|[BigInteger Data Type](BigInteger-Data-Type.md)|long \(VT\_I4\)||  
|[Decimal Data Type](Decimal-Data-Type.md)|CURRENCY \(VT\_CY\)|The CURRENCY type in COM is a special data type with a fixed point that has 15 digits to the left of the decimal point and 4 to the right. The Decimal type in C/AL does not have a fixed point and can have a total of 18 digits. This could lead to rounding being performed when a Decimal type number is passed to a method that expects a CURRENCY. The server changes that number and returns it as a CURRENCY. No matter how many digits the original Decimal had to the right of the decimal point, the returned CURRENCY will have no more than 4 digits.|  
|[Char Data Type](Char-Data-Type.md)|BSTR \(VT\_BSTR\)||  
|[Text Data Type](Text-Data-Type.md)|BSTR \(VT\_BSTR\)||  
|[Code Data Type](Code-Data-Type.md)|BSTR \(VT\_BSTR\)||  
|[Date Data Type](Date-Data-Type.md)|DATE \(VT\_DATE\)||  
|[Time Data Type](Time-Data-Type.md)|void \(VT\_VOID\)||  
|[DateTime Data Type](DateTime-Data-Type.md)|DATE \(VT\_DATE\)||  
|[Automation Data Type](Automation-Data-Type.md)|TypedObject, UntypedObject<br /><br /> \(VT\_DISPATCH\)||  
|[InStream](InStream.md)|VT\_STREAM||  
|[OutStream](OutStream.md)|VT\_STREAM||  
|[Variant Data Type](Variant-Data-Type.md)|VARIANT \(VT\_VARIANT\)||  
  
### Mapping COM Data Types to C/AL Data Types  
 The following table shows how to map COM data types to C/AL data types.  
  
|COM data type|C/AL data type|Comment|  
|-------------------|---------------------|-------------|  
|VT\_UNKNOWN|[InStream and OutStream Data Types](InStream-and-OutStream-Data-Types.md)|Only the IID\_IStream and IID\_SequentialStream interfaces are supported. If you pass any other IUnknown interface, an error will occur at runtime.|  
|short \(VT\_I2\)|[Integer Data Type](Integer-Data-Type.md)||  
|long \(VT\_I4\)|[Integer Data Type](Integer-Data-Type.md)<br /><br /> [BigInteger Data Type](BigInteger-Data-Type.md)||  
|float \(VT\_R4\)|[Decimal Data Type](Decimal-Data-Type.md)||  
|double \(VT\_R8\)|[Decimal Data Type](Decimal-Data-Type.md)||  
|CURRENCY \(VT\_CY\)|[Decimal Data Type](Decimal-Data-Type.md)|The CURRENCY type in COM is a special data type with a fixed point, which has 15 digits to the left of the decimal point and 4 to the right. The Decimal type does not have a fixed point and can have a total of 18 digits.|  
|DATE \(VT\_DATE\)|[Date Data Type](Date-Data-Type.md)<br /><br /> [DateTime Data Type](DateTime-Data-Type.md)|The COM DATE type contains both a date and a time value. C/AL has Date and Time as separate data types. Therefore, the time part of a COM DATE type will be lost when the COM DATE type is mapped to the Date C/AL data type.<br /><br /> To keep the date and the time, map the COM Date type to the C/AL DateTime data type.|  
|BSTR \(VT\_BSTR\)|[Text Data Type](Text-Data-Type.md)||  
|VARIANT\_BOOL<br /><br /> \(VT\_BOOL\)|[Boolean Data Type](Boolean-Data-Type.md)||  
|TypedObject/<br /><br /> UntypedObject<br /><br /> \(VT\_DISPATCH\)|[Automation Data Type](Automation-Data-Type.md)<br /><br /> [OCX Data Type](OCX-Data-Type.md)||  
|VT\_EMPTY|[Text Data Type](Text-Data-Type.md)||  
|VARIANT<br /><br /> \(VT\_VARIANT\)|[Variant Data Type](Variant-Data-Type.md)||  
  
### Unsigned char \(VT\_UI1\), SCODE \(VT\_ERROR\), and SAFEARRAY \(VT\_ARRAY\)  
 You can use the C/AL variant data type to pass unsigned char, SCODE, or SAFEARRAY to another variant that supports these types. You cannot assign them to C/AL data types.  
  
## Remarks  
 When you call a method with a ByRef parameter, the typical C/AL type conversions do not occur. For example, this means that if the parameter is of type float, you have to use a C/AL variable of type Decimal. You cannot use Integer and have C/AL convert it for you.  
  
> [!NOTE]  
>  If the value that you want to pass has the incorrect type, when, for example, it is a value from a database record field, then you can assign it to a C/AL variable of the correct type before you call the COM object method.  
  
 You will sometimes see a COM object method or a property in the **C/AL Symbol Menu** that has type IDispatch. This means that the method or property returns or expects a COM object. In this case, you must use a C/AL Automation variable that has been declared, through the **Subtype**, to be the correct COM object. You will have to study the documentation for the automation server to gain the necessary information.  
  
 You will also see properties and methods that do not have one of the expected types. For example, a method in Microsoft Office Excel can have a return value of type WORKBOOK. This means that the automation server has implemented a USERDEF type. [!INCLUDE[navnow](includes/navnow_md.md)] supports USERDEF types in two contexts: IDispatch and Enumeration.  
  
 If the USERDEF type is an IDispatch, it means that it is an interface \(sometimes also called class or object\) with a specific GUID. You will have to use the same object for a return value or parameter. You do this by creating an Automation variable with the correct subtype. For example, Microsoft Excel has several methods that return a WORKBOOK variable. This means that you must declare a variable of type Automation and subtype 'Microsoft Excel 8.0 Object Library'.Workbook.  
  
 If the USERDEF type is an enumeration, you cannot use the symbolic name, for example, xl3DPie, but instead must use the enumerator, for example, -4102. For Microsoft Office products, you can find this value by using the VBA Object Browser.  
  
## See Also  
 [Extending Microsoft Dynamics NAV Using COM](Extending-Microsoft-Dynamics-NAV-Using-COM.md)   
 [COM Overview](COM-Overview.md)   
 [Automation Data Type](Automation-Data-Type.md)   
 [Variant Data Type](Variant-Data-Type.md)