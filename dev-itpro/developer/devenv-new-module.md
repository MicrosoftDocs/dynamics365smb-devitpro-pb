# How to create a new module

This topic provides an overview of how to create a new module.

### Prerequisites
1. You are familiar with development in AL. For more information, see [AL Development](https://docs.microsoft.com/en-us/dynamics365/business-central/dev-itpro/developer/devenv-get-started).  
2. Your development environment has been set up. For more information, see [Development Environment](https://github.com/microsoft/ALAppExtensions/blob/master/DevEnvironment.md).

### Steps
1. In Visual Studio Code, open the folder from the AlAppExtensions repository that you want to contribute to. System modules are located in the `System` folder.
2. Open the command search by pressing `F1` and run **AL: Download Symbols**.
3. Now you are ready to go. You can modify the the module and add you contribution. Remember that your changes should adhere to the general guidelines for modules described in the [Blueprint](https://github.com/microsoft/ALAppExtensions/blob/master/Blueprint.md). See below for an example.

### Example
In the following, we will go through an example contribution for a new module. Specifically, we will look at a the XmlWriter module. The contribution added a wrapper module to provide support for the XmlWriter. Thus, if you are following along you will see that these changes have already been published in the AlAppExtensions repository. You can find the actual PR that we will be recreating here: [Pull Request 7876](https://github.com/microsoft/ALAppExtensions/pull/7876). Let's take a look at what it took to create this PR.

#### Set up Visual Studio Code for module development

When setting up your development environment, you should have taken note of the `server` and `serverInstance` settings.

Open the `launch.json` file and update the `server`, `serverInstance` and `authentication` settings, as described in [setting up your development environment](https://github.com/microsoft/ALAppExtensions/blob/master/DevEnvironment.md).

    "server": "https://YourDockerContainerName",
    "serverInstance": "BC",
    "authentication": "Windows",


Open the `settings.json` file and update the `al.assemblyProbingPaths` as described in [setting up your development environment](https://github.com/microsoft/ALAppExtensions/blob/master/DevEnvironment.md).

#### Make a branch

Make a branch by using the following command

    git checkout -b "YourFeatureBranchName"

You are now ready to start creating a new module.

#### Creating a new module

Before creating a new module, make sure you are familiar with the general architecture of system modules by looking at the [Blueprint](https://github.com/microsoft/ALAppExtensions/blob/master/Blueprint.md).

We start by creating a new folder in the `System` folder called `XmlWriter`.

Once we have the new folder, we will add an `app.json` file. This `json` file will contain the general details of the module for compilation.

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

You will have to revisit the `app.json` file at the end of your development to ensure that the `versions` and `idRanges` are set properly. The `versions` can be easily verified by checking the other System Application's `app.json`. The `idRanges` will have to be updated to properly reflect the ids used in the module.

Next we create the `src` folder under `System/XmlWriter`. This folder will contain all our source code. Next, we need to create an internal implementation codeunit in the `src` folder, `XmlWriterImpl.Codeunit.al`.

The implementation codeunit would look like the following after adding the implementation functions.

    // ------------------------------------------------------------------------------------------------
    // Copyright (c) Microsoft Corporation. All rights reserved.
    // Licensed under the MIT License. See License.txt in the project root for license information.
    // ------------------------------------------------------------------------------------------------

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

Now that we have created our implementation codeunit. We need to add public functions in a facade codeunit with the functionality that we want to expose. Since the functions here are public, we need to ensure that these are well-documented and tested. To do this, we need to create a facade codeunit which we will call `XmlWriter.Codeunit.al`. The functions simply call the corresponding function in the implementation codeunit.

It will look like the following after adding the public functions and documentation.

    // ------------------------------------------------------------------------------------------------
    // Copyright (c) Microsoft Corporation. All rights reserved.
    // Licensed under the MIT License. See License.txt in the project root for license information.
    // ------------------------------------------------------------------------------------------------

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

We have now exposed the appropriate functions. The next step is to make sure add tests to test the functionality that we added.

Like we did for the module itself, we will need to create a new folder under `System Tests`, `XmlWriter`. We will also need to create the `app.json` file for module details and `src` folder for our test code.

We will add the following new file under `System Tests/XmlWriter/src`, `XmlWriterTest.Codeunit.al` and it will look like the following:

    // ------------------------------------------------------------------------------------------------
    // Copyright (c) Microsoft Corporation. All rights reserved.
    // Licensed under the MIT License. See License.txt in the project root for license information.
    // ------------------------------------------------------------------------------------------------

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

After running all the tests including the new ones and verifying that they pass, we have now made our changes!

#### Commit and push your changes and open a PR

Commit your changes

    git commit -m "Your message"

Push your changes

    git push

You can now go to your Github fork and open a pull request in the AlAppExtensions repository. 

#### Resources

Have a look at the following articles for other walkthroughs:  
* https://blogs.msdn.microsoft.com/nav/2018/08/28/become-a-contributor-to-business-central/  
* https://community.dynamics.com/business/b/businesscentraldevitpro/archive/2018/10/26/quot-git-quot-going-with-extensions  
* https://community.dynamics.com/business/b/businesscentraldevitpro/archive/2018/11/27/walkthrough-contributing-to-an-extension-on-github