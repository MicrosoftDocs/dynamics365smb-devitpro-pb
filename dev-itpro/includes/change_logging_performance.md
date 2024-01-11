There's a performance overhead involved in having change log enabled on a table. First, there are extra writes to the database when inserting, modifying, or deleting data. Each of these operations triggers an insert statement per field that's enabled change logging. Second, the size of the change log table can impact the performance of admin operations such as copy company, export, and backup/restore of environments. 

It's recommended to critically evaluate what fields should be tracked in the change log and also to do extra testing with realistic data before rolling out configuration changes to the setup of the change log. 

For more information, see [Change log](/dynamics365/business-central/across-log-changes).  
