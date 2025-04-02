---
author: jswymer
ms.topic: include
ms.date: 07/27/2023
ms.author: jswymer
ms.reviewer: jswymer
---
## Define SQL database connection and integration runtime 

If your product requires an SQL connection, the **Define your SQL database connection** page appears during the **Cloud Migration Setup**. Other source applications might need different connection information. The **Define your SQL database connection** page shows the connection information based on the product you specified on the **Choose your product** page. The information comes from the installed extensions for the selected product. The following list provides more details about the fields in this part of the setup guide.

- **SQL connection**

  Specify **SQL Server** if the database is installed locally on an SQL Server instance.

- **SQL connection string**

  Enter the connection string to your SQL Server, including the server name, instance name, database name, and user account.

  For example, `Server=MyServer\BCDEMO;Database=GpDb;User Id=MySQLAccount;Password=MyPassWord;`.
  The following snippets illustrate a couple of connection strings with different formats for an SQL Server database:  

    `Server={Server Name\Instance Name};Initial Catalog={Database Name};UserID={SQL Authenticated UserName};Password={SQL Authenticated Password};`  

    `Server={Server Name\Instance Name};Database={Database Name};User Id={SQL Server Authenticated UserName};Password={SQL Server Authenticated Password};`  

  > [!IMPORTANT]
  > In the second connection string format, don't forget to add the **space** in *User Id* parameter as it's mandatory and can throw an error if it's missing.

  For a Business Central database hosted on Azure SQL Database, a connection string typically looks like this:

    `Server=tcp:{ServerName}.database.windows.net,1433;Initial Catalog={DatabaseName};Persist Security Info=False;User ID={SQLUserName};Password={SQLUserPassword};MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;`

  For more information about connection strings, see [the SQL Server blog](/archive/blogs/sqlforum/faq-how-do-i-find-the-correct-server-or-data-source-value-for-an-sql-server-instance-in-a-connection-string).  

  The SQL connection string is passed to Azure Data Factory (ADF). From there, it's encrypted and delivered to your Self-Hosted Integration Runtime and used to communicate with your SQL Server instance during the data migration process.  

- **Integration runtime name**

  When the **SQL connection** is set to **SQL Server**, specify the self-hosted Microsoft integration runtime instance to replicate the data from the defined source to [!INCLUDE [prod_short](../includes/prod_short.md)] online. The integration runtime must run on the machine that holds the SQL Server database.

  - If you already have an integration runtime service instance, you can use the instance by entering its name in the **Integration Runtime Name** box. Then, select **Next** to continue **Cloud Migration Setup** assisted setup.

  - If you don't have an existing integration runtime service instance, leave the **Integration runtime name** field empty, then select **Next** to download and install the self-hosted runtime. 

### Download and install the self-hosted runtime

A new page appears from where you can download the self-hosted integration runtime that you must install. Follow the instructions on the page.

1. Select **Download the Self-hosted Integration Runtime** to go to the Microsoft Download Center.
2. On the Download Center, select **Download** > **IntegrationRuntime_\<latestversion\>.msi** > **Next**.

    The file is downloaded to your computer.
3. Select **Open** file to start the installation.

   When completed, the **Register Integration Runtime (Self-Hosted)** page opens.

4. Go back to the **Cloud Migration Setup** page in Business Central and copy the value in the **Authentication key** field.
5. Go back to the **Register Integration Runtime (Self-Hosted)** page and paste the key value in authentication key box, then select **Finish**. 
6. Go back to **Cloud Migration Setup** and select **Next**.

After you select **Next**, a new pipeline is created in the Azure service. This operation usually takes less than a minute. To test your SQL string, open the **Microsoft Integration Runtime Configuration Manager** and select the **Diagnostics** menu option. From there, you can test the connection.
