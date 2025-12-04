class AuthenticateModel {
  AuthenticateModel({
    required this.accessToken,
    required this.encryptedAccessToken,
    required this.expireInSeconds,
    required this.shouldResetPassword,
    required this.passwordResetCode,
    required this.passwordExpired,
    required this.userId,
    required this.requiresTwoFactorVerification,
    required this.twoFactorAuthProviders,
    required this.twoFactorRememberClientToken,
    required this.returnUrl,
    required this.refreshToken,
    required this.refreshTokenExpireInSeconds,
    required this.captchaResult,
  });

  final String? accessToken;
  final String? encryptedAccessToken;
  final int? expireInSeconds;
  final bool? shouldResetPassword;
  final dynamic passwordResetCode;
  final bool? passwordExpired;
  final int? userId;
  final bool? requiresTwoFactorVerification;
  final dynamic twoFactorAuthProviders;
  final dynamic twoFactorRememberClientToken;
  final dynamic returnUrl;
  final String? refreshToken;
  final int? refreshTokenExpireInSeconds;
  final dynamic captchaResult;

  AuthenticateModel copyWith({
    String? accessToken,
    String? encryptedAccessToken,
    int? expireInSeconds,
    bool? shouldResetPassword,
    dynamic? passwordResetCode,
    bool? passwordExpired,
    int? userId,
    bool? requiresTwoFactorVerification,
    dynamic? twoFactorAuthProviders,
    dynamic? twoFactorRememberClientToken,
    dynamic? returnUrl,
    String? refreshToken,
    int? refreshTokenExpireInSeconds,
    dynamic? captchaResult,
  }) {
    return AuthenticateModel(
      accessToken: accessToken ?? this.accessToken,
      encryptedAccessToken: encryptedAccessToken ?? this.encryptedAccessToken,
      expireInSeconds: expireInSeconds ?? this.expireInSeconds,
      shouldResetPassword: shouldResetPassword ?? this.shouldResetPassword,
      passwordResetCode: passwordResetCode ?? this.passwordResetCode,
      passwordExpired: passwordExpired ?? this.passwordExpired,
      userId: userId ?? this.userId,
      requiresTwoFactorVerification: requiresTwoFactorVerification ?? this.requiresTwoFactorVerification,
      twoFactorAuthProviders: twoFactorAuthProviders ?? this.twoFactorAuthProviders,
      twoFactorRememberClientToken: twoFactorRememberClientToken ?? this.twoFactorRememberClientToken,
      returnUrl: returnUrl ?? this.returnUrl,
      refreshToken: refreshToken ?? this.refreshToken,
      refreshTokenExpireInSeconds: refreshTokenExpireInSeconds ?? this.refreshTokenExpireInSeconds,
      captchaResult: captchaResult ?? this.captchaResult,
    );
  }

  factory AuthenticateModel.fromJson(Map<String, dynamic> json){
    return AuthenticateModel(
      accessToken: json["accessToken"],
      encryptedAccessToken: json["encryptedAccessToken"],
      expireInSeconds: json["expireInSeconds"],
      shouldResetPassword: json["shouldResetPassword"],
      passwordResetCode: json["passwordResetCode"],
      passwordExpired: json["passwordExpired"],
      userId: json["userId"],
      requiresTwoFactorVerification: json["requiresTwoFactorVerification"],
      twoFactorAuthProviders: json["twoFactorAuthProviders"],
      twoFactorRememberClientToken: json["twoFactorRememberClientToken"],
      returnUrl: json["returnUrl"],
      refreshToken: json["refreshToken"],
      refreshTokenExpireInSeconds: json["refreshTokenExpireInSeconds"],
      captchaResult: json["captchaResult"],
    );
  }

}
