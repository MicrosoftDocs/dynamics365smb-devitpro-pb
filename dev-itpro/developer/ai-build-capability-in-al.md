---
title: Build an AI capability in AL
description: Integrate with Azure OpenAI Service through the AI module of Business Central.
author: SusanneWindfeldPedersen
ms.author: solsen
ms.reviewer: 
ms.topic: conceptual
ms.collection: get-started
ms.date: 12/08/2023
ms.custom: bap-template
---

# Build an AI capability in AL

This article explains how to integrate with Azure OpenAI Service through the AI module of [!INCLUDE [prod_short](includes/prod_short.md)]. It covers how to register the capability and how to use the AI module to call the Azure OpenAI Service API and generate text. 

## Overview of the AI module

The AI module of [!INCLUDE [prod_short](includes/prod_short.md)] integrates with Azure OpenAI Service and provides a set of AL objects that you can use to build AI capabilities. The AI module is designed for LLMs and supports test and embeddings generation. It doesn't support image generation like DALL-E or transcribing speech to text like Whisper. 

The AI module is available in the System Application, in the System.AI namespace. For reference documentation, see [System and Base Application Reference](/dynamics365/business-central/application).

The AI module can be used in any AL extension and provides the following capabilities:

- Support for test and embeddings generation
- Ease of control and viewing the copilot capabilities in the environment
- Telemetry on a capability’s registration/usages/errors and more

## Prerequisites

To build an AI capability in AL, you need the following:

- An Azure OpenAI Resource URL, such as: `https://[resourcename].openai.azure.com/`
- The Azure Deployment Name, such as: MyGPT3.5
- An Azure OpenAI API key

