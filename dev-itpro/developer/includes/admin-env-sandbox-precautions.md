If a sandbox is created with a copy of a production environment, a number of precautions are taken for that sandbox:

- The job queue is automatically stopped  
- Any base application integration settings are cleared  
- Outbound HTTP calls from extensions are blocked by default and must be approved for each extension  

    To enable outbound HTTP calls, go to the **Extension Management** page in [!INCLUDE [prodshort](prodshort.md)], and choose **Configure**. Then, on the **Extension Settings** page, make sure that **Allow HttpClient Requests** is selected. This setting must be enabled for each extension.
- Any General Data Protection Regulation (GDPR) action must be handled separately and repeated for the sandbox. There is no synchronization with the production environment after the sandbox has been created.  

    The internal administrator has the same tools and responsibilities for a sandbox environment as they do for a production environment. As a data processor, [!INCLUDE [prodshort](prodshort.md)] offers the same level of data protection and data handling restrictions that we apply to production environments.  
