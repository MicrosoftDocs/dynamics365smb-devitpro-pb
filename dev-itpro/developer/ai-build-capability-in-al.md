---
title: Build an AI capability in AL
description: Integrate with Azure OpenAI Service through the AI module of Business Central.
author: SusanneWindfeldPedersen
ms.author: solsen
ms.reviewer: 
ms.topic: conceptual
ms.collection: get-started
ms.date: 11/15/2023
ms.custom: bap-template
---

# Build an AI capability in AL

This article explains how to integrate with Azure OpenAI Service through the AI module of [!INCLUDE [prod_short](includes/prod_short.md)]. It covers how to register the capability and how to use the AI module to call the Azure OpenAI Service API and generate text. 

## Overview of the AI module

The AI module of [!INCLUDE [prod_short](includes/prod_short.md)] integrates with Azure OpenAI Service and provides a set of AL objects that you can use to build AI capabilities. The AI module is designed for LLMs and supports text generation like GPT-3, chatbots, and embeddings. It doesn't support image generation like DALL-E or transcribing speech to text like Whisper. 

The AI module is available in the System Application, in the System.AI namespace. For reference documentation, see [System and Base Application Reference](/dynamics365/business-central/application).

The AI module can be used in any AL extension and provides the following capabilities:

- Support for text generation like GPT-3, chatbots, and embeddings
- Ease of control and viewing the copilot capabilities in the environment
- Telemetry on a capability’s registration/usages/errors and more

## Prerequisites

To build an AI capability in AL, you need the following:

- An Azure OpenAI Resource URL, such as: `https://[resourcename].openai.azure.com/`
- The Azure Deployment Name 
    - MyGPT3.5
- An Azure OpenAI API key

For more information, see [Get started with Azure OpenAI Service](ai-dev-tools-get-started.md).

## Building an AI capability

The System.AI namespace provides a number of objects that you can use to build the AI capability. The following tables lists some of these objects and their purpose. 

In the Copilot namespace, you'll find the following objects:

|Object | Object type | Purpose |
|-------|-------------|---------|
|Copilot Capability|Codeunit|Used to register, modify, and delete Copilot capabilities.|
|Copilot Availability|Enum|The availability of the Copilot Capability; it can either be in preview or generally available.|
|Copilot Capability|Enum|Defines the capabilities that can be registered.|

In the Azure OpenAI namespace, you'll find the following objects:

