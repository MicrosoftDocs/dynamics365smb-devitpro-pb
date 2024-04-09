---
title: Function Calling in AI
description: Learn how to call functions in Azure OpenAI
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


# Function Calling in AI

The model has access to a variety of tools that enable it to perform additional features. Currently, these tools include Code Interpreter, Knowledge Retrieval, and Function Calling. 

The Function Calling tool allows you to describe functions to the Assistant and have it return the function that needs to be called along with its respective arguments. The function to be called and arguments depend on the user input. The Function Calling tool is used to extract key information from natural language and use it as arguments for your functions. 

There are many scenarios that ou can use function calling for:

- A scenario could be determining the intent of the input. 
- If you have two functions, “Document lookup” and “Item lookup” and the input is “I need the items from the last invoice”, the intent would be to document lookup as it needs the last invoice.  
- Another example would be “I need two red bicycles”, now the intent would be item lookup, as it needs to find what corresponds closest to red bicycles. 

An end-to-end scenario would be something like, you receiving an email to purchase some items. 

1. Determine the intent of the email.  
  If it is just a regular email, they’d like to purchase items etc. 
2. Extract contact information if the contact does not exist.
3. Extract what items they would like to purchase and create an invoice  

## Function calling - AOAIChatMessages codeunit

In the [!INCLUDE [prod_short](includes/prod_short.md)] system application, there's a codeunit that can help you ... The codeunit is located in GitHub BCApps repo in the following path: <!-- to be inserted -->.

BCApps/src/System Application/App/AI/src/Azure OpenAI/Chat Completion/AOAIChatMessages.Codeunit.al at main · microsoft/BCApps (github.com) 

The “AOAI Chat Messages” codeunit has the following methods:

- AddTool 
- ModifyTool 
- DeleteTool 
- ClearTools 
- GetTools 
- ToolsExist 
- SetAddToolsToPayload 
- SetToolChoice 
- GetToolChoice 

## Code snippet

procedure WeatherCopilot() 

    var 

        AzureOpenAI: Codeunit "Azure OpenAI"; 

        AOAIChatCompletionParams: Codeunit "AOAI Chat Completion Params"; 

        AOAIChatMessages: Codeunit "AOAI Chat Messages"; 

        AOAIOperationResponse: Codeunit "AOAI Operation Response"; 

        ResponseJsonObject: JsonObject; 

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

 

procedure ProcessWeatherCopilotResponse(Response: JsonObject) 

    var 

        Token: JsonToken; 

        Array: JsonArray; 

        Object: JsonObject; 

        Location: Text; 

        Unit: Enum "Unit"; 

    begin 

        if not Response.Get('tool_calls', Token) then exit; 

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

                Unit := Unit::Celsius; 

                if Object.Get('unit', Token) then 

                    if Token.AsValue().AsText() = 'fahrenheit' then 

                        Unit := Unit::Fahrenheit; 

                Message(GetWeather(Location, Unit)); 

            end; 

        end; 

    end; 

 

    procedure GetWeather(Location: Text; Unit: Enum "Unit"): Text 

    begin 

        // Call weather API 

    end; 

 

Things to note 

SetToolChoice 

Auto 

This is the default if not set. The response can be either a function or a regular chat message response. 

Specific function 

This guarantees the response will always call the function. Even if the intent and context do not match the function, as such, the arguments should be validated by the developer. 