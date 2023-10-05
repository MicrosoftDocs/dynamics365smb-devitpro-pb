---
title: Extend e-documents functionality
description: Learn how to extend e-documents functionality with specific requirements.
author: altotovi
ms.topic: conceptual
ms.reviewer: solsen
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.search.keywords: electronic document, electronic invoice, e-document, e-invoice, customization, development, extend
ms.search.form: 6103, 6133
ms.date: 10/05/2023
ms.author: altotovi
---

# Extend e-documents functionality

The **E-Documents Core** module is created as an extension and built as a framework. Therefore, by default, there's no **Document Format** or **Service Integration** option. These details, and others, are components of localization apps, which cater to specific local requirements. This framework is intended to cover most requirements for the process of communication with electronic documents (e-documents). However, some parts are left for localization apps. The information in this article helps you add value to this module and use it for your own localization.

## Develop a localization extension

To implement your localization on top of the E-Document Core application, you should complete the following steps.

### Step 1 - Create and set up a new extension

Create a new extension and add the dependency to the E-Document Core application. In your *app.json* file, add the dependency on the **E-Document Core** extension:

```json
"dependencies": [
    {
        "id":  "e1d97edc-c239-46b4-8d84-6368bdf67c8b",
        "name":  "E-Document Core",
        "publisher":  "Microsoft",
        "version":  "23.0.0.0"
    }
]
```

### Step 2 - Implement the document interface

The **E-Document Core** interface comprises a collection of methods that are designed to streamline the export of Microsoft Dynamics 365 Business Central documents, such as sales invoices, into e-document blobs, based on predefined format specifications. The interface also facilitates the reverse process by enabling the import of documents from blobs back into Business Central.

This first step is to extend the enumeration (enum) and associate it with your implementation codeunit.

```AL
enumextension 50100 "EDocument Format Ext" extends "E-Document Format"
{
    value(50100; "PEPPOL 3.x")
    {
        Implementation = "E-Document" = "PEPPOL EDocument";
    }
}
```

The document interface is divided into two sections:

- Create an e-document from a Business Central document that can be sent to a designated endpoint: **Check**, **Create**, and **CreateBatch**.
- Receive a document from the endpoint: **GetBasicInfo** and **PrepareDocument**.

The following example shows how you can implement each method in the interface.

- **Check:** Use the method to run a check on the release/post action of a document, to make sure that all fields that are required to submit the document are available.

    ```AL
    procedure Check(var SourceDocumentHeader: RecordRef; EDocumentService: Record "E-Document Service"; EDocumentProcessingPhase: Enum "E-Document Processing Phase")
    var
        SalesHeader: Record "Sales Header";
    begin

        Case SourceDocumentHeader.Number of
            Database::"Sales Header":
                begin
                    SourceDocumentHeader.Field(SalesHeader.FieldNo("Customer Posting Group")).TestField();
                    SourceDocumentHeader.Field(SalesHeader.FieldNo("Posting Date")).TestField();
                end;
        End;
    ```

    You can also select to perform distinct checks, depending on the document processing phase.

    ```AL
    procedure Check(var SourceDocumentHeader: RecordRef; EDocumentService: Record "E-Document Service"; EDocumentProcessingPhase: Enum "E-Document Processing Phase")
    var
        SalesHeader: Record "Sales Header";
    begin

        Case SourceDocumentHeader.Number of
            Database::"Sales Header":
                case EDocumentProcessingPhase of
                    EDocumentProcessingPhase::Release:
                        begin
                            SourceDocumentHeader.Field(SalesHeader.FieldNo("Customer Posting Group")).TestField();
                            SourceDocumentHeader.Field(SalesHeader.FieldNo("Posting Date")).TestField();
                        end;
                    EDocumentProcessingPhase::Post:
                        begin
                            SourceDocumentHeader.Field(SalesHeader.FieldNo("Customer Posting Group")).TestField();
                            SourceDocumentHeader.Field(SalesHeader.FieldNo("Posting Date")).TestField();
                            SourceDocumentHeader.Field(SalesHeader.FieldNo("Bill-to Name")).TestField();
                        end;
                end;
        End;
    end;
    ```

