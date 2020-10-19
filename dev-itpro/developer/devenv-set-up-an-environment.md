# Setting up your environment

## Prerequisites

- You are familiar with the basics of [Git](https://git-scm.com/) and it is installed. It is used to communicate with the GitHub repository.
- [Docker](https://www.docker.com/) is installed. It is used to run Business Central as a self-contained application.
- [BcContainerHelper](https://www.powershellgallery.com/packages/BcContainerHelper/) is installed and will be used to create our Docker container.
- Demo or Partner License

## Getting the Repository onto the Local Machine

1. Visit the [ALAppExtensions Repository](https://github.com/microsoft/ALAppExtensions)
2. Fork the repository under your user. The button can be located at the top right of the repository page.
3. Open the green dropdown button labeled 'Code' and copy the URL under code to clone the forked repository. 

    The URL looks like [https://github.com/\<username\>/ALAppExtensions.git](https://github.com/\<username\>/ALAppExtensions.git). Where `<username>` is your GitHub username.
4. On your local machine, open PowerShell and go to the directory you'd like to keep the repository files.

    Run the command `git clone <URL>`. Where `<URL>` is step 3's URL you copied.

5. Open VS Code in the System modules folder in the cloned repository.

    Run the command `code ALAppExtensions/Modules/System`

6. Open the file `app.json` in the System folder and take a look at what `version` is listed.

## Setting up Business Central Docker Container

1. Import BcContainerHelper to the PowerShell window

    Run the command `Import-Module BcContainerHelper`. This will load up all the functions from the module.
2. Run the command `New-BcContainerWizard`. This will open a new PowerShell window and allow you to configure the options you'd like for your Business Central container.
3. The options below aren't the complete list of options that show up but the ones we change from the default choices.

    1. Local Docker Container or Azure VM, we will be using a local docker container.
    2. Authentication, Username/Password Authentication, options a, b or c.
    3. Container Name. Any name you prefer.
    4. Version, options e or f. Depending on whether you want an Sandbox or OnPrem build.
    
        - Key in the `version` from `ALAppExtensions/Modules/System/app.json` after selecting option e or f.
    5. Country, us is fine.
    6. Test Toolkit, if you have a partner license, you may choose any option. If you only have a demo license, choose option d, No Test Toolkit.
    7. Premium Plan, not required.
    8. Create Test Users, not required.
    9. AL Base App Development, we will need this as we will work on the System Application.
    10. Export AL Base App, not required as we will not be working on BaseApp.
    11. AL Language Extension, not required.
    12. License, put in the path to your license file.
    13. Database, default option a.
    14. Multitenant, non-multitenant setup.
    15. We will then put in `!` to use the default option choices for the rest of the options.
4. At the end of the configuration, you should be presented with the following script:
    ##
        $containerName = 'mydemo'
        $password = 'P@ssw0rd'
        $securePassword = ConvertTo-SecureString -String $password -AsPlainText -Force
        $credential = New-Object pscredential 'admin', $securePassword
        $auth = 'UserPassword'
        $artifactUrl = Get-BcArtifactUrl -type 'OnPrem' -country 'w1' -select 'Latest'
        $licenseFile = '<Path to license file>'
        New-BcContainer -accept_eula `
            -containerName $containerName `
            -credential $credential `
            -auth $auth `
            -artifactUrl $artifactUrl `
            -includeTestToolkit `
            -includeTestLibrariesOnly `
            -licenseFile $licenseFile `
            -includeAL -doNotExportObjectsToText `
            -updateHosts
    If you copy the above script, do not forget to update the `<path to license file>`. Also, if you are using a demo license, remove the options `-includeTestToolkit` and `-includeTestLibrariesOnly`.
5. Run the above script and the docker container will be created. This may take some time if you are running it for the first time.
