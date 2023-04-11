---
title: "How to: Use Streams to Read from Text Files"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: c7bfffb1-db3a-4538-847a-8d79d10a6317
caps.latest.revision: 10
---
# How to: Use Streams to Read from Text Files
The [InStream](InStream.md) \(input stream\) and [OutStream](OutStream.md) \(output stream\) data types are generic stream objects that you can use to read from or write to files. This topic shows you how to use [InStream](InStream.md) to read from a text file. For information about how to use streams to write text files, see [How to: Use Streams to Write to Text Files](How-to--Use-Streams-to-Write-to-Text-Files.md). You create a codeunit to accomplish this task.  
  
### To use a stream to read from a text file  
  
1.  In Object Designer, choose **Codeunit**, and then choose the **New** button to open the **C/AL Editor**.  
  
2.  On the **View** menu, choose **C/AL Globals**.  
  
3.  On the **Variables** tab, in the **Name** column, declare a variable that represents the text file, and then set **DataType** to **File**.  
  
4.  Declare a second variable that represents the input stream that will read the data and set **DataType** to **Instream**.  
  
5.  Declare a third variable that receives the data that is read and set the **DataType**.  
  
6.  In the **C/AL Editor**, in the **OnRun** trigger, add code that uses the [OPEN Function \(File\)](OPEN-Function--File-.md) to open the file that you want to read from. The code will resemble the following code snippet.  
  
     `MyFile.OPEN('c:\MyFolder\MyText.txt');`  
  
7.  Use the [CREATEINSTREAM Function \(File\)](CREATEINSTREAM-Function--File-.md) to create the input stream. The code will resemble the following code snippet.  
  
     `MyFile.CREATEINSTREAM(MyInstream);`  
  
8.  Use the [InStream.READTEXT Function](InStream.READTEXT-Function.md) to read the data from the stream to a text variable such as a buffer or another object. The code that reads the file to a buffer will resemble the following code snippet.  
  
     `MyInStream.READTEXT(Buffer);`  
  
     If you are reading from a BLOB, use the [InStream.READ Function](InStream.READ-Function.md) to read the BLOB.  
  
9. After all the content of the file is read, use the [CLOSE Function \(File\)](CLOSE-Function--File-.md) to close the file. The code will resemble the following code snippet.  
  
     `MyFile.CLOSE;`  
  
10. On the **File** menu, choose **Save** to save the new codeunit.  
  
11. In the **Save As** window, in the **ID** text box, enter an ID for the codeunit. In the **Name** text box, enter a name for the codeunit.  
  
12. Verify that the **Compile** field is selected and then choose the **Yes** button.  
  
## Example  
 The following example reads a file that is named MyText.txt into a buffer and displays the contents of the buffer in a message. The file is read until the end of the file is reached. This example requires that you create the following variables in the **C/AL Globals** window.  
  
|Variable name|DataType|  
|-------------------|--------------|  
|MyFile|File|  
|StreamInTest|InStream|  
|Buffer|Text|  
  
```  
MyFile.OPEN('c:\MyFolder\MyText.txt');  
MyFile.CREATEINSTREAM(StreamInTest);  
WHILE NOT StreamInTest.EOS DO BEGIN  
  StreamInTest.READTEXT(Buffer);  
  // Do some processing.  
  MESSAGE('Stream is still reading: %1', Buffer);  
END;  
MyFile.CLOSE;  
MESSAGE('End of stream is reached.');  
```  
  
## See Also  
 [File Handling](File-Handling.md)   
 [How to: Use Streams to Write to Text Files](How-to--Use-Streams-to-Write-to-Text-Files.md)
