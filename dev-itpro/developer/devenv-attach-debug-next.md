---
title: Attach and Debug Next in Business Central
description: Attach the AL debugger to an existing or next session in Business Central. Configure web client, web service, background, and agent session debugging.
ms.custom: bap-template
ms.date: 10/15/2026
ms.reviewer: solsen
ms.topic: how-to
author: SusanneWindfeldPedersen
ms.author: solsen
---

# Attach and debug next

[!INCLUDE[2019_releasewave2.md](../includes/2019_releasewave2.md)]

Attach the AL debugger to an existing session or wait for the next session to troubleshoot code without launching it from Visual Studio Code. When the session runs code that reaches a breakpoint, the debugger stops so that you can inspect the code.

<!--
> [!NOTE]
> To use the attach functionality, you must make sure that your app is published with <kbd>Ctrl</kbd>+<kbd>F5</kbd> first, or with <kbd>Alt</kbd>+<kbd>Ctrl</kbd>+<kbd>F5</kbd> for [RAD](devenv-rad-publishing.md) publishing, before you start the debugging session with <kbd>F5</kbd>. Creating a new server session from the client can be achieved for example by launching a new client session. Pressing <kbd>F5</kbd> (Refresh) in a browser might not create a new server session, because it's cached, but if a session is expired and refreshed that will create a new session.
-->

## Prepare to attach the debugger

Make sure the app version you want to debug is published to the target environment and matches your source. Attaching doesn't publish the app. To publish local changes without debugging, select a launch configuration and press <kbd>Ctrl</kbd>+<kbd>F5</kbd>. For [RAD publishing](devenv-rad-publishing.md), press <kbd>Ctrl</kbd>+<kbd>Alt</kbd>+<kbd>F5</kbd>.

To debug code in another extension, that extension must allow debugging. Learn more in [Debug AL code](devenv-debugging.md).

By default, the debugger targets a session that belongs to the user signed in to Visual Studio Code. To debug another user's session, specify `userId` or that user's `sessionId`. The user starting the debugger needs permission to attach to another user's session. The **D365 ATTACH DEBUG** permission set grants this permission.

## Supported attach configurations

In sandbox and on-premises environments, you can attach to web client, web service client, background, and agent sessions.

| Business Central environment | Web client | Web service client | Background session | Agent session |
|------------------------------|------------|--------------------|--------------------|---------------|
| On-premises | Supported | Supported | Supported | Supported |
| Sandbox | Supported | Supported | Supported | Supported |

Live attach debugging isn't supported in Business Central online production environments. To record and debug code in a production environment, use [Snapshot debugging](devenv-snapshot-debugging.md).

> [!NOTE]
> Use `breakOnNext: "Background"` for a background session. A page background task runs in a child session and isn't a separate `Background` attach target. To debug a page background task, debug its parent session.

## Configure the target session

Add an attach configuration in the `launch.json` file for a cloud sandbox or your own server. The AL extension also provides Agent-specific attach configurations for both environments. Learn more in [Launch JSON file](devenv-json-launch-file.md).

The commonly used `breakOnNext` values are `WebServiceClient`, `WebClient`, `Background`, and `Agent`. Specify one value to select the session type.

Set `sessionId` to attach to an existing session. Set `breakOnNext` to match its client type. If you also specify `userId`, that user must own the session. If you omit `userId`, the debugger uses the session's owner and checks whether you have permission to debug that user's session.

If you omit `sessionId`, the debugger waits for the next session of the type specified by `breakOnNext`. It targets `userId` when specified, or the user signed in to Visual Studio Code otherwise.

> [!NOTE]
> Starting in Business Central 2023 release wave 1, the `sessionId` and `userId` properties let you attach to an ongoing session or debug on behalf of another user.

## Start an attach debugging session

