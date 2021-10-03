---
author: edupont04
ms.service: dynamics365-business-central
ms.topic: include
ms.date: 10/01/2021
ms.author: edupont
---
When an environment is created as a copy of another environment, a number of precautions are taken for that copy:

- Tasks in the job queue are automatically stopped  

    To see which scheduled jobs are stopped, and to decide which jobs to restart in the new environment, go to the **Scheduled Tasks** page in [!INCLUDE [prod_short](prod_short.md)]. There, you can set tasks to be ready to run in the job queue. However, only tasks that are marked as belonging to the current environment can run. For more information, see [View Scheduled Tasks](/dynamics365/business-central/admin-job-queues-schedule-tasks#view-scheduled-tasks) in the business functionality content.  
- Any base application integration settings are cleared  
- Outbound HTTP calls from extensions are blocked by default and must be approved for each extension, otherwise instead of an external call, the system will display the following error message: *The request was blocked by the runtime to prevent accidental use of production services*.  

    To enable outbound HTTP calls, go to the **Extension Management** page in [!INCLUDE [prod_short](prod_short.md)], and choose **Configure**. Then, on the **Extension Settings** page, make sure that **Allow HttpClient Requests** is selected. This setting must be enabled for each extension, including libraries. 
- Any General Data Protection Regulation (GDPR) action must be handled separately and repeated for the environment. There is no synchronization with the original environment after the copy has been created.  

    The internal administrator has the same tools and responsibilities for the copy as they do for the original environment. As a data processor, [!INCLUDE [prod_short](prod_short.md)] offers the same level of data protection and data handling restrictions to all types of environments, both sandboxes and production environments.  
