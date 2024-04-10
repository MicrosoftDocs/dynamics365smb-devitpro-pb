---
title: Function calling in AI
description: Learn how to call functions in Azure OpenAI.
author: SusanneWindfeldPedersen
ms.author: solsen
ms.reviewer: 
ms.topic: reference
ms.collection:
  - get-started
  - bap-ai-copilot
ms.date: 04/09/2024
ms.custom: bap-template 
---

# Function calling in AI

The model has access to various tools that enable it to perform extra features. Currently, these tools include Code Interpreter, Knowledge retrieval, and Function calling. 

The concept of function calling enables you to provide a description of functions to the Assistant. In response, the Assistant identifies the appropriate function that needs to be invoked, along with the necessary arguments. The specific function and its corresponding arguments are determined based on the user's input. The function calling tool is designed to parse essential details from user's natural language input and use this as arguments for the functions that you've defined. This way, it bridges the gap between human language and programmatic functions, making the interaction more intuitive and user-friendly.

There are many scenarios that you can use function calling for, such as:

- To help determine the intent of the input. 
  - If you have two functions, “Document lookup” and “Item lookup” and the input is “I need the items from the last invoice”, the intent would be to document lookup as it needs the last invoice.  
  - Another example would be “I need two red bicycles”, now the intent would be item lookup, as it needs to find what corresponds closest to red bicycles. 

An end-to-end scenario for you receiving an email to purchase some items, would look something like this: 

1. Determine the intent of the email.  
  If it's just a regular email, they’d like to purchase items etc.
2. Extract contact information if the contact doesn't exist.
3. Extract what items they would like to purchase and create an invoice.  

## Function calling - "AOAI Chat Messages" codeunit

In the [!INCLUDE [prod_short](includes/prod_short.md)] system application, there's a codeunit that can help you ... The codeunit is located in GitHub BCApps repo in the following path: <!-- to be inserted -->. For more information, see [“AOAI Chat Messages” codeunit](/dynamics365/business-central/application/system-application/codeunit/system.ai.aoai-chat-messages).

BCApps/src/System Application/App/AI/src/Azure OpenAI/Chat Completion/AOAIChatMessages.Codeunit.al at main · microsoft/BCApps (github.com) 

The “AOAI Chat Messages” codeunit has many methods, the following methods are some of them:

- [AddTool](/dynamics365/business-central/application/system-application/codeunit/system.ai.aoai-chat-messages#addtool)  
- [ModifyTool](/dynamics365/business-central/application/system-application/codeunit/system.ai.aoai-chat-messages#modifytool)  
- [DeleteTool](/dynamics365/business-central/application/system-application/codeunit/system.ai.aoai-chat-messages#deletetool)  
- [GetTools](/dynamics365/business-central/application/system-application/codeunit/system.ai.aoai-chat-messages#gettools)  
- [ToolsExist](/dynamics365/business-central/application/system-application/codeunit/system.ai.aoai-chat-messages#toolsexists)  
- [SetAddToolsToPayload](/dynamics365/business-central/application/system-application/codeunit/system.ai.aoai-chat-messages#setaddtoolstopayload)  
- [SetToolChoice](/dynamics365/business-central/application/system-application/codeunit/system.ai.aoai-chat-messages#settoolchoice)  
- [GetToolChoice](/dynamics365/business-central/application/system-application/codeunit/system.ai.aoai-chat-messages#gettoolchoice)  

## Code snippet

```al

procedure WeatherCopilot()
    var
        AzureOpenAI: Codeunit "Azure OpenAI";
        AOAIDeployments: Codeunit "AOAI Deployments";
        AOAIChatMessages: Codeunit "AOAI Chat Messages";
        AOAIChatCompletionParams: Codeunit "AOAI Chat Completion Params";
        AOAIOperationResponse: Codeunit "AOAI Operation Response";
        ResponseJsonObject: JsonObject;
        ApiKey: Text;
    begin
    	// Set authorization, capability etc
        // ...
        // Set temperature to 0 for fixed json output
        AOAIChatCompletionParams.SetTemperature(0);
        // Add tool
        AOAIChatMessages.AddTool(GetWeatherCopilotFunction());
        // Set tool choice to added tool
        AOAIChatMessages.SetToolChoice('{"type": "function","function": {"name": "get_current_weather"}}');
        // Mock user input
        AOAIChatMessages.AddUserMessage('What is the weather like in San Francisco?');

		// Call generate
        AzureOpenAI.GenerateChatCompletion(AOAIChatMessages, AOAIChatCompletionParams, AOAIOperationResponse);
        // Upon success, process output
        if AOAIOperationResponse.IsSuccess() then begin
            ResponseJsonObject.ReadFrom(AOAIOperationResponse.GetResult());
            ProcessWeatherCopilotResponse(ResponseJsonObject);
        end
    end;
```

```al
procedure ProcessWeatherCopilotResponse(Response: JsonObject)
    var
        Array: JsonArray;
        Token: JsonToken;
        Object: JsonObject;
        Location: Text;
        Unit: Option Celcius,Fahrenheit;
    begin
        Response.Get('tool_calls', Token);
        Array := Token.AsArray();
        if not Array.Get(0, Token) then exit;
        Object := Token.AsObject();
        if not Object.Get('type', Token) then exit;
        if Token.AsValue().AsText() = 'function' then begin
            Object.Get('function', Token);
            Object := Token.AsObject();
            Object.Get('name', Token);
            if Token.AsValue().AsText() = 'get_current_weather' then begin
                Object.Get('arguments', Token);
                Object := Token.AsObject();
                Object.Get('location', Token);
                Location := Token.AsValue().AsText();

                Unit := Unit::Celcius;
                if Object.Get('unit', Token) then
                    if Token.AsValue().AsText() = 'fahrenheit' then
                        Unit := Unit::Fahrenheit;

                Message(GetWeather(Location, Unit));
            end;
        end;
    end;

```
 
## Things to consider

When using the Function Calling tool, you can set the tool choice to either `Auto` or `Specific` function in the `SetToolChoice` method. `Auto` is the default if not set. The response can be either a function or a regular chat message response. Setting it to `Specific` function guarantees the response always calls the function. Even if the intent and context don't match the function, as such, the developer should validate the arguments.

## See also

[Get set up with Azure OpenAI Service](ai-dev-tools-get-started.md)  
[Token counting in AI](ai-system-app-token-counting.md)  