---
title: Debug MCP Server for AL
description: Learn how to use the Debug MCP Server to analyze runtime state during debugging sessions with AI-powered insights in AL.
author: SusanneWindfeldPedersen
ms.custom: bap-template
ms.date: 12/11/2025
ms.reviewer: solsen
ms.topic: concept-article
ms.author: solsen
ms.collection: get-started
---

# Debug MCP Server for AL

The Debug Model Context Protocol (MCP) Server is an AI-powered debugging tool that allows you to analyze the runtime state of AL code during active debugging sessions using natural language queries. Unlike traditional debugging where you manually inspect variables and step through code, the Debug MCP Server enables GitHub Copilot to programmatically access stack frames, variables, source code, and breakpoints to help diagnose issues.

## When to use the Debug MCP Server

Use the Debug MCP Server when you want Copilot to help analyze:

- **Runtime errors** - Understand how execution reached an error point
- **Complex call stacks** - Trace method calls across multiple application objects
- **Variable state** - Inspect variable values at specific execution points
- **Logic flow issues** - Understand why code took a particular path
- **Breakpoint analysis** - Set and analyze breakpoints programmatically

Traditional debugging is still better for:

- Interactive step-through debugging
- Quick visual inspection of simple issues
- Learning code flow for the first time

## Prerequisites

- Active debugging session in Visual Studio Code
- Execution paused at a breakpoint or error
- AL Language extension installed
- GitHub Copilot Chat enabled

## Available tools

The Debug MCP Server is only available when debugging. In Visual Studio Code, you can see the available tools by clicking the tools window in the Copilot Chat.

The Debug MCP Server supports four tools, which are described in the following sections.

### Get stack frames

Retrieves the complete call stack showing how execution reached the current point. The tool returns detailed information about each stack frame and can be used for:

- Analyzing error flows
- Understanding method call hierarchy
- Identifying which test or entry point triggered execution

The tool returns:

- Method names
- Object IDs and types (Codeunit, Page, and so on)
- Object names
- Line numbers and statement spans
- Application information (app name, publisher, and version)

#### Example question - stack frames

`Analyze how this error occurred.`

### Get variables

Inspects variable values at a specific stack frame. The tool can retrieve local and global variables, including complex types like Records and DotNet objects. It takes the frame ID as a parameter to specify which stack frame to analyze:

`frameid` - The frame index (0 = current frame, 1 = caller, and so on)

Use the tool for:

- Checking variable state at error point
- Understanding why a condition evaluated a certain way
- Verifying data flow between procedures

The tool returns:

- Variable names and values
- Type information
- Global versus local scope
- Nested children for complex types
- Database statistics (SQL latency, executes, and row reads)
- Special values like `<Uninitialized>`

