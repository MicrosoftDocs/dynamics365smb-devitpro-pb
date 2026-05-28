| HTTP header | Description | Example |
|--------|-------------|---------|
| `TenantId` | Your Microsoft Entra tenant ID (GUID) | `aaaabbbb-0000-cccc-1111-dddd2222eeee` |
| `EnvironmentName` | The name of the Business Central environment to connect to | `Production` |
| `Company` | The company name within the environment |`CRONUS USA, Inc.` (ASCII)<br><br>`=?base64?Q3JvbnVzIMOFcmh1cyBBL1M=?=` (Base64-encoding of `CRONUS Århus A/S`) |
| `ConfigurationName` | (Optional) The MCP server configuration in the environment to use | `SalesTeamConfig`<br><br>`=?base64?w4VyaHVzU2FsZXNUZWFtQ29uZmln?=` (Base64-encoding of `ÅrhusSalesTeamConfig`)|

> [!NOTE]
> If the `Company` or `ConfigurationName` values contain non-ASCII characters (for example, `ø`, `æ`, or `å`), you must encode the values using Base64 (UTF-8).  
> The encoded value must use the format `=?base64?<encodedvalue>?=`. Learn more in [Base64 decoding in the MCP HTTP standard](https://modelcontextprotocol.io/seps/2243-http-standardization#base64-decoding).
>
> With Copilot Studio, the platform handles the encoding, so manual encoding isn't required.  
