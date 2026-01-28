---
title: Define and register an agent (preview)
description: Learn how to define and register AI agents in Dynamics 365 Business Central using the Agent SDK.
author: solsen
ms.author: solsen
ms.reviewer: solsen
ms.topic: concept-article
ms.collection:
  - get-started
  - bap-ai-copilot
ms.date: 01/21/2026
ms.update-cycle: 180-days
---

# Define and register an agent (preview)

[This article is prerelease documentation and is subject to change.]

[!INCLUDE [ai-designer-preview](../includes/ai-designer-preview.md)]

To define an agent in AL, you need to extend the enum that defines the available types of agents and to implement several interfaces that configure how the agent is created, how it presents itself in the UI, and how it runs tasks.

## Register the agent type

Register your agent by extending the `Agent Metadata Provider` enum. This creates a unique identifier for your agent type and specifies which codeunits implement the required interfaces.

```al
enumextension 50101 "My Agent Metadata Provider" extends "Agent Metadata Provider"
{
    value(50101; "My Agent")
    {
        Caption = 'My Agent';
        Implementation = IAgentFactory = MyAgentFactory, 
                         IAgentMetadata = MyAgentMetadata, 
                         IAgentTaskExecution = MyAgentTaskExecution;
    }
}
```

## Register the Copilot capability

Each agent type must have a corresponding Copilot capability registered. This capability acts simultaneously as a feature switch and an overview for your agent. Register your capability by extending the `Copilot Capability` enum:

```al
enumextension 50100 "My Agent Copilot Capability" extends "Copilot Capability"
{
    value(50100; "My Agent Capability")
    {
        Caption = 'My Agent';
    }
}
```

The capability enum value must be unique across all installed extensions. This capability is referenced by the `IAgentFactory` interface to link your agent type to its AI capabilities.

The Copilot capability must also be registered when your extension is installed. Use an install codeunit to register the capability with the `Copilot Capability` codeunit:

```al
codeunit 50101 "My Agent Install"
{
    Subtype = Install;
    Access = Internal;

    trigger OnInstallAppPerDatabase()
    begin
        RegisterCapability();
    end;

    local procedure RegisterCapability()
    var
        CopilotCapability: Codeunit "Copilot Capability";
        LearnMoreUrlTxt: Label 'link-to-your-documentation', Locked = true;
    begin
        if not CopilotCapability.IsCapabilityRegistered(Enum::"Copilot Capability"::"My Agent Capability") then
            CopilotCapability.RegisterCapability(
            Enum::"Copilot Capability"::"My Agent Capability",
            Enum::"Copilot Availability"::Preview,
            "Copilot Billing Type"::"Microsoft Billed",
            LearnMoreUrlTxt);
    end;
}
```

The `RegisterCapability` method takes the capability enum value, an availability level (such as `Preview` or `GenerallyAvailable`), and a URL to documentation about the capability. This registration makes your agent visible in the Copilot & AI Capabilities page.

## IAgentFactory interface

The `IAgentFactory` interface defines how agent instances are created and configured. This interface is called by the agent framework when creating new agent instances or when displaying agent creation options in the UI.

### Define the setup page

The `GetFirstTimeSetupPageId` method returns the ID of the page displayed when configuring a new agent instance for the first time. This is different from `GetSetupPageId` on the `IAgentMetadata` interface, which is used for subsequent configuration of existing agents.

Both methods typically return the same page ID, but they serve different purposes:

- `GetFirstTimeSetupPageId` (IAgentFactory): Called during initial agent creation
- `GetSetupPageId` (IAgentMetadata): Called when editing an existing agent's configuration

The source table of the setup page must contain a `User Security ID` field of type Guid. The runtime uses this field to provide the agent user ID when the page is opened.

```al
procedure GetFirstTimeSetupPageId(): Integer
begin
    exit(Page::"My Agent Setup");
end;
```

### Control agent instance creation

The `ShowCanCreateAgent` method controls whether users can create new agent instances through the UI. This method allows for fine-grained control of agent instance creation. Note that returning `false` doesn't prevent programmatic creation of agents.

Common patterns for this method:

