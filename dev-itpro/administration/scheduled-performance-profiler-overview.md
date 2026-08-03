---
title: Scheduled performance profiler overview
description: Describes how to use the Profiler Schedules page in Business Central to troubleshoot slow processes across time.
ms.author: sodragon
ms.date: 08/03/2026
ms.reviewer: solsen
ms.topic: article
author: sodragon
---

# Scheduled performance profiler overview

In some cases, many different business processes can interfere with each other, which can cause some of them to take longer than expected. Diagnosing these issues becomes more challenging because they can be transient as they depend on specific users' workflows
or even happen outside of business hours. An example could be when scheduled jobs are run at the same time. 

Your administrator or partner can use the **Profiler Schedules** page in [!INCLUDE [prod_short](../includes/prod_short.md)] to set up schedules for when snapshots of the processes should be recorded. A schedule defines the time slots and filters for which activity should be recorded for a particular user. While recording, the profiler monitors all the activities that match the filters and produces individual profiles for each of them separately. They allow for retroactive investigation on individual user interactions or system processes by providing a view of what processes were running on the system during the defined time slots. Identifying where the holdup is, can make it easier to go to the correct support organization or, if you have developers in-house, fix the problem yourself.

## Setting up a profiler schedule

To get started working with the **Profiler Schedules** page, follow these steps:

1. In [!INCLUDE [prod_short](../includes/prod_short.md)], choose the :::image type="content" source="../developer/media/search-icon.png" alt-text="Tell me what you want to do"::: icon, enter **Profiler Schedules**, and then choose the related link.
    > [!NOTE]  
    > You can also access the **Profiler Schedules** page from under **Help & Support**, under **Analyze Performance with scheduled profiler**.
