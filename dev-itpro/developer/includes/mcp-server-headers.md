| HTTP header | Description | Example |
|--------|-------------|---------|
| `TenantId` | The Microsoft Entra tenant to use. Required unless the MCP host supports omitting it. | `aaaabbbb-0000-cccc-1111-dddd2222eeee` |
| `EnvironmentName` | The Business Central environment to use. Required unless the MCP host supports omitting it. | `Production` |
| `Company` | The company to use. Required unless the MCP host supports omitting it. |`CRONUS USA, Inc.` (ASCII)<br><br>`=?base64?Q3JvbnVzIMOFcmh1cyBBL1M=?=` (Base64-encoding of `CRONUS Århus A/S`) |
| `ConfigurationName` | Optional. The MCP server configuration in the environment to use. If omitted or empty, the server uses the current default configuration. | `SalesTeamConfig`<br><br>`=?base64?w4VyaHVzU2FsZXNUZWFtQ29uZmln?=` (Base64-encoding of `ÅrhusSalesTeamConfig`)|

> [!NOTE]
> MCP hosts that support headerless Business Central connections can omit `TenantId`, `EnvironmentName`, `Company`, and `ConfigurationName`. For example, Visual Studio Code with GitHub Copilot supports omitting all four headers.
>
> If the `Company` or `ConfigurationName` values contain non-ASCII characters (for example, `ø`, `æ`, or `å`), encode the values by using Base64 (UTF-8).  
> The encoded value must use the format `=?base64?<encodedvalue>?=`. Learn more in [Base64 decoding in the MCP HTTP standard](https://modelcontextprotocol.io/seps/2243-http-standardization#base64-decoding).
>
> In Copilot Studio, you don't need to manually encode these values because the platform handles the encoding.  
