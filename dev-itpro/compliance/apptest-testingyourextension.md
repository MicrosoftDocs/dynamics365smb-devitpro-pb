---
title: Testing your extension
description: Describing the steps you must go through to successfully submit your app to AppSource.
author: SusanneWindfeldPedersen
ms.date: 04/11/2023
ms.topic: how-to
ms.author: freddyk
---

# Testing your extension

Several key things lead to your [!INCLUDE[d365fin_long_md](../includes/d365fin_long_md.md)] extension passing the Microsoft validation process. However, one of the most important checks you can do is to take the time and test your extension before submitting it for validation. This allows you to catch some of the basic errors that could lead to validation failures. The following list calls out key points, and the sections in this article provide more context.

- Always test in a [!INCLUDE[d365fin_long_md](../includes/d365fin_long_md.md)] online environment. If you test in an on-premises deployment, you might miss errors that would be seen online.
- Ensure that your extension can be published without code signing errors. You **must not** use the `-skipverification` flag.
- The extension should be able to be installed without errors.
- If you're using the **Assisted Setup**, ensure that you can use your wizard to completion without errors.
- Walk through the setup and usage of your extension to verify it works as expected (**remember to test as a user that does not have SUPER permissions**).
- Check that you can uninstall and unpublish your extension without any errors.
- Make sure you can republish and reinstall your extension without any errors.

## Use the correct [!INCLUDE[d365fin_long_md](../includes/d365fin_long_md.md)] version

Use Docker for your development and testing. At least, run your full test in [!INCLUDE[d365fin_long_md](../includes/d365fin_long_md.md)] online at least once before submitting for validation. We use Docker, and this ensures that you'll be testing on the same as what we validate your app on.  

If you test in an on-premises deployment, you might miss errors that would be seen online.

Make sure that you use the correct artifacts for Docker to set up the correct [!INCLUDE[d365fin_long_md](../includes/d365fin_long_md.md)] version number. Use the function `Get-BCArtifactUrl` in the BcContainerHelper module to retrieve the artifactUrl of the current version. If you test on a build that is older or newer than the current version, your app will most likely fail validation.

Also make sure that you refresh the Docker instance each time you want to submit. If you haven't run your Docker script to refresh for months, then you are on an older build.

## Use the correct data when you test your app

When we validate apps, we use the base CRONUS demo data. This is there for some countries/regions and you don't have to do anything additional to receive that demo data. However, for countries/regions that are empty and don't include demo data, you must import the CRONUS evaluation demo data. Not the International CRONUS data, the evaluation demo data. We don't use custom data and we don't use any other data. We always use the base evaluation demo data. To get this same data (if you don't have it by default), you must follow these instructions:

1. Search for **Configuration Packages**, and then choose the link.
2. Choose **Process > Import Predefined Package**.
3. Select the link for **GB.ENU.EVALUATION**.

    That starts processing and you'll see the process bar.
4. If there are popups at all, just choose **Yes** or **OK**.
5. Once the process is complete, choose the **Apply Package** button, and then choose **Yes**.
7. Again, if any popups or anything just click through them.
8. Once it completes, sign out of [!INCLUDE[prod_short](../includes/prod_short.md)] and then sign back in again.
9. You now have data.

## Use the right user for your testing

Don't do your testing with a user that has SUPER permissions marked. The SUPER user can do all without issue and you won't catch your true app bugs. No live customer have several users marked with this permission set. Therefore, we can't test with it. You need to set up a user in your test environment that only has the **BUS FULL ACCESS** permission set, LOCAL, and any of your own permission sets. For information on how to set up this user, see this blog [Enabling Premium Experience in Business Central Sandbox Containers](https://cloudblogs.microsoft.com/dynamics365/no-audience/2018/04/13/enabling-premium-experience-in-business-central-sandbox-containers/?source=nav). 

## Testing your app

Now it's time to test your app. The following are all things you must do as part of your testing effort.

- Test your app in its entirety. We expect you to test 100% of the functionality of your app. Testing just a few areas of your app won't suffice. Test everything.
- We aren't going to test 100% of the functionality of your app. We expect you to be doing that.
- If the testing works for you, it will most likely work for us.
- Ensure that no permission errors are thrown for any of your app's functionality.
- With the ESSENTIAL user (before you assign your permission sets to it), make sure that the user can still use the core [!INCLUDE[prod_short](../includes/prod_short.md)] without facing permission errors. You must allow that user to do things such as accessing the Customer card, posting sales order, and so on.

## Maintaining your app

Although we do regular testing of your app when we prepare a new version of [!INCLUDE[d365fin_long_md](../includes/d365fin_long_md.md)], we expect you to do the same on your end. You have access to the same builds that we do through the Collaborate program. You can do more thorough testing than we can because you know your app the best. By doing this testing, you can catch future [!INCLUDE[d365fin_long_md](../includes/d365fin_long_md.md)] changes that may impact or break your app. Catching these changes in advance leaves less risk for customers to run into them.

You should be doing regular testing against our next minor (monthly) and next major (bi-annual) release branches that ports into our monthly service updates. To test against these builds, sign into [aka.ms/collaborate](https://aka.ms/collaborate), navigate to packages, and locate the package named **Working With Business Central Insider Builds**. The package contains a Shared Access Signature token with which you can download artifacts of future releases for use with Docker.

## Related information

[Checklist for submitting your app](../developer/devenv-checklist-submission.md)  
[Rules and Guidelines for AL code](apptest-overview.md)  
