Clear references to .flf license, if used by the database.

   A *\.bclicense* license type was introduced in 17.12, 18.7, 19.1. Starting in 2023 release wave 1 (v22), the .flf license type [can no longer be used](../../upgrade/deprecated-features-platform.md#flfformat). If your database is using an .flf, you must delete all references to the .flf file in the database. Otherwise, you'll have problems trying to complete the upgrade process.

   To delete references to the .flf file, run the following query on the database, for example, by using SQL Server Management Studio:

   ```sql
   UPDATE [master].[dbo].[$ndo$srvproperty] SET [license] = null
   UPDATE [<app database name>].[dbo].[$ndo$dbproperty] SET [license] = null
   UPDATE [<tenant database name>].[dbo].[$ndo$tenantproperty] SET [license] = null
   ```

   Replace `<app database name>` and `<tenant database name>` with the name of your application and tenant databases, respectively. With a single-tenant deployment, these values are the same.

   [Learn more about how to query a database](/sql/ssms/quickstarts/ssms-connect-query-sql-server)