Sandbox environments are meant to be precisely that: Environments that you can play around with, use as a testbed for development, and delete at will. You can deploy apps straight from Visual Studio Code to a sandbox environment, and you can attach a debugging session to a sandbox.  

You can also safely use sandboxes for training, such as for following a learning path from [Microsoft Learn](/learn/dynamics365/business-central?WT.mc_id=dyn365bc_landingpage-docs), because it's a safe environment to experiment with. If anything goes wrong, you just delete the sandbox and start over.  

> [!IMPORTANT]
> The automatic backup that applies to production environments does not apply to sandbox environments. If you want to export data from a sandbox environment, you can use Excel or RapidStart, but you cannot request a database export.  
> Also, apps that are published to a sandbox from the development environment or in-client designer are published within the scope of the service node that hosts the environment. When the sandbox is upgraded, these apps are removed because the environment is moved to another node that is running the new version. However, the data of the app is not removed, so you only have to re-publish and install the app to make it available.  
> Apps that are published to production environments are published within a global scope. During the upgrade, these apps are downloaded to the service node and installed, which means that they will not disappear.

You can create a sandbox environment that includes data from your production environment for debugging purposes, for example. But if you want to run performance tests, or similar benchmarking, the sandbox is not reliable enough for that purpose. This is because sandboxes run in a different performance tier on Azure than production environments. Instead, create a dedicated environment based on the Production environment type - this gives you the exact experience and performance that users will experience in the actual production environment.  

Sandbox environments are handy for certain types of development scenarios because the debugging endpoint is open by default. This means that you can attach Visual Studio Code to a running system and debug through running code. It also allows you to publish directly to the environment from Code.  

If your organization has more than one sandbox environment, you can switch between environments by opening the App Launcher, choosing the Dynamics 365 tile, then choose the Business Central Sandbox tile. The sandbox environment picker shows the available sandboxes, so choose the one that you want to switch to.
