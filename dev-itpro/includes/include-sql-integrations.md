> [!WARNING] 
> The [!INCLUDE[prod_short](prod_short.md)] server synchronizes the metadata model defined in AL to physical tables on the SQL Server database during operations such as upgrade and app/extension synchronization. 
>
> While it is possible to integrate directly with SQL Server objects on the database (bypassing the [!INCLUDE[prod_short](prod_short.md)] server), this is not recommended and not also supported.
> 
> Altering SQL objects created by the [!INCLUDE[prod_short](prod_short.md)] server directly on the database can break operations such as upgrade and app/extension synchronization. 
> 
> Adding additional SQL objects such as triggers or stored procedures directly on the database can both break operations such as upgrade and app/extension synchronization, but will also break system integrations that depend on such additional objects in case the table schema created by the [!INCLUDE[prod_short](prod_short.md)] server synchronization change. 