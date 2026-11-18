---
author: jswymer
ms.topic: include
ms.date: 11/17/2026
ms.author: jswymer
ms.reviewer: jswymer
ai-usage: ai-assisted
---
## Define SQL database connection and integration runtime 

If your product requires an SQL connection, the **Define your SQL database connection** page appears during the **Cloud Migration Setup**. Other source applications might need different connection information. The **Define your SQL database connection** page shows the connection information based on the product you specified on the **Choose your product** page. The information comes from the installed extensions for the selected product. The following list provides more details about the fields in this part of the setup guide.

- **SQL Configuration**:

  Specify **SQL Server** if the database is installed locally on an SQL Server instance.

- **SQL Connection String**:

  Enter the connection string to your SQL Server, including the server name, instance name, database name, and user account.

  For example, `Server=MyServer\SLDEMO;Database=SLAppDb;User Id=MySQLAccount;Password=<SqlPassword>;`.
  The following snippets illustrate a couple of connection strings with different formats for an SQL Server database:  

    `Server=<ServerName>\<InstanceName>;Initial Catalog=<DatabaseName>;User Id=<SqlUserName>;Password=<SqlPassword>;`

    `Server=<ServerName>\<InstanceName>;Database=<DatabaseName>;User Id=<SqlUserName>;Password=<SqlPassword>;`

  > [!IMPORTANT]
  > Include the space in the `User Id` keyword in both examples. `UserID` isn't a valid keyword.

  Learn more in [Find the correct server or data source value for a SQL Server connection string](/archive/blogs/sqlforum/faq-how-do-i-find-the-correct-server-or-data-source-value-for-an-sql-server-instance-in-a-connection-string).

  The SQL connection string is passed to Azure Data Factory (ADF). From there, it's encrypted and delivered to your Self-Hosted Integration Runtime and used to communicate with your SQL Server instance during the data migration process.  

- **Integration Runtime Name**:

  When **SQL Configuration** is set to **SQL Server**, specify the self-hosted Microsoft integration runtime instance to replicate the data from the defined source to [!INCLUDE [prod_short](../includes/prod_short.md)] online. The runtime can run on the SQL Server machine or another machine with network access to the database. Learn more in [Create and configure a self-hosted integration runtime](/azure/data-factory/create-self-hosted-integration-runtime).

  - If you already have an integration runtime service instance, you can use the instance by entering its name in the **Integration Runtime Name** box. Then, select **Next** to continue **Cloud Migration Setup** assisted setup.

  - If you don't have an existing integration runtime service instance, leave the **Integration Runtime Name** field empty, then select **Next** to download and install the self-hosted runtime.

### Download and install the self-hosted runtime

A new page appears from where you can download the self-hosted integration runtime that you must install. Follow the instructions on the page.

1. Select **Download the Self-hosted Integration Runtime** to go to the Microsoft Download Center.
1. On the Download Center, download the current installer, `IntegrationRuntime_<LatestVersion>.msi`.

    The file is downloaded to your computer.
1. Open the downloaded file to start the installation.

   When completed, the **Register Integration Runtime (Self-Hosted)** page opens.

1. Go back to the **Cloud Migration Setup** page in Business Central and copy the value in the **Authentication Key** field.
1. Go back to the **Register Integration Runtime (Self-Hosted)** page and paste the key value in the authentication key box, then select **Register**.
1. Go back to **Cloud Migration Setup** and select **Next**.

After you select **Next**, a new pipeline is created in the Azure service. This operation usually takes less than a minute. To test your SQL string, open the **Microsoft Integration Runtime Configuration Manager** and select the **Diagnostics** menu option. From there, you can test the connection.
