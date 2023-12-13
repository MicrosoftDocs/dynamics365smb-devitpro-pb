---
title: Build the copilot capability in AL
description: Integrate with Azure OpenAI Service through the AI module of Business Central.
author: SusanneWindfeldPedersen
ms.author: solsen
ms.reviewer: 
ms.topic: conceptual
ms.collection: get-started
ms.date: 12/08/2023
ms.custom: bap-template
---

# Build the copilot capability in AL

Your extensions can enhance Copilot in [!INCLUDE [prod_short](includes/prod_short.md)] with one or more features known as copilot capabilities. This article explains how to register a new capability, and how to integrate with the Azure OpenAI Service API to generate text through the AI module of [!INCLUDE [prod_short](includes/prod_short.md)] centered around an example of a copilot capability to draft a project plan.

## Overview of the AI module

The AI module of [!INCLUDE [prod_short](includes/prod_short.md)] integrates with Azure OpenAI Service and provides a set of AL objects that you can use to build AI capabilities. The AI module is designed for Large Language Models (LLMs) such as GPT. It doesn't support image generation like DALL-E or transcribing speech to text like Whisper. 

The AI module is available in the System Application, in the System.AI namespace. For reference documentation, see [System and Base Application Reference](/dynamics365/business-central/application).

The AI module can be used in any AL extension and provides the following capabilities:

- Support for text completion, chat completion, and embeddings
- Discoverability of your AI capability alongside other capabilities.
- An enabler for AI transparency, control and data governance for customers.
- Built-in prompt guard rails to build AI responsibly.
- Usage insights about your AI capability through telemetry.

> [!NOTE]  
> Chat completion is a feature of LLMs that generates responses in a sequenced thread, and is an alternative to text completion prompt engineering. It's not the same as Copilot chat in [!INCLUDE [prod_short](includes/prod_short.md)]. The upcoming preview of Chat with Copilot won't be extensible and the AI module can't be used to influence chat. For more information, see [Chat with Copilot](https://learn.microsoft.com/dynamics365/release-plan/2023wave2/smb/dynamics365-business-central/chat-copilot).

