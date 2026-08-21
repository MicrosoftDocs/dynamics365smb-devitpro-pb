---
title: Snapshot debugging
description: Overview of how snapshot debugging allows recording running AL code for Business Central.
author: SusanneWindfeldPedersen
ms.date: 08/03/2026
ms.topic: article
ms.author: solsen
ms.reviewer: solsen
---

# Snapshot debugging

> [!NOTE]  
> With [!INCLUDE[prod_short](includes/prod_short.md)] 17.2 - Snapshot Debugging is available in production cloud environments.

With snapshot debugging, you can record AL code that runs on the server, and when it has completed, debug the recorded *snapshot* in Visual Studio Code. Snapshot debugging lets you inspect code execution and variables in the production environment on a cloud service for a specified user session. To create and download a snapshot file that exists on the server on behalf of an end-user, the user must be part of the **D365 Snapshot Debug** permission set. For more information, see [Assign Permissions to Users and Groups](/dynamics365/business-central/ui-define-granular-permissions).

Snapshot debugging introduces the concept of *snappoints*. A snappoint is a breakpoint in Visual Studio Code that is set while creating a snapshot but they don't stop execution of code like regular debugging. Snappoints log the state at the breakpoint for later offline inspection. Snapshot debugging will record AL code as it runs on the server, but will only collect variable information on: 

- Snappoints  
- AL exceptions

> [!NOTE]  
> With [!INCLUDE[prod_short](includes/prod_short.md)] version 18.1, it's possible to snapshot the debug event subscribers triggered by built-in codeunit triggers if a snappoint is placed in an AL file on the stack trace that leads to the built-in method. For more information, see [Snapshot debugging built-in methods](devenv-snapshot-debugging.md#snapshot-debugging-the-built-in-codeunit-triggers).

