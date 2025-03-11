> [!NOTE]
>
>- Support for the SOAP protocol is deprecated in [!INCLUDE[prod_short](prod_short.md)] and will be removed in the future. Start to move your solutions to use either ODataV4 or API pages/queries. API pages/queries are recommended.
>
>- Support for exposing Microsoft UI pages as a SOAP endpoint will be removed in Business Central 2026 release wave 2 (version 29.0). If you need SOAP integrations for these pages, copy the source code for the page and host it in a per-tenant extension. Until version 29 is released, you can still expose a Microsoft page as a SOAP endpoint, but not by default. If needed, use the **Feature: Disable SOAP web services on Microsoft UI pages** key in **Feature Management** to enable it.  
>
> Learn more about the removal timeline in [Deprecated Features in the Platform - Clients, Server, and Database](../upgrade/deprecated-features-platform.md).