- **Create:** Create a blob that represents the posted document.

    The core extension creates an "E-Document" record that has initial information. It automatically determines the type of the document, based on the source document. You can find the value in the **Document Type** field.

    The **Document Type** field is automatically identified by the core extension, based on the source document. If you've introduced your custom document type, you must extend the **E-Document Type** enum and populate the **E-Document Type** field.

    ```AL
    procedure Create(EDocumentService: Record "E-Document Service"; var EDocument: Record "E-Document"; var SourceDocumentHeader: RecordRef; var SourceDocumentLines: RecordRef; var TempBlob: Codeunit "Temp Blob")
    var
        OutStr: OutStream;
    begin
        TempBlob.CreateOutStream(OutStr);

        case EDocument."Document Type" of
            EDocument."Document Type"::"Sales Invoice":
                GenerateInvoiceXMLFile(SourceDocumentHeader, OutStr);
            EDocument."Document Type"::"Sales Credit Memo":
                GenerateCrMemoXMLFile(SourceDocumentHeader, OutStr);
        end;
    end;
    ```

- **CreateBatch:** Create a blob that represents a batch of posted documents.

    The functionality resembles the **Create** method. It lets you iterate through a collection of e-documents and generate a single blob that collectively represents them.

    ```AL
    procedure CreateBatch(EDocumentService: Record "E-Document Service"; var EDocuments: Record "E-Document"; var SourceDocumentHeaders: RecordRef; var SourceDocumentsLines: RecordRef; var TempBlob: Codeunit "Temp Blob")
    var
        OutStr: OutStream;
    begin
        TempBlob.CreateOutStream(OutStr);
        if EDocuments.FindSet() then
            repeat
                OutStr.WriteText(EDocuments."Document No.");
            until EDocuments.Next() = 0;
    end;
    ```

- **GetBasicInfo:** Get the basic information of an e-document from the received blob.

    ```AL
    procedure GetBasicInfo(var EDocument: Record "E-Document"; var TempBlob: Codeunit "Temp Blob")
    var
        XmlDoc: XmlDocument;
        DocInstr: InStream;
        NamespaceManager: XmlNamespaceManager;
    begin
        // Create an XML document from the blob
        TempBlob.CreateInStream(DocInstr);
        XmlDocument.ReadFrom(DocInstr, XmlDoc);

        // Parse the document to fill EDocument information
        EDocument."Bill-to/Pay-to No." := CopyStr(GetPEPPOLNode('//cac:InvoiceLine/cbc:ID', XmlDoc, NamespaceManager), 1, 20);
        EDocument."Bill-to/Pay-to Name" := CopyStr(GetPEPPOLNode('//cac:AccountingCustomerParty/cac:Party/cac:PartyName/cbc:Name', XmlDoc, NamespaceManager), 1, 20);
        Evaluate(EDocument."Document Date", GetPEPPOLNode('//cbc:IssueDate', XmlDoc, NamespaceManager));
        EDocument."Document Type" := EDocument."Document Type"::"Purchase Invoice";
    end;
    ```

- **PrepareDocument:** Create a document from the imported blob.

    ```AL
    procedure PrepareDocument(var EDocument: Record "E-Document"; var CreatedDocumentHeader: RecordRef; var CreatedDocumentLines: RecordRef; var TempBlob: Codeunit "Temp Blob")
    var
    begin

    end;
    ```

    > [!NOTE]  
    > The **Create** and **CreateBatch** methods generate a blob that's stored in the log table. When you export the blob, the E-Document Core app exports it without a predefined file extension. If you want to specify the file extension, use the following event subscriber.
    > 
    > ```AL
    > [EventSubscriber(ObjectType::Table, Database::"E-Document Log", 'OnBeforeExportDataStorage', '', false, false)]
    > local procedure MyProcedure()
    > begin
    > end;
    > ```

