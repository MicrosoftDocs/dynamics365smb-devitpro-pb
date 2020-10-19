---
title: "Change a module in the System Application"
description: "This topic provides steps and examples of how to change a module in the System Application."
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: bholtorf
---

# Change an Existing Module
This topic provides an overview of how to change an existing module.

### Prerequisites
1. You are familiar with development in AL. For more information, see https://docs.microsoft.com/en-us/dynamics365/business-central/dev-itpro/developer/devenv-get-started.  
2. Your development environment has been set up. For more information, see https://github.com/microsoft/ALAppExtensions/blob/master/DevEnvironment.md.

### Steps
1. In Visual Studio Code, open the folder from the AlAppExtensions repository that you want to contribute to. System modules are located in the `System` folder.
2. Open the command search by pressing `F1` and run **AL: Download Symbols**.
3. Now you are ready to go. You can modify the the module and add you contribution. Remember that your changes should adhere to the general guidelines for modules described in the [Blueprint](https://github.com/microsoft/ALAppExtensions/blob/master/Blueprint.md). See below for an example. 
4. The main consideration when changing an existing module, compared to contributing with a new module, is that you need to adhere to, and think about no breaking changes. When doing your changes make sure that you do not break existing functionality. Once you are done, check that existing tests still pass, and add new tests for the functionality that you changed or added.

### Example
In the following, we will go through an example contribution to an existing module. Specifically, we will look at a previous contribution to the Base64 Convert module. The contribution added support for other text encodings than UTF8. Thus, if you are following along you will see that these changes have already been published in the AlAppExtensions repository. You can find the actual PR that we will be recreating here: https://github.com/microsoft/ALAppExtensions/pull/7676. Let's take a look at what it took to create this PR.

#### Set up Visual Studio Code for module development

When setting up your development environment, you should have taken note of the `server` and `serverInstance` settings.

Open the `launch.json` file and update the `server`, `serverInstance` and `authentication` settings, as described in [setting up your development environment](https://github.com/microsoft/ALAppExtensions/blob/master/DevEnvironment.md).

    "server": "https://YourDockerContainerName",
    "serverInstance": "BC",
    "authentication": "Windows",


Open the `settings.json` file and update the `al.assemblyProbingPaths` as described in [setting up your development environment](https://github.com/microsoft/ALAppExtensions/blob/master/DevEnvironment.md).

#### Make a branch

Make a branch

    git checkout -b "YourFeatureBranchName"

You are now ready to start changing the module.

#### Making changes to the module

Before making changes, make sure you are familiar with the general architecture of system modules by looking at the [Blueprint](https://github.com/microsoft/ALAppExtensions/blob/master/Blueprint.md). You can also check the article: [How to add a system module](https://github.com/microsoft/ALAppExtensions/blob/master/How-to-add-a-module.md) for an example of creating a full system module.

We start by adding the functions that we need to the internal implementation codeunit, that we need to support different text encodings. We add the following functions to the implementation codeunit `System/Base64 Convert/src/Base64ConvertImpl.Codeunit.al`:

    procedure ToBase64(String: Text; TextEncoding: TextEncoding): Text
    begin
        exit(ToBase64(String, false, TextEncoding, 0));
    end;

    procedure ToBase64(String: Text; TextEncoding: TextEncoding; Codepage: Integer): Text
    begin
        exit(ToBase64(String, false, TextEncoding, Codepage));
    end;

    procedure ToBase64(String: Text; InsertLineBreaks: Boolean; TextEncoding: TextEncoding): Text
    begin
        exit(ToBase64(String, InsertLineBreaks, TextEncoding, 0));
    end;

    procedure ToBase64(String: Text; InsertLineBreaks: Boolean; TextEncoding: TextEncoding; Codepage: Integer): Text
    var
        Convert: DotNet Convert;
        Encoding: DotNet Encoding;
        Base64FormattingOptions: DotNet Base64FormattingOptions;
        Base64String: Text;
    begin
        if String = '' then
            exit('');

        if InsertLineBreaks then
            Base64FormattingOptions := Base64FormattingOptions.InsertLineBreaks
        else
            Base64FormattingOptions := Base64FormattingOptions.None;
        case TextEncoding of
            TextEncoding::UTF16:
                Base64String := Convert.ToBase64String(Encoding.Unicode().GetBytes(String), Base64FormattingOptions);
            TextEncoding::MSDos,
            TextEncoding::Windows:
                Base64String := Convert.ToBase64String(Encoding.GetEncoding(CodePage).GetBytes(String), Base64FormattingOptions);
            else
                Base64String := Convert.ToBase64String(Encoding.UTF8().GetBytes(String), Base64FormattingOptions);
        end;

        exit(Base64String);
    end;

    procedure FromBase64(Base64String: Text; TextEncoding: TextEncoding): Text
    begin
        exit(FromBase64(Base64String, TextEncoding, 1252));
    end;

    procedure FromBase64(Base64String: Text; TextEncoding: TextEncoding; CodePage: Integer): Text
    var
        Convert: DotNet Convert;
        Encoding: DotNet Encoding;
        OutputString: Text;
    begin
        if Base64String = '' then
            exit('');

        case TextEncoding of
            TextEncoding::UTF16:
                OutputString := Encoding.Unicode().GetString(Convert.FromBase64String(Base64String));
            TextEncoding::MSDos,
            TextEncoding::Windows:
                OutputString := Encoding.GetEncoding(CodePage).GetString(Convert.FromBase64String(Base64String));
            else
                OutputString := Encoding.UTF8().GetString(Convert.FromBase64String(Base64String));
        end;
        exit(OutputString);
    end;

We also need to update some of the existing functions in `System/Base64 Convert/src/Base64ConvertImpl.Codeunit.al`, while making sure that they keep the same functionality:

    procedure ToBase64(String: Text): Text
    begin
        exit(ToBase64(String, false));
    end;

    procedure ToBase64(String: Text; InsertLineBreaks: Boolean): Text
    begin
        exit(ToBase64(String, InsertLineBreaks, TextEncoding::UTF8, 0));
    end;

    procedure FromBase64(Base64String: Text): Text
    begin
        exit(FromBase64(Base64String, TextEncoding::UTF8, 0));
    end;

At this point, we have changed the implementation codeunit. We have made sure not to break existing functionality, by keeping the same behaviour for existing functions.

We can then add public functions in the facade codeunit with the functionality that we want to expose. Since the functions here are public we need to ensure that these are well-documented and tested. The functions simply call the corresponding function in the implementation codeunit. We add the following functions to `System/Base64 Convert/src/Base64Convert.Codeunit.al`:

    /// <summary>
    /// Converts the value of the input string to its equivalent string representation that is encoded with base-64 digits.
    /// </summary>
    /// <param name="String">The string to convert.</param>
    /// <param name="TextEncoding">The TextEncoding for the input string.</param>
    /// <returns>The string representation, in base-64, of the input string.</returns>
    procedure ToBase64(String: Text; TextEncoding: TextEncoding): Text
    begin
        exit(Base64ConvertImpl.ToBase64(String, TextEncoding));
    end;

    /// <summary>
    /// Converts the value of the input string to its equivalent string representation that is encoded with base-64 digits.
    /// </summary>
    /// <param name="String">The string to convert.</param>
    /// <param name="TextEncoding">The TextEncoding for the input string.</param>
    /// <param name="Codepage">The Codepage if TextEncoding is MsDos or Windows.</param>
    /// <returns>The string representation, in base-64, of the input string.</returns>
    procedure ToBase64(String: Text; TextEncoding: TextEncoding; Codepage: Integer): Text
    begin
        exit(Base64ConvertImpl.ToBase64(String, TextEncoding, Codepage));
    end;

    /// <summary>
    /// Converts the specified string, which encodes binary data as base-64 digits, to an equivalent regular string.
    /// </summary>
    /// <param name="Base64String">The string to convert.</param>
    /// <param name="TextEncoding">The TextEncoding for the input string.</param>
    /// <returns>Regular string that is equivalent to the input base-64 string.</returns>
    /// <error>The length of Base64String, ignoring white-space characters, is not zero or a multiple of 4.</error>
    /// <error>The format of Base64String is invalid. Base64String contains a non-base-64 character, more than two padding characters,
    /// or a non-white space-character among the padding characters.</error>
    procedure FromBase64(Base64String: Text; TextEncoding: TextEncoding): Text
    begin
        exit(Base64ConvertImpl.FromBase64(Base64String, TextEncoding));
    end;

    /// <summary>
    /// Converts the specified string, which encodes binary data as base-64 digits, to an equivalent regular string.
    /// </summary>
    /// <param name="Base64String">The string to convert.</param>
    /// <param name="TextEncoding">The TextEncoding for the inout string.</param>
    /// <param name="Codepage">The Codepage if TextEncoding is MsDos or Windows.</param>
    /// <returns>Regular string that is equivalent to the input base-64 string.</returns>
    /// <error>The length of Base64String, ignoring white-space characters, is not zero or a multiple of 4.</error>
    /// <error>The format of Base64String is invalid. Base64String contains a non-base-64 character, more than two padding characters,
    /// or a non-white space-character among the padding characters.</error>
    procedure FromBase64(Base64String: Text; TextEncoding: TextEncoding; Codepage: Integer): Text
    begin
        exit(Base64ConvertImpl.FromBase64(Base64String, TextEncoding, Codepage));
    end;

We have now exposed the appropriate functions. The next step is to first make sure existing tests pass and then add new tests to test the functionality that we added.

After verifying that the tests passes, we add the following two new tests to the file `System Tests/Base64 Convert/src/Base64ConvertTest.Codeunit.al`:

    [Test]
    procedure StringToBase64UTF16Test()
    var
        ConvertedText: Text;
    begin
        // [SCENARIO] A string variable is converted to base-64 string, binary representation is kept in UTF16

        // [WHEN] The string is converted
        ConvertedText := Base64Convert.ToBase64(SampleUTF16Txt, TextEncoding::UTF16);

        // [THEN] The converted value is correct
        Assert.AreEqual(Base64SampleUTF16Txt, ConvertedText, ConvertionToBase64UTF16Err);
    end;

    [Test]
    procedure FromBase64UTF16StringTest()
    var
        ConvertedText: Text;
    begin
        // [SCENARIO] A base-64 string with UTF16 encoding is converted to a regular string

        // [WHEN] The base-64 string is converted
        ConvertedText := Base64Convert.FromBase64(Base64SampleUTF16Txt, TextEncoding::UTF16);

        // [THEN] The converted value is correct
        Assert.AreEqual(SampleUTF16Txt, ConvertedText, ConvertionFromBase64UTF16Err);
    end;

After running all the tests including the new ones and verifying that they pass, we have now made our changes!

#### Commit and push your changes and open a PR

Commit your changes

    git commit -m "Your message"

Push your changes

    git push

You can now go to your GitHub fork and open a pull request in the AlAppExtensions repository. 

## See Also
[Become a contributor](https://blogs.msdn.microsoft.com/nav/2018/08/28/become-a-contributor-to-business-central/)
[Git going with extensions](https://community.dynamics.com/business/b/businesscentraldevitpro/archive/2018/10/26/quot-git-quot-going-with-extensions)
[Walkthrough: Contributing to an extension on GitHub](https://community.dynamics.com/business/b/businesscentraldevitpro/archive/2018/11/27/walkthrough-contributing-to-an-extension-on-github)