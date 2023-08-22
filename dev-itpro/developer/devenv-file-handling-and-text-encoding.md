---
title: File Handling and Text Encoding
description: Understand how files are handled and text is encoded in Business Central.
ms.custom: bap-template
ms.date: 04/01/2021
ms.reviewer: jswymer
ms.service: dynamics365-business-central
ms.author: solsen
ms.topic: conceptual
author: SusanneWindfeldPedersen
---

# File Handling and Text Encoding

There are several AL methods that you can use to open files, import and export files to and from [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)], and more. For a list of methods, see [File Data Type](./methods-auto/file/file-data-type.md).

The following are recommended best practices for working with files:

- Use fully qualified paths to eliminate ambiguity.

- Be aware of operating system file access restrictions when designing applications that use files. Consider which users have access to files and directories and what Access Control List (ACL) that you need to apply to file directories. 

## Text encoding

Text encoding is the process of transforming bytes of data into readable characters for users of a system or program. When you import a file as text or as a stream, the text encoding format ensures that all the language-specific characters are represented correctly in [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)]. When you export a file as text or as a stream, the text encoding format ensures that all the language-specific characters are represented correctly in the system or program that will read the exported file.  
  
## Encoding formats

You can specify text encoding for the following objects.  
  
|Object or data type|For more information, go to|  
|-------------|----------------|  
|**XMLports**|[TextEncoding Property \(XMLports\)](properties/devenv-textencoding-property.md)|  
|**File**|[OPEN Method \(File\)](./methods-auto/file/file-open-method.md)|  
|**BLOB**|[CREATEINSTREAM Method \(BLOB\)](./methods-auto/blob/blob-createinstream-method.md)<br /><br /> [CREATEOUTSTREAM Method \(BLOB\)](./methods-auto/library.md)|  
  
There are several industry text encoding formats and different systems support different formats. Internally, [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)] uses Unicode encoding. For exporting and importing data with an XMLport, it supports MS-DOS, UTF-8, UTF-16, and Windows encoding formats.

Data is imported and exported as follows:  
  
- When data is imported from an external file, it's read using the format that is specified by the **TextEncoding** property or parameter, and then converted to Unicode in [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)].  
  
- When data is exported to an external file, it's converted from Unicode in [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)], and then written to the file in the format that is specified by the **TextEncoding** property or parameter.  
  
You should set the text encoding to the encoding format that is compatible with the system or program that you'll be exporting to or importing from. The following sections describe the available text encoding formats.  
  
### MS-DOS encoding format

 **MS-DOS** encoding, which is also referred to as OEM encoding, is an older format than UTF-8 and UTF-16, but it's still widely supported. 
  
 MS-DOS encoding requires a different character set for each language. When the property is set to MS-DOS, text is encoded by using the system locale language of the computer that is running [!INCLUDE[server](includes/server.md)] instance. So if you use MS-DOS encoding, you should set the system locale language of server instance computer to match the language of the data that is being imported or exported. For example, if an XMLport includes text in Danish, then you should set the system locale language of the server instance computer to Danish before the XMLport is run.  
  
 You should choose **MS-DOS** with XMLports that were created in earlier versions of [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)].  
  
### UTF-8 encoding format

 **UTF-8** encoding is a Unicode Transformation Format that uses one byte \(8 bits\) to encode each character. UTF-8 is based on the Unicode character set, which includes most characters of all languages in a single character set.  
  
 Unlike MS-DOS, when you use UTF-8, you don't have to consider the language settings of [!INCLUDE[server](includes/server.md)] instance or the external system or program that will read or write the data.  
  
 UTF-8 is compatible with ASCII so that it will understand files written in ASCII format.  
  
 UTF-8 is the most common encoding format and the recommended setting if you aren't sure of the format that is supported by the system that you're integrating with.  
  
### UTF-16 encoding format

 **UTF-16** encoding resembles UTF-8 except that UTF-16 uses 2 bytes \(16 bits\) to encode each character. UTF-16 is also based on the Unicode character set, so you don't have to consider the language setting of [!INCLUDE[server](includes/server.md)] instance or the external system or program that reads or writes the data.  
  
 UTF-16 includes two encoding schemes, which mandate the byte order: UTF-16LE and UTF-16BE. The schemas are supported as follows:  
  
- When exporting, the file is written using UTF-16LE encoding.  
  
- When importing, the file is read using the UTF-16, UTF-16LE, or UTF-16BE, depending on encoding scheme of the file itself.  
  
A UTF-16 encoded file will typically be larger than the same file encoded with UTF-8, except for Eastern language character sets, which will typically be smaller.  
  
UTF-16 is incompatible with ASCII so that it will not understand files written in ASCII format.  
  
### Windows format

**Windows** encoding is also referred to as ANSI encoding. If you set the text encoding to **Windows**, you can import and export text files that are based on the Windows codepage determined by the system locale on the [!INCLUDE[server](includes/server.md)]. As a result, you don't have to consider the language setting of [!INCLUDE[server](includes/server.md)] instance computer or the external system or program that reads or writes the data.

For example, if an XMLport can import bank files from a foreign bank in addition to a domestic bank, use Windows encoding instead of MS-DOS encoding to avoid changing the language of the [!INCLUDE[server](includes/server.md)] instance computer.

> [!NOTE]
> In [!INCLUDE[prod_short](includes/prod_short.md)] online, you have no control over the system locale on [!INCLUDE[server](includes/server.md)]. Here, it's recommended to use UTF8/UTF16 for text encodings instead.
  
## See Also

[TextEncoding Property (XMLports)](properties/devenv-textencoding-property.md)  
[File Data Type](./methods-auto/library.md)