### Step 3 - Implement the integration interface

The **E-Document Core** integration interface comprises a collection of methods that are designed to streamline the process of integrating with endpoints for submitting electronic documents.

First, you must extend the enum and associate it with your implementation codeunit.

```AL
enumextension 50101 "EDocument Integration Ext" extends "E-Document Integration"
{
    value(50100; "Example Service")
    {
        Implementation = "E-Document Integration" = "Example Integration SVC";
    }
}
```

The following example shows how you can implement each method in the interface.

- **Send:** Send an e-document to an external service.

    ```AL
    procedure Send(var EDocument: Record "E-Document"; var TempBlob: Codeunit "Temp Blob"; var IsAsync: Boolean; var HttpRequest: HttpRequestMessage; var HttpResponse: HttpResponseMessage);
    var
        // Record that hold integration setup
        ExampleIntegration: Record "Example - Test Integration";
        HttpClient: HttpClient;
        Payload: Text;
    begin
        ExampleIntegration.Get();
        Payload := EDocumentHelper.TempBlobToTxt(TempBlob);

        // Manipulate the payload and set the headers if needed
        HttpRequest.Content.WriteFrom(Payload);
        HttpRequest.Method := 'POST';
        HttpRequest.SetRequestUri(ExampleIntegration."Sending Endpoint");

        HttpClient.Send(HttpRequest, HttpResponse);

        // Parse the response if needed.
    end;
    ```

- **SendBatch:** Send a batch of e-documents to an external service.

    ```AL
    procedure SendBatch(var EDocuments: Record "E-Document"; var TempBlob: Codeunit "Temp Blob"; var IsAsync: Boolean; var HttpRequest: HttpRequestMessage; var HttpResponse: HttpResponseMessage);
    var
        // Record that hold integration setup
        ExampleIntegration: Record "Example - Test Integration";
        HttpClient: HttpClient;
        Payload: Text;
    begin
        ExampleIntegration.Get();
        Payload := EDocumentHelper.TempBlobToTxt(TempBlob);

        // Manipulate the payload and set the headers if needed
        HttpRequest.Content.WriteFrom(Payload);
        HttpRequest.Method := 'POST';
        HttpRequest.SetRequestUri(ExampleIntegration."Sending Endpoint");

        HttpClient.Send(HttpRequest, HttpResponse);

        // Parse the response if needed.
    end;
    ```

- **GetResponse:** Get the response of an asynchronous send request.

    ```AL
    procedure GetResponse(var EDocument: Record "E-Document"; var HttpRequest: HttpRequestMessage; var HttpResponse: HttpResponseMessage): Boolean;
    var
        // Record that hold integration setup
        ExampleIntegration: Record "Example - Test Integration";
        HttpClient: HttpClient;
    begin
        ExampleIntegration.Get();

        // Manipulate the payload and set the headers if needed
        HttpRequest.Method := 'GET';
        HttpRequest.SetRequestUri(ExampleIntegration."Get Response Endpoint");

        HttpClient.Send(HttpRequest, HttpResponse);

        // Parse the response if needed.
    end;
    ```

- **GetApproval:** Check whether a document is approved or rejected.

    ```AL
    procedure GetResponse(var EDocument: Record "E-Document"; var HttpRequest: HttpRequestMessage; var HttpResponse: HttpResponseMessage): Boolean;
    var
        // Record that hold integration setup
        ExampleIntegration: Record "Example - Test Integration";
        HttpClient: HttpClient;
    begin
        ExampleIntegration.Get();

        // Manipulate the payload and set the headers if needed
        HttpRequest.Method := 'GET';
        HttpRequest.SetRequestUri(ExampleIntegration."Get Response Endpoint");

        HttpClient.Send(HttpRequest, HttpResponse);

        // Parse the response if needed.
    end;
    ```

