---
title: "Create a New Module in the System Application"
description: Learn how to create a new module in the System Application.
author: bholtorf
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.author: bholtorf
ms.service: "dynamics365-business-central"
---

# Create a New Module in the System Application
This topic provides an overview of how to create a new module in the System Application. 

## Requirements
1. Familiarity with development in AL. For more information, see [AL Development](https://docs.microsoft.com/dynamics365/business-central/dev-itpro/developer/devenv-get-started).  
2. Your development environment is ready. For more information, see [Development Environment](https://github.com/microsoft/ALAppExtensions/blob/master/DevEnvironment.md).

> [!NOTE]
> Your environment must have the correct symbols. Go get those, in Visual Studio Code, press **F1**, and then choose **AL: Download Symbols**. Also, make a note of the **server** and **serverInstance** settings. You will add that information to the launch.json file.

## Create a New Module
The following sections provide an example of how to contribute a new module. The example is based on the XmlWriter module, which is published in the AlAppExtensions repository. That contribution added a wrapper module to provide support for the XmlWriter, and the steps in this topic will recreate the pull request for the XmlWriter module. If you want to view the original pull request, it's available here: [Pull Request 7876](https://github.com/microsoft/ALAppExtensions/pull/7876). 

### Set Up Visual Studio Code for Module Development
Open the **launch.json**, file and update the **server**, **serverInstance**, and **authentication** settings, as described in [Set Up Your Development Environment](devenv-set-up-an-environment.md).

```

    "server": "https://YourDockerContainerName",
    "serverInstance": "BC",
    "authentication": "Windows",

```
Open the **settings.json** file, and update the **al.assemblyProbingPaths**, as described in [Set Up a Development Environment](devenv-set-up-an-environment.md).

### Create a Branch
To create a branch, run the **git checkout -b "YourFeatureBranchName"** command. Afterward, you can start creating a new module.

### Create a New Module
Before you create a new module, make sure you are familiar with the general architecture of system modules. For more information, see [Module Architecture](devenv-blueprint.md).

We'll start by creating a new folder named **XmlWriter** in the **System** folder, where we will add an app.json file. The app.json file will contain the general details of the module.

```
    {
        "id":  "215b484f-9fbf-437c-bc6e-67e2c0f283b0",
        "name":  "XMLWriter",
        "publisher":  "Microsoft",
        "brief":  "Write XML quickly with System.Xml.XmlTextWriter.",
        "description":  "Provides a fast, non-cached, forward-only way to create streams or files with XML data that conforms to guidelines for W3C Extensible Markup Language (XML) 1.0 and Namespaces.",
        "version":  "17.0.0.0",
        "privacyStatement":  "https://go.microsoft.com/fwlink/?linkid=724009",
        "EULA":  "https://go.microsoft.com/fwlink/?linkid=2009120",
        "help":  "https://go.microsoft.com/fwlink/?linkid=2103698",
        "url":  "https://go.microsoft.com/fwlink/?linkid=724011",
        "logo":  "",
        "dependencies":  [
            {
                "id":  "7e3b999e-1182-45d2-8b82-d5127ddba9b2",
                "name":  "DotNet Aliases",
                "publisher":  "Microsoft",
                "version":  "17.0.0.0"
            }
        ],
        "screenshots":  [],
        "platform":  "17.0.0.0",
        "idRanges":  [
            {
                "from":  1483,
                "to":  1484
            }
        ],
        "target":  "OnPrem",
        "contextSensitiveHelpUrl":  "https://docs.microsoft.com/dynamics365/business-central/"
    }

```
> [!NOTE]
> After we finish developing our module, we will need to update the app.json file to ensure that the **versions** and **idRanges** are correct. We can easily verify the version by checking the app.json in other modules in the System Application. The idRanges must reflect the IDs used in the module.

Next, create the **src** folder under **System/XmlWriter**. This folder will contain our source code. We will create an internal implementation codeunit named **XmlWriterImpl.Codeunit.al** in the **src** folder.

After adding the implementation functions, the implementation codeunit will look as follows.

```
    codeunit 1484 "XmlWriter Impl"
    {
        Access = Internal;

        procedure WriteStartDocument()
        begin
            StringBuilder := StringBuilder.StringBuilder();
            StringWriter := StringWriter.StringWriter(StringBuilder);
            XmlTextWriter := XmlTextWriter.XmlTextWriter(StringWriter);
            XmlTextWriter.WriteStartDocument();
        end;

        procedure WriteEndDocument()
        begin
            XmlTextWriter.WriteEndDocument();
        end;

        procedure ToBigText(var XmlBigText: BigText)
        begin
            XmlTextWriter.WriteString(XmlBigText);
        end;

        var
            StringBuilder: DotNet StringBuilder;
            StringWriter: DotNet StringWriter;
            XmlTextWriter: DotNet XmlTextWriter;
    }

````
Now that we have created our implementation codeunit, we must add public functions in a facade codeunit with the functionality that we want to expose. Because the functions are public, we must ensure that these are tested and documented. To do this, we need to create a facade codeunit. In this example, we'll name the codeunit **XmlWriter.Codeunit.al**. The functions call the corresponding functions in the implementation codeunit.

The following is an example of the facade codeunit named **XmlWriter.Codeunit.al** that includes public functions and documentation.

```

    /// <summary>
    /// Provides helper functions for System.Xml.XmlWriter
    /// </summary>
    codeunit 1483 "XmlWriter"
    {
        Access = Public;

        /// <summary>
        /// Creates the XmlWriter Document
        /// </summary>
        procedure WriteStartDocument()
        begin
            XmlWriterImpl.WriteStartDocument();
        end;

        /// <summary>
        /// Closes any open elements or attributes and puts the writer back in the Start state.
        /// </summary>
        procedure WriteEndDocument()
        begin
            XmlWriterImpl.WriteEndDocument();
        end;

        /// <summary>
        /// Writes the text within XmlWriter to the BigText variable. 
        /// </summary>
        /// <param name="XmlBigText">The BigText the XmlWriter has to be write to.</param>
        procedure ToBigText(var XmlBigText: BigText)
        begin
            Clear(XmlBigText);
            XmlWriterImpl.ToBigText(XmlBigText)
        end;

        var
            XmlWriterImpl: Codeunit "XmlWriter Impl";
    }
```
Now that we have now exposed the functions, the next step is to add tests. To do that, we'll create a new folder under **System Tests**, **XmlWriter**. We will also create an app.json file for the module details and an **src** folder for our test code.

We will add the following new file under **System Tests/XmlWriter/src**, **XmlWriterTest.Codeunit.al**. 

```
    codeunit 139911 "Xml Writer Test"
    {
        Subtype = Test;

        var
            Assert: Codeunit "Library Assert";

        [Test]
        procedure TestWriteStartDocument()
        var
            XmlWriter: Codeunit "XmlWriter";
            XmlBigText: BigText;
        begin
            // [GIVEN] Initialized XmlWriter
            XmlWriter.WriteStartDocument();

            // [THEN] Get XmlDocument to text
            XmlWriter.ToBigText(XmlBigText);
            Assert.AreEqual('<?xml version="1.0" encoding="utf-16"?>', Format(XmlBigText), 'Unexpected text when creating a Xml Document with XmlWriter');
        end;

        [Test]
        procedure TestWriteEndDocumentNoElement()
        var
            XmlWriter: Codeunit "XmlWriter";
        begin
            // [GIVEN] Initialized XmlWriter with root element
            XmlWriter.WriteStartDocument();

            // [WHEN] Write end document
            // [THEN] Expected error to be thrown
            asserterror XmlWriter.WriteEndDocument();
            Assert.ExpectedError('A call to System.Xml.XmlTextWriter.WriteEndDocument failed with this message: Document does not have a root element.');
        end;
    }

```
After running the tests successfully, changes are complete.

#### Commit and push your changes and open a PR

* To commit your changes, run the **git commit -m "Your message"** command.
* To push your changes, run the **git push** command.

You can now go to your Github fork and open a pull request in the AlAppExtensions repository. 

## See Also
[Create a .NET Wrapper Module](devenv-create-a-wrapper-module.md)  
[Become a Contributor to Business Central](https://blogs.msdn.microsoft.com/nav/2018/08/28/become-a-contributor-to-business-central/)  
["Git" going with extensions](https://community.dynamics.com/business/b/businesscentraldevitpro/archive/2018/10/26/quot-git-quot-going-with-extensions)  
[Walkthrough: Contributing to an extension on GitHub](https://community.dynamics.com/business/b/businesscentraldevitpro/archive/2018/11/27/walkthrough-contributing-to-an-extension-on-github)  
[Getting Started with Modules](devenv-getting-started.md)  
[Create a New Module in the System Application](devenv-new-module.md)  
[Module Architecture](devenv-blueprint.md)  