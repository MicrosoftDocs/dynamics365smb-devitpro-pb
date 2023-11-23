---
title: Introduction to developing generative AI experiences for your extensions
description: Learn about the basic tasks to creating a copilot for your solution.
author: jswymer
ms.author: jswymer
ms.reviewer: jswymer
ms.topic: how-to 
ms.collection:
ms.date: 11/22/2023
ms.custom: bap-template
---

# Developing generative AI experiences overview

Developing a copilot requires working with several different components. In this article, we'll walk you through the necessary tasks to build a copilot for Business Central.

## Essential components

A copilot in Business Central extension involves three essential components:

- The prompt dialog page for creating the UI for the copilot.
- The AI module of the system application that provides the programming interface between Business Central and Azure Open AI Service.
- An Azure OpenAI resource, which is a service offered by Microsoft Azure that enables developers to use the OpenAI natural language processing models to build intelligent applications.

![Shows the tasks in the generative-AI development](media/dev-generative-ai-overview.svg)

To develop an effective copilot, you'll need to work with each of these components.

## Getting set up with Azure OpenAI Service

Before you can get started with creating a copilot in Business Central, you must apply for access to Azure OpenAI Service. Once you're approved, you can create an Azure OpenAI resource in the Azure portal. From this resource, you get your API key and deployment name.

To learn more, go to [Get setup with Azure OpenAI Service](ai-dev-tools-get-started.md).

## Building AI capability using the AI module of system application

The AI module of the Business Central system application provides the API for communicating with Azure OpenAI. In this task, you use the AI module to define the application logic to request and retrieve AI-generated content from the Azure OpenAI service.

The AI module of the Business Central system application provides the API for communicating with Azure OpenAI. In this task, you use the AI module to define the application logic in AL code to request and retrieve AI-generated content from the Azure OpenAI service. 

To learn more, go to [Build AI capability in app](ai-build-capability-in-al.md).

## Designing the copilot user interface

The copilot user interface is an essential component of any copilot experience. In this task, you design the copilot user interface by using a PromptDialog type page. This page enables users to input their requirements, start the generation process, review the output, and save it. The PromptDialog page can be customized to suit the needs of your specific extension and can include fields for user input, buttons for initiating the generation process, and fields for displaying the generated content.

To learn more, go to [Design the Copilot user experience](ai-build-experience.md).

## See also

[Integrating AI using developer tools for copilot](ai-integration-landing-page.yml)

