---
title: "Application Test Automation"
ms.date: 10/01/2018
ms.topic: article
ms.assetid: 54287f24-da52-4e74-97f5-06b934a53728
caps.latest.revision: 6
---
# Application Test Automation
You can write application tests in C/AL and run them individually or collectively. The [!INCLUDE[navnow](includes/navnow_md.md)] product media includes a folder with application objects that form a library of application tests, helper functions, and test runners so you can automate your application tests. For example, use the application test libraries to verify your application after upgrading to the latest release of [!INCLUDE[navnow](includes/navnow_md.md)].  

## Application Test Toolkit  
 The **TestToolkit** folder on the [!INCLUDE[navnow](includes/navnow_md.md)] product media includes three .fob files:  

|Name|[!INCLUDE[bp_tabledescription](includes/bp_tabledescription_md.md)]|  
|----------|---------------------------------------|  
|CALTestCodeunits.W1.fob|Contains codeunits with test functions to test various application areas.<br /><br /> The tests in this .fob file depend on the test libraries in the CALTestLibraries.W1.fob file. You must import the objects from all three files in order to use the application tests.|  
|CALTestLibraries.W1.fob|Contains codeunits with generic and application-specific functions to reduce duplication of test code.|  
|CALTestRunner.fob|Contains application objects for running application tests, include the CAL Test Tool page and other objects that support the application tests.|  

> [!NOTE]  
>  The file names in the table are for the default version of [!INCLUDE[navnow](includes/navnow_md.md)]. The product media for the country-/region specific versions of [!INCLUDE[navnow](includes/navnow_md.md)] contain files that are relevant for that country/region.  

### Describing Your Tests  
 To help you design the relevant tests for your functionality, you can write scenarios that outline what you want to test, and you can write test criteria in the GIVEN-WHEN-THEN format. By adding comments based on feature, scenario, and GIVEN-WHEN-THEN, you add structure to your test code and make tests readable.  

 With this structure, you can analyze your functional coverage, such as which behavior you covered for each feature. When you can parse test code for defined tags, you have a human-readable description \(XML or structured text\) of the automated scenarios without unnecessary details of test implementation that tells you the purpose of the test. You can provide the owner of the business functionality with this description and include it in a global tree of scenarios supported by your solution.  

 When you have established the test criteria, you can write the test code itself. If you add the test criteria to the test code as comments, you can always refer to the test criteria, and it is easy to get an overview of what the test does.  

 The following sections provide an overview of the tags that we recommend that you use.  

#### FEATURE Tag  

```  
// [FEATURE] [<FeatureTag1>] [<FeatureTagN>]  
```  

 `FeatureTag` represents the name of the feature, application area, functional area, or another aspect of the application.  

 This list of tags should point to an area of your solution that is touched by the test. Order tags in descending importance. Start with the most important tags referring to the WHEN or THEN steps. Also add tags to important elements of functionality mentioned in GIVEN steps. For example, a test that verifies VAT amounts posted by a sales prepayment invoice can be marked as `[VAT] [Prepayment] [Sales]`.  

 The `[FEATURE]` tag can be set for the whole test codeunit if you enter is at the beginning of the Documentation trigger. This means all tests in this codeunit will inherit the list of tags set there. If a test is supposed to have the same list of tags as the codeunit has, you do not have to add the `[FEATURE]` tag for this test. Add the tags only if the test has something specific to say.  

#### SCENARIO Tag  

```  
// [SCENARIO <ScenarioID>] <TestDescription>  
```  

 `ScenarioID` links the test to a work item for the functionality. For example, if you use Visual Studio Online or Team Foundation Server, `[SCENARIO 12345]` represents a work item with the ID 12345.  

 `TestDescription` represents a short description of the purpose of the test, such as **Annie can apply a deferral template to a purchase order**.  

 The `[SCENARIO]` tag should be the first line in the test method. Review sets of related tests and make sure that you can recognize the difference between similar tests based on the description. The following example illustrates the use of the \[SCENARIO\] tag to describe a test:  

```  
// [SCENARIO 12345] [Deferral Code] Annie can apply a deferral template to a purchase order.  
```  

#### GIVEN-WHEN-THEN Tags  
 The GIVEN-WHEN-THEN tags provide a framework for the specific test criteria.  

|Tag|[!INCLUDE[bp_tabledescription](includes/bp_tabledescription_md.md)]|  
|---------|---------------------------------------|  
|GIVEN|Describes one step in setting up the test. If you feel a need to add an AND, you should probably add a separate GIVEN.<br /><br /> In most of cases, in order to run an action under test, you must prepare the database. Tests can be complex, so you can add more than one GIVEN. They can come in one block or comment particular lines of code. Do not try to repeat code and comment each line. Instead, add information of a higher level that would be valuable when reading without the test code.|  
|WHEN|Describes the action under test.<br /><br /> A test is to test one thing. There should be only one WHEN in a test. It is the line of code that changes state of something that we are going to verify. If you feel a need to add more than one WHEN followed by different verification, you should split this test in two or more tests.|  
|THEN|Describes what is verified by the test.<br /><br /> All tests must have a verification part. If there is no verification, the test does not test anything. You can add more than one THEN tag.|  

 The following example illustrates a use of the GIVEN-WHEN-THEN format:  

```  
[GIVEN] The credit limit approval workflow is enabled.  
[GIVEN] A sales invoice exists that is not approved and released.  
[WHEN] The user wants to post a sales invoice.  
[THEN] The user sees an error that they cannot post an invoice that is not approved and released.  
```  

#### Putting It All Together  
 For an example of how you can use the \[FEATURE\], \[SCENARIO\], and GIVEN-WHEN-THEN tags, see [Walkthrough: Testing Purchase Invoice Discounts](Walkthrough--Testing-Purchase-Invoice-Discounts.md). You can also search for \[FEATURE\] or \[SCENARIO\] in the test codeunits that are available on [!INCLUDE[navnowlong](includes/navnowlong_md.md)] product media.  

## See Also  
 [How to: Create a Test Runner Codeunit](How-to--Create-a-Test-Runner-Codeunit.md)   
 [Walkthrough: Testing Purchase Invoice Discounts](Walkthrough--Testing-Purchase-Invoice-Discounts.md)   
 [Random Test Data](Random-Test-Data.md)   
 [Testing the Application](Testing-the-Application.md)   
 [Code Coverage](uiref/-$-N_9990-Code-Coverage-$-.md)
