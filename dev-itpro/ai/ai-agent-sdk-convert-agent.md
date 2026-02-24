---
title: Convert an agent to AL code (preview)
description: Learn how to convert an agent created in Business Central to an agent defined in AL code for distribution in an AL application.
author: solsen
ms.author: solsen
ms.reviewer: solsen
ms.topic: concept-article
ms.collection:
  - get-started
  - bap-ai-copilot
ms.date: 02/23/2026
ms.update-cycle: 180-days
---

# Convert an agent to AL code (preview)

[This article is prerelease documentation and is subject to change.]

[!INCLUDE [ai-designer-preview](../includes/ai-designer-preview.md)]

When you have prototyped and tested your agent in [!INCLUDE [prod_short](../includes/prod_short.md)], you can convert it to AL code and package it as part of an AL application. This allows you to distribute your agent to other environments and customers, and also to integrate it with other AL code and business processes.

## Export the agent

As a first step, the agent can be exported via [!INCLUDE [prod_short](../includes/prod_short.md)] so that the developer can have an overview of everything that the agent includes. An exported agent consists of the following components:

- Identifying information, name, display name, and initials
- Instructions
- Default permission sets
- Default profile
- Agent user settings

All of these components have to be included in the AL application to define your agent.

## Create an AL application for your agent

Review [Coding agents in AL (preview)](ai-agent-sdk-overview.md) to create an AL application for your agent. This application both applies the settings specific to your exported agents and introduces the necessary AL objects for an agent like the interfaces, setup page, summary page, and so on.

## Adapt the exported agent to AL

### Instructions

Instructions have to be applied to every agent instance during creation. If using the agent template, then the instruction resource file has to be changed to contain the instructions exported by your agent.

### Default permission sets

To apply the permission sets, the `GetDefaultAccessControls` method has to be implemented for the `IAgentFactory` interface. There the required permission sets should be inserted into the temporary record.
If the agent is using a permission set created in [!INCLUDE [prod_short](../includes/prod_short.md)], the permission set should be created in AL first.

```al
procedure GetDefaultAccessControls(var TempAccessControlTemplate: Record "Access Control Buffer" temporary)
begin
    SalesValAgentSetup.GetDefaultAccessControls(TempAccessControlTemplate);
end;
```

```al
procedure GetDefaultAccessControls(var TempAccessControlBuffer: Record "Access Control Buffer" temporary)
var
    BaseApplicationAppIdTok: Label '437dbf0e-84ff-417a-965d-ed2bb9650972', Locked = true;
    D365ReadPermissionSetTok: Label 'D365 READ', Locked = true;
    D365SalesPermissionSetTok: Label 'D365 SALES', Locked = true;
begin
    Clear(TempAccessControlBuffer);
    TempAccessControlBuffer."Company Name" := CopyStr(CompanyName(), 1, MaxStrLen(TempAccessControlBuffer."Company Name"));
    TempAccessControlBuffer.Scope := TempAccessControlBuffer.Scope::System;
    TempAccessControlBuffer."App ID" := BaseApplicationAppIdTok;
    TempAccessControlBuffer."Role ID" := D365ReadPermissionSetTok;
    TempAccessControlBuffer.Insert();

    TempAccessControlBuffer.Init();
    TempAccessControlBuffer."Company Name" := CopyStr(CompanyName(), 1, MaxStrLen(TempAccessControlBuffer."Company Name"));
    TempAccessControlBuffer.Scope := TempAccessControlBuffer.Scope::System;
    TempAccessControlBuffer."App ID" := BaseApplicationAppIdTok;
    TempAccessControlBuffer."Role ID" := D365SalesPermissionSetTok;
    TempAccessControlBuffer.Insert();
end;
```

### Default profile

The default profile can also be defined via the `GetDefaultProfile` method required by the `IAgentFactory` interface. If the profile is created in [!INCLUDE [prod_short](../includes/prod_short.md)] or contains customizations created in the UI, they must also be included in the application in the form of a profile object and page customizations.

```al
procedure GetDefaultProfile(var TempAllProfile: Record "All Profile" temporary)
var
    DefaultProfileTok: Label 'SALES VALIDATION AGENT', Locked = true;
    CurrentModuleInfo: ModuleInfo;
begin
    NavApp.GetCurrentModuleInfo(CurrentModuleInfo);
    Agent.PopulateDefaultProfile(DefaultProfileTok, CurrentModuleInfo.Id, TempAllProfile);
end;
```

### Agent user settings and identifying information

Identifying information for the agent can be specified when creating the agent in the setup page.

```al
...
    AgentSetup.GetSetupRecord(
        AgentSetupBuffer,
        Rec."User Security ID",
        Enum::"Agent Metadata Provider"::"Sales Validation Agent",
        AgentNameLbl + ' - ' + CompanyName(),
        DefaultDisplayNameLbl,
        AgentSummaryLbl);
...
```

For localization settings, you can use the [UpdateLocalizationSettings](https://microsoft.github.io/BCApps/reference/system-application/Codeunit/System.Agents.Agent.html#updatelocalizationsettings) method from the `Agent` codeunit.

### Triggering the agent

When an agent is packaged as part of an application, tasks for it are meant to be triggered via AL code. Follow the guidance in [Managing agent tasks programmatically](ai-agent-sdk-tasks.md) to understand how to create tasks for your agent as part of a business process, event, or other integration scenarios.

## Sales Validation Agent as an AL application

You can visit the [BCTech Sales Validation Agent Sample](https://github.com/microsoft/BCTech/tree/master/samples/BCAgents/SalesValidationAgent) to see how the Sales Validation Agent can be packaged as an app. This can be used as a starter template to develop and publish your own agents.

## Related information

[Overview (preview)](ai-development-toolkit-landing-page.yml)
[Export and import agents](ai-development-toolkit-export-import.md)
[Coding agents in AL (preview)](ai-agent-sdk-overview.md)
[Managing agent tasks programmatically](ai-agent-sdk-tasks.md)
[BCTech Sales Validation Agent Sample](https://github.com/microsoft/BCTech/tree/master/samples/BCAgents/SalesValidationAgent)
[Transparency note: Business Central AI development toolkit (preview)](transparency-note-ai-development-toolkit.md)