- **GetApproval:** Check whether a document is approved or rejected.

    ```AL
    procedure GetApproval(var EDocument: Record "E-Document"; var HttpRequest: HttpRequestMessage; var HttpResponse: HttpResponseMessage): Boolean;
    var
        // Record that hold integration setup
        ExampleIntegration: Record "Example - Test Integration";
        HttpClient: HttpClient;
    begin
        ExampleIntegration.Get();

        // Manipulate the payload and set the headers if needed
        HttpRequest.Method := 'GET';
        HttpRequest.SetRequestUri(ExampleIntegration."Get Approval Endpoint");

        HttpClient.Send(HttpRequest, HttpResponse);

        // Parse the response if needed.
    end;
    ```

- **Cancel:** Send a cancel request for an e-document.

    ```AL
    procedure Cancel(var EDocument: Record "E-Document"; var HttpRequest: HttpRequestMessage; var HttpResponse: HttpResponseMessage): Boolean;
    var
        // Record that hold integration setup
        ExampleIntegration: Record "Example - Test Integration";
        HttpClient: HttpClient;
    begin
        ExampleIntegration.Get();

        // Manipulate the payload and set the headers if needed
        HttpRequest.Method := 'Delete';
        HttpRequest.SetRequestUri(ExampleIntegration."Cancel Endpoint");

        HttpClient.Send(HttpRequest, HttpResponse);

        // Parse the response if needed.
    end;
    ```

- **ReceiveDocument:** Receive an e-document from an external service.

    ```AL
    procedure ReceiveDocument(var TempBlob: Codeunit "Temp Blob"; var HttpRequest: HttpRequestMessage; var HttpResponse: HttpResponseMessage);
    var
        // Record that hold integration setup
        ExampleIntegration: Record "Example - Test Integration";
        HttpClient: HttpClient;
        Result: Text;
    begin
        ExampleIntegration.Get();

        HttpRequest.Method := 'GET';
        HttpRequest.SetRequestUri(ExampleIntegration."Receiving Endpoint");

        HttpClient.Send(HttpRequest, HttpResponse);

        HttpResponse.Content.ReadAs(Result);
        WriteToTempBlob(TempBlob, Result);
    end;
    ```

- **GetDocumentCountInBatch:** Define how many received documents are in a batch import.

    ```AL
    procedure GetDocumentCountInBatch(var TempBlob: Codeunit "Temp Blob"): Integer
    begin
        // Parse the TempBlob to find how many documents in the batch.
        exit(1);
    end;
    ```

- **GetIntegrationSetup:** Define the integration setup of a service.

    ```AL
    procedure GetIntegrationSetup(var SetupPage: Integer; var SetupTable: Integer)
    begin
        SetupPage := page::"Example - Test Integration";
        SetupTable := Database::"Example - Test Integration";
    end;
    ```

### Step 4 - Implement the setup wizard

Create a setup wizard that guides users through the process of configuring e-documents by gathering all details that are required for a seamless integration with the service.

1. Create the wizard page. This first page should introduce the feature.
2. Create a second page that includes integration setup information, such as URL endpoints, user names and passwords, certificates, and schema URIs.
3. On the third page, include setup information for the sending profiles.
4. If your service will submit documents to the endpoint, use the next page to get consent from the user and enable HTTP outgoing calls for the document core extension and your localization.

Here's an example of a wizard.

