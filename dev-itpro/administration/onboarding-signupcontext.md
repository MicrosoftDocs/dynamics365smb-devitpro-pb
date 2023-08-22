---
title: Create customer-centric onboarding experiences with the SignupContext parameter.
description: Learn how you can use the SignupContext parameter to create customer-centric evaluation and onboarding experiences.
ms.date: 01/25/2023
ms.topic: conceptual
author: sorenfriisalexandersen
ms.author: soalex
ms.reviewer: bholtorf
---

# Create customer-centric onboarding experiences using SignupContext

Microsoft partners can create customer-centric onboarding experiences to help customers quickly get started with [!INCLUDE [prod_short](../includes/prod_short.md)]. Speeding up the onboarding process saves time and money for both the partner and customer. The `SignupContext` parameter enables partners to create experiences that can help the customer try out and evaluate [!INCLUDE [prod_short](../includes/prod_short.md)], and then onboard at their own pace, without hands-on help from the partner, who instead provides onboarding services digitally. Allowing prospects to learn about [!INCLUDE [prod_short](../includes/prod_short.md)] from their own perspectives increases the chance of them becoming paying customers.

Starting trials for customers is a multi-step task for partners:

* Build a reseller relationship with the potential customer
* Create [!INCLUDE [prod_short](../includes/prod_short.md)] environments
* Apply the partner's app(s), 
* Load demo data that's relevant for the prospect.

The `SignupContext` parameter lets partners create customer-centric trials without having to do the work manually. They can provide apps that cover the steps, and tailor the experience based on the customer's context. These trials are similar to trials that prospects start from Microsoft's *dynamics.microsoft.com* website. They're unmanaged in the sense that there isn't a CSP relationship between the prospect and the partner.

## Use the SignupContext parameter to get information about prospects

The `SignupContext` parameter can pass information about a prospect from your website to [!INCLUDE [prod_short](../includes/prod_short.md)], and use the information to tailor the evaluation and onboarding experience for a specific customer. The tailoring makes [!INCLUDE [prod_short](../includes/prod_short.md)] more relevant to each prospect.

The `SignupContext` parameter can include information about the origin of the sign-up, and other information you want to pass to [!INCLUDE [prod_short](../includes/prod_short.md)] from the sign-up process on your website. For example, your website might offer a questionnaire that asks the prospect for information that can help you understand the prospect's needs. The questions might gather the following information from prospects

* Their industry
* Number of users
* How they intend to use a business management solution.

You can use the prospect's answers in the `SignupContext` parameter to prepare demo and onboarding experiences that match their needs.

## The SignupContext parameter explained

When a prospect starts a [!INCLUDE [prod_short](../includes/prod_short.md)] trial from the dynamics.microsoft.com website, the first step is to sign up as a Microsoft cloud customer and create a onmicrosoft.com tenant. In this process, the prospect either signs in to a tenant or creates one, depending on whether they're already a customer. After this step, the prospects are redirected to *https:\//businesscentral.dynamics.com*. The URL has parameters that [!INCLUDE [prod_short](../includes/prod_short.md)] uses to identify sign-ups and sign-ins. The URL also has a `SignupContext` parameter. This parameter can contain the sign-up information from the partner's website. For example, the answers to questions on a questionnaire.

## How the SignupContext parameter works

In the sign-up process, when [!INCLUDE [prod_short](../includes/prod_short.md)] provisions a trial environment it passes the sign-up context from the browser URL to the application, where AL code can process it. The `SignupContext` parameter is available to apps that want to tailor functionality according to the context. The partner's app is provisioned automatically along with the trial environment, and does the actual tailoring.

The `SignupContext` parameter is a JSON string with key-value pairs that [!INCLUDE [prod_short](../includes/prod_short.md)] parses and stores in a system table.

Let's explore an example where a sign-up is triggered by a user on Partner X's website. Imagine that the user was asked a single question on the partner website. Based on the answer to the question, you want to load a specific app with the trial and use the app to tailor the experience in [!INCLUDE [prod_short](../includes/prod_short.md)]. For example, the question and answer pair could be:

* Question on website: "Which application are you currently using?"*
* Answer from prospect: "Foo Accounting"

This combination of question and answer could result in the following `SignupContext` parameter:

```json
signupContext={"name":"partnerx","appid":"12345678-1234-1234-1234-12456781234","countrycode":"us","eulaaccept": "true" ,"presystem":"Foo Accounting"}
```
The `SignupContext` parameter requires a few keys and values:

