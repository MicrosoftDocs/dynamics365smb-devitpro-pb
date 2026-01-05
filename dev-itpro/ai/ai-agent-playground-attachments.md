---
title: Attachment capabilities and limitations
description: Learn about the capabilities and limitations when working with attachments in agent tasks within the Agent playground in Business Central. Understand supported file types, size limits, and best practices for document processing.
author: solsen
ms.author: solsen
ms.reviewer: solsen
ms.topic: concept-article
ms.collection:
  - get-started
  - bap-ai-copilot
ms.date: 01/05/2026
ms.update-cycle: 180-days
---

# Attachment capabilities and limitations

When working with attachments in agent tasks, be aware of the following capabilities and constraints.

## Supported file types

Agents can process attachments with the following file types:

- **PDF documents** (.pdf) - Invoices, purchase orders, contracts, reports
- **Image files** (.png, .jpg, .jpeg) - Scanned documents, receipts, product images

> [!NOTE]
> Be aware that agents only process text out of images and pdfs and not the images themselves.

## File size limits

<!-- The exact file size limit needs to be verified. -->

Attachments are subject to the standard file size limits in [!INCLUDE [prod_short](../includes/prod_short.md)]. [VERIFY: Specify the exact MB/GB limit here]

If you need to process large files:

- Consider splitting multi-page documents into smaller files
- Optimize PDF files by reducing image quality or removing embedded fonts
- Compress images before attaching
- Test with realistic file sizes during prototyping

## PDF page limits

When processing PDF documents, agents can handle up to **10 pages** per document. This limit applies to document extraction and processing capabilities.

**Considerations for multi-page PDFs:**

- Documents exceeding 10 pages might not be fully processed
- If you have documents with more than 10 pages, consider:
  - Splitting the document into smaller files (for example, by invoice or section)
  - Extracting only relevant pages before attaching
  - Processing the document in multiple tasks
- Test your document processing scenarios with typical document sizes during prototyping

> [!NOTE]
> The 10-page limit addresses known limitations with multi-page PDF processing. Always test with representative documents to ensure your scenarios work within these constraints.

### Process attachments with custom logic

By default, when you attach a file to an agent task, the agent processes it using built-in capabilities. However, you can implement custom document processing logic to extract specific fields or use specialized services.

#### Use custom document analyzers

If you need to use a custom Azure AI Document Intelligence analyzer or other content understanding services, you can implement your own processing logic in AL:

```al
local procedure CreateTaskWithCustomProcessing()
var
    AgentTaskBuilder: Codeunit "Agent Task Builder";
    AgentTaskMessageBuilder: Codeunit "Agent Task Message Builder";
    DocumentAnalyzer: Codeunit "My Document Analyzer"; // Your custom analyzer
    TempBlob: Codeunit "Temp Blob";
    InStr: InStream;
    ExtractedData: Text;
begin
    // Load your document
    TempBlob.CreateInStream(InStr);
    
    // Process with your custom analyzer to extract specific fields
    ExtractedData := DocumentAnalyzer.ExtractInvoiceFields(InStr);
    
    // Create task with extracted data in the message
    AgentTaskMessageBuilder
        .Initialize('Document Processing', 
            'Process invoice with the following extracted data: ' + ExtractedData)
        .AddAttachment('invoice.pdf', 'application/pdf', InStr);

    AgentTaskBuilder
        .Initialize(AgentUserSecurityId, 'Process Invoice')
        .AddTaskMessage(AgentTaskMessageBuilder)
        .Create();
end;
```

This approach allows you to:

- Use Azure AI Document Intelligence with custom-trained models
- Extract only the specific fields relevant to your scenario
- Apply business logic before passing data to the agent
- Integrate with third-party document processing services
- Pre-validate document content before agent processing

#### Example: Custom invoice processing

```al
local procedure ProcessVendorInvoiceWithCustomAnalyzer(InvoicePDF: InStream)
var
    AgentTaskBuilder: Codeunit "Agent Task Builder";
    AgentTaskMessageBuilder: Codeunit "Agent Task Message Builder";
    AIDocIntelligence: Codeunit "Azure AI Doc Intelligence";
    InvoiceData: JsonObject;
    VendorName: Text;
    InvoiceNumber: Text;
    TotalAmount: Decimal;
    TaskMessage: Text;
begin
    // Use your custom Content Understanding connection
    InvoiceData := AIDocIntelligence.AnalyzeInvoice(InvoicePDF, 'CustomInvoiceModel');
    
    // Extract specific fields
    VendorName := GetJsonValue(InvoiceData, 'VendorName');
    InvoiceNumber := GetJsonValue(InvoiceData, 'InvoiceNumber');
    TotalAmount := GetJsonDecimal(InvoiceData, 'TotalAmount');
    
    // Create structured message for agent with extracted data
    TaskMessage := StrSubstNo(
        'Process vendor invoice:\n' +
        'Vendor: %1\n' +
        'Invoice No: %2\n' +
        'Amount: %3\n' +
        'Please validate and create purchase invoice.',
        VendorName, InvoiceNumber, TotalAmount);
    
    AgentTaskMessageBuilder
        .Initialize('System', TaskMessage)
        .AddAttachment('vendor-invoice.pdf', 'application/pdf', InvoicePDF)
        .SetSkipMessageSanitization(true);

    AgentTaskBuilder
        .Initialize(AgentUserSecurityId, 'Vendor Invoice - ' + InvoiceNumber)
        .SetExternalId('VINV-' + InvoiceNumber)
        .AddTaskMessage(AgentTaskMessageBuilder)
        .Create();
end;
```