1. In Visual Studio Code, go to **Run** > **Add Configuration**.
2. Select an AL attach configuration for a cloud sandbox or your own server.
3. In `launch.json`, update the connection settings for your target environment.
4. Set `breakOnNext` to the session type. To attach to an existing session, set `sessionId`. To target another user, set `userId` or that user's `sessionId`.
5. Set a breakpoint in the code you want to debug.
6. Select the attach configuration and press <kbd>F5</kbd>.
7. If you're waiting for the next session, first create a new session of the type specified by `breakOnNext`. Run the functionality you want to debug in the target session.
8. When execution reaches a breakpoint, inspect the code. You can add more breakpoints while debugging.
9. To stop debugging, select **Detach** in the Visual Studio Code debug toolbar.

> [!IMPORTANT]
> If you change the app code, republish it so that the source matches the published app before you continue debugging.

## Example: Attach to a web client session

This configuration attaches to the next web client session on an on-premises server. Replace *\<ServerInstance\>* with the name of your Business Central Server instance, and update `server` and `authentication` for your environment.

```json
{
    "name": "Attach to web client on own server",
    "type": "al",
    "request": "attach",
    "environmentType": "OnPrem",
    "server": "https://localhost",
    "serverInstance": "<ServerInstance>",
    "authentication": "Windows",
    "breakOnError": "All",
    "breakOnRecordWrite": "None",
    "enableSqlInformationDebugger": true,
    "enableLongRunningSqlStatements": true,
    "longRunningSqlStatementsThreshold": 500,
    "numberOfSqlStatements": 10,
    "breakOnNext": "WebClient"
}
```

## Example: Attach to a sandbox web service session

This configuration attaches to the next web service session in an online sandbox. Replace *\<EnvironmentName\>* with your sandbox's name.

```json
{
    "name": "Attach to online sandbox",
    "type": "al",
    "request": "attach",
    "environmentType": "Sandbox",
    "environmentName": "<EnvironmentName>",
    "breakOnError": "All",
    "breakOnRecordWrite": "None",
    "enableSqlInformationDebugger": true,
    "enableLongRunningSqlStatements": true,
    "longRunningSqlStatementsThreshold": 500,
    "numberOfSqlStatements": 10,
    "breakOnNext": "WebServiceClient"
}
```

## Example: Attach to an agent session in a sandbox

This configuration attaches to the next session for the specified agent in an online sandbox. Replace *\<EnvironmentName\>* with your sandbox's name and *\<AgentUserSecurityId\>* with the agent's user security ID. The user starting the debugger needs permission to attach to another user's session.

```json
{
    "name": "Attach to agent on cloud sandbox",
    "type": "al",
    "request": "attach",
    "environmentType": "Sandbox",
    "environmentName": "<EnvironmentName>",
    "breakOnError": "All",
    "breakOnRecordWrite": "None",
    "enableSqlInformationDebugger": true,
    "enableLongRunningSqlStatements": true,
    "longRunningSqlStatementsThreshold": 500,
    "numberOfSqlStatements": 10,
    "breakOnNext": "Agent",
    "userId": "<AgentUserSecurityId>"
}
```

## Example: Attach to an agent session on your own server

This configuration connects to the next session for the specified agent on an on-premises server. Replace *\<ServerInstance\>* and *\<AgentUserSecurityId\>* with your server instance name and the agent's user security ID. Update `server` and `authentication` for your environment. The environment must provide agent sessions, and the user starting the debugger needs permission to connect to another user's session.

```json
{
    "name": "Attach to agent on own server",
    "type": "al",
    "request": "attach",
    "environmentType": "OnPrem",
    "server": "https://localhost",
    "serverInstance": "<ServerInstance>",
    "authentication": "Windows",
    "breakOnError": "All",
    "breakOnRecordWrite": "None",
    "enableSqlInformationDebugger": true,
    "enableLongRunningSqlStatements": true,
    "longRunningSqlStatementsThreshold": 500,
    "numberOfSqlStatements": 10,
    "breakOnNext": "Agent",
    "userId": "<AgentUserSecurityId>"
}
```

## Related information

[AL development environment](devenv-reference-overview.md)  
[Developing extensions in AL](devenv-dev-overview.md)  
[Debug AL code](devenv-debugging.md)  
[Snapshot debugging](devenv-snapshot-debugging.md)  
[Launch JSON file](devenv-json-launch-file.md)  
[JSON files](devenv-json-files.md)  
