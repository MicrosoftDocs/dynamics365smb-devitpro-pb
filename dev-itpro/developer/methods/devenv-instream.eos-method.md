---
title: "InStream.EOS Method"
ms.custom: na
ms.date: 07/13/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamics365-financials
ms.assetid: 17798d4c-d894-4d3b-9bb2-99e6d1ec5fff
caps.latest.revision: 16
---

[!INCLUDE[newdev_dev_preview](../includes/newdev_dev_preview.md)]

# InStream.EOS Method
Indicates whether an input stream has reached End of Stream \(EOS\).  
  
## Syntax  
  
```  
  
IsEOS := InStream.EOS  
```  
  
## Property Value/Return Value  
 Type: Boolean  
  
 **True** if the stream has reached End of Stream; otherwise, **false**.  
  
## Remarks  
 If you are reading data from an external component, EOS can return **FALSE** even though no more data is available. This may occur if you have not called READ first.  
  
## Example  
 The following example opens the text file in a folder that is named MyFolder. The data in the text file is read into and input stream variable named StreamInTest. The [InStream.EOS Method](devenv-InStream.EOS-Method.md) is used to determine whether the input stream has reached the end. If the stream has not reached the end, the stream is read into a text buffer, which indicates that the stream has not reached the end until the stream reaches the end. This example requires that you create the following global variables. You must also create the following file 'c:\\MyFolder\\MyText.txt'.  
  
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
 [InStream.READ Method](devenv-InStream.READ-Method.md)   
 [InStream.READTEXT Method](devenv-InStream.READTEXT-Method.md)   
 [InStream and OutStream Data Types](../datatypes/devenv-InStream-and-OutStream-Data-Types.md)