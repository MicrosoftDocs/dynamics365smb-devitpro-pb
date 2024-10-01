---
title: OpenAPI specification
description: OpenAPI specification for Dynamics 365 Business Central
author: SusanneWindfeldPedersen
ms.date: 09/10/2021
ms.topic: article
ms.author: solsen
ms.reviewer: solsen
---

# OpenAPI specification for Dynamics 365 Business Central

[!INCLUDE[azure-ad-to-microsoft-entra-id](~/../shared-content/shared/azure-ad-to-microsoft-entra-id.md)]

Standard APIs for Business Central are available as an [OpenAPI Specification (OAS)](https://swagger.io/specification/). OAS defines a standard interface to RESTful APIs, providing a uniform access to APIs and documentation.  

> [!IMPORTANT]  
> At this point in time, there's no downloadable .yaml file for version 2.0 of the API. This article explains how to preview the OpenAPI contract based on a version 1.0 of the .yaml file. 

## Download Business Central OpenAPI specification

|API Version|YAML|
|-----------|------|
|1.0|[Download](../v1.0/contracts/BCOAS1.0.yaml)|

The OAS is set up to use OAuth2 and accessing the default sandbox environment. Details can be changed in the contact to connect to specific environments (servers URL). YAML can be converted to JSON if needed.

## Previewing the OpenAPI contract

There are [extensions](https://marketplace.visualstudio.com/search?term=openapi&target=VSCode&category=All%20categories&sortBy=Relevance) for Visual Studio Code that enable previewing and editing. [SwaggerHub](https://swagger.io/tools/swaggerhub/) enables previewing and editing online.

To run SwaggerUI locally, node.js can be used to serve the SwaggerUI, by following the steps below:

1) Download OAS for [!INCLUDE [prod_short](../../developer/includes/prod_short.md)] as shown above.
2) Install [Node.js](https://nodejs.org/en/download/).
3) Copy the javascript code shown below and save it to a file with the filename `BC_OAS.js`.  

    ```javascript
    const express = require('express');
    const app = express();
    const port = 3000;
    const swaggerUi = require('swagger-ui-express');
    const YAML = require('yamljs');
    const swaggerDocument = YAML.load('./BCOAS1.0.yaml'); 

    //const swaggerDocument = require('./BCOAS1.0.json');

    var options = { };
    app.use('/', swaggerUi.serve, swaggerUi.setup(swaggerDocument, options));
    app.listen(port, () => console.log(`Swagger UI for Business Central listening on port ${port}!`))
    ```

4) Install the required node packages by running *npm* from the command line:  
    ```
    npm install express swagger-ui-express yamljs
    ```
5) Run the node app created. From the command line run the following:
    ```
    node BC_OAS.js
    ```
6) Browse to `https://localhost:3000`.
7) To use **Try it out** authorization in SwaggerUI, a Microsoft Entra app must be created. [Follow these steps to create a Microsoft Entra app, with access to Business Central](../../developer/devenv-develop-connect-apps.md#set-up-microsoft-entra-id-based-authentication). Copy and paste the client ID from the Microsoft Entra app into the authorization dialog of SwaggerUI.

## See also

[Developing Connect apps for Dynamics 365 Business Central](../../developer/devenv-develop-connect-apps.md)  
