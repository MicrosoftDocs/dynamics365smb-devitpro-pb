---
title: Frequently Asked Questions | Microsoft Docs
description: Get a cloud copy of your data so you are connected to the intelligent cloud also when you have an on-premises solution 
based on Business Central, Dynamics GP, Dynamics SL, or Dynamics NAV.
author: edupont04
manager: edupont
ms.service: dynamics365-business-central
ms.topic: article
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms. search.keywords: cloud, edge
ms.date: 09/07/2018
ms.author: bmeier

---

This section contains answers to frequently asked question regarding Business Central Intelligent Cloud.

**What products and versions are supported with Intelligent Cloud?**

With the initial release of the Intelligent Cloud on October 1, 2018, Dynamics GP 2018 R2 and Dynamics 365 Business Central(on-premises)
will be supported.  Support for additional products will become available in future updates & releases.


**How is my on-premise data replicated to my Business Central tenant?**

Data is replicated using an Azure service called Azure Data Factory (ADF).  The Azure Data Factory is a service that is always running 
within the Business Central cloud service manager.  During the Intelligent Cloud configure process, a data pipeline is created within 
the ADF service that enable data to flow from your on-premises solution to your Business Central cloud tenant. If your data source is a 
local SQL Server instance, you will also be asked to configure a Self-Hosted Integration Runtime.  The runtime is installed locally and 
enable the communication between the cloud services and your on-premise data to communicate without opening any ports or firewalls.

**Are there any limits on the amount or type of data will replicate?**

Data replication for the initial release will have a limit of 150GB.  There are no restrictions on the type of data that can be 
replicated.  


**Is my SQL Connection string required to setup Intelligent Cloud?**

Yes.  The SQL Connection String is passed to Azure Data Factory where it is stored in a secure key vault.  This information in required 
for the service to communicate with your SQL Server instance.


**I am a hosting partner; do I need to configure the Self-Hosted Runtime Service for each tenant?**

No, there is no limit on the number for tenants that can be added to Self-Hosted Integration Runtime.  Each added tenant will have a 
dedicated pipeline created.


**Will code customizations replicate?**

No, only tables that is available in both your on-premises solution and your Business Central cloud tenant will replicate.  Any 
customization would need to be made into an extension and installed on both your on-premises solution and your Business Central cloud 
tenant to replicate. 


**Why are my Business Central tenant permissions restricted?**

Once the Intelligent Cloud is configured, all existing users without Super permission be automatically assigned to the Intelligent Cloud
user group.  In this configuration, your on-premises solution is the master where all business entries will take place.  The Business 
Central cloud tenant becomes read only and the data is used to make business decisions.  We restriction permissions to avoid users from 
accidentally entering transaction or updating master records only to have that information overwritten and lost when data replication 
takes place.


**Can I ‘turn off’ my Intelligent Cloud?**

You may discontinue your Intelligent Cloud environment at any point.  Once you disable your Intelligent Cloud configuration, your 
on-premises and Business Central tenant will become completely independent of one another.  If you discontinued your Intelligent Cloud 
and want to use your Business Central tenant as your primary solution to run and manage your business, you will need to reassign 
permissions to provide read/write access to users.


**Will my On-Premises Users and Permissions Replicate?**

No, since you are not required to configure your on-premises solution with Azure Active Directory (AAD), we cannot guarantee a mapping 
between on-premises users and Business Central cloud tenant users.  Business Central tenant users must have an AAD account and be 
manually added as users in the Business Central tenant.  All permission need to be granted in the Business Central tenant, independent 
from your on-premises permissions.


**Can I view insights from cloud services in my On-Premises solution?**

Yes, a new Intelligent Cloud Insights page can be hosted within either Dynamics GP 2018 R2 or Dynamics 365 Business Central 
(on-premises). Each user will need to have a Business Central cloud license to view the data.


**Can you export to Excel, modify the contents and import it back in?**

You can export the list to Excel but since the data is read only you cannot make changes and import it back in.


**Is the data replication only one-way?**

Yes, data is only replicated from the on-premises solution to your Business Central tenant.


**Is there a cost to configure the Intelligent Cloud?**

Currently, the only costs associated with the Intelligent Cloud are your named user license costs.  


**Why did my Role Center change after configuring the Intelligent Cloud?**

To keep the role center experience as clean as possible and avoid permission errors, we automatically hide actions that would generate a
permission error for the user.  


**Should I uninstall all my Business Central tenant Extensions?**

Not necessary, most Extension will run without issue in the Intelligent Cloud environment.  You may want to consider uninstalling 
Extensions that send data to an external service to avoid potential duplicated calls to that service.  It is always a best practice to 
test any Extension in a Sandbox tenant configured to Intelligent Cloud.


**How do I build an Extension that enables data replication?** 

The Extension should be created in the same manner as any other Extension.  For data to replicate, you will need to add a ‘Replicate’ 
property to your table and set the value to <Yes>.  If your Extension connects with an External service and you want to restrict any 
service calls from your Business Central Intelligent Cloud tenant, a good practice would be to store the connection information in a 
separate table and set the ‘Replication’ property to <No>.  This would enable you to keep the Extension Installed but prevent it from 
making any type of service calls from the Read Only Business Central tenant. Once the Extension is installed in both your on-premises 
and Business Central cloud tenants, the data will begin to replicate.


**How do I find my SQL connection string?**

A connection string to your SQL database can be found in SQL Management Studio or using Visual Studio.  The user name and password 
defined in the connection requires a SQL Authenticated user name/password.  Your connection string should look something like this. 
Server=tcp:{ServerName},1433;Initial Catalog={DatabaseName};Persist Security Info=False;
User ID={UserName};Password={Password};MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=True;Connection Timeout=30;


**How do I find the Integration Runtime name?**

The Integration Runtime name can be found in the Microsoft Integration Runtime Manager.  You can find this application in your Windows 
system tray or by doing a search for the application.  You will not be able to copy and paste the name.  You will need to manually type 
in the name.


**Does Invoicing support the Intelligent Cloud?**  

Invoicing currently does not support an Intelligent Cloud.  If your organization has an existing Invoicing tenant and want to create a 
Business Central tenant, you will need to contact support to have them delete your existing Invoicing tenant.
