---
title: "How to: Use Streams to Write to Text Files"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 8a82791e-8eb6-4cde-9fee-fc99c0885093
caps.latest.revision: 7
---
# How to: Use Streams to Write to Text Files
The [InStream](InStream.md) \(input stream\) and [OutStream](OutStream.md) \(output stream\) data types are generic stream objects that you can use to read from or write to files. This topic shows you how to use the [OutStream](OutStream.md) object to write to a text file. You create a codeunit to accomplish this task. For information about how to use streams to read text files, see [How to: Use Streams to Read from Text Files](How-to--Use-Streams-to-Read-from-Text-Files.md).  
  
### To use a stream to write to a text file  
  
1.  In Object Designer, choose **Codeunit**, and then choose the **New** button to open the **C/AL Editor**.  
  
     You declare variables to represent the text file and output stream object that you want to work with.  
  
2.  From the **View** menu, choose **C/AL Globals** to open the **C/AL Globals** window.  
  
3.  Under the **Variable** tab, in the **Name** column, declare a variable that represents the text file and then set **DataType** to **File**.  
  
4.  Declare a second variable that represents the output stream that will write the data, then set **DataType** to **OutStream**.  
  
     If you want to retrieve the number of characters that are written to the text file, create variable to hold the value.  
  
5.  From the **View** menu, choose **C/AL Code** to open the **C/AL Editor**.  
  
6.  In the **C/AL Editor**, in the OnRun\(\) trigger, add code that uses the [CREATE Function \(File\)](CREATE-Function--File-.md) to create the file that you want to write to. The code will resemble following code snippet: `MyFile.CREATE('c:\MyNewFolder\MyWriteText.txt');`.  
  
7.  Use the [CREATEOUTSTREAM Function \(File\)](CREATEOUTSTREAM-Function--File-.md) to create the output stream. The code will resemble the following code snippet: `MyFile.CREATEOUTSTREAM(MyOutStream);`.  
  
8.  Use the [OutStream.WRITETEXT Function](OutStream-WRITETEXT-Function.md) to write the data from the output stream to the file. The code will resemble the following code snippet: `MyOutStream.WRITETEXT(‘Hello world’);`.  
  
9. From the **File** menu, choose **Save AS**.  
  
10. In the **Save As** dialog box, in the **ID** text box, enter an ID for the codeunit.  
  
11. In the **Name** text box, enter a name for the codeunit.  
  
12. Verify that **Compile** is selected and then choose the **Yes** button.  
  
## Example  
 The following example shows how to use an output stream to write text to a text file and displays the number of characters that were written to the file. This example requires that you create the following variables in the **C/AL Globals** window.  
  
|Variable name|DataType|  
|-------------------|--------------|  
|MyFile|File|  
|MyOutStream|OutStream|  
|NumberOfChars|Integer|  
  
```  
  
MyFile.CREATE('c:\MyNewFolder\MyWriteText.txt');  
MyFile.CREATEOUTSTREAM(MyOutStream);  
NumberOfChars := MyOutStream.WRITETEXT('Hello World!');  
MESSAGE('%1 characters were written to the file.', NumberOfChars);  
```  
  
## See Also  
 [File Handling](File-Handling.md)   
 [How to: Use Streams to Read from Text Files](How-to--Use-Streams-to-Read-from-Text-Files.md)
