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

The Debug MCP Server is an AI-powered debugging tool that allows you to analyze the runtime state of AL code during active debugging sessions using natural language queries. Unlike traditional debugging where you manually inspect variables and step through code, the Debug MCP Server enables GitHub Copilot to programmatically access stack frames, variables, source code, and breakpoints to help diagnose issues.

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

The Debug MCP Server supports four tools:

### Get stack frames

Retrieves the complete call stack showing how execution reached the current point.

**When to use:**

- Analyzing error flows
- Understanding method call hierarchy
- Identifying which test or entry point triggered execution

**Returns:**

- Method names
- Object IDs and types (Codeunit, Page, and so on)
- Object names
- Line numbers and statement spans
- Application information (app name, publisher, version)

**Example question:**

*"Analyze how we got to this error."*

### Get variables

Inspects variable values at a specific stack frame.

**Parameters:**

- `frameid` - The frame index (0 = current frame, 1 = caller, and so on)

**When to use:**

- Checking variable state at error point
- Understanding why a condition evaluated a certain way
- Verifying data flow between procedures

**Returns:**

- Variable names and values
- Type information
- Global vs local scope
- Nested children for complex types
- Database statistics (SQL latency, executes, row reads)

**Example questions:**

*"Show me the value for the CallTreeProfilingNodes"*

*"Analyze the error at this breakpoint"*

### Get source code

Retrieves the source code for a specific stack frame.

**Parameters:**

- `frameid` - The frame index (optional, defaults to current)

**When to use:**

- Viewing code context for frames in system codeunits
- Understanding implementation details of called methods
- Analyzing code without switching files

**Returns:**

- Complete source code of the codeunit containing the frame

**Example question:**

*"Show me the source code at frame 2 in the call stack"*

### Add breakpoint

Programmatically adds a breakpoint during debugging.

**Parameters:**

- `ApplicationObjectId` - The object number
- `ApplicationObjectType` - The object type (Codeunit, Page, and so on)
- `LineNumber` - Line number within the object

**When to use:**

- Setting conditional investigation points based on analysis
- Adding breakpoints to system code
- Automating breakpoint placement based on patterns

**Example question:**

*"Add a breakpoint at line 42 in codeunit 50100"*

## Tips and best practices

### Be specific in your requests

❌ "What's wrong with my code?"  
✅ "Analyze how we got to this error using the Debug MCP Server"

### Reference stack frame numbers

When discussing specific frames:

*"What are the variables at frame 1?"*  
*"Show me the source code for the GetProfilingNodes caller"*

### Combine multiple queries

Ask Copilot to gather comprehensive information:

*"Get the stack frames, then show me the variables at the error frame and the calling frame"*

### Use for complex scenarios

The Debug MCP Server shines with:

- Deep call stacks (5+ frames)
- Multiple codeunit interactions
- System/framework code analysis
- State corruption issues

### Verify Copilot's findings

The Debug MCP Server provides raw data - verify:

- Variable values match your expectations
- Frame sequence makes logical sense
- Source code matches your repository version

## Common use cases

### Debugging test failures

Ask: *"Use the Debug MCP Server to show me the call stack and variables when this test fails"*

### Understanding error origins

Ask: *"Trace back through the stack frames to show me how execution reached this error"*

### Inspecting state across frames

Ask: *"Show me the RecordData variable values at the current frame and in the calling frame"*

### Analyzing system code behavior

Ask: *"Get the source code for the system codeunit frame and show me what parameters it received"*

## Understanding frame IDs

Frame IDs represent the call stack position:

- Frame 0 = Current execution point (where debugger is paused)
- Frame 1 = Direct caller
- Frame 2 = Caller's caller
- Frame N = N levels up the call stack

## Variable display format

Variables are shown with:

- **Name** - Variable identifier
- **Value** - Current value (or `<Uninitialized>`)
- **TypeName** - AL type (Integer, Text, Codeunit, Record, and so on)
- **Children** - For complex types (Records, DotNet objects)

Special values:

- `<Uninitialized>` - Variable declared but not assigned
- `<Database Statistics>` - SQL performance metrics

## Limitations

- **Requires active debug session** - Cannot analyze past executions
- **Frame-based** - Limited to current call stack; cannot inspect other sessions
- **No time travel** - Cannot go back to previous breakpoints

## Comparison with traditional debugging

|Feature|Debug MCP Server|Traditional Debugger|
|-------|----------------|-------------------|
|View call stack|✅ Programmatic access|✅ Visual panel|
|Inspect variables|✅ All frames at once|✅ One frame at a time|
|Step through code|❌|✅|
|Watch variables|❌|✅ (watch expressions)|
|AI analysis|✅ Automatic insights|❌|
|Complex pattern detection|✅|❌|
|Set breakpoints|✅ Programmatic|✅ Manual|
|Export debug info|✅ Via Copilot|❌|
|Multi-frame analysis|✅ Simultaneous|⚠️ Manual switching|

## Best practices for AL developers

**DO:**

✅ Use Debug MCP Server for complex call stack analysis  
✅ Ask Copilot to correlate variables across multiple frames  
✅ Request pattern detection in error scenarios  
✅ Get AI insights on why errors occurred  
✅ Use for test failure analysis

**DON'T:**

❌ Replace all manual debugging with MCP Server  
❌ Expect it to modify execution flow  
❌ Use for simple single-step investigations  
❌ Rely on it without verifying findings  
❌ Use when not in an active debug session

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
[Snapshot Debugging](devenv-snapshot-debugging.md)  
[Attach and Debug Next](devenv-attach-debug-next.md)