2. Create a new schedule by choosing the **New** action. This opens the **Profiler Schedule** card page.
3. Add a description for your schedule, which makes it easy for you to identify it in the future.
4. Select the user to be profiled, for example, the user who has reported a performance problem.
5. Select the activity type, depending on what kind of performance problem was reported (for example, **Activities in the browser** for a user experiencing slow page loads).
6. Select a start and end time for the schedule.
    > [!TIP]  
    > Choose a time slot that's appropriate for the issue you're investigating. For intermittent performance problems, a longer schedule - even several days - can help catch the issue. Profiling has a minor performance impact on the selected user; for details, see the [FAQ](#faq).
7. Close the card page.
   [!INCLUDE [prod_short](../includes/prod_short.md)] now automatically records any activity that matches your configuration and happens in the time frame that you configured.

## Types of activity, which can be recorded

Profiler schedules are supported for the following types of activities:

1. **Activities in the browser** - A user logs into [!INCLUDE [prod_short](../includes/prod_short.md)] and uses the product.
2. **Background Tasks (incl. job queues)** - Scheduled tasks, job queues, and sessions created from AL code for background processing.
3. **Web Service Calls** - Incoming OData or SOAP API calls.

## Permissions for creating a schedule

Administrator users can create schedules for themselves and other users. Other users can create schedules for themselves to record their workflow. 

### How to turn off a schedule

A schedule can be turned off by navigating to it via the **Profiler Schedules** page and toggling off the **Enabled** field. A schedule also automatically becomes inactive when its configured end time is reached.

## Viewing and analyzing the profiles from a schedule

The profiles generated from a specific schedule can be accessed by selecting it in the Profiler Schedules page and clicking on the **Open Profiles** action. This opens the **Performance Profiles** page.
In the list, each profile corresponds to an activity within [!INCLUDE [prod_short](../includes/prod_short.md)]. The **Activity Description** column describes what kind of activity happened in order to 
correlate these activities with user interactions, jobs, or web service calls. Various aggregate performance metrics are provided for each activity. Use analysis mode to perform a high-level investigation of what processes
take the most time here. Learn more in [Learn more about data analysis mode](/dynamics365/business-central/analysis-mode).

> [!TIP]  
> The **Correlation ID** column can be provided to customer support when reporting a performance issue to identify a specific interaction.

Each activity is associated with a performance profile, which contains a snapshot of the AL code that was executed as part of it. By clicking on the row or using the **Open Profile** action, an overview of the profile opens in the **Performance Profiler** page.
This overview is the same as the one created for the in-client performance profiler. Learn more about how to analyze this data in [Analyzing high-level results](performance-profiler-overview.md#analyzing-high-level-results) and [Viewing advanced results](performance-profiler-overview.md#viewing-advanced-results).

The profiles can also be analyzed via the AL profiler in Visual Studio Code after downloading them. Learn more in [AL Profiler overview](/dynamics365/business-central/dev-itpro/developer/devenv-al-profiler-overview).

An overview of the fields of the **Performance Profiles** page can be found below:

| Name                  | Description                                                    |
|-----------------------|----------------------------------------------------------------|
| Start Time            | When the profile started.                                      |
| User Name             | The name of the user who performed the activity.             |
| Activity Type         | The type of activity that the user performed.        |
| Activity Description  | A system generated description of the activity.                |
| Activity Duration     | The duration of the recorded activity, not including idle time.|
| AL Execution Duration | The duration of the executed AL code in the recorded activity, not including idle time. |
| Duration of captured SQL calls | The total duration of captured SQL calls in the recorded activity. |
| Number of SQL Calls   | The number of SQL calls made during the recorded activity.     |
| Duration of Http Calls | The total duration of HTTP calls made during the recorded activity. |
| Number of Http Calls  | The number of HTTP calls made during the recorded activity.    |
| Duration of Platform Calls | The total duration of platform calls made during the recorded activity. |
| Correlation ID        | An ID used to correlate the activity with telemetry. Corresponds to Operation ID in Application Insights.  |
| Client Session ID     | The ID of the client session in which the activity was recorded. Corresponds to the Session ID in Application Insights. |
| Schedule Description  | The description of the schedule that generated the profile.    |

## Downloading performance profiles

If you want to share a recording, for example, if you're in contact with the company that provided an app that you think is slowing down a process, you can share the recording with them. Choose the **Share** button on the **Performance Profiler** page, and send the link to the app provider.

You can also download the recording and, for example, copy the file to OneDrive to share it with your colleagues. Choose the **Download** button on the **Performance Profiles** page, and then choose **Yes** in the confirmation dialog. The file is downloaded to your default download location.

## Clearing performance profiles

The performance profiles associated to a schedule are deleted when the schedule itself is deleted. The amount of data collected from user sessions can grow quickly and take up storage. For this reason, the maximum retention time of a schedule after it finished is one week and the maximum duration of a schedule itself is also one week.

## Advanced Schedule settings

### Sampling Frequency

Sampling profiling is used when recording activities via the scheduled performance profiler. In simple terms, the system takes samples of what AL code is being executed in evenly spaced time intervals (for example, every 100 milliseconds). The frequency of the samples is controlled via the **Sampling Frequency** column in the **Profiler Schedule** page. This means that code that executes for smaller durations might not be captured in the recordings. Furthermore, the durations, which are recorded are approximate and depend on the sampling frequency that's used.

### Activity Duration Threshold

The **Activity Duration Threshold** is a threshold that allows for filtering out short-lived activities, which wouldn't be helpful when doing an analysis of the profiling results. The threshold refers to the duration of executed AL code.

## Scheduled Profiling and Debugging

While scheduled profiling is enabled for a session, it's not possible to attach the debugger to it. This includes launching with debugging, attaching to a session and snapshot debugging via Visual Studio Code.

## Profiling with an AI agent (MCP server)

[!INCLUDE [2026-releasewave2-later](../includes/2026-releasewave2-later.md)]

> [!NOTE]
> This feature is available in preview with a prerelease of runtime 18 and Business Central Server version 29.

Instead of setting up and collecting a schedule manually, you can let an AI agent drive the whole flow through the **Performance Profiling MCP server**. The agent sets up a schedule for a slow session, you keep working, and the agent then collects the recorded profiles and explains what's slow - without you opening the **Profiler Schedules** page.

The MCP server uses the same scheduling engine described earlier in this article, so how profiles are captured, stored, retained, and analyzed is unchanged. It exposes the following tools that an agent calls on your behalf:

| Tool | What it does | Manual equivalent |
|------|--------------|-------------------|
| Schedule profiling | Creates a schedule for the target session's user and activity type, enabled for a bounded window (5 minutes by default, up to 1 hour). Session memory usage is also estimated automatically. Learn more in [Session memory usage](#session-memory-usage). | [Setting up a profiler schedule](#setting-up-a-profiler-schedule) |
| Stop schedule and get profiles | Turns off the schedule and returns the recorded `.alcpuprofile` files plus a per-activity overview (durations, SQL, and HTTP call counts and times). Each `.alcpuprofile` also carries the session's estimated total memory and object count. Learn more in [Session memory usage](#session-memory-usage). | [Open Profiles](#viewing-and-analyzing-the-profiles-from-a-schedule) and [Download](#downloading-performance-profiles) |
| Get profile for activity | Returns a single activity's profile for a closer look. | Opening one row on the **Performance Profiles** page |
| Analyze profiles in folder | A local tool that doesn't connect to Business Central. It lists the `.alcpuprofile` (or `.zip`) files you placed in the proxy's user profile folder so the agent can read and analyze them. Use it for profiles obtained out of band or captured earlier. | Opening downloaded recordings in the Visual Studio Code AL Profiler |

When the agent interprets a profile, it evaluates the hot AL functions against the Business Central [performance patterns and anti-patterns](https://github.com/microsoft/BCQuality).

The proxy also saves captured profiles to local files on the machine running the agent so MCP hosts that drop embedded binary content can still read them. Auto-captured profiles are grouped in per-schedule subfolders and removed once past a retention window (1 day by default; configurable with `--profileretentiondays`); cleanup runs at proxy startup and at the next capture, not on a background timer. Profiles you want to keep and analyze with the **Analyze profiles in folder** tool go in the `user` subfolder, which is never deleted automatically. The folder location is configurable with `--profilefolder`. These local files can contain sensitive business data, so handle them securely and in line with your privacy requirements.

### Session memory usage

Alongside the CPU sampling profiles, the profiling tools automatically estimate the profiled session's memory usage; there's nothing extra to turn on. When you collect with **Stop schedule and get profiles**, the session's estimated total memory and object count are retained with the results, and the agent presents them in a human-readable form, for example, "about 512 MiB across 1.2 million objects", so you can see at a glance whether memory is a factor.

The profiles the agent collects are the same ones that appear on the **Performance Profiles** page, and you can open them in the Visual Studio Code AL Profiler just as you would a downloaded recording.

### Part of the Business Central MCP server

The profiling tools aren't a separate server - they're part of the [Business Central MCP server](../ai/mcp-overview.md), the same server that exposes your API pages to agents, surfaced as a developer profiling capability alongside the debugging tools. To use them, provide **altool** with the `launchprofilingmcpproxy` command - an MCP client you can set up with any MCP host (Claude CLI, GitHub Copilot CLI, Visual Studio Code, and so on), as shown in the following sections. Learn more in [Performance Profiling MCP proxy](/dynamics365/business-central/dev-itpro/developer/devenv-al-tool#performance-profiling-mcp-proxy).

### You need the session ID of the slow connection

The profiling MCP always targets one specific session, so before you start you need the **numeric session ID** of the connection you want to profile - the agent passes it to every tool call. An administrator can identify the session and its ID from the list of active sessions for the environment; the same numeric session ID is the one reported as the session ID in telemetry. You give it to the agent in your prompt - for example, *"Profile session 10 for the next five minutes and tell me what's slow."*

### Setting it up

The MCP server is the `launchprofilingmcpproxy` command of [ALTool](/dynamics365/business-central/dev-itpro/developer/devenv-al-tool#performance-profiling-mcp-proxy), a .NET tool you install once:

```bash
dotnet tool install --global Microsoft.Dynamics.BusinessCentral.Development.Tools
```

Each MCP host launches that command as a stdio server. The connection target (cloud environment or on-premises server) and the authentication method are passed as command-line `args`. The examples in the following sections connect to a cloud sandbox. For on-premises servers, see [Performance Profiling MCP proxy](/dynamics365/business-central/dev-itpro/developer/devenv-al-tool#performance-profiling-mcp-proxy) for information about the `--server`, `--serverinstance`, and `--port` options, as well as the full option and authentication reference.

> [!NOTE]  
> The credentials themselves *aren't* command-line arguments. The proxy has no option for them, so secrets never end up in `args`. The proxy reads them from its environment instead, which you set through the server's `env` block: for **cloud** you can either sign in interactively by using `altool auth login` (the proxy then reads the cached token automatically - no `env` block needed) or set `BC_ACCESS_TOKEN` (a Microsoft Entra access token); for **on-premises** `UserPassword` authentication set `BC_SERVER_USERNAME` and `BC_SERVER_PASSWORD`. Reference an environment variable rather than hardcoding the value so the secret stays out of the config file. In Visual Studio Code, the AL extension handles sign-in for you, so no `env` block is needed when the server is autoregistered.

For a cloud environment, you can authenticate in one of two ways.

**Interactive sign-in (recommended for local use).** Sign in once as a user who has access to the environment:

```bash
altool auth login --environmenttype Sandbox --environmentname sandbox --tenant contoso.onmicrosoft.com
```

This method opens a browser and then stores the token - together with a refresh token - in a local cache shared by the Business Central AL dev tools. The proxy reads it automatically on every run and refreshes it silently, so you don't need a `BC_ACCESS_TOKEN` `env` block and you won't hit the one-hour token expiry.

**Pre-acquired token (for headless or CI/CD).** When an interactive sign-in isn't possible, supply a token through `BC_ACCESS_TOKEN` instead. Acquire it by using the [Azure CLI](/cli/azure/) (after `az login` as a user who has access to the environment), requesting a token for the Business Central API scope:

```bash
az account get-access-token --scope https://api.businesscentral.dynamics.com/.default --query accessToken --output tsv
```

Assign the result to the `BC_ACCESS_TOKEN` environment variable that the `env` block references. This token is short-lived (about one hour), so refresh it when it expires. `BC_ACCESS_TOKEN` takes precedence over an interactive sign-in, so leave it unset when you use `altool auth login` - a stale value overrides the cached token and the connection fails. In Visual Studio Code, the AL extension acquires and refreshes the token for you.

The host-specific examples in the following sections include a `BC_ACCESS_TOKEN` `env` block for the pre-acquired-token approach. If you signed in by using `altool auth login`, omit the `env` block entirely.

#### Claude CLI

Register the server by using the `claude mcp add` command:

```bash
claude mcp add bc-profiling -e BC_ACCESS_TOKEN=$BC_ACCESS_TOKEN -- altool launchprofilingmcpproxy --environmenttype Sandbox --environmentname sandbox --tenant contoso.onmicrosoft.com
```

This command is equivalent to the following stdio entry in your Claude configuration:

```json
{
  "mcpServers": {
    "bc-profiling": {
      "command": "altool",
      "args": ["launchprofilingmcpproxy", "--environmenttype", "Sandbox", "--environmentname", "sandbox", "--tenant", "contoso.onmicrosoft.com"],
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
    "bc-profiling": {
      "type": "local",
      "command": "altool",
      "args": ["launchprofilingmcpproxy", "--environmenttype", "Sandbox", "--environmentname", "sandbox", "--tenant", "contoso.onmicrosoft.com"],
      "tools": ["*"],
      "env": { "BC_ACCESS_TOKEN": "$BC_ACCESS_TOKEN" }
    }
  }
}
```

#### Visual Studio Code

In Visual Studio Code agent mode, you don't configure anything: the AL extension registers the **Business Central Profiling MCP Server** automatically and derives the connection from your `launch.json`. Sign in when prompted, and then ask the agent to profile a session. To wire it up manually in another editor, add an equivalent stdio entry to `.vscode/mcp.json`:

```json
{
  "servers": {
    "bc-profiling": {
      "type": "stdio",
      "command": "altool",
      "args": ["launchprofilingmcpproxy", "--environmenttype", "Sandbox", "--environmentname", "sandbox", "--tenant", "contoso.onmicrosoft.com"],
      "env": { "BC_ACCESS_TOKEN": "${env:BC_ACCESS_TOKEN}" }
    }
  }
}
```

After the server is registered, prompt the agent - for example, *"Profile session 10 for the next five minutes and tell me what's slow"* - and it sets up the schedule, collects the profiles, and summarizes the hot paths.

### Permissions and limitations

The agent connects with your Business Central identity and acts entirely within your permissions. Every action is audited under your user, just like the manual workflow:

- **The MCP server must be enabled** for the environment. Learn more in [Configure the Business Central MCP server](../ai/configure-mcp-server.md).
- **Profiling your own session** needs the same access as [creating a schedule](#permissions-for-creating-a-schedule) by hand: permission to create profiler schedules and read the resulting performance profiles.
- **Profiling another user's session** is delegated debugging, so you must belong to the **D365 ATTACH DEBUG** permission set - the same permission required for [Attach and Debug Next](/dynamics365/business-central/dev-itpro/developer/devenv-attach-debug-next). Without it, the request is denied.

Finally, the [debugging restriction](#scheduled-profiling-and-debugging) still applies: while a schedule is active for a session, the debugger can't attach to it.

## FAQ

### What's the performance impact of running with a profiler schedule?

Profiling only affects the specific user selected in the schedule, and only for the selected type of activity (for example, activities in the browser). Other users and other activity types aren't impacted at all. The overhead of profiling applies only to AL code execution and is typically around 10%. Because database calls, which tend to dominate overall execution time, aren't affected by profiling, the real-world impact on the user's experience is much smaller.

### Is scheduled profiling enabled for my session?

The **Active Schedule ID** field in the **Profiler Schedules** page contains the active schedule for the current session. It's empty if profiling isn't enabled.

### How many profiles are generated from a schedule?

For background jobs and web service calls, one profile is generated for every activity. For users on the web browser the amount depends on their workflow. To ensure that the collected data is useful for investigations and doesn't take up unnecessary storage space, use a high enough value for the **Activity Duration Threshold** setting and limit the duration of schedules to the shortest timespan possible to record the activities of a user.

### Why are profiles appearing with a delay in the **Performance Profiles** page?

The recorded profiles are processed in the background and might take some time to appear. You can use the **Refresh** action to see the latest results.

### I set up a profile and verified that profiling is enabled for a user, but profiles aren't appearing for an interaction. What went wrong?

First, ensure that the **Activity Duration Threshold** and **Sampling Frequency** are set to a low enough value to capture the activities you're trying to record. If the activities are still not being captured, it could be that little time is spent executing AL code but something else is making the execution last longer, such as system functionalities.

### I see some profiles in the **Performance Profiles** page, but I deleted the schedule?

Due to the background processing of profiles, it's possible that some profiles will be processed after their associated schedule is deleted. The system automatically deletes these profiles in a regular interval.


## Related information

[Performance Profiler overview](performance-profiler-overview.md)  
[ALTool](/dynamics365/business-central/dev-itpro/developer/devenv-al-tool)  
[Managing technical support](manage-technical-support.md)  
[Escalate support issues to Microsoft](raise-support-case.md)  