- **Single-instance agent**: Return `true` only if no instances of the agent exist
- **Conditional creation**: Return `true` only if specific licensing or configuration conditions are met
- **Always allow creation**: Always return `true`
- **Creation only via code**: Always return `false`

```al
procedure ShowCanCreateAgent(): Boolean
var
    MyAgentSetup: Record "My Agent Setup";
begin
    // Example: Only allow one instance of this agent
    exit(MyAgentSetup.IsEmpty());
end;
```

### Set the default profile

The `GetDefaultProfile` method provides the default user profile assigned to new agent instances. The profile determines which Role Center and UI elements the agent uses when navigating the application.

```al
procedure GetDefaultProfile(var TempAllProfile: Record "All Profile" temporary)
begin
    TempAllProfile."Profile ID" := 'ACCOUNTANT';
    TempAllProfile."App ID" := SystemApplicationAppId;
    TempAllProfile.Insert();
end;
```

### Set the default permissions

The `GetDefaultAccessControls` method provides the default permission sets assigned to new agent instances. These permissions determine what data and operations the agent can access.

```al
procedure GetDefaultAccessControls(var TempAccessControlBuffer: Record "Access Control Buffer" temporary)
begin
    TempAccessControlBuffer."Role ID" := 'D365 BASIC';
    TempAccessControlBuffer.Scope := TempAccessControlBuffer.Scope::System;
    TempAccessControlBuffer.Insert();
end;
```

## IAgentMetadata interface

The `IAgentMetadata` interface provides runtime metadata for individual agent instances. Unlike `IAgentFactory`, which handles creation, this interface is called during agent execution and UI rendering to retrieve instance-specific information.

### Customize the task message review page

The `GetAgentTaskMessagePageId` method returns the ID of the page used to display agent task messages. The source table of this page must be the `Agent Task Message` table. If you don't need a custom message display, return the default `Page::"Agent Task Message Card"`.

```al
procedure GetAgentTaskMessagePageId(AgentUserId: Guid; MessageId: Guid): Integer
begin
    exit(Page::"Agent Task Message Card");
end;
```

### Add agent-level annotations

The `GetAgentAnnotations` method returns annotations (errors or warnings) to display for the agent at the agent level. These annotations are not persisted and are regularly requested by the server. Use this method to validate preconditions for agent operation, such as licensing requirements or the validity of its configuration.

```al
procedure GetAgentAnnotations(AgentUserId: Guid; var Annotations: Record "Agent Annotation")
var
    MyAgentLicenseMgt: Codeunit "My Agent License Mgt.";
    LicenseMissingMsg: Label 'Agent license not found.';
    LicenseMissingDetailsTxt: Label 'A premium license is required to use this agent. Please contact your administrator to add the necessary license.';
begin
    Clear(Annotations);
    
    if not MyAgentLicenseMgt.IsLicenseActive() then begin
        Annotations.Code := 'LICENSE001';
        Annotations.Severity := Annotations.Severity::Error;
        Annotations.Message := LicenseMissingMsg;
        Annotations.Details := LicenseMissingDetailsTxt;
        Annotations.Insert();
    end;
end;
```

### Define a summary page with KPIs

The `GetSummaryPageId` method returns the ID of the page shown when users hover over the agent icons in the role center. This summary page displays important KPIs relevant to the agent. The page only supports displaying numeric values.

```al
procedure GetSummaryPageId(AgentUserId: Guid): Integer
begin
    exit(Page::"My Agent Summary");
end;
```

## IAgentTaskExecution interface

The `IAgentTaskExecution` interface controls how agents process and execute tasks. These methods are executed in the context of the agent user and allow fine-tuning of agent behavior during task execution.

### Validate and post-process messages

The `AnalyzeAgentTaskMessage` method analyzes the content of agent task messages and their attachments. This method is called for both input (incoming) and output (outgoing) messages, allowing you to validate inputs and post-process outputs.

For input messages, you can add annotations to flag issues:

- **Error annotations** stop the task from being processed further
- **Warning annotations** trigger a request for user intervention

For output messages, you can modify the content before it's sent (for example, adding an email signature).

