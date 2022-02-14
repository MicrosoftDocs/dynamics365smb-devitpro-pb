---
title: "Introducing a dependency to an app on GitHub"
description: "Create a dependency in the app.json file in your AL-Go project for Business Central."
author: freddyk
ms.custom: na
ms.date: 01/27/2022
ms.reviewer: solsen
ms.topic: conceptual
ms.service: "dynamics365-business-central"
ms.author: solsen
---


# Introducing a Dependency to an App on GitHub

If your app has a dependency to another application on a different GitHub repository, the foreign repository can be added to the dependency probing paths `appDependencyProbingPaths` in the AL-Go settings file. The dependency must also be added to the `app.json` file as a dependency. During a build all the apps mentioned in the probing paths will be downloaded and installed on the tenant.

The `appDependencyProbingPaths` key in the settings expects a JSON array with the following structure:

```json
"appDependencyProbingPaths":  [
        {
            "repo": "https://github.com/<Owner>/<repository name>",
            "version": "<latest, specific version>",
            "release_status": "<release, prerelease, draft>",
            "authTokenSecret": "<Secret Name>",
            "projects": "*"
        }
    ]

```

The following table describes the settings:

|Setting|Description|
|-------|-----------|
|`repo`|Specifies the URL of the foreign repository.|
|`version`|Specifies the version of the dependency to be downloaded; it could be set to latest or to a specific version.|
|`release_status`|Specifies the type of release on the foreign repository. The artifacts can be downloaded from a release, prerelease, or a draft.|
|`authTokenSecret`|If the foreign repository is private, to download the artifacts an access token is needed. In this case a secret should be added to GitHub secrets or Azure Key Vault and the name of the secret should be provided in the settings.|
|`projects`|Specifies the project in a multi project repository. “*” means all projects.|

# See also