```AL
page 6138 "Edocument Setup Wizard"
{
    PageType = NavigatePage;
    ApplicationArea = All;
    Caption = 'E-Document setup wizard';

    layout
    {
        area(Content)
        {
            group(MediaStandard)
            {
                Caption = '';
                Editable = false;
                Visible = TopBannerVisible;
                field("MediaResourcesStandard Media Reference"; MediaResourcesStandard."Media Reference")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ShowCaption = false;
                }
            }
            group(FirstPage)
            {

                Caption = '';
                Visible = FirstStepVisible;
                group("IntroductionGroup")
                {
                    Caption = 'Welcome to Edocument service';
                    Visible = FirstStepVisible;

                    group(LearnMoreLinkGroup)
                    {
                        Caption = '';

                        field(CanLearnMore; YouCanLearnMoreTxt)
                        {
                            ApplicationArea = Basic, Suite;
                            ShowCaption = false;
                            Editable = false;
                            MultiLine = true;
                        }
                    }
                }
            }

            group(SetupService)
            {
                Caption = '';
                Visible = SetupServiceStepVisible;

                field("Service Name"; EdocFormat.Code)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Service Name';
                }
                field(Description; EdocFormat.Description)
                {
                    ApplicationArea = Basic, Suite;
                }
                field("Document Format"; EdocFormat."Document Format")
                {
                    ApplicationArea = Basic, Suite;
                }
                field("Service Integration"; EdocFormat."Service Integration")
                {
                    ApplicationArea = Basic, Suite;
                }

            }

            group(SetupSendingProfiles)
            {
                Caption = '';
                Visible = SetupSendingProfilesStepVisible;

                field(UseWithDefaultDocSendingProfile; UseWithDefaultDocSendingProfile)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Use with default Sending Profile';
                }
            }
            group(FinalPage)
            {
                Visible = FinalStepVisible;
                group("That's it!")
                {
                    Caption = 'That''s it!';

                    group(ChooseFinishGroup)
                    {
                        Caption = '';
                        Visible = true;
                        field(ChooseFinish; ChooseFinishTxt)
                        {
                            ApplicationArea = Basic, Suite;
                            ShowCaption = false;
                            Editable = false;
                            MultiLine = true;
                        }
                    }
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(ActionBack)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Back';
                Enabled = BackActionEnabled;
                Visible = BackActionEnabled;
                Image = PreviousRecord;
                InFooterBar = true;

                trigger OnAction()
                begin
                    NextStep(true);
                end;
            }
            action(ActionNext)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Next';
                Enabled = NextActionEnabled;
                Image = NextRecord;
                InFooterBar = true;

                trigger OnAction()
                begin
                    NextStep(false);
                end;
            }

            action(ActionFinishAndEnable)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Finish';
                Enabled = FinishActionEnabled;
                Image = Approve;
                InFooterBar = true;

                trigger OnAction()
                begin
                    FinishAndEnableAction();
                end;
            }
        }
    }

    trigger OnInit()
    begin
        LoadTopBanners();
    end;

    trigger OnOpenPage()
    begin
        Step := Step::Start;
        EnableControls();


    end;

    local procedure FinishAndEnableAction()
    var
        EDocumentHelper: codeunit "E-Document Helper";
    begin
        // Insert E-Document Services

        // Insert Document Sending Profile

        // Insert WorkFlows
        // You can find detailed examples in codeunit "E-Document Workflow Setup"

        // Enable EDocument Core extension to send http calls after getting user's consent
        EDocumentHelper.AllowEDocumentCoreHttpCalls();

        // Setup retention policy if needed
    end;

    local procedure LoadTopBanners()
    begin
        if MediaRepositoryStandard.Get('AssistedSetup-NoText-400px.png', Format(ClientTypeManagement.GetCurrentClientType())) and
           MediaRepositoryDone.Get('AssistedSetupDone-NoText-400px.png', Format(ClientTypeManagement.GetCurrentClientType()))
        then
            if MediaResourcesStandard.Get(MediaRepositoryStandard."Media Resources Ref") and
               MediaResourcesDone.Get(MediaRepositoryDone."Media Resources Ref")
            then
                TopBannerVisible := MediaResourcesDone."Media Reference".HasValue;
    end;

    local procedure NextStep(Backwards: Boolean)
    begin

        if Backwards then
            Step -= 1
        else
            Step += 1;

        EnableControls();
    end;

    local procedure EnableControls()
    begin
        ResetControls();

        case Step of
            Step::Start:
                ShowStartStep();
            Step::SetupService:
                ShowSetupServiceStep();
            Step::SetupSendingProfiles:
                ShowSetupSendingProfilesStep();
            Step::Finish:
                ShowFinalStep();
        END;
    end;

    local procedure ShowStartStep()
    begin
        FirstStepVisible := true;
        BackActionEnabled := false;
    end;

    local procedure ShowSetupServiceStep()
    begin
        FirstStepVisible := false;
        SetupServiceStepVisible := true;
        SetupSendingProfilesStepVisible := false;
        FinalStepVisible := false;

        BackActionEnabled := true;
    end;

    local procedure ShowSetupSendingProfilesStep()
    begin
        FirstStepVisible := false;
        SetupServiceStepVisible := false;
        SetupSendingProfilesStepVisible := true;
        FinalStepVisible := false;

        BackActionEnabled := true;
    end;

    local procedure ShowFinalStep()
    begin
        FirstStepVisible := false;
        SetupServiceStepVisible := false;
        SetupSendingProfilesStepVisible := false;
        FinalStepVisible := true;

        FinishActionEnabled := true;
        NextActionEnabled := false;
        BackActionEnabled := true;
    end;

    local procedure ResetControls()
    begin
        BackActionEnabled := true;
        NextActionEnabled := true;

        FirstStepVisible := false;
        SetupServiceStepVisible := false;
        SetupSendingProfilesStepVisible := false;
        FinalStepVisible := false;
    end;

    var
        MediaRepositoryStandard: Record "Media Repository";
        MediaRepositoryDone: Record "Media Repository";
        MediaResourcesStandard: Record "Media Resources";
        MediaResourcesDone: Record "Media Resources";
        EdocFormat: Record "E-Document Service" temporary;
        ClientTypeManagement: Codeunit "Client Type Management";

        Step: Option Start,SetupService,SetupSendingProfiles,Finish;
        TopBannerVisible: Boolean;
        BackActionEnabled, NextActionEnabled, FinishActionEnabled : Boolean;
        FirstStepVisible, SetupServiceStepVisible, SetupSendingProfilesStepVisible, FinalStepVisible : Boolean;
        UseWithDefaultDocSendingProfile: Boolean;
        YouCanLearnMoreTxt: Label 'This wizard helps you to setup a connection to an electronic invoicing setup.';
        ChooseFinishTxt: Label 'Click ''Finish'' to insert the service connection. \You will still have to setup the settings for the endpoint and import/export mapping.';
}
```

