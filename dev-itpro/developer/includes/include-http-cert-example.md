The following example shows how to add a certificate to the HttpClient data type.

```AL
// This code shows how to use certificates with HttpClient
procedure AddCertificateToHttpClient(var HttpClient: HttpClient; CertificateCode: Text[6])
var
    IsolatedCertificate: Record "Isolated Certificate";
    CertificateManagement: Codeunit "Certificate Management";
begin
    if not IsolatedCertificate.Get(CertificateCode) then
        exit;
    HttpClient.AddCertificate(
        CertificateManagement.GetCertAsBase64String(IsolatedCertificate),
        CertificateManagement.GetPassword(IsolatedCertificate));
end;
```