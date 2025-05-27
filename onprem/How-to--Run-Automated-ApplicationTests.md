---
title: "How to: Run Automated ApplicationTests"
ms.date: 10/01/2018
ms.topic: article
ms.assetid: 4209d5ac-3bf6-4e61-bb8c-8e3b221bd6ea
caps.latest.revision: 3
---
# How to: Run Automated ApplicationTests
You can run the automated application tests that are included on the [!INCLUDE[navnow](includes/navnow_md.md)] product media, and you can create your own tests suites and run them in the **CAL Test Tool** window.  
  
 To run tests in the CAL Test Tool window, you must import the objects in the .fob files in the **TestToolkit** folder that is included on the [!INCLUDE[navnow](includes/navnow_md.md)] product media. For more information, see [Application Test Automation](Application-Test-Automation.md).  
  
 Any changes done to the database by running tests are automatically rolled back using the Test Isolation testability functionality. For more information, see [How to: Create a Test Runner Codeunit](How-to--Create-a-Test-Runner-Codeunit.md).  
  
### To run an application test suite  
  
1.  Open the **CAL Test Tool** window.  
  
     From the [!INCLUDE[nav_dev_short](includes/nav_dev_short_md.md)]: In Object Designer, select page ID 130401, and then choose **Run**.  
  
     From the [!INCLUDE[nav_windows](includes/nav_windows_md.md)] or the [!INCLUDE[nav_web](includes/nav_web_md.md)]: In the Search field, enter **CAL Test Tool**, and then choose the relevant link.  
  
    > [!WARNING]  
    >  Make sure that the application language is English \(US\). If the language is any other language, the Microsoft-provided tests will fail.  
  
2.  On the Home tab, choose **Get Test Codeunits**, and then choose **All Test Codeunits**.  
  
     This adds a number of test codeunits to the lines in the **CAL Test Tool** window.  
  
3.  To run all loaded tests, on the Home tab, choose **Run**.  
  
    > [!NOTE]  
    >  If you load all Microsoft-provided tests and run all tests against the [!INCLUDE[demolong](includes/demolong_md.md)], the process takes approximately 8 hours.  
  
     Alternatively, choose one or more tests, and then, on the Home tab, choose **Run Selected**.  
  
     If you clear the **Run** field for a codeunit, the field is also cleared for all functions in that codeunit. You can then select one or more test functions.  
  
 When the test run completes, the **CAL Test Tool** window is updated with the result of the tests. You can the number of tests that were successful, failed, or were not run.  
  
 If any test fails, you can attach a debugger session and run the failing test again. The debugger will then break at the line where the test failed, and you will be able to inspect the call stack and examine variables to determine the underlying cause of the failure.  
  
## Running Specific Tests  
 During typical development, it is unacceptable to have to wait hours to get results from tests, which is why we have two additional options for test selection:  
  
1.  Manual test selection.  
  
2.  Test selection based on test coverage maps.  
  
     This is a more advanced test selected that is based on an analysis of the code coverage data from individual test codeunits and comparing the result to the set of objects that have to be tested. [!INCLUDE[navnow](includes/navnow_md.md)] can automatically suggest test codeunits basing on objects where the **Modified** field is set to Yes in the database. Or you can select objects to be tested from the full list of objects.  
  
 You can create several test suites with different set of selected tests. A default test suite is created with the first run of the test tool. You can create an unlimited number of test suites and import and export them in XML format. This helps to move test suites between different databases and machines.  
  
#### To run specific tests based on manual test selection  
  
1.  Open the **CAL Test Tool** window.  
  
2.  On the Home tab, choose **Get Test Codeunits**, and then choose **Select Test Codeunits**.  
  
3.  In the **CAL Test Get Codeunits** window, select the codeunits that you want to load, and then choose OK.  
  
 The new test codeunits appear at the bottom of the list in the **CAL Test Tool** window. You can now select them and run them as described in the previous procedure.  
  
#### To run specific tests based on test coverage maps  
  
1.  Open the **CAL Test Tool** window.  
  
2.  Choose the test or test suite that you want to generate a test coverage map for, and then choose **Generate Test Coverage Map**.  
  
     Then, when you run the test, a test coverage map is generated based on the code coverage functionality in [!INCLUDE[navnow](includes/navnow_md.md)].  
  
 When you have generated a test coverage map, you can export it to an XML file and import it into another database, for example.  
  
## See Also  
 [Application Test Automation](Application-Test-Automation.md)   
 [Code Coverage](uiref/-$-N_9990-Code-Coverage-$-.md)