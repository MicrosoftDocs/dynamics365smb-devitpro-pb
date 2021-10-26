---
title: "Technical Validation Checklist FAQ"
description: Describing the most common questions when submitting your app to AppSource.
author: qutreson
ms.custom: na
ms.date: 10/08/2021
ms.reviewer: solsen
ms.suite: na
ms.topic: conceptual
ms.service: "dynamics365-business-central"
ms.author: qutreson
---

# Technical Validation Checklist FAQ

This topic addresses some of the most frequently asked questions around validation of apps for AppSource submission.

## Questions about the validation process

### Against which releases are my apps validated?

- Link to other docs about min release until latest at the time of submission.
- Link to TSG

### Against which baselines are my apps validated?

- Link to TSG

### When are my app available to be installed on customers?

- Once the full graph is green in Partner Center.
- No preview supported for BC.

### My app failed at the 'Automated Technical Validation' stage, what do I do next?

- Use the TSG or query the storage and analyze the diagnostics.

### My app failed at the 'Pushing app to the service' stage, what do I do next?

- Support case for Partner Center CSS.

## Questions about refactoring

### Can I move AL objects from my main app to a library?

- If tables, no because that's a migration and this is not supported, see migration.json
- Other objects, yes, if obsoleted first. Need to make sure that both the new library and new base are not installed together.
- This is possible, but can be risky - not advised if app is used.

## Questions about code-signing validation

### Can I use a Self-signed certificate to sign my apps targeting AppSource?

### Do I need to use an EV Code-signing certificate to pass the technical validation?

### Can I re-use the same code-signing certificate to sign multiple apps?

## Questions about affixes and ID ranges

### Do I need to register different affixes for each of my extensions?

### Do I need to request a different ID range for each of my extensions?

## Questions about App identity changes

### When is it ok to change the name of my extension?

### When is it ok to change the publisher of my extension?

### When is it ok to change the app ID of my extension?

- Basically creating a new offer. Data upgrade issues for customers.

## Channels to report issues

In the following, you can read about how you reach out for support most efficiently.

### When do I contact d365val@microsoft.com?

When registering affixes for your publisher. For more information, see [Benefits and Guidelines for using a Prefix or Suffix](../compliance/apptest-prefix-suffix.md).

### When do I contact Partner Center customer support?

- Failed technical validation of the submission
- Failed content validation of the submission
- Failed upload of the extensions in the submission
- When requesting an exception for a breaking change

### When do I contact Business Central customer support?

When your submission has been successfully completed in Partner Center, but your customers are experiencing issues installing or using the app.

### When do I log an issue on NavContainerHelper on Github?

When you have questions or bugs regarding the self-validation script. For more information, see [https://github.com/microsoft/navcontainerhelper/issues](https://github.com/microsoft/navcontainerhelper/issues).

### When do I write on Yammer?

- When you have questions related to development (which code-signing certificate to use, best practices, etc.).
- Or, when you have other questions that pertain to this area - use [aka.ms/bcyammer](https://aka.ms/bcyammer).

## See also

[Technical Validation Checklist](devenv-checklist-submission.md)