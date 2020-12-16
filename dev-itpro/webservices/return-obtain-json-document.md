---
title: "How to: Use OData to Return-Obtain a JSON Document"
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
---
# Using OData to Return or Obtain a JSON Document
You can publish a page as a web service and consume it using JavaScript Object Notation \(JSON\).  
  
## Obtain a document based on JSON  
  
1.  You can build applications that consume and display [!INCLUDE[prod_short](../developer/includes/prod_short.md)] data using JSON. This example assumes that you have registered and published a page web service in [!INCLUDE[prod_short](../developer/includes/prod_short.md)].
  
2.  Start Windows Internet Explorer. In the **Address** field, enter a URI in this format:  
  
    ```  
    https://<Server>:<WebServicePort>/<ServerInstance>/OData/<web service>?$format=json  
    ```  
  
    If [!INCLUDE[server](../developer/includes/server.md)] is running on the local computer and is using the default [!INCLUDE[server](../developer/includes/server.md)] instance and OData port, and you have published a web service that is based on page 21 that is called **Customer**, then the address is:  
  
    ```  
    https://localhost:7048/BC130/OData/Customer?$format=json  
    ```  
  
     This generates a text file that contains metadata and data from the web service. You can open the file from the browser, or you can save it to disk.  
  
    > [!NOTE]  
    >  The value of the format attribute must be lowercase: `?$format=json`.  
  
     If you want to consume the web service as JSON-P, you can add the `?$callback=<callback function name>` parameter.  
  
     You can use a similar URI to return the web service as an AtomPub document, in which case the attribute is `?$format=atom`. For more information, see [Using OData to Return-Obtain an AtomPub Document](Return-Obtain-an-AtomPub-Document.md).  
  
## See Also  
 [Using OData Web Services to Modify Data](use-odata-to-modify-data.md)