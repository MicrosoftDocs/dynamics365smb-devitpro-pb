---
title: Function calling in AI
description: Learn how to call functions in Azure OpenAI.
author: SusanneWindfeldPedersen
ms.author: solsen
ms.topic: reference
ms.collection:
  - get-started
  - bap-ai-copilot
ms.date: 04/11/2024
ms.custom: bap-template
ms.reviewer: solsen
---

# Function calling in AI

The model has access to various tools that enable it to perform extra features. Currently, these tools include Code interpreter, Knowledge retrieval, and Function calling. 

The concept of function calling enables you to provide a description of functions to the Assistant. In response, the Assistant identifies the appropriate function that needs to be invoked, along with the necessary arguments. The specific function and its corresponding arguments are determined based on the user's input. The function calling tool is designed to parse essential details from user's natural language input and use this as arguments for the functions that you've defined. This way, it bridges the gap between human language and programmatic functions, making the interaction more intuitive and user-friendly.

There are many scenarios that you can use function calling for, one is to determine the intent of the input:

An example could be the following. You have two functions, "Document lookup" and "Item lookup". If the user input is "I need the items from the last invoice", the inferred intent would be to trigger a document lookup, as it requires information from the last invoice. If the user input is instead "I need two red bicycles", the inferred intent would be to perform an item lookup, as it aims to locate the closest match to red bicycles.

In an end-to-end scenario, where you receive an email to purchase some items, the steps look something like this: 

1. Determine the intent of the email:  
  If it's just a regular email, that the customer would like to purchase items etc.
2. Extract the contact information if the contact doesn't already exist.
3. Extract what items the customer would like to purchase and create an invoice.  

## Function calling - "AOAI Chat Messages" codeunit

In the [!INCLUDE [prod_short](includes/prod_short.md)] system application, you find the "AOAI Chat Messages" codeunit. It's located on GitHub in the following path: [https://github.com/microsoft/BCApps/blob/main/src/System%20Application/App/AI/src/Azure%20OpenAI/Chat%20Completion/AOAIChatMessages.Codeunit.al](https://github.com/microsoft/BCApps/blob/main/src/System%20Application/App/AI/src/Azure%20OpenAI/Chat%20Completion/AOAIChatMessages.Codeunit.al). 

For more documentation, see [“AOAI Chat Messages” codeunit](/dynamics365/business-central/application/system-application/codeunit/system.ai.aoai-chat-messages).

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

The following code snippet demonstrates how to use the function calling tool in the Azure OpenAI service. The example shows how to set the temperature to 0 for fixed JSON output, add a tool, set the tool choice to the added tool, mock user input, call generate, and process the output.


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
        // Set temperature to 0 for fixed JSON output
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