* **name**: [Required] Identifies the partner. We recommend aligning the value with the _name of the app_ that will tailor the trial and onboarding experiences.
* **appid**: [Required] Identifies the app to install when provisioning the trial.
* **countrycode**: [Required] Identifies the country in which the app is supported, and the country of the prospects Azure AD tenant. The country codes must be the same.
* **eulaaccept**: [Required] This setting must always be true for the partner app. The partner must provide the option to read the EULA for their app before the prospect starts a trial.

Then come the partner-specific parameters. In this example, the presystem key-value ("presystem":"Foo Accounting") that represents the question on the partner's website.

## Constructing the sign-up URL including the sign-up context

After the partner establishes the outcome of the profiling questions, the `SignupContext` parameter can be constructed, as shown above.

To pass the `SignupContext` parameter through the sign-up process to the [!INCLUDE [prod_short](../includes/prod_short.md)] trial, the partner's website double-encode it. The following steps show an example.

1. URI encodes the `SignupContext` value itself.  

   The encoded characters resolve to a URL, such as the following example:  

   **Before encoding**
   ```json
    {"name":"partnerx","appid":"12345678-1234-1234-1234-12456781234","countrycode":"us","eulaaccept": "true" ,"presystem":"Foo Accounting"}
    ```    
   **After encoding**
   <pre>7B%22name%22%3A%22partnerx%22%2C%22appid%22%3A%2212345678-1234-1234-1234-12456781234%22%2C%22countrycode%22%3A%22us%22%2C%22eulaaccept%22%3A%20%22true%22%20%2C%22presystem%22%3A%22Foo%20Accounting%22%7D
   </pre>

   The `SignupContext` parameter is part of a larger `&ru` redirect URL parameter that redirects the user from the sign-up process to the [!INCLUDE [prod_short](../includes/prod_short.md)] trial provisioning. For the redirect to work properly, the entire redirect URL with the `SignupContext` parameter must be URI encoded. The result is a double-encoding of the `SignupContext` parameter value.

2. URI encodes the `&ru` parameter value.  

   **Before encoding**
   <pre>https://businesscentral.dynamics.com/?redirectedFromSignup=1&ScenarioId=signup&signupContext=%7B%22name%22%3A%22partnerx%22%2C%22appid%22%3A%2212345678-1234-1234-1234-12456781234%22%2C%22countrycode%22%3A%22us%22%2C%22eulaaccept%22%3A%20%22true%22%20%2C%22presystem%22%3A%22Foo%20Accounting%22%7D
   </pre>

   The string already has the encoded `SignupContext` from the previous step.

   **After encoding**
   <pre>https%3A%2F%2Fbusinesscentral.dynamics.com%2F%3FredirectedFromSignup%3D1%26ScenarioId%3Dsignup%26signupContext%3D%257B%2522name%2522%253A%2522partnerx%2522%252C%2522appid%2522%253A%252212345678-1234-1234-1234-12456781234%2522%252C%2522countrycode%2522%253A%2522us%2522%252C%2522eulaaccept%2522%253A%2520%2522true%2522%2520%252C%2522presystem%2522%253A%2522Foo%2520Accounting%2522%257D
   </pre>

   Now, the final URL can be constructed. The URL starts the sign-up process and includes the encoded redirect URL (containing a now double URI encoded `SignupContext` parameter value).

3. Construct the final URL.

    <pre>https://signup.microsoft.com/get-started/signup?sku=6a4a1628-9b9a-424d-bed5-4118f0ede3fd&ru=https%3A%2F%2Fbusinesscentral.dynamics.com%2F%3FredirectedFromSignup%3D1%26ScenarioId%3Dsignup%26signupContext%3D%257B%2522name%2522%253A%2522partnerx%2522%252C%2522appid%2522%253A%252212345678-1234-1234-1234-12456781234%2522%252C%2522countrycode%2522%253A%2522us%2522%252C%2522eulaaccept%2522%253A%2520%2522true%2522%2520%252C%2522presystem%2522%253A%2522Foo%2520Accounting%2522%257D&products=6a4a1628-9b9a-424d-bed5-4118f0ede3fd&ali=1
    </pre>

    The URL points to *signup.microsoft.com* and has the `&products` and `&ali` parameters.

## What happens with the SignupContext in [!INCLUDE [prod_short](../includes/prod_short.md)]

[!INCLUDE [prod_short](../includes/prod_short.md)] examines the `SignupContext` parameter when it's provisioned through a viral trial sign-up. It checks the **countrycode** value and matches it with the country/region set for the Azure AD tenant. The countries/regions must match because [!INCLUDE [prod_short](../includes/prod_short.md)] will provision a trial in the Azure AD country/region by default. Using the **countrycode** value allows you to set the *intended* country/region, so partners can offer the experience on country/region-specific (locale) versions of their websites. The supported countries/regions of the app specified by the **appid** value are also checked for a match. If all three countries/regions don't match, trial provisioning stops and shows a message to the user.

