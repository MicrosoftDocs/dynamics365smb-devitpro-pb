There's a performance overhead involved in having change log enabled on a table. First, there are extra writes to the database when inserting, modifying, or deleting data, each of these operations will trigger an insert statement per field that is enabled for change logging. Second, the size of the change log table can impact the performance of admin operations such as copy company, export, and backup/restore of environments. 

It is therefore recommended to critically evaluate what fields should be tracked in the change log and also to do extra testing with realistic data setup before rolling out configuration changes to the setup of change log. 

For more information, see [Change log](/dynamics365/business-central/across-log-changes)  