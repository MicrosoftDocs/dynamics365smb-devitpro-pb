> [!WARNING] 
> During operations such as upgrade and app/extension synchronization, the [!INCLUDE[server](../developer/includes/server.md)] synchronizes the metadata model defined in AL to physical tables on the SQL Server database.
>
> While it's possible to integrate directly with SQL Server objects on the database (bypassing the [!INCLUDE[server](../developer/includes/server.md)]), it's not recommended or even supported.
> 
> Altering SQL objects created by the [!INCLUDE[server](../developer/includes/server.md)] directly on the database can break operations such as upgrade and app/extension synchronization. 
> 
> Adding additional SQL objects such as triggers or stored procedures directly on the database can break operations like upgrade and app/extension synchronization, but will also break system integrations that depend on such additional objects in case the table schema created by the [!INCLUDE[server](../developer/includes/server.md)] synchronization change. 
