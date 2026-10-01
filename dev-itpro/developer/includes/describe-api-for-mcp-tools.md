## Describe the API for MCP tools

When an API page or API query is exposed as a tool through the Business Central MCP server, the server uses metadata from the API object to generate the tool description.

The MCP server determines the tool description in the following order:

1. The [AboutText](../properties/devenv-abouttext-property.md) property.
1. If `AboutText` isn't specified, the server uses the [EntitySetCaption](../properties/devenv-entitysetcaption-property.md) property.
1. If `EntitySetCaption` isn't available, the server uses a camel-cased version of the [EntityName](../properties/devenv-entityname-property.md) property.

Provide meaningful values for these properties to help MCP clients and agents understand and select the appropriate tools. Learn more about the Business Central MCP server in [Model Context Protocol (MCP) in Business Central](../../ai/mcp-overview.md).