> [!IMPORTANT]  
> To enable snapshot debugging, it's very important that the symbols on the tenant match the symbols on the server. This isn't automatically detected, and must be manually checked. In this release, you can ensure this by copying the specific sandbox and download symbols from that copy. Furthermore, any code that snappoints are set in, must have been deployed, otherwise debugging will not work. For more information, see the section [Downloading symbols on the snapshot debugger endpoint](devenv-snapshot-debugging.md#download-symbols-on-the-snapshot-debugger-endpoint).

## Snapshot debugging keyboard shortcuts

In the following sections, you can read more about how to initialize, view the status, and finalize a snapshot debugging session. It's useful to familiarize yourself with the following keyboard shortcuts. For more keyboard shortcuts, see [Keyboard Shortcuts](devenv-keyboard-shortcuts.md).

|Keyboard Shortcut|Action|
|-----------------|------|
|<kbd>F7</kbd>|Start a snapshot debugging session|
|<kbd>Shift</kbd>+<kbd>F7</kbd>|List all available snapshots|
|<kbd>Alt</kbd>+<kbd>F7</kbd>|Finish a snapshot debugging session|

## Initialize a snapshot debugging session

You can start a snapshot by creating a snapshot configuration file in Visual Studio Code. There are two template configurations for a snapshot, which are accessed by selecting **Add Configuration** in Visual Studio Code.

- AL: Initialize a snapshot debugging session locally
- AL: Initialize a snapshot debugging session on cloud

Choose whether to run the session on a cloud service or locally. The configuration file contains the following information. For a full overview of configuration settings, see [Launch JSON file](devenv-json-launch-file.md#initialize-a-snapshot-debugging-session-on-a-cloud-production-environment-launchjson).

|Setting | Description |
|--------|-------------|
|`userId`| The GUID of the user who initiated the process to start snapshot debugging. For on-premises, this can also be the user name in user password authentication scenarios. The user must be able to start, or have a session type opened that is specified in the `breakOnNext` parameter. <br>**Note:** Specifying `userId` doesn't work with Windows authentication: `"authentication" : "Windows"`, in which case you can only choose `sessionId` or attach to the next session. For more information, see [Launch JSON file](devenv-json-launch-file.md).|
|`sessionId`| A session ID for the user specified in `userId`.|
|`snapshotVerbosity`| Determines how much execution context to be recorded. If **SnapPoint** is specified, then only methods that hit a snappoint will be recorded.|
|`tenant`| The Microsoft Entra tenant ID for the tenant to connect to. Specify this if your target is a different tenant from the user's own Microsoft Entra tenant, for example when running as a delegated admin.|

When a configuration is defined, a snapshot debugging session can be initialized by selecting <kbd>Ctrl</kbd>+<kbd>Shift</kbd>+<kbd>P</kbd>, and then selecting **AL:Initialize Snapshot Debugging** or by selecting <kbd>F7</kbd>.

> [!NOTE]  
> If you're going to use the snapshot for profiling the code, you must enable the configuration parameter called `executionContext`. For more information, see [AL Profiler Overview](devenv-al-profiler-overview.md).

To record the AL execution, the server will now wait for a connection to happen where the following rules apply: 

- If a `sessionId` is specified for a `userId` in the given tenant, then it'll be the session that's going to be snapshot debugged. If the specified `sessionId` isn't found or the session, which is found isn't owned by the user specified in `userId` property, then the attach request will fail. 
- If only a `userId` is specified for a given tenant then the next session, which is specified in the `breakOnNext` configuration parameter is snapshot debugged. 
- If no `userId` is specified then the next session on a given tenant that validates the `breakOnNext` parameter will be snapshot debugged. 

> [!TIP]  
> If you're having difficulty getting the snapshot debugger to attach to a new session using `WebClient` for the `breakOnNext` configuration parameter, then close the browser window and try again.

> [!TIP]  
> To do snapshot debugging of Service to Service (S2S) web service calls set the `breakOnNext` configuration parameter to `WebServiceClient` in the `launch.json` file and use table explorer to find the `userId` of the user record mapped to the S2S Microsoft Entra authentication Application. When the snapshot session is initialized, trigger the session either from the integration (service or device) or manually by invoking a web service call using tools like Insomnia, Bruno, or Insomnium. For information about creating S2S refer to [Using Service to Service Authentication](../administration/automation-apis-using-s2s-authentication.md), [Client Credentials Grant Flow](/azure/active-directory/develop/v2-oauth2-client-creds-grant-flow), [App-only Authentication](/powershell/exchange/app-only-auth-powershell-v2?view=exchange-ps&preserve-view=true).

Once a snapshot debugging session is initialized, the snapshot debugging session counter on the status bar will be updated and look like this:

:::image type="content" source="media/SnapshotDebugger.png" alt-text="Snapshot debugger counter":::

## Status of a snapshot debugging session

Clicking on the status bar icon or selecting <kbd>Shift</kbd>+<kbd>F7</kbd>  will bring up a list of all available snapshots.  
The status list will show the state of a snapshot-debugged session. 

A snapshot debugging session can be in one of the three states:

- **Initialized** - A request is issued and the server is waiting for the next session to be snapshot debugged based on the above rules. 
- **Started** - You've attached to an end-user session to snapshot debug. 
- **Finished** - When the snapshot debugging session has finished. 
- **Downloaded** - When the snapshot file is downloaded. 

## Stop a snapshot debugging session

You can stop a snapshot debugging session by selecting <kbd>Alt</kbd>+<kbd>F7</kbd>. This brings up all snapshot sessions that have been started. Choosing one will close the session debugging on the server and download the snapshot file. 

> [!IMPORTANT]  
> The snapshot file can contain customer privacy data and must therefore be handled according to the privacy and compliance policies. The file should be deleted when it's not needed anymore.

Snapshot debugging sessions that have produced a snapshot file can be debugged. The location of a snapshot file is controlled by the `al.snapshotOutputPath` configuration parameter. By default it's local to the current workspace and it's called `./.snapshots`. For more information, see [AL Language Extension Configuration](devenv-al-extension-configuration.md).

## Download symbols on the snapshot debugger endpoint

To download symbols on a production server, you need permission related entries. The read-only access to the **Published Application** table emphasized in the **D365 Snapshot Debug** permission set should be granted.

Symbols download is using the **snapshotInitialize** debug configuration settings in Visual Studio Code, which is set up when you choose either **AL: Initialize a snapshot debugging session locally** or **AL: Initialize a snapshot debugging session on cloud**.

```al
{
            "name": "snapshotInitialize: MyServer",
            "type": "al",
            "request": "snapshotInitialize",
            "environmentType": "OnPrem",
            "server": "http://localhost",
            "serverInstance": "BC190",
            "authentication": "UserPassword",
            "breakOnNext": "WebClient"
        },
```

> [!IMPORTANT]  
> Debugging requires that symbols on the server are matched with the symbols that the user has locally. If this isn't the case, and you set a breakpoint on a given line in Visual Studio Code, the line of the code may differ from what is on the server. For example, if you don't download the symbols from the production servers for snapshot debugging, you can face a scenario where you set a breakpoint in a DAL file on line 12, but line 12 on the server is an empty line or a completely different line because the symbols aren't the same.

## Debugging a snapshot file 

There are two user actions that will start snapshot debugging:

- Creating a new launch debug configuration and specifying the snapshot file name in the `snapshotFileName` configuration setting. This is the only setting that is needed besides the type, request, and name. 
- Choosing the status icon or by selecting <kbd>Shift</kbd>+<kbd>F7</kbd> and selecting a finished snapshot-debugged session. 

Once a snapshot debugging session starts in Visual Studio Code, code execution will stop at the first snappoint. AL exceptions will be treated as snappoints, with the only difference that they can't be removed by the user actions. Other snappoints are regular breakpoints that can be removed or readded by the user actions. If no snappoints are specified in the first recorded methods; the first line is the entry breakpoint. 

The user can set breakpoints and continue execution to these breakpoints for testing because a snappoint is what carries the real information, so a line can be hit. 

### Viewing executed code

> [!INCLUDE [2022_releasewave2](../includes/2022_releasewave2.md)]

During snapshot debugging playback, the left-side code editor gutter contains a vertical visual bar to indicate which code was executed in the snapshot capture. The color of the gutter bar can be controlled using the *al.snapshotDebuggerLinesHitDecoration* in the settings.json file. For more information, see [AL Language Extension Configuration](devenv-al-extension-configuration.md).


## Snapshot debugging the built-in codeunit triggers

Built-in codeunit triggers can be snapshot-debugged if they're part of the stack trace, these are System Action Triggers, or Company Triggers. This provides a way to snapshot debug that part of the Base App too. To help locate where built-in codeunit triggers are called, use the **Event Recorder** in [!INCLUDE[prod_short](includes/prod_short.md)]. From the code, when all symbols on the snapshot endpoint have been downloaded, see [Downloading symbols on the snapshot debugger endpoint](devenv-snapshot-debugging.md#download-symbols-on-the-snapshot-debugger-endpoint), you can add AL code that contains a reference to that particular event subscription and then use **Go to Definition** to locate the place where that particular codeunit trigger is defined in the .dal file. Adding a snappoint to the code in the .dal file and then initiating the snapshot debugger session will ensure that the code is part of the stacktrace. When the generated snapshot file is then opened in the debugger, the execution will break on the snappoint.

## Snapshot debugging versus regular debugging

Snapshot debugging is almost the same as a regular debugging with the differences mentioned below:

|Snapshot versus regular debugging|
|--|
|Breakpoints can be added or removed and they'll be hit if the breakpoint is in the execution context of a recorded state. This means that if you walk the execution stack for a breakpoint and the next stepped line is reached, then the code will break on the breakpoint. |
|A snappoint is a breakpoint in Visual Studio Code that is set when creating a snapshot. They don't, however, stop execution of code like when using regular debugging. Snappoints instruct execution to log the state at the breakpoint for later offline inspection.|
|You can always navigate through all the breakpoints with **Continue** (<kbd>F5</kbd>). The order may not be the same as the execution order on the [!INCLUDE[prod_short](includes/prod_short.md)] server. This is because some calls on the server are AL calls with non-walkable stacks. Some are direct server calls on the server like triggers. A snapshot debugging session on the [!INCLUDE[prod_short](includes/prod_short.md)] server can only record AL calls and walk AL stack traces.|
|This is also true when stepping. The rule of thumb is that breakpoints within the reach are hit first, and if there are none; the next line is hit. Breakpoints on triggers may not always qualify as code within reach.|
|Variable data is only shown on snappoints.|
|If there are no frames available, snapshot debugging will stop.|
|Stepping out of triggers with no recorded stack information will move execution to the first recorded method's first line. This may be far from the user's execution of interest. For example, stepping out from an `OnOpenPage` trigger with a snappoint may land on deep inside base code execution where recording has started. Navigating with <kbd>F5</kbd> will start over breakpoint resolution, thus this is an exit strategy from a scenario like this.|
|A snappoint may resolve as a non-reachable breakpoint if there was no execution state on the server hitting the snappoint.|
|A snapshot debugger session with a [!INCLUDE[prod_short](includes/prod_short.md)] server will be closed if not attached to after 30 minutes.|
|If a snapshot debugger session is started, it has to be finished after 10 minutes.|
 
## Snapshot debugging with an AI agent (MCP server)

[!INCLUDE [2026-releasewave2-later](../includes/2026-releasewave2-later.md)]

> [!NOTE]
> This feature is available in preview with a prerelease of runtime 18 and Business Central Server version 29.

Instead of using the [keyboard-shortcut workflow](#snapshot-debugging-keyboard-shortcuts), you can use an AI agent to capture a snapshot through the **Snapshot Debugging MCP server**. You describe the failing scenario, the agent initializes a snapshot session, you reproduce the problem, and the agent collects the recorded snapshot. You don't need to press <kbd>F7</kbd>/<kbd>Alt</kbd>+<kbd>F7</kbd> or edit a snapshot launch configuration.

The MCP server uses the same snapshot engine described earlier in this article, so how snapshots are initialized, recorded, and finalized is unchanged. It exposes the following tools that an agent calls on your behalf:

| Tool | What it does | Manual equivalent |
|------|--------------|-------------------|
| Initialize snapshot debugging | Initializes a waiting snapshot for a set of snappoints, optionally scoped to a specific user. There's usually no session yet - the server records the next session that reproduces the scenario. | Start a session (<kbd>F7</kbd>). Learn more in [Initialize a snapshot debugging session](#initialize-a-snapshot-debugging-session) |
| Get snapshot status | Reports whether the snapshot is waiting, recording, or finished. | List snapshots (<kbd>Shift</kbd>+<kbd>F7</kbd>). Learn more in [Status of a snapshot debugging session](#status-of-a-snapshot-debugging-session) |
| Stop snapshot debugging | Finalizes the run and returns the recorded snapshot archive so the agent can debug it. | Finish a session (<kbd>Alt</kbd>+<kbd>F7</kbd>). Learn more in [Stop a snapshot debugging session](#stop-a-snapshot-debugging-session) |

The snapshot the agent collects is the same recording you would produce manually, and it can contain customer privacy data. Handle it according to your privacy and compliance policies and delete it when it's no longer needed. You can open it in the Visual Studio Code snapshot debugger just as you would a downloaded snapshot file. See [Debugging a snapshot file](#debugging-a-snapshot-file).

### Part of the Business Central MCP server

The snapshot tools aren't a separate server - they're part of the [Business Central MCP server](../ai/mcp-overview.md), the same server that exposes your API pages to agents, surfaced as a developer debugging capability. To use them, provide **altool** with the `launchsnapshotmcpproxy` command - an MCP client you can set up with any MCP host (Claude CLI, GitHub Copilot CLI, Visual Studio Code, and so on), as shown in the following sections. Learn more in [Snapshot debugging MCP proxy](devenv-al-tool.md#snapshot-debugging-mcp-proxy).

### Session ID is optional - arm the next reproduction or attach to a known session

In most cases, you don't have a session yet, so don't pass a session ID. Snapshot debugging *arms* the server and records the next session that reproduces the problem. Describe the failing scenario to the agent - for example, *"A user gets an error when posting a sales order. Arm a snapshot on the posting codeunit so we can debug it."* - and, when the agent tells you it's armed, reproduce the scenario yourself (or have the affected user reproduce it). Optionally, the agent can scope the wait to a specific user.

If you already know the session you want to record - for example, a session that's currently running - provide its session ID instead. The snapshot debugger then attaches to that session directly rather than waiting for the next reproduction.

The snapshot is recorded on the server while you reproduce the scenario. If the environment moves or restarts before you stop it, the in-progress recording is lost and the agent reports that there's nothing to collect. When that happens, just arm a new snapshot and reproduce the scenario again.

### What to tell the agent when you arm a snapshot

Describe the scenario in natural language and the agent fills in the inputs to the **initialize snapshot debugging** tool for you. The more specific your prompt, the more precisely the agent arms the snapshot - so it helps to know what the tool accepts. All of its inputs are optional:

| Input | What it's for | How to express it in a prompt |
|-------|---------------|-------------------------------|
| **Snappoints** | The specific AL lines to record. AL runtime errors are *always* captured automatically, so you only add snappoints when you also want to record lines that don't throw. | *"Add a snappoint at line 100 of codeunit 80."* |
| **Client type** | The client surface that reproduces the scenario, so the server waits for a matching session. One of `WebClient` (the default), `WebServiceClient`, `Background`, or `ClientService`. | *"The error happens through a web service"* arms it for `WebServiceClient`. |
| **Target user** | Whose next session to record, given as the user's security ID (a GUID). Omit it to record *your own* next session. | *"Wait for the next session of user `<user security ID>`."* |

Each snappoint identifies an AL object and a line within it, using these fields:

- `applicationObjectType` - the object type, for example `Codeunit`, `Page`, `Table`, or `Report`.
- `applicationObjectId` **or** `applicationObjectName` - identify the object either by its ID or by its name (provide one).
- `lineNumber` - the line to record, counted from the start of that object.

For example, a snappoint on the sales-posting codeunit is `{ "applicationObjectType": "Codeunit", "applicationObjectId": 80, "lineNumber": 100 }`, or equivalently `{ "applicationObjectType": "Codeunit", "applicationObjectName": "Sales-Post", "lineNumber": 100 }`.

Providing a session ID is optional. Omit it to arm and record the next session that reproduces the problem, or supply the ID of a session that's already running to attach to it directly.

Putting it together, a fully specified prompt reads like: *"Arm a web client snapshot for the next session of user `<user security ID>`, with a snappoint at line 100 of codeunit 80 (Sales-Post), then tell me when to reproduce it."* A minimal prompt works too - *"Snapshot-debug why posting a sales order fails"* - because the agent defaults to your own next web client session and relies on the automatic capture of the AL error.

### Set up the server

The MCP server uses the `launchsnapshotmcpproxy` command from [ALTool](devenv-al-tool.md#snapshot-debugging-mcp-proxy), a .NET tool you install once:

```bash
dotnet tool install --global Microsoft.Dynamics.BusinessCentral.Development.Tools
```

Each MCP host runs that command as a stdio server. You pass the connection target (cloud environment or on-premises server) and the authentication method as command-line `args`. The examples in the following sections connect to a cloud sandbox. For on-premises servers, see [Snapshot debugging MCP proxy](devenv-al-tool.md#snapshot-debugging-mcp-proxy) for information about the `--server`, `--serverinstance`, and `--port` options, as well as the full option and authentication reference.

> [!NOTE]  
> The credentials aren't command-line arguments. The proxy has no option for them, so secrets never end up in `args`. The proxy reads them from its environment instead, which you set through the server's `env` block: for **cloud** you can either sign in interactively by using `altool auth login` (the proxy then reads the cached token automatically - no `env` block needed) or set `BC_ACCESS_TOKEN` (a Microsoft Entra access token); for **on-premises** `UserPassword` authentication set `BC_SERVER_USERNAME` and `BC_SERVER_PASSWORD`. Reference an environment variable rather than hardcoding the value so the secret stays out of the config file. In Visual Studio Code, the AL extension handles sign-in for you, so no `env` block is needed when the server is autoregistered.

For a cloud environment, you can authenticate in one of two ways.

**Interactive sign-in (recommended).** Sign in once as a user who has access to the environment:

```bash
altool auth login --environmenttype Sandbox --environmentname sandbox --tenant contoso.onmicrosoft.com
```

This method opens a browser and then stores the token - together with a refresh token - in a local cache shared by the Business Central AL dev tools. The proxy reads it automatically on every run and refreshes it silently, so you don't need a `BC_ACCESS_TOKEN` `env` block and you won't hit the one-hour token expiry.

For example, after signing in once as shown previously, register the server with **no** `env` block at all - the proxy picks up the cached sign-in on its own:

```json
{
  "mcpServers": {
    "bc-snapshot": {
      "command": "altool",
      "args": ["launchsnapshotmcpproxy", "--environmenttype", "Sandbox", "--environmentname", "sandbox", "--tenant", "contoso.onmicrosoft.com"]
    }
  }
}
```

This is the recommended approach: signing in interactively with `altool auth login` works against cloud sandbox and production environments alike. Only reach for `BC_ACCESS_TOKEN` when an interactive sign-in isn't possible.

**Pre-acquired token (for headless or CI/CD).** When an interactive sign-in isn't possible, supply a token through `BC_ACCESS_TOKEN` instead. Acquire it by using the [Azure CLI](/cli/azure/) (after `az login` as a user who has access to the environment), requesting a token for the Business Central API scope:

```bash
az account get-access-token --scope https://api.businesscentral.dynamics.com/.default --query accessToken --output tsv
```

Assign the result to the `BC_ACCESS_TOKEN` environment variable that the `env` block references. This token is short-lived (about one hour), so refresh it when it expires. `BC_ACCESS_TOKEN` takes precedence over an interactive sign-in, so leave it unset when you use `altool auth login` - a stale value overrides the cached token and the connection fails. In Visual Studio Code, the AL extension acquires and refreshes the token for you.

The host-specific examples in the following sections include a `BC_ACCESS_TOKEN` `env` block for the pre-acquired-token approach. If you signed in by using `altool auth login`, omit the `env` block entirely.

#### Claude CLI

Register the server by using the `claude mcp add` command:

```bash
claude mcp add bc-snapshot -e BC_ACCESS_TOKEN=$BC_ACCESS_TOKEN -- altool launchsnapshotmcpproxy --environmenttype Sandbox --environmentname sandbox --tenant contoso.onmicrosoft.com
```

This command is equivalent to the following stdio entry in your Claude configuration:

```json
{
  "mcpServers": {
    "bc-snapshot": {
      "command": "altool",
      "args": ["launchsnapshotmcpproxy", "--environmenttype", "Sandbox", "--environmentname", "sandbox", "--tenant", "contoso.onmicrosoft.com"],
      "env": { "BC_ACCESS_TOKEN": "${BC_ACCESS_TOKEN}" }
    }
  }
}
```

#### GitHub Copilot CLI

Add the server to the Copilot CLI MCP configuration (`~/.copilot/mcp-config.json`):

```json
{
  "mcpServers": {
    "bc-snapshot": {
      "type": "local",
      "command": "altool",
      "args": ["launchsnapshotmcpproxy", "--environmenttype", "Sandbox", "--environmentname", "sandbox", "--tenant", "contoso.onmicrosoft.com"],
      "tools": ["*"],
      "env": { "BC_ACCESS_TOKEN": "$BC_ACCESS_TOKEN" }
    }
  }
}
```

#### Visual Studio Code

In Visual Studio Code agent mode, you don't configure anything: the AL extension registers the **Business Central Snapshot MCP Server** automatically and derives the connection from your `launch.json`. Sign in by using the **AL: Sign in to Business Central Snapshot MCP** command when prompted, and then ask the agent to capture a snapshot. To wire it up manually in another editor, add an equivalent stdio entry to `.vscode/mcp.json`:

```json
{
  "servers": {
    "bc-snapshot": {
      "type": "stdio",
      "command": "altool",
      "args": ["launchsnapshotmcpproxy", "--environmenttype", "Sandbox", "--environmentname", "sandbox", "--tenant", "contoso.onmicrosoft.com"],
      "env": { "BC_ACCESS_TOKEN": "${env:BC_ACCESS_TOKEN}" }
    }
  }
}
```

After the server is registered, prompt the agent - for example, *"A user gets an error posting a sales order; arm a snapshot on the posting codeunit, tell me when to reproduce it, then collect the snapshot"* - and it arms the snapshot, waits for you to reproduce the scenario, and returns the recording for offline debugging.

### Permissions and limitations

The agent connects by using your Business Central identity and acts entirely within your permissions. Every action is audited under your user, just like the manual workflow:

- **Enable the MCP server** for the environment. To learn more, see [Configure the Business Central MCP server](../ai/configure-mcp-server.md).
- **Snapshot debugging** needs the **D365 Snapshot Debug** permission set - the same permission required to create and download a snapshot by hand, as described at the [top of this article](#snapshot-debugging).
- **The snapshot MCP server requires the D365 ATTACH DEBUG permission set for every snapshot** - including your own session, unlike the manual workflow where it's only needed to target another user. See [Attach and Debug Next](devenv-attach-debug-next.md). Without it, the request is denied.

Finally, aside from the extra **D365 ATTACH DEBUG** requirement noted previously, the same permissions and time limits as the manual workflow apply throughout - the agent path adds no separate access model. The same time limits hold: an armed session is closed if it isn't attached to within 30 minutes, and a started session must be finished within 10 minutes. See [Snapshot debugging versus regular debugging](#snapshot-debugging-versus-regular-debugging).

## Related information

[Debugging](devenv-debugging.md)  
[Attach and Debug Next](devenv-attach-debug-next.md)  
[Developing Extensions](devenv-dev-overview.md)  
[JSON Files](devenv-json-files.md)  
[AL Code Navigation](devenv-al-code-navigation.md)  
