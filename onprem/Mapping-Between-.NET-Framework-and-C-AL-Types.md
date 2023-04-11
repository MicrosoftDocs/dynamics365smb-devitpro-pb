---
title: "Mapping Between .NET Framework and C/AL Types"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 1e5577ea-9730-46d2-b828-5e35135d9a52
caps.latest.revision: 18
---
# Mapping Between .NET Framework and C/AL Types
In C/AL, some .NET Framework data types, such as strings, DateTime, integers, and decimals, are automatically converted to C/AL types. Because the types are converted, the .NET Framework versions of these types are not supported in C/AL. For example, instead of using a .NET Framework integer data type in your C/AL code, you should use a C/AL integer data type. When the C/AL integer is sent back to a .NET Framework object, such as through a method call, then the C/AL integer is automatically converted to a .NET Framework integer.  

## Conversion Table for .NET Framework and C/AL Types  
 The following table lists the automatic data type conversions between.NET Framework and C/AL types.  

> [!NOTE]  
>  The System.String type and System.DateTime type are converted differently than other types that are listed in the table. For more information, see [Conversion of System.String and System.DateTime Types](#ConversionStringDate).  

|.NET Framework Data Type<br /><br /> \(range\)|C/AL Data Type<br /><br /> \(range\)|Comments|  
|--------------------------------------------|-----------------------------------|--------------|  
|System.Byte<br /><br /> \(0...255\)|Byte<br /><br /> \(0...255\)|Single unsigned byte that represents a value from 0...255.|  
|System.SByte<br /><br /> \(-128...127\)|Integer<br /><br /> \(-128...127\)|Single signed byte that represents a value from -128...127.|  
|System.Char<br /><br /> \(0...65535\)|Char<br /><br /> \(0...65535\)|Unicode character that is represented internally as a 16-bit unsigned integer.|  
|System.Int16<br /><br /> \(-32768...32767\)|Integer<br /><br /> \(±2,147,483,647\)||  
|System.Int32<br /><br /> \(-2,147,483,648...2,147,483,647\)|Integer<br /><br /> \(±2,147,483,647\)||  
|System.Int64<br /><br /> \(-9,223,372,036,854,775,808...9,223,372,036,854,775,807\)|BigInteger<br /><br /> \(±9,223,372,036,854,775,807\)||  
|System.UInt16<br /><br /> \(0...65335\)|Integer<br /><br /> \(±2,147,483,647\)|[!INCLUDE[navnow](includes/navnow_md.md)] does not have a corresponding type, but values can be stored in an integer.|  
|System.UInt32<br /><br /> \(0...4,250,000,000\)|BigInteger<br /><br /> \(±9,223,372,036,854,775,807\)|[!INCLUDE[navnow](includes/navnow_md.md)] does not have a corresponding type, but values can be stored in a big integer.|  
|System.UInt64<br /><br /> \(0...18,446,744,073,709,551,615\)|Decimal<br /><br /> \(0...18,446,744,073,709,551,615\)|[!INCLUDE[navnow](includes/navnow_md.md)] does not have a corresponding type, but values can be stored in a big integer or decimal.|  
|System.Single<br /><br /> \(±3.402823e38\)|Decimal<br /><br /> \(±3.402823e38\)||  
|System.Double<br /><br /> \(±1.79769313486232e308\)|Decimal<br /><br /> \(±1.79769313486232e308\)||  
|System.Decimal<br /><br /> \(±79,228,162,514,264,337,593,543,950,335\)|Decimal<br /><br /> \(-999,999,999,999,999.99...999,999,999,999,999.99\)|An internal range that is not persisted to a field but is the type’s native value range.|  
|System.Int32<br /><br /> \(±2,147,483,647\)|Option<br /><br /> \(±2,147,483,647\)|Option values can be freely converted to numeric values. The range is the same as an integer.|  
|System.Enum<br /><br /> \(-32768...32767\)|Integer<br /><br /> \(±2,147,483,647\)|An enumeration is a named constant with an underlying type that is any integer type except Char. If no underlying type is explicitly declared, then Int32 is used.<br /><br /> [!INCLUDE[navnow](includes/navnow_md.md)] has no information about the constant’s name, only the value is known.|  
|System.Bool<br /><br /> \(TRUE, FALSE\)|Boolean<br /><br /> \(TRUE, FALSE\)||  
|System.String<br /><br /> \(0 to 1024 bytes\)|Text<br /><br /> \(0 to 1024 bytes\)<br /><br /> BigText<br /><br /> \(up to 2 gigabytes\)|Denotes a text string with a maximum length of 1024 characters. Text strings are single-byte only.<br /><br /> For more information, see [Conversion of System.String and System.DateTime Types](#ConversionStringDate).|  
|System.String<br /><br /> \(0 to 1024 bytes\)|Code<br /><br /> \(0 to 1024 bytes.\)|Denotes an alphanumeric string with maximum length of 1024 characters. The value is stored in uppercase.<br /><br /> For more information, see [Conversion of System.String and System.DateTime Types](#ConversionStringDate).|  
|System.DateTime<br /><br /> 3 January year 1 ... 31 December 9999|Date<br /><br /> 1 January year 1753 ... 31 December 9999|The common language runtime only supports DateTime. In [!INCLUDE[navnow](includes/navnow_md.md)], Date must be converted to a DateTime value type when passing as a parameter, such as for `CREATEDATETIME(d, 000000T);`<br /><br /> For more information, see [Conversion of System.String and System.DateTime Types](#ConversionStringDate).|  
|System.DateTime|Time<br /><br /> \(00:00:00...23:59:59.999\)|The common language runtime only supports DateTime. In [!INCLUDE[navnow](includes/navnow_md.md)], Date must be converted to a DateTime value type when passing it as a parameter, such as for `CREATEDATETIME( 0D, t);`<br /><br /> The common language runtime DateTime object that will be used for storing a [!INCLUDE[navnow](includes/navnow_md.md)] Time value must handle daylight saving time and time zone. The time value does not change.<br /><br /> For more information, see [Conversion of System.String and System.DateTime Types](#ConversionStringDate).|  
|System.DateTime|DateTime<br /><br /> \(January 1, 1753, 00:00:00.000 to December 31, 9999, 23:59:59.999\)|The common language runtime DateTime value type represents dates and times with values ranging from 12:00:00 midnight, January 1, 1753 Common Era \(CE\) through 11:59:59 P.M., December 31, 9999 CE.<br /><br /> For more information, see [Conversion of System.String and System.DateTime Types](#ConversionStringDate).|  
|TimeSpan<br /><br /> \(Resolution is 100 nanoseconds\)|Duration<br /><br /> \(Resolution is 1 milliseconds\)|A time interval is the duration of time or elapsed time that is measured as a positive or negative number of days, hours, minutes, seconds, and fractions of a second. Duration is internally represented as a 64-bit integer.|  
|System.Guid<br /><br /> \(128 bit number\)|GUID<br /><br /> \(128 bit number\)||  
|System.IO.Stream|inStream|Streams require a context specific conversion and specialized stream types such as {Stream,String,Text}{Reader,Writer} classes. BLOB-related streams typically use MemoryStreams.|  
|System.IO.Stream|Outstream||  

##  <a name="ConversionStringDate"></a> Conversion of System.String and System.DateTime Types  
 Unlike the types in the previous table, the System.String and System.DateTime types are not converted automatically to C/AL data types when the DotNet variable is instantiated. The System.String and System.DateTime types are only converted when assigned to a compatible C/AL data type. This lets you create an instance of the System.String type or System.DateTime type, and then call the DotNet variable like any other DotNet variable.  

> [!NOTE]  
>  You cannot use a DotNet variable for the System.String type or System.DateTime type in comparisons with C/AL types because in these cases, there is no implicit type conversion.  

### Example  
 The following C/AL code example illustrates how a DotNet variable for the System.String type is converted to a C/AL text data type.  

 In a [!INCLUDE[navnow](includes/navnow_md.md)] object, such as a codeunit, define the following global variables.  

|Variable name|DataType|SubType|Comments|  
|-------------------|--------------|-------------|--------------|  
|alVariable|Text|||  
|dotNetVariable|DotNet|System.String|Located in the **mscorlib** assembly.|  

 In the C/AL code, add the following code.  

```  
alVariable := ‘sample text’;  
dotNetVariable := ‘sample text’;  

// Compares the objects using the Equals method on the DotNet object.  
if not dotNetVariable.Equals(alVariable) then  
  error(‘Object should contain same data’);  

// Converts the DotNet object to a C/AL text type by calling the ToString method on the object.   
// This forces an implicit type conversion to the C/AL text type and the standard C/AL comparison can be used.  
if dotNetVariable.ToString() <> alVariable then  
  error(‘Objects should contain same data, compared with ToString()’);  

```  

## See Also  
 [Extending Microsoft Dynamics NAV Using Microsoft .NET Framework Interoperability](Extending-Microsoft-Dynamics-NAV-Using-Microsoft-.NET-Framework-Interoperability.md)   
 [How to: Call .NET Framework Types From C/AL Code](How-to--Call-.NET-Framework-Types-From-C-AL-Code.md)