For more information on how to obtain this, see [aka.ms/oaiapply](https://aka.ms/oaiapply) for requesting access and [Get started with Azure OpenAI Service](ai-dev-tools-get-started.md) to help get started.

## Building an AI capability

The System.AI namespace provides many objects that you can use to build the AI capability. The following tables list some of these objects and their purpose. 

Under Copilot you find the following objects:

|Object | Object type | Purpose |
|-------|-------------|---------|
|Copilot Capability|Codeunit|Used to register, modify, and delete Copilot capabilities.|
|Copilot Availability|Enum|The availability of the Copilot Capability; it can either be in preview or generally available.|
|Copilot Capability|Enum|Defines the capabilities that can be registered.|

Under Azure OpenAI you find the following objects:

|Object | Object type | Purpose | 
|-------|-------------|---------|
|Azure OpenAI |Codeunit| Provides functionality for using the Azure OpenAI API.|
|AOAI Operation Response|Codeunit|Monitors the status and result of an operation.|
|AOAI Model Type| Enum |The supported model types for Azure OpenAI; `Embeddings`, `Text Completions`, and `Chat Completions`.|
|AOAI Chat Messages|Codeunit|Helper functions for the AOAI Chat Message table. This is where you set your own metaprompt. For more information, see [Metaprompt](ai-build-capability-in-al.md#metaprompt).|
|AOAI Text Completion Params| Codeunit|Optional parameters that can be modified for text generation.|
|AOAI Chat Completion Params| Codeunit|Optional parameters that can be modified for chat generation.|
|AOAI Chat Roles|Enum|The chat roles available for chat generation; `User`, `System`, and `Assistant`. `User` defines when the end user inputs text to the chat, `System` defines guiding the system, for example, by giving a metaprompt, and `Assistant` defines when the model returns output.|

For more information, see [System reference](/dynamics365/business-central/application/system/module/system).

### Registering an AI capability

A new AI capability must be registered with the AI module. Every extension must register with the `Copilot Capability` codeunit, and if the capability isn't registered with the extension, which is using it, an error is thrown. The registered capability shows up in the **Copilot & AI Capabilities** page in [!INCLUDE [prod_short](includes/prod_short.md)]. The capability can be deactivated from this page, but doesn't change the registration of the capability.

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

Next, you add a codeunit that registers the capability. Here the codeunit is of the type `Install`, which ensures that the capability is discoverable and ready to use at installation time. The codeunit could also be of the type `Upgrade`. The following example shows how to register the capability for drafting a job. The `RegisterCapability` procedure registers the capability if it isn't already registered and registers it as generally available. The `LearnMoreUrlTxt` parameter is optional and can be used to provide a link in the **Copilot & AI Capabilities** page in [!INCLUDE [prod_short](includes/prod_short.md)] to provide more information about the capability.

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
            CopilotCapability.RegisterCapability(
            Enum::"Copilot Capability"::“Draft a Job", 
            Enum::"Copilot Availability"::"Generally Available", LearnMoreUrlTxt);
    end;
}
```

### Saving the authorization

When the prerequisites are met, and you have retrieved an endpoint URL, an Azure OpenAI deployment, and an Azure OpenAI API key, you must save the authorization information.

> [!TIP]  
> It's recommended to create a page, from which you can type in these three keys, so that you're not hardcoding any values.

The following example shows how to save the authorization information by calling the `Azure OpenAI` codeunit. The `SetAuthorization` procedure saves the authorization information in the `IsolatedStorage` object, which provides isolation between extensions, so that you can keep keys/values in one extension from being accessed from other extensions. The ApiKey variable is defined as `SecretText`, which means that it isn't available to the debugger for inspection.

An alternative to using the `IsolatedStorage` object, if you're building an AppSource app, is to use the AppSource Key Vault. For more information, see [Setting up App Key Vaults for Business Central Online](../administration/setup-app-key-vault.md).

```al
local procedure SetAuthorization(var AzureOpenAI: Codeunit "Azure OpenAI")
var
    Endpoint: Text;
    Deployment: Text;
    Apikey: SecretText;
begin
    IsolatedStorage.Get('Endpoint', Endpoint);
    IsolatedStorage.Get('Deployment', Deployment);
    IsolatedStorage.Get('Apikey', Apikey);

    AzureOpenAI.SetAuthorization(Enum::"AOAI Model Type"::"Chat Completions", Endpoint, Deployment, Apikey);
end;
```

### Generation

Next, you can use the `Azure OpenAI` codeunit to generate text. The following `CopilotJob` codeunit shows how to generate text from a prompt. The codeunit contains the following elements:

The `Generate` procedure takes a prompt as a parameter and returns the generated text. It calls the other procedures to set up the authorization, parameters, and capability for the generation. The `SetAuthorization` sets the authorization information as described in the previous section, and uses the `AzureOpenAI` object to set the endpoint and key for the service.

The `SetParameters` sets the parameters that define the max number of tokens that can be used for the generation and at which temperature the generation should be set. The temperature is a number between 0 and 2 that controls how creative the model is when generating text. Higher values mean more creativity, but also more errors. Lower values mean more accuracy, but also more boring text. This example sets the temperature to 0, which outputs a well-defined answer. For more information, see [Azure OpenAI Service REST API reference](/azure/ai-services/openai/reference).

The `SetCopilotCapability` call sets the capability for the generation. It uses the `IsolatedStorage` object to get the metaprompt from the storage. The metaprompt is a special message that tells the model what kind of text to generate. For more information, see [Metaprompt](ai-build-capability-in-al.md#metaprompt). 

Then, the `AddUserMessage` call adds a user message to the chat history. The user message is what you want to generate text from. Next, the `GenerateChatCompletion` call generates the chat completion based on the user message and input parameters. It uses the `AzureOpenAI` object to call the service and get the response. The `IsSuccess` method checks if the operation was successful, and finally, the `GetLastMessage` call returns the last message from the chat history. The last message is the generated text that you want to use.


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

A *metaprompt* is a prompt used to define the model’s profile, capabilities, and limitations for the implementation of your scenario. It's used to improve the performance of language models and to provide a better user experience. The metaprompt defines the output format of the model and provides examples to demonstrate the intended behavior of the model. The metaprompt also provides other behavioral guardrails to ensure that the model doesn't generate undesirable content. For more information, see [System message framework and template recommendations for Large Language Models (LLMs)](/azure/ai-services/openai/concepts/system-message). For guidance on responsible AI, see [Responsible AI](ai-responsible-ai.md).


## Next steps

When you've registered the AI capability, authorized through Azure OpenAI, and written code that generates text based on the metaprompt and the user input, you can now build the interface for handling the user input and generated output. For next steps, see [Design the user experience](ai-build-experience.md).
