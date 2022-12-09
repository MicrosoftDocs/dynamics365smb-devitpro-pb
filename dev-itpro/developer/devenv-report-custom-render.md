---
title: "Developing a Custom Report Render"
description: Describe the custom report render logic.
ms.custom: na
ms.date: 04/01/2022
ms.reviewer: solsen
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: conceptual
ms.service: "dynamics365-business-central"
author: nhsejth
---

# Developing a Custom Report Render

[!INCLUDE[2022_releasewave1](../includes/2022_releasewave1.md)]

This article describes the concept of a custom report render. The custom report render manages the rendering of a generated report dataset with a layout type specified by an extension. The actual rendering will take place in the application by using the `OnCustomDocumentMergerEx` event provided by the `ReportManagement` codeunit. The layout must be specified in the `rendering` section in the report definition.

## History and context

The custom render feature is a substitute for the business events that were used in the `OnDocumentMerge` event provided by the `DocumentManagement` codeunit for rendering Word documents in the application. When using the custom render logic, the report can support multiple layouts and the event code won't have dependencies to standard Word layout processing in the platform or application. The layout files that are provided in the extension are imported without any further processing, whereas the Word documents are aligned with the platform requirements for that format.

## Layout declaration for a custom render

```al
report 50000 "Standard Report Layout"
{
    DefaultRenderingLayout = CustomLayout;
    ...
    rendering
    {
        layout(CustomLayout)
        {
            Type = Custom;
            LayoutFile = './StandardReportLayout.custom';
            Caption = 'First custom layout';
            Summary = 'First custom layout summary';
            MimeType = 'Application/Report/MyExtension';
        }
    }
}
```

## Sample AL code

The simplest possible custom document render can be implemented as in the following sample. The example will use the existing application logic to render XML datasets into Microsoft Word or PDF documents using a given template (Word template).

```al
    [EventSubscriber(ObjectType::Codeunit, Codeunit::ReportManagement, 'OnCustomDocumentMergerEx', '', true, true)]
    local procedure OnCustomDocumentMergerEx(ObjectID: Integer; ReportAction: Option SaveAsPdf,SaveAsWord,SaveAsExcel,Preview,Print,SaveAsHtml; ObjectPayload: JsonObject; XmlData: InStream; LayoutData: InStream; var DocumentStream: OutStream; var IsHandled: Boolean)
    var
        DocumentReportMgt: Codeunit "Document Report Mgt.";
        TempBlob: Codeunit "Temp Blob";
        DataInStream: InStream;
        DataOutStream: OutStream;
        ObjectName: JsonToken;
        DocumentTypeParts: List of [Text];
        DocumentType: JsonToken;
        Extension: Text;
        Token: JsonToken;
        MimeType: Text;
        LayoutName: Text;
        LayoutModel: Text;
        JsonText: Text;
        JsonFile: File;
    begin        
        if IsHandled then
            exit;

        Init();

        // Sample code to persist the json object to disk
        ObjectPayload.WriteTo(JsonText);
        JsonFile.TextMode := true;
        JsonFile.Create(TempFolderPath + 'OnCustomDocumentMergerEx.json', TextEncoding::UTF8);
        JsonFile.Write(JsonText);
        JsonFile.Close();

        // Get report options from the json object
        ObjectPayload.Get('objectname', ObjectName);
        ObjectPayload.Get('documenttype', DocumentType);
        ObjectPayload.Get('layoutmimetype', Token);
        MimeType := Token.AsValue().AsText();

        ObjectPayload.Get('layoutname', Token);
        LayoutName := Token.AsValue().AsText();

        ObjectPayload.Get('layoutmodel', Token);
        LayoutModel := Token.AsValue().AsText();

        DocumentTypeParts := DocumentType.AsValue().AsText().Split('/');
        
        // Notice that the Extension below have to be remapped to a standard file extension based on the document mimetype.
        Extension := DocumentTypeParts.Get(DocumentTypeParts.Count);

        TempBlob.CreateOutStream(DataOutStream);

        // The 
        case ReportAction of
            ReportAction::SaveAsPdf, ReportAction::Preview, ReportAction::Print:
                begin
                    if not DocumentReportMgt.TryXmlMergeWordDocument(LayoutData, XmlData, DataOutStream) then
                        error('Unable to handle custom document merge');
                    DocumentReportMgt.ConvertWordToPdf(TempBlob, ObjectID);
                    TempBlob.CreateInStream(DataInStream);
                    CopyStream(DocumentStream, DataInStream);
                    IsHandled := true;
                end;
            ReportAction::SaveAsHtml:
                begin
                    if not DocumentReportMgt.TryXmlMergeWordDocument(LayoutData, XmlData, DataOutStream) then
                        error('Unable to handle custom document merge');
                    DocumentReportMgt.ConvertWordToHtml(TempBlob);
                    TempBlob.CreateInStream(DataInStream);
                    CopyStream(DocumentStream, DataInStream);
                    IsHandled := true;
                end;
            ReportAction::SaveAsWord:
                begin
                    if not DocumentReportMgt.TryXmlMergeWordDocument(LayoutData, XmlData, DocumentStream) then
                        error('Unable to handle custom document merge');
                    IsHandled := true;
                end;
            else
                error('Unsupported report action %0', ReportAction);
        end;
    end;
```

## See Also

[Working With and Troubleshooting Payloads](devenv-reports-troubleshoot-printing.md)  
[OnCustomDocumentMergerEx Event](devenv-oncustomdocumentmergerEx-event.md)  
[Events in AL](devenv-events-in-al.md)  
[Publishing Events](devenv-publishing-events.md)  
[Raising Events](devenv-raising-events.md)  
[Subscribing to Events](devenv-subscribing-to-events.md)  
