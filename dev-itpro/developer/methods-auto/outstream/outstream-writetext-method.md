---
title: "OutStream.WriteText Method"
ms.author: solsen
ms.custom: na
ms.date: 11/23/2020
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
# OutStream.WriteText Method
> **Version**: _Available from runtime version 1.0._

Writes text to an OutStream object.


## Syntax
```
[Written := ]  OutStream.WriteText([Text: String] [, Length: Integer])
```
## Parameters
*OutStream*
&emsp;Type: [OutStream](outstream-data-type.md)
An instance of the [OutStream](outstream-data-type.md) data type.

*Text*  
&emsp;Type: [String](../string/string-data-type.md)  
The text to write. If you do not specify this, a carriage return and a line feed are written.
        
*Length*  
&emsp;Type: [Integer](../integer/integer-data-type.md)  
The number of characters to be written.  


## Return Value
*Written*
&emsp;Type: [Integer](../integer/integer-data-type.md)
 If you omit this optional return value and the operation does not execute successfully, a runtime error will occur.  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks

For more information about how zero bytes and line endings are written and read, see [WRITE, WRITETEXT, READ, and READTEXT Method Behavior Regarding Line Endings and Zero Terminators](../../devenv-write-read-methods-line-break-behavior.md).
## Example  

 This example also requires that the c:\\TestFiles folder exists.  
  
```  
 var
    MyHTMLFile: File;
    TestOutStream: OutStream;
begin
    MyHTMLFile.CREATE('c:\TestFiles\main.html');  
    MyHTMLFile.CREATEOUTSTREAM(TestOutStream);  
    TestOutStream.WRITETEXT('<html>');  
    TestOutStream.WRITETEXT;  
    TestOutStream.WRITETEXT('<head>');  
    TestOutStream.WRITETEXT('<title>My Page</title>');  
    TestOutStream.WRITETEXT('</head>');  
    TestOutStream.WRITETEXT;  
    TestOutStream.WRITETEXT('<P>Hello world!</p>');  
    TestOutStream.WRITETEXT;  
    TestOutStream.WRITETEXT('</html>');  
    FileMyHTML.CLOSE;  
end;
```  
  
## See Also
[OutStream Data Type](outstream-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)