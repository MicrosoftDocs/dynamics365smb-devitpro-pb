---
title: "Developing a Custom Report Render"
description: Describe the custom report render logic.
ms.custom: na
ms.date: 04/03/2022
ms.reviewer: solsen
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: conceptual
ms.service: "dynamics365-business-central"
author: nhsejth
---

# Developing a Custom Report Render

This article describes the concept of a custom report render that manages the rendering of a generated report dataset with a layout type specified by external code, meaning by an extension. The actual rendering will take place in the application by using the `OnCustomDocumentMerger` event provided by the `ReportManagement` codeunit. The layout must be specified in the `rendering` section in the report definition.

## History and context

The custom render feature is a substitute for the business events that were used in the `OnDocumentMerge` event provided by the `DocumnentManagement` codeunit for rendering Word documents in the application. By using the custom render logic the report can support multiple layouts and the event code will not have dependencies to standard Word layout processing in platform or application. The layout files that are provided in the extension are imported without any further processing, whereas the Word documents are aligned with the platform requirements for that format.

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

## Sample AL Code

The simplest possible custom document render can be implemented as in the following sample that will use the existing application logic to render XML datasets into Microsoft Word or PDF documents using a given template (Word template).

```al
    [EventSubscriber(ObjectType::Codeunit, Codeunit::ReportManagement, 'OnCustomDocumentMerger', '', true, true)]
    local procedure OnCustomDocumentMerger(ObjectID: Integer; ReportAction: Option SaveAsPdf,SaveAsWord,SaveAsExcel,Preview,Print,SaveAsHtml; XmlData: InStream; LayoutData: InStream; var printDocumentStream: OutStream; var IsHandled: Boolean)
    var
        DocumentReportMgt: Codeunit "Document Report Mgt.";
        TempBlob: Codeunit "Temp Blob";
        DataInStream: InStream;
        DataOutStream: OutStream;
    begin
        if IsHandled then
            exit;

        TempBlob.CreateOutStream(DataOutStream);

        // The supported actions
        case ReportAction of
            ReportAction::SaveAsPdf, ReportAction::Preview, ReportAction::Print:
                begin
                    // Try to merge the xml data with the layyout and create a stream with the resulting Word document.
                    if not DocumentReportMgt.TryXmlMergeWordDocument(LayoutData, XmlData, DataOutStream) then
                        error('Unable to handle custom document merge');
                    // Convert the Word document to a PDF document using the streams in the blob object.
                    DocumentReportMgt.ConvertWordToPdf(TempBlob, ObjectID);
                    TempBlob.CreateInStream(DataInStream);
                    // Return the stream data to the printDocumentStream for further processing in the server.
                    CopyStream(printDocumentStream, DataInStream);
                    IsHandled := true;
                end;
            ReportAction::SaveAsHtml:
                begin
                    if not DocumentReportMgt.TryXmlMergeWordDocument(LayoutData, XmlData, DataOutStream) then
                        error('Unable to handle custom document merge');
                    DocumentReportMgt.ConvertWordToHtml(TempBlob);
                    TempBlob.CreateInStream(DataInStream);
                    CopyStream(printDocumentStream, DataInStream);
                    IsHandled := true;
                end;
            ReportAction::SaveAsWord:
                begin
                    if not DocumentReportMgt.TryXmlMergeWordDocument(LayoutData, XmlData, printDocumentStream) then
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
[OnCustomDocumentMerger Event](devenv-oncustomdocumentmerger-event.md)
[Events in AL](devenv-events-in-al.md)
[Publishing Events](devenv-publishing-events.md)
[Raising Events](devenv-raising-events.md)
[Subscribing to Events](devenv-subscribing-to-events.md)
