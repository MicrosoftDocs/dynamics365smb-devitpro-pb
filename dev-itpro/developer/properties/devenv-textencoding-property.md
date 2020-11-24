---
title: "TextEncoding Property"
ms.author: solsen
ms.custom: na
ms.date: 11/24/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# TextEncoding Property
> **Version**: _Available from runtime version 1.0._

Specifies the text encoding format to use when you use an XmlPort to export or import data as text.

## Applies to
-   Xml Port

## Property Value

|Value|Description|
|-----------|---------------------------------------|
|**MSDOS**|Use MS-DOS encoding format. It is the default value.|
|**UTF8**|Use UTF-8 encoding format.|
|**UTF16**|Use UTF-16 encoding format.|
|**WINDOWS**|Use Windows encoding format.|

[//]: # (IMPORTANT: END>DO_NOT_EDIT)


For more information, see [[File Handling and Text Encoding](../devenv-file-handling-and-text-encoding.md).  

## Syntax

```AL
TextEncoding = Windows;
```
 
## Remarks

The **TextEncoding** property is only available when the **Format** property is set to **Fixed Text** or **Variable Text**.

[File Handling and Text Encoding](../devenv-file-handling-and-text-encoding.md) is the process of transforming bytes of data into readable characters for users of a system or program. There are several industry [File Handling and Text Encoding](../devenv-file-handling-and-text-encoding.md) formats and different systems support different formats. Internally, [!INCLUDE[d365fin_long_md](../includes/d365fin_long_md.md)] uses Unicode encoding. For exporting and importing data with an XMLport, [!INCLUDE[d365fin_long_md](../includes/d365fin_long_md.md)] supports MS-DOS, UTF-8, UTF-16, and Windows encoding formats.  
  
You should set the **TextEncoding** property to the encoding format that is compatible with the system or program that you will be exporting to or importing from. The following sections describe the available [File Handling and Text Encoding](../devenv-file-handling-and-text-encoding.md) formats.  
  
> [!TIP]  
> You can also set the **TextEncoding** property in AL code using the [TextEncoding Method](../methods-auto/xmlport/xmlportinstance-TextEncoding-method.md) . For example, if your XMLport can import or export different formats based on certain conditions, you can change the encoding on the fly depending on the conditions. For example, you can write code such as one of the following:  
> 
> `currXMLport.TextEncoding := TextEncoding::Windows;`  
> `currXMLport.TextEncoding(TextEncoding::Windows);`
  
## Example

The following code example illustrates how you can set the encoding during run time.  
  
```AL
...  
      case MyDefinitionTable."File Encoding" of  
        MyDefinitionTable."File Encoding"::"MS-DOS":  
          currXMLport.TextEncoding(TextEncoding::MSDos);  
        MyDefinitionTable."File Encoding"::"UTF-8":  
          currXMLport.TextEncoding(TextEncoding::UTF8);  
        MyDefinitionTable."File Encoding"::"UTF-16":  
          currXMLport.TextEncoding(TextEncoding::UTF16);  
        MyDefinitionTable."File Encoding"::WINDOWS:  
          currXMLport.TextEncoding(TextEncoding::Windows);  
...  
```  
  
The code example is based on XMLport 1220 in the [!INCLUDE[demolong](../includes/demolong_md.md)]. The table, **MyDefinitionTable**, has a field, **File Encoding**, that specifies the encoding for this part of an import.  
  
## See Also  

[Properties](devenv-properties.md)   
[Format Property \(XMLports\)](devenv-format-xmlports-property.md)   
[File Handling and Text Encoding](../devenv-file-handling-and-text-encoding.md)