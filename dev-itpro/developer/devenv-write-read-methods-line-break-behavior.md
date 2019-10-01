---
title: "Write, WriteText, Read, and ReadText Method Behavior"
description: "Write, WriteText, Read, and ReadText Method Behavior for Line Endings and Zero Terminators."
author: SusanneWindfeldPedersen
ms.custom: na
ms.date: 10/01/2019
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.author: solsen
---

# Write, WriteText, Read, and ReadText Method Behavior for Line Endings and Zero Terminators 

When writing to and reading from a stream object using the Write, WriteText, Read, and ReadText methods, it is important to be aware of the following behavior regarding line endings and zero byte terminators:

- Write adds a 0 byte at the end of the stream; WriteText does not.
- Read reads until a 0 byte or the specified length  of the string.
- ReadText reads the until a zero byte, an end-of-line, the specified number of bytes, or the maximum length.  

To help understand this, consider the following code examples. These example assume that a BLOB field called `MyBlobField` exists in a table called `MyBlogTable`.

```
var
    myInt: Integer;
    MyRecord: Record MyBlobTable;
    MyOutStream: OutStream;
    MyInStream: InStream;
    Result: ext;
    CRLF: Text[2];
}
begin
    MyRecord.MyBlobField.CreateOutStream(MyOutStream);
    MyOutStream.WRITETEXT('A');
    MyOutStream.WRITETEXT;
    MyOutStream.WRITETEXT('B');
    MyOutStream.WRITETEXT;
    MyOutStream.WRITETEXT('C');

    MyRecord.MyBlobField.CreateInStream(MyInStream);
    MyInStream.READTEXT(Result); // Reads A
    Message(Result);
    MyInStream.READTEXT(Result); // Reads B
    Message(Result);
    MyInStream.READTEXT(Result); // Reads C
    Message(Result);

    MyRecord.MyBlobField.CreateInStream(MyInStream);
    MyInStream.READ(Result); // Reads A\B\C
    Message(Result);

    CRLF[1] := 10;
    CRLF[2] := 13;
    MyRecord.MyBlobField.CreateOutStream(MyOutStream);
    MyOutStream.WRITE('A' + CRLF + 'B');
    MyOutStream.WRITE('C');

    MyRecord.MyBlobField.CreateInStream(MyInStream);
    MyInStream.READTEXT(Result); // Reads A
    Message(Result);

    MyInStream.READTEXT(Result); // Reads B
    Message(Result);

    MyInStream.READTEXT(Result); // Reads C
    Message(Result);


    MyRecord.MyBlobField.CreateInStream(MyInStream);
    MyInStream.READ(Result); // Reads A + CRLF + B
    Message(Result);

    MyInStream.READ(Result); // Reads C
    Message(Result);

    Clear(MyRecord.MyBlobField);
    MyRecord.MyBlobField.CreateOutStream(MyOutStream);
    MyOutStream.WRITETEXT('A' + CRLF + 'B');
    MyOutStream.WRITETEXT('C');

    MyRecord.MyBlobField.CreateInStream(MyInStream);
    MyInStream.READ(Result); // Reads A + CRLF + BC
    Message(Result);


    MyRecord.MyBlobField.CreateInStream(MyInStream);
    MyInStream.READTEXT(Result); // Reads A
    Message(Result);
    MyInStream.READTEXT(Result); // Reads BC
    Message(Result);

end;

```
<!--
```
table 50100 MyBlobTable
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; MyField; Integer)
        {
            DataClassification = ToBeClassified;

        }
        field(2; MyBlobField; Blob)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(PK; MyField)
        {
            Clustered = true;
        }
    }

}

codeunit 50111 MyCodeunit
{
    trigger OnRun()
    begin
        MyRecord.MyBlobField.CreateOutStream(MyOutStream);
        MyOutStream.WRITETEXT('A');
        MyOutStream.WRITETEXT;
        MyOutStream.WRITETEXT('B');
        MyOutStream.WRITETEXT;
        MyOutStream.WRITETEXT('C');

        MyRecord.MyBlobField.CreateInStream(MyInStream);
        MyInStream.READTEXT(Result); // Reads A
        Message(Result);
        MyInStream.READTEXT(Result); // Reads B
        Message(Result);
        MyInStream.READTEXT(Result); // Reads C
        Message(Result);

        MyRecord.MyBlobField.CreateInStream(MyInStream);
        MyInStream.READ(Result); // Reads A\B\C
        Message(Result);

        CRLF[1] := 10;
        CRLF[2] := 13;
        MyRecord.MyBlobField.CreateOutStream(MyOutStream);
        MyOutStream.WRITE('A' + CRLF + 'B');
        MyOutStream.WRITE('C');

        MyRecord.MyBlobField.CreateInStream(MyInStream);
        MyInStream.READTEXT(Result); // Reads A
        Message(Result);

        MyInStream.READTEXT(Result); // Reads B
        Message(Result);

        MyInStream.READTEXT(Result); // Reads C
        Message(Result);


        MyRecord.MyBlobField.CreateInStream(MyInStream);
        MyInStream.READ(Result); // Reads A + CRLF + B
        Message(Result);

        MyInStream.READ(Result); // Reads C
        Message(Result);

        Clear(MyRecord.MyBlobField);
        MyRecord.MyBlobField.CreateOutStream(MyOutStream);
        MyOutStream.WRITETEXT('A' + CRLF + 'B');
        MyOutStream.WRITETEXT('C');

        MyRecord.MyBlobField.CreateInStream(MyInStream);
        MyInStream.READ(Result); // Reads A + CRLF + BC
        Message(Result);


        MyRecord.MyBlobField.CreateInStream(MyInStream);
        MyInStream.READTEXT(Result); // Reads A
        Message(Result);

        MyInStream.READTEXT(Result); // Reads BC
        Message(Result);



    end;

    var
        myInt: Integer;
        MyRecord: Record MyBlobTable;
        MyOutStream: OutStream;
        MyInstream: InStream;
        Result: ext;T
        CRLF: Text[2];
}

```
-->
## See Also
[Write and WriteText Methods](methods-auto/outstream/outstream-data-type.md)  
[Read and ReadText Methods](methods-auto/instream/instream-data-type.md)  
[AL Development Environment](devenv-reference-overview.md)    
