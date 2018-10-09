---
title: "ISOLATEDSTORAGE.DELETE Method"
ms.custom: na
ms.date: 10/10/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamics365-financials
ms.assetid: e536abc9-b0bb-4010-bd77-22e537eb24ba
caps.latest.revision: 14
manager: SorenGP
---

# ISOLATEDSTORAGE.DELETE Method
?Body text?

ISOLATEDSTORAGE.DELETE(KEY, [DATASCOPE]);

## Syntax  

```  

<Method Name="Delete" IsStatic="true" StaticClassName="ALIsolatedStorage" AddArguments="DataError" Compatibility="2.0">

  <Documentation>Deletes the value with the specified key from the isolated storage.</Documentation>

  <Returns Name="Ok" Type="Boolean" IsOptional="true">

    <Documentation>**true** if the value with the given key was successfully deleted from isolated storage, otherwise **false**.</Documentation>

  </Returns>

  <Parameter Name="Key" Type="String">

    <Documentation>The key of the value to remove.</Documentation>

  </Parameter>

  <Parameter Name="DataScope" Type="DataScope" IsOptional="true">

    <Documentation>The scope from which to remove the value with the given key. If a value is not passed in, the default value DataScope::Module will be used.</Documentation>

  </Parameter>

</Method>
```  

#### Parameters (REPLACE or DELETE)
 *File*  
 Type: File  

 Specifies the file to create.  

 *Name*  
 Type: Text or code  

 The name of the file that include the path. The following rules apply:  

-   You can omit the drive designation if the file is located on the current drive.  

-   You can omit the full path if the file is located in the current directory.  

-   You can enter only the subdirectory name if the file is located in a subdirectory of the current directory.  

 *TextEncoding*  
 Value: **MsDos**, **UTF8**, **UTF16**, or **Windows**  

 Optionally, you can specify the encoding on the file. By specifying the [File Handling and Text Encoding](../devenv-file-handling-and-text-encoding.md), you ensure that all the language-specific characters are represented correctly in [!INCLUDE[d365fin_md](../includes/d365fin_md.md)] when you read data and write data.  

 For more information, see [File Handling and Text Encoding](../devenv-file-handling-and-text-encoding.md).  

## Property Value/Return Value (REPLACE or DELETE)
 Type: Boolean  

 Specifies whether the file was created.  

 **True** if the file was created; otherwise, **false**.  

## Remarks (REPLACE or DELETE)
 If the [TEXTMODE Method \(File\)](devenv-TEXTMODE-Method-File.md) returns **true** and you read or write to the file, text is put in the buffer.  

 If the [TEXTMODE Method \(File\)](devenv-TEXTMODE-Method-File.md) method returns **false**, binary information is put in the buffer.  

 If you call CREATE on a File variable that refers to an open file, the method does not automatically close the existing file and create the new file. You must explicitly call the [CLOSE Method \(File\)](devenv-CLOSE-Method-File.md) to close the existing file. Otherwise, a run-time error occurs.  

## Example (REPLACE or DELETE)
 The following example creates a file that is named TestFile.txt in the path C:\\TestFolder\\. The TestFile variable stores the file and path that is created. If the file is created, a message that states that the file is created is displayed. Otherwise, an error message is displayed. This example requires that you create the following global variable.  

|Variable name|DataType|  
|-------------------|--------------|  
|TestFile|File|  

```  

IF TestFile.CREATE('C:\TestFolder\TestFile.txt') THEN BEGIN  
  MESSAGE('%1 is created', TestFile.NAME)  
END  
ELSE  
ERROR('The file could not be created');  
```  

## See Also  
 [GUID Data Type](../datatypes/devenv-GUID-Data-Type.md)
