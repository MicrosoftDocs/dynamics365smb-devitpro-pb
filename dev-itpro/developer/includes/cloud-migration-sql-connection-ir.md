---
author: jswymer
ms.topic: include
ms.date: 07/27/2023
ms.author: jswymer
---
## Define SQL database connection and integration runtime 

If the product you selected requires an SQL connection, the **Define your SQL database connection** page appears as part of the **Cloud Migration Setup**. Other source applications may require different connection information. The **Define your SQL database connection** page displays the connection information based on the product that you specified in the **Choose your product** page of the **Cloud Migration Setup**. The information is determined from the installed extensions for the product you've selected. The following list provides more details about the fields in this part of the assisted setup guide.  

- **SQL connection**

  Specify **SQL Server** if the database is installed locally on an SQL Server instance. Specify **Azure SQL** if the database is an Azure SQL Database database. The **Azure SQL** doesn't apply to Dynamics GP, because it's not supported.
 
<!-- 
  > [!IMPORTANT]
  > Azure SQL Managed Instance isn't supported.  
-->
- **SQL connection string**

  You must specify the connection string to your SQL Server, including the name of the server that SQL Server is running on, and the name of the instance, the database, and the relevant user account.  

  For example, `Server=MyServer\BCDEMO;Database=BC210;User Id=MySQLAccount;Password=MyPassWord;`, if you're migrating from [!INCLUDE [prod_short](prod_short.md)] on-premises.  

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

  When the **SQL connection** is set to **SQL Server**, you must specify the self-hosted Microsoft integration runtime instance to use to replicate the data from the defined source to [!INCLUDE [prod_short](prod_short.md)] online. The integration runtime must be running on the machine that holds the SQL Server database.

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

Once you choose **Next**, a new pipeline is created in the Azure service. This operation takes less than a minute to complete, in most cases. If you want to test your SQL string, open the **Microsoft Integration Runtime Configuration Manager**, and then choose the **Diagnostics** menu option. From there, you can test to see if the connection is good.  
