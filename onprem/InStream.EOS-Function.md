---
title: "InStream.EOS Function"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 17798d4c-d894-4d3b-9bb2-99e6d1ec5fff
caps.latest.revision: 16
---
# InStream.EOS Function
Indicates whether an input stream has reached End of Stream \(EOS\).  
  
## Syntax  
  
```  
  
IsEOS := InStream.EOS  
```  
  
## Property Value/Return Value  
 Type: Boolean  
  
 **Yes** if the stream has reached End of Stream; otherwise, **No**.  
  
## Remarks  
 If you are reading data from an external component, EOS can return **FALSE** even though no more data is available. This may occur if you have not called READ first.  
  
## Example  
 The following example opens the text file in a folder that is named MyFolder. The data in the text file is read into and input stream variable named StreamInTest. The [InStream.EOS Function](InStream.EOS-Function.md) is used to determine whether the input stream has reached the end. If the stream has not reached the end, the stream is read into a text buffer, which indicates that the stream has not reached the end until the stream reaches the end. This example requires that you create the following variables in the **C/AL Globals** window. You must also create the following file 'c:\\MyFolder\\MyText.txt'.  
  
|Variable name|DataType|  
|-------------------|--------------|  
|FileTest|File|  
|StreamInTest|InStream|  
|Buffer|Text|  
  
```  
  
FileTest.OPEN('c:\MyFolder\MyText.txt');  
FileTest.CREATEINSTREAM(StreamInTest);  
WHILE NOT StreamInTest.EOS DO BEGIN  
  StreamInTest.READTEXT(Buffer);  
  //Do some processing  
  MESSAGE('Stream is still processing')  
END;  
MESSAGE('End of Stream');  
```  
  
## See Also  
 [InStream.READ Function](InStream.READ-Function.md)   
 [InStream.READTEXT Function](InStream.READTEXT-Function.md)   
 [InStream and OutStream Data Types](InStream-and-OutStream-Data-Types.md)