### Best practices for document processing

Follow these best practices when working with document attachments:

#### Choose the right approach

- **Use attachments** when you need the agent to understand document structure and context
- **Use extracted data** when you only need specific fields and want to control what the agent sees
- **Combine both approaches** by attaching the original document for reference while providing extracted data in the message

#### Optimize documents for processing

- **Keep PDFs within the 10-page limit** - Split larger documents or extract relevant pages
- **Use clear, high-quality scans** - Ensure text is readable if using image-based PDFs
- **Remove unnecessary pages** - Cover pages, blank pages, or marketing materials can be excluded
- **Test with real documents** - Use actual invoices, purchase orders, or receipts from your business during prototyping

#### Handle errors gracefully

```al
local procedure CreateTaskWithErrorHandling(DocumentStream: InStream; FileName: Text)
var
    AgentTaskBuilder: Codeunit "Agent Task Builder";
    AgentTaskMessageBuilder: Codeunit "Agent Task Message Builder";
begin
    if not ValidateDocumentSize(DocumentStream) then
        Error('Document exceeds maximum file size');
    
    if not ValidateDocumentType(FileName) then
        Error('Unsupported file type. Please use PDF, PNG, or JPG files');
    
    // Proceed with task creation
    AgentTaskMessageBuilder
        .Initialize('User', 'Process this document')
        .AddAttachment(FileName, GetMimeType(FileName), DocumentStream);

    AgentTaskBuilder
        .Initialize(AgentUserSecurityId, 'Process Document')
        .AddTaskMessage(AgentTaskMessageBuilder)
        .Create();
end;
```

#### Provide context in instructions

When agents process documents, include guidance in your agent instructions:

- Specify which fields to extract or validate
- Define how to handle missing or unclear information
- Explain business rules for document validation
- Indicate when to request human review

Example instruction excerpt:

```text
When processing invoice attachments:
1. Extract: Vendor name, invoice number, date, line items, and total amount
2. Validate that the vendor exists in the system
3. Check that line items match expected formats
4. If any required field is missing or unclear, mark the task for manual review
5. For invoices over $10,000, always request supervisor approval
```

### Add messages to existing tasks

Continue conversations by adding new messages to existing agent tasks:

```al
local procedure AddMessageToExistingTask(ExternalId: Text; MessageText: Text)
var
    AgentTaskRecord: Record "Agent Task";
    AgentTask: Codeunit "Agent Task";
    AgentTaskMessageBuilder: Codeunit "Agent Task Message Builder";
begin
    // Get the existing task by its external ID
    AgentTaskRecord := AgentTask.GetTaskByExternalId(AgentUserSecurityId, ExternalId);
    
    // Add a new message to the task
    AgentTaskMessageBuilder
        .Initialize('User', MessageText)
        .SetRequiresReview(true)
        .AddToTask(AgentTaskRecord);
    
    // Restart the task if it's completed or stopped
    if AgentTask.CanSetStatusToReady(AgentTaskRecord) then
        AgentTask.SetStatusToReady(AgentTaskRecord);
end;
```

This pattern is useful for:

- Providing additional information after the initial task creation
- Continuing multi-turn conversations with your agent
- Simulating email thread continuations

### Manage task lifecycle

Monitor and control running tasks:

```al
local procedure ManageAgentTask(var AgentTask: Record "Agent Task")
var
    AgentTaskCU: Codeunit "Agent Task";
begin
    // Check task status
    if AgentTaskCU.IsTaskRunning(AgentTask) then
        Message('Task is still running');
    
    if AgentTaskCU.IsTaskCompleted(AgentTask) then
        Message('Task completed successfully');
    
    // Restart a stopped task
    if AgentTaskCU.CanSetStatusToReady(AgentTask) then
        AgentTaskCU.SetStatusToReady(AgentTask);
    
    // Stop a running task
    AgentTaskCU.StopTask(AgentTask, true);
end;
```

## Related information

[Overview (preview)](ai-agent-playground-landing-page.yml)  
[Create and activate (preview)](ai-agent-playground-create.md)  
[Write effective instructions (preview)](ai-agent-playground-effective-instructions.md)  
[Instruction keywords (preview)](ai-agent-playground-instruction-keywords.md)  
[Integrate with the Tasks AL API (preview)](ai-agent-playground-tasks-api.md)  
[Set up permissions and profiles (preview)](ai-agent-playground-permissions-profiles.md)  
[Run a playground agent (preview)](ai-agent-playground-run-agent.md)  
[Iterate and manage (preview)](ai-agent-playground-iterate.md)  
[Agent playground frequently asked questions (preview)](ai-agent-playground-faq.md)  
[Best practices (preview)](ai-agent-playground-best-practices.md)  
[Create a Sales Validation Agent (preview)](ai-agent-playground-sales-validation.md)  
[Transparency note: Business Central agent playground](transparency-note-agent-playground.md)