```al
procedure AnalyzeAgentTaskMessage(AgentTaskMessage: Record "Agent Task Message"; var Annotations: Record "Agent Annotation")
begin
    if AgentTaskMessage.Type = AgentTaskMessage.Type::Output then
        PostProcessOutputMessage(AgentTaskMessage)
    else
        ValidateInputMessage(AgentTaskMessage, Annotations);
end;

local procedure ValidateInputMessage(AgentTaskMessage: Record "Agent Task Message"; var Annotations: Record "Agent Annotation")
var
    AgentMessage: Codeunit "Agent Message";
    MyAgentRelevance: Codeunit "My Agent Relevance";
    MessageText: Text;
    NotRelevantMsg: Label 'This message does not appear to be relevant to sales order processing.';
    NotRelevantDetailsTxt: Label 'The agent is designed to handle sales orders. Please provide a message related to sales order creation, updates, or inquiries.';
begin
    MessageText := AgentMessage.GetText(AgentTaskMessage);
    
    if not MyAgentRelevance.IsMessageRelevant(MessageText) then begin
        Annotations.Code := 'RELEVANCE001';
        Annotations.Severity := Annotations.Severity::Warning;
        Annotations.Message := NotRelevantMsg;
        Annotations.Details := NotRelevantDetailsTxt;
        Annotations.Insert();
    end;
end;

local procedure PostProcessOutputMessage(var AgentTaskMessage: Record "Agent Task Message")
var
    AgentMessage: Codeunit "Agent Message";
    OldText: Text;
    SignatureTxt: Label '\n\nWritten with the help of AI\n';
begin
    OldText := AgentMessage.GetText(AgentTaskMessage);
    AgentMessage.UpdateText(AgentTaskMessage, OldText + SignatureTxt);
end;
```

> [!NOTE]
> For implementing relevance checks with Azure OpenAI, see [Developer tools for Copilot](../developer/developer-tools-for-copilot-overview.md).


### Provide user intervention suggestions

The `GetAgentTaskUserInterventionSuggestions` method provides contextual suggestions when the agent requests assistance. These suggestions help guide users on what actions they can take to help the agent complete its task.

Each suggestion includes:

- **Summary**: A user-friendly title for the suggestion
- **Description**: Context about when this suggestion applies (used by the system to determine relevance)
- **Instructions**: Detailed steps for the agent to follow

```al
procedure GetAgentTaskUserInterventionSuggestions(
    AgentTaskUserInterventionRequestDetails: Record "Agent User Int Request Details"; 
    var Suggestions: Record "Agent Task User Int Suggestion")
var
    ApproveSalesOrderLbl: Label 'Approve the sales order';
    // Descriptions are locked as they are used internally to decide relevance
    ApproveSalesOrderDescriptionLbl: Label 'Use when the agent needs approval to proceed with a sales order.', Locked = true;
    ApproveSalesOrderInstructionsLbl: Label 'Review the sales order details and click Approve if everything is correct.';
    ProvideMissingCustomerInfoLbl: Label 'Provide missing customer information';
    ProvideMissingCustomerInfoDescriptionLbl: Label 'Use when customer data is incomplete or invalid.', Locked = true;
    ProvideMissingCustomerInfoInstructionsLbl: Label 'Update the customer record with the correct information, then retry the task.';
begin
    if AgentTaskUserInterventionRequestDetails.Type = AgentTaskUserInterventionRequestDetails.Type::Assistance then begin
        Suggestions.Summary := ApproveSalesOrderLbl;
        Suggestions.Description := ApproveSalesOrderDescriptionLbl;
        Suggestions.Instructions := ApproveSalesOrderInstructionsLbl;
        Suggestions.Insert();
        
        Suggestions.Summary := ProvideMissingCustomerInfoLbl;
        Suggestions.Description := ProvideMissingCustomerInfoDescriptionLbl;
        Suggestions.Instructions := ProvideMissingCustomerInfoInstructionsLbl;
        Suggestions.Insert();
    end;
end;
```

## Related information

[Agent SDK (preview)](ai-agent-sdk-overview.md)  
[Agent setup and configuration (preview)](ai-agent-sdk-configuration.md)  
[Managing agent tasks (preview)](ai-agent-sdk-tasks.md)  
[Overview (preview)](ai-agent-designer-landing-page.yml)  
[Agent designer (preview)](ai-agent-designer.md)  
