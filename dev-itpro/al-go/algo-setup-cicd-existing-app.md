---
title: "Set up CI/CD for an Existing Appsource App"
description: ""
author: freddyk
ms.custom: na
ms.date: 01/24/2022
ms.reviewer: solsen
ms.topic: conceptual
ms.service: "dynamics365-business-central"
ms.author: solsen
---


# Set up CI/CD for an Existing AppSource App

> *The prerequisites for this how to is that you have a GitHub account and have experience from the other how-to's in this section*

1. Navigate to https://github.com/microsoft/AL-Go-AppSource and choose the **Use this template** button.
1. Enter `app3` in the **Repository name** field and then choose the **Create repository from template** button.
1. My current AppSource App is using Azure DevOps, I download the entire source as a .zip file and place it on Dropbox or Azure Blob storage and create a secure download Url to the .zip file.
1. Back on github.com, on the **Actions** tab, select the **Add existing app or test app** workflow and choose **Run workflow**. Paste in the **Secure Download URL** and then choose the **Run Workflow** button.
1. When the workflow finishes, complete the pull request created.
1. A CI workflow is kicked off with the pull request, this will fail with the following error: `For AppSource Apps with AppSourceCop enabled, you need to specify AppSourceCopMandatoryAffixes in .AL-Go\settings.json`.
1. If you fix this and re-run, you will get another error: `When building an AppSource App, you need to create a secret called LicenseFileUrl, containing a secure URL to your license file with permission to the objects used in the app`.
1. I will use my KeyVault from []()Scenario 7, by adding a secret called `AZURE_CREDENTIALS` to my GitHub repo. And then add or modify the following properties in the .AL-Go\settings.json file:

```json
"LicenseFileUrlSecretName": "LicenseFile",
"AppSourceCopMandatoryAffixes": [ "BingMaps" ],
```

1. This setting checks that BingMaps is used as an affix for my objects. The first setting is only needed if my secret is called something else than expected. AL-Go is by default looking for a secret called `LicenseFileUrl`, but you might have multiple repositories sharing the same key vault, but needing different secrets. In that case, you create a setting called `"<secretname>SecretName"`, specifying the actual secret name in the key vault. This mechanism is used for all secrets. In my `BuildVariables` key valut, the `LicenseFileUrl` secret is called `LicenseFile`. After these changes, the CI pipeline completes.
1. AppSource apps must be code-signed. To achieve this, you must create two secrets in the GitHub repo or in your key vault. `CodeSignCertificateUrl` should be a secure download URL to your `<Code Signing Certificate>.pfx` file and `CodeSignCertificatePassword` should be the password for this .pfx file. Adding these secrets will cause the CI workflow and the **Create Release** workflow to sign the .app files. In the pipeline, you will see a new step.
1. If your secrets are called something else than `CodesignCertificateUrl` and `CodesignCertificatePassword`, you can add an indirection to the .AL-Go\settings.json file, like this:

```json
"CodeSignCertificateUrlSecretName": "myCodeSignCertUrl",
"CodeSignCertificatePasswordSecretName": "myCodeSignCertPassword",
```

## See also