class ApiConstance {
  static const String basUrl = "https://api.workiom.club/api/";

  static const String getCurrentLoginInformations="${basUrl}services/app/Session/GetCurrentLoginInformations";
  static const String getEditionsForSelect="${basUrl}services/app/TenantRegistration/GetEditionsForSelect";
  static const String getPasswordComplexitySetting="${basUrl}services/app/Profile/GetPasswordComplexitySetting";
  static const String isTenantAvailable="${basUrl}services/app/Account/IsTenantAvailable";
  static const String registerTenant="${basUrl}services/app/TenantRegistration/RegisterTenant";
  static const String authenticate="${basUrl}TokenAuth/Authenticate";


}
