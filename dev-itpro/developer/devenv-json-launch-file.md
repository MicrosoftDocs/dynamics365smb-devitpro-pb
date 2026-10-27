---
title: Launch JSON Settings for Business Central AL
description: Configure launch.json settings for AL publishing, attach debugging, and snapshot debugging in Business Central online and on-premises environments.
author: SusanneWindfeldPedersen
ms.date: 10/16/2026
ms.topic: reference
ms.author: solsen
ms.reviewer: solsen
---

# Launch JSON file

Use `launch.json` to configure how the AL extension publishes apps and starts debugging in Business Central. Each configuration identifies the target environment and the operation to perform. To add a configuration in Visual Studio Code, open `launch.json` and select **Add Configuration**.

The examples below show individual configuration objects. Add them to the `configurations` array in `launch.json`. Replace the server, instance, environment, and authentication values with the settings for your environment.

The following configuration options are available:

- [Attach to the client on the cloud sandbox](devenv-json-launch-file.md#attach-to-client-on-cloud-sandbox-settings-launchjson)
- [Attach to the client on your own server](devenv-json-launch-file.md#attach-to-client-on-your-own-server-launchjson)
- [Attach to an agent session on a cloud sandbox](devenv-json-launch-file.md#attach-to-agent-session-on-cloud-sandbox-launchjson)
- [Attach to an agent session on your own server](devenv-json-launch-file.md#attach-to-agent-session-on-your-own-server-launchjson)
- [Initialize a snapshot debugging session in the cloud](#initialize-a-snapshot-debugging-session-on-a-cloud-production-environment-launchjson)
- [Initialize a snapshot debugging session on your own server](devenv-json-launch-file.md#initialize-a-snapshot-debugging-session-on-your-own-server-launchjson)
- [Publish to Microsoft cloud sandbox](devenv-json-launch-file.md#publish-to-cloud-settings-launchjson)
- [Publish to your own server](devenv-json-launch-file.md#publish-to-local-server-settings-launchjson)

The following sections describe the settings for each configuration. You can also define a [user or workspace launch configuration](#user-and-workspace-launch-configuration).


## Publish to local server settings (launch.json)

Here's an example of a configuration for publishing to an on-premises server.

```json
{
    "name": "Publish: Your own server",
    "type": "al",
    "request": "launch",
    "environmentType": "OnPrem",
    "server": "https://bcserver",
    "serverInstance": "BC",
    "authentication": "UserPassword",
    "startupObjectId": 22,
    "breakOnError": "All",
    "breakOnRecordWrite": "None",
    "launchBrowser": true,
    "enableSqlInformationDebugger": true,
    "enableLongRunningSqlStatements": true,
    "longRunningSqlStatementsThreshold": 500,
    "numberOfSqlStatements": 10,
    "tenant": "default",
    "usePublicURLFromServer": true
}
```

The following table describes the settings in the `launch.json` file for publishing to a local server.

|Setting|Mandatory|Value|
|-------|---------|-----|
|`name`|Yes|A name that identifies the configuration in Visual Studio Code.|
|`type`|Yes|Set to `"al"`.|
|`request`|Yes|Set to `"launch"` to publish and run the app.|
|`environmentType`|Yes|Set to `"OnPrem"`.|
|`server`|Yes|The HTTP or HTTPS base URL of your server, for example, `"https://bcserver"`. Specify the instance in `serverInstance` and the service port in `port`. The `usePublicURLFromServer` setting controls the browser URL separately.|
|`port`|No|The development-service port. The default is `7049`. Set this property explicitly for a nondefault service port. Don't rely on a port embedded in `server` to select the service port.|
|`serverInstance`|Yes|The name of your Business Central Server instance, for example, `"BC"`.|
|`authentication`|No|The server authentication method: `"MicrosoftEntraID"`, `"AAD"`, `"Windows"`, or `"UserPassword"`. The default is `"MicrosoftEntraID"`. Set it to match your server configuration. For on-premises Microsoft Entra authentication, use `primaryTenantDomain` to identify the directory for sign-in. Learn more in [Microsoft Entra authentication for Business Central on-premises](devenv-aad-auth-onprem.md).|
|`useVsCodeAuthentication`|No|Requests Visual Studio Code's built-in authentication provider. The default is `true`, subject to the `al.useVsCodeAuthentication` setting and this configuration's override. Only supported cloud Microsoft Entra connections use this provider. On-premises connections use the extension's authentication flow.|
|`startupObjectType`|No|The type of object to open after publishing: `"Page"`, `"Table"`, `"Report"`, or `"Query"`. The default is `"Page"`.|
|`startupObjectId`|No|The ID of the page, table, report, or query to open after publishing.|
|`startupCompany`|No|The company to open after publishing. Set `startupObjectId` to apply this setting. If `startupObjectType` is omitted, the type defaults to `"Page"`.|
|`schemaUpdateMode`|No|The data synchronization mode: `"Synchronize"`, `"Recreate"`, or `"ForceSync"`. The default is `"Synchronize"`. Learn more in [Retaining table data after publishing](devenv-retaining-data-after-publishing.md).<br>[!INCLUDE[nav_not_supported](includes/nav_not_supported.md)]|
|`breakOnError`|No|Controls when the debugger breaks on errors. Starting in 2022 release wave 2, use `"All"` to break on all errors, `"None"` to ignore errors, or `"ExcludeTry"` to break only on errors outside try functions. The default is `"All"`. The Boolean values `true` and `false` remain accepted for compatibility and map to `"All"` and `"None"`. We recommend the string values.|
|`breakOnRecordWrite`|No|Controls when the debugger breaks on record writes. Starting in 2022 release wave 2, use `"All"` for all record writes, `"None"` to ignore writes, or `"ExcludeTemporary"` to ignore writes to temporary records. The default is `"None"`. The Boolean values `true` and `false` remain accepted for compatibility and map to `"All"` and `"None"`. We recommend the string values.|
|`launchBrowser`|No|Specifies whether to open the browser after publishing without debugging. The default is `true`. Set to `false` to publish without opening the browser. When debugging is enabled, the browser opens regardless of this setting.|
|`enableSqlInformationDebugger`|No|Specifies whether the debugger shows SQL information. The default is `true`. Learn more in [Debugging SQL behavior](devenv-debugging.md#DebugSQL).|
|`enableLongRunningSqlStatements`|No|Specifies whether long-running SQL statements are shown in the debugger. The default is `true`.|
|`longRunningSqlStatementsThreshold`|No|The threshold, in milliseconds, for treating a SQL statement as long-running. The default is `500`.|
|`numberOfSqlStatements`|No|The number of SQL statements shown in the debugger. The default is `10`.|
|`dependencyPublishingOption`|No|Controls dependency publishing. `"Default"` applies the standard dependency publishing behavior. `"Ignore"` publishes only the current project. `"Strict"` fails if apps depend directly on the startup project but aren't part of the workspace. Learn more in [Working with multiple projects and project references](devenv-work-workspace-projects-references.md).|
|`disableHttpRequestTimeout`|No|Disables the AL extension's client-side HTTP request timeout. The default is `false`. Package publishing disables this timeout automatically. This setting doesn't disable server-side or network timeouts.|
|`forceUpgrade`|No|Allows upgrade codeunits to run when an installed extension is republished with the same version. Use a newly generated package ID. This doesn't force the upgrade path for `"Recreate"` or incremental RAD publishing.|
|`useSystemSessionForDeployment`|No|Requests that deployment use a system session. The default is `false`. Install and upgrade codeunits that run in a system session can't be debugged.|
|`snapshotFileName`|No|Specifies an existing snapshot recording file to open for [snapshot debugging](devenv-snapshot-debugging.md). This setting selects snapshot playback instead of publishing. It doesn't name the file produced by `snapshotInitialize`.|
|`primaryTenantDomain`|No|The Microsoft Entra tenant ID or primary domain, for example, *\<TenantId\>* or `mycustomer.onmicrosoft.com`. For on-premises Microsoft Entra authentication, this identifies the directory used for sign-in. The `tenant` setting separately identifies the Business Central server tenant.|
|`tenant`|Conditional|The Business Central tenant name, for example, `"default"` or `"MyTenant"`. Required when the server hosts multiple tenants and the tenant can't be resolved from the connection URL.|
|`usePublicURLFromServer`|No|Controls the browser URL for on-premises connections. The default is `true`, which uses the server's `PublicWebBaseURL` when available. Set to `false` to use the scheme, host, and port from `server` while retaining the server-provided web endpoint path. This setting doesn't change the development-service endpoint selected by `serverInstance` and `port`.|

## Publish to cloud settings (launch.json)

Here's an example of a configuration file for publishing to a cloud sandbox.

```json
{
    "name": "Publish: Microsoft cloud sandbox",
    "type": "al",
    "request": "launch",
    "environmentType": "Sandbox",
    "environmentName": "sandbox",
    "startupObjectId": 22,
    "breakOnError": "All",
    "breakOnRecordWrite": "None",
    "launchBrowser": true,
    "enableSqlInformationDebugger": true,
    "enableLongRunningSqlStatements": true,
    "longRunningSqlStatementsThreshold": 500,
    "numberOfSqlStatements": 10
}
```

The following table describes the settings in the `launch.json` file for publishing to a cloud sandbox.

|Setting|Mandatory|Value|
|-------|---------|-----|
|`name`|Yes|A name that identifies the configuration in Visual Studio Code.|
|`type`|Yes|Set to `"al"`.|
|`request`|Yes|Set to `"launch"` to publish and run the app.|
|`environmentType`|Yes|Set to `"Sandbox"` when publishing from Visual Studio Code. Publishing to a cloud production environment through this configuration isn't supported.|
|`environmentName`|No|The sandbox environment name. The default is `"sandbox"`. Specify this setting when targeting an environment with a different name.|
|`applicationFamily`|Conditional|The cloud application family, for example, `"Fabrikam"`. Required for Embed apps and reserved for that scenario.|
|`useVsCodeAuthentication`|No|Requests Visual Studio Code's built-in authentication provider for supported cloud Microsoft Entra connections. The default is `true`, subject to the `al.useVsCodeAuthentication` setting and this configuration's override. An explicit `tenant` or an unsupported cloud scenario uses the extension's authentication flow instead. Set to `false` to disable the built-in provider.|
|`startupObjectType`|No|The type of object to open after publishing: `"Page"`, `"Table"`, `"Report"`, or `"Query"`. The default is `"Page"`.|
|`startupObjectId`|No|The ID of the page, table, report, or query to open after publishing.|
|`startupCompany`|No|The company to open after publishing. Set `startupObjectId` to apply this setting. If `startupObjectType` is omitted, the type defaults to `"Page"`.|
|`tenant`|No|The Microsoft Entra tenant ID or primary domain, for example, *\<TenantId\>* or `mycustomer.onmicrosoft.com`. Use it to target a particular tenant.|
|`breakOnError`|No|Controls when the debugger breaks on errors. Starting in 2022 release wave 2, use `"All"` to break on all errors, `"None"` to ignore errors, or `"ExcludeTry"` to break only on errors outside try functions. The default is `"All"`. The Boolean values `true` and `false` remain accepted for compatibility and map to `"All"` and `"None"`. We recommend the string values.|
|`breakOnRecordWrite`|No|Controls when the debugger breaks on record writes. Starting in 2022 release wave 2, use `"All"` for all record writes, `"None"` to ignore writes, or `"ExcludeTemporary"` to ignore writes to temporary records. The default is `"None"`. The Boolean values `true` and `false` remain accepted for compatibility and map to `"All"` and `"None"`. We recommend the string values.|
|`launchBrowser`|No|Specifies whether to open the browser after publishing without debugging. The default is `true`. Set to `false` to publish without opening the browser. When debugging is enabled, the browser opens regardless of this setting.|
|`enableSqlInformationDebugger`|No|Specifies whether the debugger shows SQL information. The default is `true`. Learn more in [Debugging SQL behavior](devenv-debugging.md#DebugSQL).|
|`enableLongRunningSqlStatements`|No|Specifies whether long-running SQL statements are shown in the debugger. The default is `true`.|
|`longRunningSqlStatementsThreshold`|No|The threshold, in milliseconds, for treating a SQL statement as long-running. The default is `500`.|
|`numberOfSqlStatements`|No|The number of SQL statements shown in the debugger. The default is `10`.|
|`dependencyPublishingOption`|No|Controls dependency publishing. `"Default"` applies the standard dependency publishing behavior. `"Ignore"` publishes only the current project. `"Strict"` fails if apps depend directly on the startup project but aren't part of the workspace. Learn more in [Working with multiple projects and project references](devenv-work-workspace-projects-references.md).|
|`disableHttpRequestTimeout`|No|Disables the AL extension's client-side HTTP request timeout. The default is `false`. Package publishing disables this timeout automatically. This setting doesn't disable server-side or network timeouts.|


## Attach to client on cloud sandbox settings (launch.json)

The attach configuration is used for specific debugging scenarios where you don't want to publish and invoke functionality to debug it. Learn more in [Attach and debug next](devenv-attach-debug-next.md).

Here's an example of a configuration file for attaching to a client on a cloud sandbox.

```json
{
    "name": "Attach: Microsoft cloud sandbox",
    "type": "al",
    "request": "attach",
    "environmentType": "Sandbox",
    "environmentName": "sandbox",
    "breakOnError": "All",
    "breakOnRecordWrite": "None",
    "enableSqlInformationDebugger": true,
    "enableLongRunningSqlStatements": true,
    "longRunningSqlStatementsThreshold": 500,
    "numberOfSqlStatements": 10,
    "breakOnNext": "WebServiceClient"
}
```

The following table describes the settings in the `launch.json` file for attaching to a client on a cloud sandbox.


|Setting|Mandatory|Value|
|-------|---------|-----|
|`name`|Yes|A name that identifies the configuration in Visual Studio Code.|
|`type`|Yes|Set to `"al"`.|
|`request`|Yes|Set to `"attach"`. Attaching doesn't publish the app.|
|`environmentType`|Yes|Set to `"Sandbox"`. Live attach debugging isn't supported in cloud production environments.|
|`environmentName`|No|The sandbox environment name. The default is `"sandbox"`. Specify this setting when targeting an environment with a different name.|
|`userId`|No|The User Security ID of the user whose session you want to debug. If neither `userId` nor `sessionId` is specified, the debugger targets the signed-in user. Debugging another user's session requires additional permissions. Learn more in [Attach and debug next](devenv-attach-debug-next.md#prepare-to-attach-the-debugger).|
|`sessionId`|No|An existing session to debug. If you also specify `userId`, the session must belong to that user. Set `breakOnNext` to match the session type.|
|`breakOnError`|No|Controls when the debugger breaks on errors. Starting in 2022 release wave 2, use `"All"` to break on all errors, `"None"` to ignore errors, or `"ExcludeTry"` to break only on errors outside try functions. The default is `"All"`. The Boolean values `true` and `false` remain accepted for compatibility and map to `"All"` and `"None"`. We recommend the string values.|
|`breakOnNext`|No|The session type: `"WebServiceClient"` for OData or SOAP clients, `"WebClient"` for the web client, `"Background"` for background sessions such as job queues, or `"Agent"` for agent sessions. Without `sessionId`, the debugger waits for the next matching session for `userId`, or the signed-in user if `userId` is omitted.|
|`breakOnRecordWrite`|No|Controls when the debugger breaks on record writes. Starting in 2022 release wave 2, use `"All"` for all record writes, `"None"` to ignore writes, or `"ExcludeTemporary"` to ignore writes to temporary records. The default is `"None"`. The Boolean values `true` and `false` remain accepted for compatibility and map to `"All"` and `"None"`. We recommend the string values.|
|`enableSqlInformationDebugger`|No|Specifies whether the debugger shows SQL information. The default is `true`. Learn more in [Debugging SQL behavior](devenv-debugging.md#DebugSQL).|
|`enableLongRunningSqlStatements`|No|Specifies whether long-running SQL statements are shown in the debugger. The default is `true`.|
|`longRunningSqlStatementsThreshold`|No|The threshold, in milliseconds, for treating a SQL statement as long-running. The default is `500`.|
|`numberOfSqlStatements`|No|The number of SQL statements shown in the debugger. The default is `10`.|


## Attach to client on your own server (launch.json)

The attach configuration is used for specific debugging scenarios where you don't want to publish and invoke functionality to debug it. Learn more in [Attach and debug next](devenv-attach-debug-next.md).

Here's an example of a configuration file for attaching to a client on your own server.

```json
{
    "name": "Attach: Your own server",
    "type": "al",
    "request": "attach",
    "environmentType": "OnPrem",
    "server": "https://bcserver",
    "serverInstance": "BC",
    "authentication": "UserPassword",
    "breakOnError": "All",
    "breakOnRecordWrite": "None",
    "enableSqlInformationDebugger": true,
    "enableLongRunningSqlStatements": true,
    "longRunningSqlStatementsThreshold": 500,
    "numberOfSqlStatements": 10,
    "breakOnNext": "WebServiceClient",
    "tenant": "default"
}
```

The settings for attaching to a client on your own server are described in the following table.

|Setting|Mandatory|Value|
|-------|---------|-----|
|`name`|Yes|A name that identifies the configuration in Visual Studio Code.|
|`type`|Yes|Set to `"al"`.|
|`request`|Yes|Set to `"attach"`. Attaching doesn't publish the app.|
|`environmentType`|Yes|Set to `"OnPrem"`.|
|`server`|Yes|The HTTP or HTTPS base URL of your server, for example, `"https://bcserver"`. Specify the instance in `serverInstance` and the service port in `port`.|
|`port`|No|The development-service port. The default is `7049`. Set this property explicitly for a nondefault service port. Don't rely on a port embedded in `server` to select the service port.|
|`serverInstance`|Yes|The name of your Business Central Server instance, for example, `"BC"`.|
|`authentication`|No|The server authentication method: `"MicrosoftEntraID"`, `"AAD"`, `"Windows"`, or `"UserPassword"`. The default is `"MicrosoftEntraID"`. Set it to match your server configuration. For on-premises Microsoft Entra authentication, use `primaryTenantDomain` to identify the directory for sign-in. Learn more in [Microsoft Entra authentication for Business Central on-premises](devenv-aad-auth-onprem.md).|
|`primaryTenantDomain`|No|The Microsoft Entra tenant ID or primary domain used for on-premises Microsoft Entra sign-in. This is separate from the Business Central `tenant` setting.|
|`userId`|No|The User Security ID of the user whose session you want to debug. If neither `userId` nor `sessionId` is specified, the debugger targets the signed-in user. Debugging another user's session requires additional permissions. Learn more in [Attach and debug next](devenv-attach-debug-next.md#prepare-to-attach-the-debugger).|
|`sessionId`|No|An existing session to debug. If you also specify `userId`, the session must belong to that user. Set `breakOnNext` to match the session type.|
|`breakOnError`|No|Controls when the debugger breaks on errors. Starting in 2022 release wave 2, use `"All"` to break on all errors, `"None"` to ignore errors, or `"ExcludeTry"` to break only on errors outside try functions. The default is `"All"`. The Boolean values `true` and `false` remain accepted for compatibility and map to `"All"` and `"None"`. We recommend the string values.|
|`breakOnNext`|No|The session type: `"WebServiceClient"` for OData or SOAP clients, `"WebClient"` for the web client, `"Background"` for background sessions such as job queues, or `"Agent"` for agent sessions. Without `sessionId`, the debugger waits for the next matching session for `userId`, or the signed-in user if `userId` is omitted.|
|`breakOnRecordWrite`|No|Controls when the debugger breaks on record writes. Starting in 2022 release wave 2, use `"All"` for all record writes, `"None"` to ignore writes, or `"ExcludeTemporary"` to ignore writes to temporary records. The default is `"None"`. The Boolean values `true` and `false` remain accepted for compatibility and map to `"All"` and `"None"`. We recommend the string values.|
|`enableSqlInformationDebugger`|No|Specifies whether the debugger shows SQL information. The default is `true`. Learn more in [Debugging SQL behavior](devenv-debugging.md#DebugSQL).|
|`enableLongRunningSqlStatements`|No|Specifies whether long-running SQL statements are shown in the debugger. The default is `true`.|
|`longRunningSqlStatementsThreshold`|No|The threshold, in milliseconds, for treating a SQL statement as long-running. The default is `500`.|
|`numberOfSqlStatements`|No|The number of SQL statements shown in the debugger. The default is `10`.|
|`tenant`|Conditional|The Business Central tenant name, for example, `"default"` or `"MyTenant"`. Required when the server hosts multiple tenants and the tenant can't be resolved from the connection URL.|

## Attach to agent session on cloud sandbox (launch.json)

The attach configuration for agent sessions allows you to debug the AL code that an agent is executing on a cloud sandbox. Learn more in [Attach and debug next](devenv-attach-debug-next.md).

Here's an example of a configuration for attaching to an agent session in a cloud sandbox. Replace *\<AgentUserSecurityId\>* with the agent's User Security ID. The user starting the debugger needs permission to debug another user's session.

```json
{
    "name": "Attach: Agent on cloud sandbox",
    "type": "al",
    "request": "attach",
    "environmentType": "Sandbox",
    "environmentName": "sandbox",
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

Use the [client attach settings for a cloud sandbox](#attach-to-client-on-cloud-sandbox-settings-launchjson) with `breakOnNext` set to `"Agent"`. Set `userId` to the agent's User Security ID, or specify an existing agent session with `sessionId`.

## Attach to agent session on your own server (launch.json)

The attach configuration for agent sessions allows you to debug the AL code that an agent is executing on your own server. Learn more in [Attach and debug next](devenv-attach-debug-next.md).

Here's an example of a configuration for attaching to an agent session on your own server. Replace *\<AgentUserSecurityId\>* with the agent's User Security ID. The user starting the debugger needs permission to debug another user's session.

```json
{
    "name": "Attach: Agent on own server",
    "type": "al",
    "request": "attach",
    "environmentType": "OnPrem",
    "server": "https://bcserver",
    "serverInstance": "BC",
    "authentication": "UserPassword",
    "breakOnError": "All",
    "breakOnRecordWrite": "None",
    "enableSqlInformationDebugger": true,
    "enableLongRunningSqlStatements": true,
    "longRunningSqlStatementsThreshold": 500,
    "numberOfSqlStatements": 10,
    "breakOnNext": "Agent",
    "tenant": "default",
    "userId": "<AgentUserSecurityId>"
}
```

Use the [client attach settings for your own server](#attach-to-client-on-your-own-server-launchjson) with `breakOnNext` set to `"Agent"`. Set `userId` to the agent's User Security ID, or specify an existing agent session with `sessionId`.

## Initialize a snapshot debugging session on a cloud production environment (launch.json)

Snapshot debugging allows you to record AL code that runs on the server, and when it has completed, you can debug the recorded *snapshot* in Visual Studio Code. Learn more in [Snapshot debugging](devenv-snapshot-debugging.md).

Here's an example of a configuration file for snapshot debugging on a cloud production environment.

```json
{
    "name": "snapshotInitialize: Microsoft production cloud",
    "type": "al",
    "request": "snapshotInitialize",
    "environmentType": "Production",
    "environmentName": "production",
    "breakOnNext": "WebClient",
    "executionContext": "DebugAndProfile"
}
```

The following table describes the settings in the `launch.json` file for snapshot debugging on a cloud production environment.

|Setting|Mandatory|Value|
|-------|---------|-----|
|`name`|Yes|A name that identifies the configuration in Visual Studio Code.|
|`type`|Yes|Set to `"al"`.|
|`request`|Yes|Set to `"snapshotInitialize"`.|
|`userId`|No|The User Security ID of the user whose session you want to record. To record an existing session, specify `sessionId`. If both are supplied, the session must belong to that user.|
|`sessionId`|No|An existing session to record. You can specify it without `userId`. If both are supplied, the session must belong to that user.|
|`environmentType`|Yes|Set to `"Production"` for the example above, or `"Sandbox"` to record a sandbox session.|
|`environmentName`|No|The cloud environment name. The default is `"production"` for `environmentType: "Production"` and `"sandbox"` for `environmentType: "Sandbox"`. Specify this setting when targeting an environment with a different name.|
|`breakOnNext`|No|The session type to record: `"WebServiceClient"` for OData or SOAP clients, `"WebClient"` for the web client, `"Background"` for background sessions such as job queues, or `"Agent"` for agent sessions. If neither `userId` nor `sessionId` is specified, recording waits for the next matching session on the tenant.|
|`executionContext`|No|Specifies whether to collect debugging data, profiling data, or both: `"Debug"`, `"Profile"`, or `"DebugAndProfile"`. The default is `"DebugAndProfile"`. Learn more in [Snapshot configuration settings](devenv-al-profiler-overview.md#snapshot-configuration-settings).|
|`snapshotVerbosity`|No|Set to `"Full"` to record stepping information for every executed line, or `"SnapPoint"` to record stepping information at snappoints.|
|`profilingType`|No|Specifies `"Instrumentation"` to measure every executed frame or `"Sampling"` to collect frames at intervals. The default is `"Instrumentation"`. Sampling requires a server that supports sampling and `executionContext` set to `"Profile"`. Learn more in [Profiling AL code](devenv-al-profiler-overview.md).|
|`profileSamplingInterval`|No|The sampling interval in milliseconds when `profilingType` is `"Sampling"`. Options are `50`, `100`, or `150`. The default is `100`.|

## Initialize a snapshot debugging session on your own server (launch.json)

Snapshot debugging allows you to record AL code that runs on the server, and when it has completed, you can debug the recorded *snapshot* in Visual Studio Code. Learn more in [Snapshot debugging](devenv-snapshot-debugging.md).

Here's an example of a configuration for snapshot debugging on your own server.

```json
{
    "name": "snapshotInitialize: Your own server",
    "type": "al",
    "request": "snapshotInitialize",
    "environmentType": "OnPrem",
    "server": "https://bcserver",
    "serverInstance": "BC",
    "authentication": "UserPassword",
    "breakOnNext": "WebClient",
    "executionContext": "DebugAndProfile"
}
```

The following table describes the settings in the `launch.json` file for snapshot debugging on your own server.


|Setting|Mandatory|Value|
|-------|---------|-----|
|`name`|Yes|A name that identifies the configuration in Visual Studio Code.|
|`type`|Yes|Set to `"al"`.|
|`request`|Yes|Set to `"snapshotInitialize"`.|
|`userId`|No|The User Security ID of the user whose session you want to record. For on-premises user-password authentication, you can also specify the username. To record an existing session, specify `sessionId`. If both are supplied, the session must belong to that user.|
|`sessionId`|No|An existing session to record. You can specify it without `userId`. If both are supplied, the session must belong to that user.|
|`environmentType`|Yes|Set to `"OnPrem"`.|
|`server`|Yes|The HTTP or HTTPS base URL of your server, for example, `"https://bcserver"`. Specify the instance in `serverInstance` and the snapshot service port in `port`.|
|`port`|No|The snapshot debugger endpoint port. The default is `7083`. Set this property explicitly for a nondefault snapshot port. Don't rely on a port embedded in `server` to select the service port.|
|`serverInstance`|Yes|The name of your Business Central Server instance, for example, `"BC"`.|
|`authentication`|No|The server authentication method: `"MicrosoftEntraID"`, `"AAD"`, `"Windows"`, or `"UserPassword"`. The default is `"MicrosoftEntraID"`. Set it to match your server configuration. For on-premises Microsoft Entra authentication, use `primaryTenantDomain` to identify the directory for sign-in. Learn more in [Microsoft Entra authentication for Business Central on-premises](devenv-aad-auth-onprem.md).|
|`primaryTenantDomain`|No|The Microsoft Entra tenant ID or primary domain used for on-premises Microsoft Entra sign-in. This is separate from the Business Central `tenant` setting.|
|`tenant`|Conditional|The Business Central tenant name, for example, `"default"` or `"MyTenant"`. Required when the server hosts multiple tenants and the tenant can't be resolved from the connection URL.|
|`breakOnNext`|No|The session type to record: `"WebServiceClient"` for OData or SOAP clients, `"WebClient"` for the web client, `"Background"` for background sessions such as job queues, or `"Agent"` for agent sessions. If neither `userId` nor `sessionId` is specified, recording waits for the next matching session on the tenant.|
|`executionContext`|No|Specifies whether to collect debugging data, profiling data, or both: `"Debug"`, `"Profile"`, or `"DebugAndProfile"`. The default is `"DebugAndProfile"`. Learn more in [Snapshot configuration settings](devenv-al-profiler-overview.md#snapshot-configuration-settings).|
|`snapshotVerbosity`|No|Set to `"Full"` to record stepping information for every executed line, or `"SnapPoint"` to record stepping information at snappoints.|
|`profilingType`|No|Specifies `"Instrumentation"` to measure every executed frame or `"Sampling"` to collect frames at intervals. The default is `"Instrumentation"`. Sampling requires a server that supports sampling and `executionContext` set to `"Profile"`. Learn more in [Profiling AL code](devenv-al-profiler-overview.md).|
|`profileSamplingInterval`|No|The sampling interval in milliseconds when `profilingType` is `"Sampling"`. Options are `50`, `100`, or `150`. The default is `100`.|

## User and workspace launch configuration

Starting in [!INCLUDE[prod_short](includes/prod_short.md)] version 21.1, you can add a `launch` property to a `.code-workspace` file or the user `settings.json` file to share configurations across projects. A local `launch.json` file overrides workspace and user configurations. A workspace launch configuration overrides the launch configuration in the user `settings.json` file.

> [!NOTE]
> If a local `launch.json` file doesn't contain a matching AL configuration, the extension looks for one in the workspace, then in user settings. However, a `launch` property in the `.code-workspace` file takes precedence over user settings, even if it doesn't contain a matching AL configuration.

## Related information

[JSON files](devenv-json-files.md)  
[AL development environment](devenv-reference-overview.md)  
[Understand app identity for AL apps](devenv-app-identity.md)  
[Debug AL code](devenv-debugging.md)  
[Resource exposure policy setting](devenv-security-settings-and-ip-protection.md)  
[AL Language extension configuration](devenv-al-extension-configuration.md)  
[Configure context-sensitive help](../help/context-sensitive-help.md)  
[Use app key vaults with Business Central extensions](devenv-app-key-vault-overview.md)  