If countries/regions match, [!INCLUDE [prod_short](../includes/prod_short.md)] provisions the trial environment from the dynamics.microsoft.com website. When the provisioning is complete, the app specified by the **appid** value is installed from AppSource if the **eulaaccept** value is true. Partners can set the **eulaaccept** value to true when they have presented the End-User License Agreement (EULA) of their app to the user, and the user has accepted it. The partner is responsible for providing the opportunity to review and consent to the EULA on their website. If the value is true, [!INCLUDE [prod_short](../includes/prod_short.md)] assumes the user has accepted the EULA, which is a requirement for installing apps from AppSource. After the app is installed, [!INCLUDE [prod_short](../includes/prod_short.md)] is ready to load and sign the user in to their Role Center.

The `SignupContext` parameter string is stored in [!INCLUDE [prod_short](../includes/prod_short.md)]. [!INCLUDE [prod_short](../includes/prod_short.md)] parses the key-value pairs and adds them to system **table 2000000255, Signup Context** so they're ready for an app to consume them. However, before a trial-provisioned app can consume these `SignupContext` parameter values, the correct sign-up context **name** must first be set for the application, which is stored in **table 150, Signup Context Values**. Subscribe to the `OnSetSignupContext` event. By subscribing to the event, an app can read the value for the **name** key stored in the **Signup Context** system table and set the **Signup Context** enum field in the **Signup Context Values** table. This enum must be extended with a new enum option that identifies the `SignupContext` parameter for the specific app. We recommend using an enum caption that reflects the chosen **name** value provided in the URL.

### Extending the Signup Context enum field

```AL
enumextension 50100 ParnerXAppSignupContext extends "Signup Context"
{
    value(50100, PartnerXApp)
    {
        Caption = 'Partner X app'    }
    }
}
```

### Setting the Signup Context value in the Signup Context Values table

```AL
[EventSubscriber(ObjectType::Codeunit, Codeunit::"System Initialization", 'OnSetSignupContext', '', false, false)]
local procedure SetPartnerXAppContextOnSetSignupContext(SignupContext: Record "Signup Context") 
var SignupContextValues: Record "Signup Context Values";

begin        
    if not SignupContext.Get('name') then            
        exit;
    
    if not (LowerCase(SignupContext.Value) = 'name') then            
        exit;

    Clear(SignupContextValues);
    if not SignupContextValues.IsEmpty() then            
        exit;
    
    SignupContextValues."Signup Context" := SignupContextValues."Signup Context"::PartnerXApp;
    SignupContextValues.Insert();
end;
```
Setting the sign-up context causes [!INCLUDE [prod_short](../includes/prod_short.md)] to skip initialization of default checklist items for all roles. Partners must add checklist items for the relevant roles.

When the `SignupContext` parameter has a value expected by the partner's, the app can add checklist items and other elements to the tailor the experience.

### Reacting to the SignupContext parameter

```AL
[EventSubscriber(ObjectType::Codeunit, Codeunit::"System Initialization", 'OnAfterLogin', '', false, false)]
local procedure InitializeChecklistOnAfterLogIn()
var
    Company: Record Company;
    SignupContextValues: Record "Signup Context Values";
    Checklist: Codeunit Checklist;
begin
    if not SignupContextValues.Get() then            
        exit;

    if not (SignupContextValues."Signup Context" = SignupContextValues."Signup Context"::PartnerXApp) then
        exit;
        
    // Invoke codeunit for inserting checklist items and other elements that tailor the experience.    
    
end;
```

> [!NOTE]
> The `SignupContext` parameter and the ability to create un-managed trials isn't intended for test-driving apps. These types of trials should only be used to create evaluation and onboarding experiences. Partners should make sure to create experiences that greet the prospect, demo the desired features, and take the prospect through a buying and onboarding experience. The goal is to convert the prospect to become a paying customer of [!INCLUDE [prod_short](../includes/prod_short.md)], and the job of the partner's app is to smoothen that transition to minimize the hands-on work from the partner. 

> [!IMPORTANT]
> Partners who load their apps when the trial is provisioned must give users the chance to review and agree to the EULA for their app before starting the trial. This also means that only the partner's own apps can be loaded. Therefore, partners should avoid having non-owned apps in the dependency list in the app manifest.

## See also

[Onboarding experiences in Business Central](onboarding-experiences.md)  
