---
title: "Creating a Rich Text Editor"
description: How to create a functioning rich text editor using ExtendedDataType and a table blob field
ms.custom: na
ms.date: 08/01/2023
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: overview
author: damsboemil
---

# Creating a Rich Text Editor
Creating a control which will render a rich text editor is easy enough, it takes a bit more work to combine the control with a persisted value on a record. Below we have provided an example of how to persist the value of a rich text editor in a table's blob field.

Bear in mind the following requirements when creating a rich text editor:
* The `RichContent` value of `ExtendedDataType` cannot be set directly on a table field.
* The rich text editor must specify `MultiLine = true`.
* The placement of the rich text editor must be on a root-level group on the page (i.e. FastTab group), and it must be the only control in that group.

# Example: Creating Rich Text Editor backed by a Blob field
This example uses triggers and streams to achieve persistance of the rich text value. The code comments inside the example explain the design pattern. The example uses `Text` but the pattern is also applicable to using `BigText`.

```AL

table 50100 MyTable
{
    fields
    {
        field(1; MyIntegerField; Integer) { }
        field(2; RichTextBlob; Blob) { Description = 'Contains a rich text value'; }
    }

    /// <summary>
    /// Reads the RcihTextBlob value into a stream and outputs the value as a text representation.
    /// </summary>
    /// <returns>A text value which can be used with a rich text editor.</returns>
    procedure GetRichText(): Text
    var
        InStream: Instream;
        TextValue: Text;
    begin
        rec.CalcFields(rec.RichTextBlob);
        rec.RichTextBlob.CreateInStream(InStream);
        InStream.ReadText(TextValue);

        exit(TextValue);
    end;

    // 
    /// <summary>
    /// Saves the text parameter in the RichTextBlob field.
    /// </summary>
    /// <param name="MyRichText">The value to save in blob field.</param>
    procedure SaveRichText(RichText: Text)
    var
        OutStream: OutStream;
    begin
        rec.RichTextBlob.CreateOutStream(OutStream);
        Output.WriteText(RichText);
        rec.Modify();
    end;
}

page 50100 MyPage
{
    PageType = Card;
    SourceTable = MyTable;

    layout
    {
        area(Content)
        {
            group(FastTabGroup)
            {
                // Rich text editor is required to be alone in a FastTab group, which is a group that is at the root-level of it's page
                field("Rich Text Editor"; RichText)
                {
                    Caption = 'My rich text editor.';

                    // Both these are required to render a rich text editor
                    ExtendedDataType = RichContent;
                    MultiLine = true;

                    // ensures that the value from the RichText variable is persisted in the record
                    trigger OnValidate()
                    begin
                        rec.SaveRichText(RichText);
                    end;
                }
            }
        }
    }
    
    // ensures that when the page loads, the peristed value is read into the rich text editor control
    trigger OnAfterGetCurrRecord()
    begin
        RichText := rec.GetRichText();
    end;

    var
        RichText: Text;
}

```