## Helper procedures

The following set of E-Document Helper codeunits is available. These codeunits consist of collections of utility methods that we highly recommend you use to build your localization app. These methods can help you with various tasks. For example, they can help you effortlessly log any error messages that are encountered.

- "E-Document Helper"
- "E-Document Error Helper"
- "E-Document Import Helper"

```AL
procedure Create(EDocumentService: Record "E-Document Service"; var EDocument: Record "E-Document"; var SourceDocumentHeader: RecordRef; var SourceDocumentLines: RecordRef; var TempBlob: Codeunit "Temp Blob")
    var
        EDocumentHelper: Codeunit "E-Document Helper";
        OutStr: OutStream;
    begin
        TempBlob.CreateOutStream(OutStr);

        case EDocument."Document Type" of
            EDocument."Document Type"::"Sales Invoice":
                if not GenerateInvoiceXMLFile(SourceDocumentHeader, OutStr) then
                    EDocumeneHelper.LogSimpleErrorMessage(EDocument, 'Error <> happened while creating this document');

            EDocument."Document Type"::"Sales Credit Memo":
                if not GenerateCrMemoXMLFile(SourceDocumentHeader, OutStr) then
                    EDocumeneHelper.LogSimpleErrorMessage(EDocument, 'Error <> happened while creating this document');
        end;
    end;
```

## Missing features

Do you believe that there are any essential features that could make the development of an e-document solution easier? If so, create the idea on aka.ms/BCIdeas, or start the topic on [aka.ms/BCYammer](https://aka.ms/BCYammer), and we'll get back to you.

## See also

[How to set up e-documents in Business Central](finance-how-setup-edocuments.md)  
[How to use e-documents in Business Central](finance-how-use-edocuments.md)  
[Work with [!INCLUDE[prod_short](includes/prod_short.md)]](ui-work-product.md)
