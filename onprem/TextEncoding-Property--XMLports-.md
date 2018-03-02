---
title: "TextEncoding Property (XMLports)"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: cecfed61-dfea-4eb7-be2c-5b5091f765c5
caps.latest.revision: 25
manager: edupont
---
# TextEncoding Property (XMLports)
Specifies the text encoding format to use when you use an XMLport to export or import data as text.  
  
## Applies to  
 XMLports  
  
> [!NOTE]  
>  The **TextEncoding** property is only available when the [Format Property \(XMLports\)](Format-Property--XMLports-.md) of the XMLport is set to **Fixed Text** or **Variable Text**.  
  
## Values  
  
-   MS-DOS \(default\)  
  
-   UTF-8  
  
-   UTF-16  
  
-   Windows  
  
 For more information, see [Text Encoding](Text-Encoding.md).  
  
## Remarks  
 Text encoding is the process of transforming bytes of data into readable characters for users of a system or program. There are several industry text encoding formats and different systems support different formats. Internally, [!INCLUDE[navnow](includes/navnow_md.md)] uses Unicode encoding. For exporting and importing data with an XMLport, [!INCLUDE[navnow](includes/navnow_md.md)] supports MS-DOS, UTF-8, UTF-16, and Windows encoding formats.  
  
 You should set the **TextEncoding** property to the encoding format that is compatible with the system or program that you will be exporting to or importing from. The following sections describe the available text encoding formats.  
  
> [!TIP]  
>  You can also set the **TextEncoding** property in C/AL code. For example, if your XMLport can import or export different formats based on certain conditions, you can change the encoding on the fly depending on the conditions. For example, you can write code such as the following:  
>   
>  `currXMLport.TEXTENCODING := TEXTENCODING::Windows;`  
  
## Example  
 The following code example illustrates how you can set the encoding during run time.  
  
```  
...  
      CASE MyDefinitionTable."File Encoding" OF  
        MyDefinitionTable."File Encoding"::"MS-DOS":  
          currXMLport.TEXTENCODING(TEXTENCODING::MSDos);  
        MyDefinitionTable."File Encoding"::"UTF-8":  
          currXMLport.TEXTENCODING(TEXTENCODING::UTF8);  
        MyDefinitionTable."File Encoding"::"UTF-16":  
          currXMLport.TEXTENCODING(TEXTENCODING::UTF16);  
        MyDefinitionTable."File Encoding"::WINDOWS:  
          currXMLport.TEXTENCODING(TEXTENCODING::Windows);  
...  
```  
  
 The code example is based on XMLport 1220 in the [!INCLUDE[demolong](includes/demolong_md.md)]. The table, **MyDefinitionTable**, has a field, **File Encoding**, that specifies the encoding for this part of an import.  
  
## See Also  
 [XMLports](XMLports.md)   
 [How to: Create XMLports](How-to--Create-XMLports.md)   
 [Format Property \(XMLports\)](Format-Property--XMLports-.md)   
 [Walkthrough: Importing Data from Text Files to Tables](Walkthrough--Importing-Data-from-Text-Files-to-Tables.md)   
 [Text Encoding](Text-Encoding.md)