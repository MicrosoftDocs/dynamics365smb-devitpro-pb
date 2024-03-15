---
title: "Text Encoding"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.assetid: b006a515-5465-4aad-94c5-12211f6f4f35
caps.latest.revision: 6
---
# Text Encoding
Text encoding is the process of transforming bytes of data into readable characters for users of a system or program. When you import a file as text or as a stream, the text encoding format ensures that all the language-specific characters are represented correctly in [!INCLUDE[navnow](includes/navnow_md.md)]. When you export a file as text or as a stream, the text encoding format ensures that all the language-specific characters are represented correctly in the system or program that will read the exported file.  
  
## Encoding Formats  
 You can specify text encoding for the following objects.  
  
|Object or data type|For more information, see|  
|-------------------------|-------------------------------|  
|**XMLports**|[TextEncoding Property \(XMLports\)](TextEncoding-Property--XMLports-.md)|  
|**File**|[OPEN Function \(File\)](OPEN-Function--File-.md)|  
|**BLOB**|[CREATEINSTREAM Function \(BLOB\)](CREATEINSTREAM-Function--BLOB-.md)<br /><br /> [CREATEOUTSTREAM Function \(BLOB\)](CREATEOUTSTREAM-Function--BLOB-.md)|  
  
 There are several industry text encoding formats and different systems support different formats. Internally, [!INCLUDE[navnow](includes/navnow_md.md)] uses Unicode encoding. For exporting and importing data with an XMLport, [!INCLUDE[navnow](includes/navnow_md.md)] supports MS-DOS, UTF-8, UTF-16, and Windows encoding formats. Data is imported and exported as follows:  
  
-   When data is imported from an external file, it is read using the format that is specified by the **TextEncoding** property or parameter, and then converted to Unicode in [!INCLUDE[navnow](includes/navnow_md.md)].  
  
-   When data is exported to an external file, it is converted from Unicode in [!INCLUDE[navnow](includes/navnow_md.md)], and then written to the file in the format that is specified by the **TextEncoding** property or parameter.  
  
 You should set the text encoding to the encoding format that is compatible with the system or program that you will be exporting to or importing from. The following sections describe the available text encoding formats.  
  
### MS-DOS Encoding Format  
 **MS-DOS** encoding, which is also referred to as OEM encoding, is an older format than UTF-8 and UTF-16, but it is still widely supported. MS-DOS encoding was the only format that was supported by earlier versions of [!INCLUDE[navnow](includes/navnow_md.md)].  
  
 MS-DOS encoding requires a different character set for each language. When the property is set to MS-DOS, text is encoded by using the system locale language of the computer that is running [!INCLUDE[nav_server](includes/nav_server_md.md)]. So if you use MS-DOS encoding, you should set the system locale language of [!INCLUDE[nav_server](includes/nav_server_md.md)] to match the language of the data that is being imported or exported. For example, if an XMLport includes text in Danish, then you should set the system locale language of [!INCLUDE[nav_server](includes/nav_server_md.md)] to Danish before the XMLport is run.  
  
 You should choose **MS-DOS** with XMLports that were created in earlier versions of [!INCLUDE[navnow](includes/navnow_md.md)].  
  
### UTF-8 Encoding Format  
 **UTF-8** encoding is a Unicode Transformation Format that uses one byte \(8 bits\) to encode each character. UTF-8 is based on the Unicode character set, which includes most characters of all languages in a single character set.  
  
 Unlike MS-DOS, when you use UTF-8, you do not have to consider the language settings of [!INCLUDE[nav_server](includes/nav_server_md.md)] or the external system or program that will read or write the data.  
  
 UTF-8 is compatible with ASCII so that it will understand files written in ASCII format.  
  
 UTF-8 is the most common encoding format and the recommended setting if you are not sure of the format that is supported by the system that you are integrating with.  
  
### UTF-16 Encoding Format  
 **UTF-16** encoding resembles UTF-8 except that UTF-16 uses 2 bytes \(16 bits\) to encode each character. UTF-16 is also based on the Unicode character set, so you do not have to consider the language setting of [!INCLUDE[nav_server](includes/nav_server_md.md)] or the external system or program that reads or writes the data.  
  
 UTF-16 includes two encoding schemes which mandate the byte order: UTF-16LE and UTF-16BE. [!INCLUDE[navnow](includes/navnow_md.md)] supports these schemes according to the following:  
  
-   When exporting, the file is written using UTF-16LE encoding.  
  
-   When importing, the file is read using the UTF-16, UTF-16LE, or UTF-16BE, depending on encoding scheme of the file itself.  
  
 A UTF-16 encoded file will typically be larger than the same file encoded with UTF-8, except for Eastern language character sets, which will typically be smaller.  
  
 UTF-16 is incompatible with ASCII so that it will not understand files written in ASCII format.  
  
### Windows Format  
 **Windows** encoding is also referred to as ANSI encoding. If you set the text encoding to **Windows**, you can import and export text files that are based on the Windows codepage on the user’s computer. As a result, you do not have to consider the language setting of [!INCLUDE[nav_server](includes/nav_server_md.md)] or the external system or program that reads or writes the data.  
  
 For example, if an XMLport can import bank files from a foreign bank in addition to a domestic bank, use Windows encoding instead of MS-DOS encoding to avoid changing the language of [!INCLUDE[nav_server](includes/nav_server_md.md)].  
  
 Windows encoding is compatible with ASCII so that it will understand files written in ASCII format.  
  
## See Also  
 [TextEncoding Property \(XMLports\)](TextEncoding-Property--XMLports-.md)   
 [OPEN Function \(File\)](OPEN-Function--File-.md)   
 [CREATEINSTREAM Function \(File\)](CREATEINSTREAM-Function--File-.md)   
 [CREATEOUTSTREAM Function \(File\)](CREATEOUTSTREAM-Function--File-.md)   
 [CREATEINSTREAM Function \(BLOB\)](CREATEINSTREAM-Function--BLOB-.md)   
 [CREATEOUTSTREAM Function \(BLOB\)](CREATEOUTSTREAM-Function--BLOB-.md)   
 [File Handling](File-Handling.md)