> [!TIP]  
> To see the AI module in action, try the example extension available at [BCTech on GitHub](https://aka.ms/BCStartCodingWithAI).

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
|[Copilot Capability](/dynamics365/business-central/application/system-application/codeunit/system.ai.copilot-capability)|Codeunit|Used to register, modify, and delete Copilot capabilities.|
|[Copilot Availability](/dynamics365/business-central/application/system-application/enum/system.ai.copilot-availability)|Enum|The availability of the Copilot Capability; it can either be in preview or generally available.|
|[Copilot Capability](/dynamics365/business-central/application/system/enum/system.ai.copilot-capability)|Enum|Defines the capabilities that can be registered.|

Under Azure OpenAI you find the following objects:

|Object | Object type | Purpose | 
|-------|-------------|---------|
|[Azure OpenAI](/dynamics365/business-central/application/system-application/codeunit/system.ai.azure-openai)|Codeunit| Provides functionality for using the Azure OpenAI API.|
|[AOAI Operation Response](/dynamics365/business-central/application/system-application/codeunit/system.ai.aoai-operation-response)|Codeunit|Monitors the status and result of an operation.|
|[AOAI Model Type](/dynamics365/business-central/application/system-application/enum/system.ai.aoai-model-type)| Enum |The supported model types for Azure OpenAI; `Embeddings`, `Text Completions`, and `Chat Completions`.|
|[AOAI Chat Messages](/dynamics365/business-central/application/system-application/codeunit/system.ai.aoai-chat-messages)|Codeunit|Helper functions for the AOAI Chat Message table. This is where you set your own metaprompt. For more information, see [Metaprompt](ai-build-capability-in-al.md#metaprompt).|
|[AOAI Text Completion Params](/dynamics365/business-central/application/system-application/codeunit/system.ai.aoai-text-completion-params)| Codeunit|Optional parameters that can be modified for text generation.|
|[AOAI Chat Completion Params](/dynamics365/business-central/application/system-application/codeunit/system.ai.aoai-chat-completion-params)| Codeunit|Optional parameters that can be modified for chat generation.|
|[AOAI Chat Roles](/dynamics365/business-central/application/system-application/enum/system.ai.aoai-chat-roles)|Enum|The chat roles available for chat generation; `User`, `System`, and `Assistant`. `User` defines when the end user inputs text to the chat, `System` defines guiding the system, for example, by giving a metaprompt, and `Assistant` defines when the model returns output.|

For more information, see [System application reference](/dynamics365/business-central/application/system-application/module/system-application).

### Registering an AI capability

A new AI capability must be registered with the AI module. Every extension must register with the `Copilot Capability` codeunit, and if the capability isn't registered with the extension, which is using it, an error is thrown. The registered capability shows up in the **Copilot & AI Capabilities** page in [!INCLUDE [prod_short](includes/prod_short.md)]. The capability can be deactivated from this page, but doesn't change the registration of the capability. All capabilities are active by default, and customer administrators can deactivate the capability from this page at any time.

To register the capability, you add an `enumextension` of the **Copilot Capability** enum. The following example shows how to register a new capability for drafting a project plan.

```al
enumextension 54320 "Copilot Capability Extension" extends "Copilot Capability"
{
    value(54300; “Draft a job")
    {
        Caption = ‘Draft a Job';
    }
}
```

Next, you add a codeunit that registers the capability. Here the codeunit is of the type `Install`, which ensures that the capability is discoverable and ready to use at installation time. The codeunit could also be of the type `Upgrade`. The following example shows how to register the capability for drafting a project plan. The `RegisterCapability` procedure registers the capability if it isn't already registered and registers it as generally available. The `LearnMoreUrlTxt` parameter is optional and can be used to provide a link in the **Copilot & AI Capabilities** page in [!INCLUDE [prod_short](includes/prod_short.md)] to provide more information for customer administrators to learn more about the purpose and safety of your capability.

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

Regarding the `"Copilot Availability"`, you can choose `Preview` for the first release of your capability to signal to your customers that the capability is ready for production, but subject to change and welcoming their feedback.

### Saving the authorization

When the prerequisites are met, and you have retrieved an endpoint URL, an Azure OpenAI deployment, and an Azure OpenAI API key, you must save the authorization information and make sure that you're not hardcoding any values.

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

Next, you can use the `Azure OpenAI` codeunit to generate text. The following `CopilotJob` codeunit shows how to generate text from a prompt and creates drafts for a project plan. The codeunit contains the following elements:

The `Generate` procedure takes a prompt as a parameter and returns the generated text. It calls the other procedures to set up the authorization, parameters, and capability for the generation. The `SetAuthorization` sets the authorization information as described in the previous section, and uses the `AzureOpenAI` object to set the endpoint and key for the service.

The `SetParameters` sets the parameters that define the max number of tokens that can be used for the generation and at which temperature the generation should be set. The temperature is a number between 0 and 2 that controls how creative the model is when generating text. Higher values are typically ideal for creative use cases, while lower values result in more deterministic and consistent completion. This example sets the temperature to 0, which outputs a well-defined answer. For more information, see [Azure OpenAI Service REST API reference](/azure/ai-services/openai/reference).

The `SetCopilotCapability` call sets the capability for the generation. The `SetPrimarySystemMessage` call uses the `IsolatedStorage` object to get the metaprompt from the storage. The primary system message will be included in all chat histories unlike regular system messages. The metaprompt is a special message that tells the model what kind of text to generate. For more information, see [Metaprompt](ai-build-capability-in-al.md#metaprompt). 

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

A *metaprompt* is a prompt used to define the model’s profile, capabilities, and limitations for the implementation of your scenario. It's used to improve the performance of language models and to provide a better user experience. The metaprompt defines the output format of the model and provides examples to demonstrate the intended behavior of the model. The metaprompt also provides other behavioral guardrails to ensure that the model doesn't generate undesirable content. For more information, see [System message framework and template recommendations for Large Language Models (LLMs)](/azure/ai-services/openai/concepts/system-message).


## Next steps

When you've registered the AI capability, authorized through Azure OpenAI, and written code that generates text based on the metaprompt and the user input, you can now build the interface for handling the user input and generated output. For next steps, see [Design the user experience](ai-build-experience.md).

## See also

[Get started with Azure OpenAI Service](ai-dev-tools-get-started.md)  
[Design the user experience](ai-build-experience-overview.md)  

