> [!IMPORTANT]
> In [!INCLUDE[prod_short](prod_short.md)] versions 22 (2023 release wave 1) and later, certificates must include the following information: 
> 
> If **KeyUsage** is defined, you also need to specify **DigitalSignature**. 
> If **ExtendedKeyUsage** is defined, you also need to specify **ClientAuthentication**.
>
> This is due to a different behavior between .NET Core and .NET Framework. 
>
> When making an outbound http call to an external endpoint, if you receive a 403 response (external endpoint required a certificate), and your code _does_ have a HttpClient.AddCertificate, do check the version of the [!INCLUDE[prod_short](prod_short.md)] platform and the new requirements for **KeyUsage** and **ExtendedKeyUsage**.