Learn more about frame IDs in the [Understanding frame IDs](#understanding-frame-ids) section.

#### Example questions - get variables

`Show me the value for the CallTreeProfilingNodes`

`Analyze the error at this breakpoint`

### Get source code

Retrieves the source code for a specific stack frame. It takes the frame ID as a parameter to specify which stack frame's code to return:

`frameid` - The frame index (optional, defaults to current)

Use the tool for:

- Viewing code context for frames in system codeunits
- Understanding implementation details of called methods
- Analyzing code without switching files

The tool returns:

- Complete source code of the codeunit containing the frame

Learn more about frame IDs in the [Understanding frame IDs](#understanding-frame-ids) section.

#### Example question - get source code

`Show me the source code at frame 2 in the call stack`

### Add breakpoint

Programmatically adds a breakpoint during debugging. The tool takes the following parameters:

- `ApplicationObjectId` - The object number
- `ApplicationObjectType` - The object type (Codeunit, Page, and so on)
- `LineNumber` - Line number within the object

Use the tool for:

- Setting conditional investigation points based on analysis
- Adding breakpoints to system code
- Automating breakpoint placement based on patterns

#### Example question - add breakpoint

`Add a breakpoint at line 42 in codeunit 50100`

## Tips and best practices

In the next sections, you can find tips and best practices for using the Debug MCP Server effectively.

### Be specific in your requests

- **Don't ask** "What's wrong with my code?"
- **Ask** "Analyze how we got to this error using the Debug MCP Server" instead.

### Reference stack frame numbers

When discussing specific frames, make sure to reference frame IDs, for example:

- `What are the variables at frame 1?`
- `Show me the source code for the GetProfilingNodes caller`

### Combine multiple queries

Ask Copilot to gather comprehensive information, such as:

`Get the stack frames, then show me the variables at the error frame and the calling frame`

### Use for complex scenarios

The Debug MCP Server works well for complex debugging scenarios, such as:

- Deep call stacks (5+ frames)
- Multiple codeunit interactions
- System/framework code analysis
- State corruption issues

### Verify Copilot's findings

The Debug MCP Server provides raw data, but you should always verify the findings by checking:

- Variable values match your expectations
- Frame sequence makes logical sense
- Source code matches your repository version

## Common use cases

Some common use cases for the Debug MCP Server are described in the next sections.

### Debugging test failures

Ask: `Use the Debug MCP Server to show me the call stack and variables when this test fails`

### Understanding error origins

Ask: `Trace back through the stack frames to show me how execution reached this error`

### Inspecting state across frames

Ask: `Show me the RecordData variable values at the current frame and in the calling frame`

### Analyzing system code behavior

Ask: `Get the source code for the system codeunit frame and show me what parameters it received`

## Understanding frame IDs

Frame IDs represent the call stack position, refer to the following table for details:

|Frame ID| Description |
|..------|-------------|
|0       | Current execution point (where debugger is paused) |
|1       | Direct caller |
|2       | Caller's caller |
|N       | N levels up the call stack |

## Variable display format

In the Debug MCP Server, variables are shown with the following properties:

- **Name** - Variable identifier
- **Value** - Current value (or `<Uninitialized>`)
- **TypeName** - AL type (Integer, Text, Codeunit, Record, and so on)
- **Children** - For complex types (Records, DotNet objects)

Special values include:

- `<Uninitialized>` - Variable declared but not assigned
- `<Database Statistics>` - SQL performance metrics

## Limitations

The Debug MCP Server has the following limitations:

- **Requires active debug session** - it can't analyze past executions
- **Frame-based** - it's limited to current call stack; can't inspect other sessions
- **No time travel** - it can't go back to previous breakpoints

## Comparison with traditional debugging

|Feature|Debug MCP Server|Traditional Debugger|
|-------|----------------|-------------------|
|View call stack|Yes. Programmatic access|Yes. Visual panel|
|Inspect variables|Yes. All frames at once|Yes. One frame at a time|
|Step through code|No.|Yes.|
|Watch variables|No.|Yes. (watch expressions)|
|AI analysis|Yes. Automatic insights|No.|
|Complex pattern detection|Yes.|No.|
|Set breakpoints|Yes. Programmatic|Yes. Manual|
|Export debug info|Yes. Via Copilot|No.|
|Multi-frame analysis|Yes. Simultaneous|No. Manual switching|

## Best practices for AL developers

The following best practices can help you get the most out of the Debug MCP Server.

### Do

- Use Debug MCP Server for complex call stack analysis  
- Ask Copilot to correlate variables across multiple frames  
- Request pattern detection in error scenarios  
- Get AI insights on why errors occurred  
- Use for test failure analysis

### Don't

- Replace all manual debugging with MCP Server  
- Expect it to modify execution flow  
- Use for simple single-step investigations  
- Rely on it without verifying findings  
- Use when not in an active debug session

## Troubleshooting

### "No debug session active"

- Ensure you've hit a breakpoint or error
- Code must be paused in debugger
- Check AL Language extension is running

### "Frame ID not found"

- Frame IDs are 0-based
- Check stack depth first with Get Stack Frames
- Ensure frame still exists (hasn't returned)

### "Source code unavailable"

- Some system frames might not return source
- Source might be from compiled .app files
- Try viewing variables instead

### "Empty variable list"

- Frame might have no local variables
- Check global variables in Frame 0
- Procedure might use parameters only

## Advanced techniques

### Multi-frame variable tracking

Track how a value changes through the call stack:

*"Show me the MyParameter variable at frames 0, 1, and 2 to see how it was modified"*

### Error context gathering

Get comprehensive error context:

*"Get the stack frames, then show variables at the error frame and the source code of the calling method"*

### Test failure root cause

Understand test failures:

*"This test is failing - use the Debug MCP Server to show me the full call stack from the test method to the error"*

### Performance investigation

Check database statistics:

*"Show me the database statistics at the current frame - how many SQL operations occurred?"*

## Related information

[Debugging in AL](devenv-debugging.md)  
[Setting conditional breakpoints](devenv-debugging-conditional-breakpoints.md)  
[Snapshot Debugging](devenv-snapshot-debugging.md)  
[Attach and Debug Next](devenv-attach-debug-next.md)  
[Debug upgrade and install code](devenv-debug-upgrade-install-code.md)
