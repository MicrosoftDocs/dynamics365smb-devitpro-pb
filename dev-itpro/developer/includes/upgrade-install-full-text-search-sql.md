The SQL server instance that hosts your Business Central database must include the **Full-text and Semantic Extractions for Search** feature. The version 25 Microsoft base application requires this feature; however, it isn't installed by default.

1. To verify whether full-text search is installed:

   - Using Transactional-SQL

     Execute the following query on the SQL database instance: 

     ```tsql  
     SELECT FULLTEXTSERVICEPROPERTY('IsFullTextInstalled') AS IsFullTextInstalled;
     ```

     If the query returns `0`, then full-text search isn't installed; if `1`, then it's installed.

   - Using SQL Server Management Studio

     In Object Explorer, right-click a server instance, select **Properties**, then select **Advanced**. If the **Default Full-Text Language** property is present, then full-text search is installed; otherwise, it isn't.

   Learn more at [Viewing or Changing Server Properties for Full-Text Search](/sql/relational-databases/search/manage-and-monitor-full-text-search-for-a-server-instance)

2. To install full-text search, add it as a feature by using the SQL Server Installation Center.

    You need to access the installation media or folder for your SQL Server version, and then run set.exe to start the SQL Server Installation Center. Follow the instructions at [Add Features to an Instance of SQL Server](/sql/database-engine/install-windows/add-features-to-an-instance-of-sql-server-setup). When you get to the **Feature Selection** page, choose **Full-text and Semantic Extractions for Search**.

    > [!TIP]
    > If you're using SQL Server 2019 Express, you can download the installation media from [Microsoft Download Center](https://www.microsoft.com/en-US/download/details.aspx?id=101064).