|Object | Object type | Purpose | 
|-------|-------------|---------|
|Azure OpenAI |Codeunit| Provides functionality for using the Azure OpenAI API.|
|AOAI Operation Response|Codeunit|Monitors the status and result of an operation.|
|AOAI Model Type| Enum |The supported model types for Azure OpenAI; `Embeddings`, `Text Completions`, and `Chat Completions`.|
|AOAI Chat Messages|Codeunit|Helper functions for the AOAI Chat Message table. This is where you set your own metaprompt. For more information, see [Metaprompt](ai-build-capability-in-al.md#metaprompt).|
|AOAI Text Completion Params| Codeunit|Optional parameters that can be modified for text generation.|
|AOAI Chat Completion Params| Codeunit|Optional parameters that can be modified for chat generation.|
|AOAI Chat Roles|Enum|The chat roles available for chat generation; `User`, `System`, and `Assistant`.|

For more information, see [System reference](/dynamics365/business-central/application/system/module/system).

### Registering an AI capability

A new AI capability must be registered with the AI module. Every extension must register with the `Copilot Capability` codeunit, and if the capability isn't registered with the extension, which is using it, an error will be thrown. The registered capability will show up in the **Copilot and AI Capabilities** page in [!INCLUDE [prod_short](includes/prod_short.md)]. The capability can be deactivated from this page, but doesn't change the registration of the capability.

To register the capability, you add an `enumextension` of the **Copilot Capability** enum. The following example shows how to register a new capability for drafting a job.

```al
enumextension 54320 "Copilot Capability Extension" extends "Copilot Capability"
{
    value(54300; “Draft a job")
    {
        Caption = ‘Draft a Job';
    }
}
```

Next, you add a codeunit that registers the capability. The following example shows how to register the capability for drafting a job in a codeunit of the type `install`. Registering at installation time, ensures that the capability is discoverable and ready to use. The `RegisterCapability` procedure registers the capability if it isn't already registered.

```al
codeunit 54310 "Secrets And Capabilities Setup"
{
    Subtype = Install;
    InherentEntitlements = X;
    InherentPermissions = X;
    Access = Internal;
 
    trigger OnInstallAppPerDatabase()
    begin
        RegisterCapability();
    end;

    local procedure RegisterCapability()
    var
        CopilotCapability: Codeunit "Copilot Capability";
        LearnMoreUrlTxt: Label 'https://example.com/DraftaJob', Locked = true;
    begin
        if not CopilotCapability.IsCapabilityRegistered(Enum::"Copilot Capability"::“Draft a Job") then
            CopilotCapability.RegisterCapability(Enum::"Copilot Capability"::“Draft a Job", Enum::"Copilot Availability"::"Generally Available", LearnMoreUrlTxt);
    end;
}
```

### Saving the authorization

When the prerequisites are met, and you have retrieved an endpoint URL, an Azure OpenAI deployment, and an Azure OpenAI API key, you must save the authorization information. The following example shows how to save the authorization information by calling the the `Azure OpenAI` codeunit. The `SetAuthorization` procedure saves the authorization information in the `IsolatedStorage` object. An alternative to the `IsolatedStorage` object is to use the AppSource Key Vault. For more information, see []().

```al
local procedure SetAuthorization(var AzureOpenAI: Codeunit "Azure OpenAI")
var
    Endpoint: Text;
    Deployment: Text;
    [NonDebuggable]
    Apikey: Text;
begin
    IsolatedStorage.Get('Endpoint', Endpoint);
    IsolatedStorage.Get('Deployment', Deployment);
    IsolatedStorage.Get('Apikey', Apikey);

    AzureOpenAI.SetAuthorization(Enum::"AOAI Model Type"::"Chat Completions", Endpoint, Deployment, Apikey);
end;
```

### Generation

Next, you can use the `Azure OpenAI` codeunit to generate text. The following `CopilotJob` codeunit shows how to generate text. 

The `Generate` procedure takes a prompt as a parameter and returns the generated text. 
The `SetAuthorization` procedure sets the authorization information as described in the previous section.

The `SetParameters` procedure sets the parameters that define the max number of tokens that can be used for the generation and at which temperature the generation should be set. The temperature is defined as what sampling temperature to use, and can be set to a number between 0 and 2. Higher values means that the model will take more risks. 0 (argmax sampling) can be set for generation with a well-defined answer, whereas 0.9 will allow for more creative applications. For more information, see [Azure OpenAI Service REST API reference](/azure/ai-services/openai/reference).

The `SetCopilotCapability` procedure sets the capability for the generation. 
The `IsolatedStorage.Get` procedure gets the metaprompt from the `IsolatedStorage` object.
The `SetPrimarySystemMessage` procedure then sets metaprompt as the primary system message. For more information, see [Metaprompt](ai-build-capability-in-al.md#metaprompt).

The `AddUserMessage` procedure adds a user message. 
The `GenerateChatCompletion` procedure generates the chat completion based on the user message and input parameters. 
The `IsSuccess` procedure checks if the operation was successful. 
The `GetLastMessage` procedure returns the last message.

```al
codeunit 54334 "CopilotJob"
{
    procedure Generate(Prompt: Text): Text
    var
        AzureOpenAI: Codeunit "Azure OpenAI";
        AOAIOperationResponse: Codeunit "AOAI Operation Response";
        AOAIChatCompletionParams: Codeunit "AOAI Chat Completion Params";
        AOAIChatMessages: Codeunit "AOAI Chat Messages";
        Metaprompt: Text;
        Result: Text;
    begin
        SetAuthorization(AzureOpenAI);
        SetParameters(AOAIChatCompletionParams);
        AzureOpenAI.SetCopilotCapability(Enum::"Copilot Capability"::“Draft a Job");
        IsolatedStorage.Get('DescribeJobMetaprompt', Metaprompt);
        AOAIChatMessages.SetPrimarySystemMessage(Metaprompt);
        AOAIChatMessages.AddUserMessage(Prompt);
        AzureOpenAI.GenerateChatCompletion(AOAIChatMessages, AOAIChatCompletionParams, AOAIOperationResponse);
        if AOAIOperationResponse.IsSuccess() then
            Result := AOAIChatMessages.GetLastMessage();
        exit(Result);
    end;
    local procedure SetParameters(var AOAIChatCompletionParams: Codeunit "AOAI Chat Completion Params")
    begin
        AOAIChatCompletionParams.SetMaxTokens(2500);
        AOAIChatCompletionParams.SetTemperature(0);
    end;
}
```

### Metaprompt

The metaprompt is a prompt that is used to define the model’s profile, capabilities, and limitations for the implementation of your scenario. It's used to improve the performance of language models and to provide a better user experience. The metaprompt defines the output format of the model and provides examples to demonstrate the intended behavior of the model. The metaprompt also provides additional behavioral guardrails to ensure that the model doesn't generate undesirable content. For more information, see [System message framework and template recommendations for Large Language Models (LLMs)](/azure/ai-services/openai/concepts/system-message).



<!--add your content here-->

<!--Next steps - Required. Provide at least one next step and no more than three. Include some context so the customer can determine why they would click the link.-->
## Next steps
