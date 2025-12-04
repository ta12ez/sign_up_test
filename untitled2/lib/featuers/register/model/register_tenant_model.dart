class RegisterTenantModel {
  RegisterTenantModel({
    required this.tenantId,
    required this.tenancyName,
    required this.name,
    required this.userName,
    required this.emailAddress,
    required this.isTenantActive,
    required this.isActive,
    required this.isEmailConfirmationRequired,
    required this.captchaResult,
  });

  final int? tenantId;
  final String? tenancyName;
  final String? name;
  final String? userName;
  final String? emailAddress;
  final bool? isTenantActive;
  final bool? isActive;
  final bool? isEmailConfirmationRequired;
  final dynamic captchaResult;

  RegisterTenantModel copyWith({
    int? tenantId,
    String? tenancyName,
    String? name,
    String? userName,
    String? emailAddress,
    bool? isTenantActive,
    bool? isActive,
    bool? isEmailConfirmationRequired,
    dynamic? captchaResult,
  }) {
    return RegisterTenantModel(
      tenantId: tenantId ?? this.tenantId,
      tenancyName: tenancyName ?? this.tenancyName,
      name: name ?? this.name,
      userName: userName ?? this.userName,
      emailAddress: emailAddress ?? this.emailAddress,
      isTenantActive: isTenantActive ?? this.isTenantActive,
      isActive: isActive ?? this.isActive,
      isEmailConfirmationRequired: isEmailConfirmationRequired ?? this.isEmailConfirmationRequired,
      captchaResult: captchaResult ?? this.captchaResult,
    );
  }

  factory RegisterTenantModel.fromJson(Map<String, dynamic> json){
    return RegisterTenantModel(
      tenantId: json["tenantId"],
      tenancyName: json["tenancyName"],
      name: json["name"],
      userName: json["userName"],
      emailAddress: json["emailAddress"],
      isTenantActive: json["isTenantActive"],
      isActive: json["isActive"],
      isEmailConfirmationRequired: json["isEmailConfirmationRequired"],
      captchaResult: json["captchaResult"],
    );
  }

}
