| HTTP header | Description | Example |
|--------|-------------|---------|
| `TenantId` | Your Microsoft Entra tenant ID (GUID) | `aaaabbbb-0000-cccc-1111-dddd2222eeee` |
| `EnvironmentName` | The name of the Business Central environment to connect to | `Production` |
| `Company` | The company name within the environment | `CRONUS USA, Inc.` (ASCII) or `=?base64?Q3JvbnVzIMOFcmh1cyBBL1M=?=` ( Base64-encoded) for `CRONUS Århus A/S` |
| `ConfigurationName` | (Optional) The MCP server configuration in the environment to use | `SalesTeamConfig` or `=?base64?w4VyaHVzU2FsZXNUZWFtQ29uZmln?=` |

> [!NOTE]
> MCP clients specify values such as the Business Central company (`Company`) and configuration (`ConfigurationName`) by using HTTP headers.  
> If a header value contains non-ASCII characters (for example, `ø`, `æ`, or `å`), some clients might require the value to be encoded using Base64 (UTF-8) before it's sent.  
> The encoded value must use the format `=?base64?<encoded>?=`. Learn more in [Base64 decoding in the MCP HTTP standard](https://modelcontextprotocol.io/seps/2243-http-standardization#base64-decoding).
>
> When using Copilot Studio, header handling is managed by the platform, so manual encoding is generally not required.  
