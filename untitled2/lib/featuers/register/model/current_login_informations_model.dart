class CurrentLoginInformationsModel {
  CurrentLoginInformationsModel({
    required this.result,
    required this.targetUrl,
    required this.success,
    required this.error,
    required this.unAuthorizedRequest,
    required this.abp,
  });

  final Result? result;
  final dynamic targetUrl;
  final bool? success;
  final dynamic error;
  final bool? unAuthorizedRequest;
  final bool? abp;

  CurrentLoginInformationsModel copyWith({
    Result? result,
    dynamic? targetUrl,
    bool? success,
    dynamic? error,
    bool? unAuthorizedRequest,
    bool? abp,
  }) {
    return CurrentLoginInformationsModel(
      result: result ?? this.result,
      targetUrl: targetUrl ?? this.targetUrl,
      success: success ?? this.success,
      error: error ?? this.error,
      unAuthorizedRequest: unAuthorizedRequest ?? this.unAuthorizedRequest,
      abp: abp ?? this.abp,
    );
  }

  factory CurrentLoginInformationsModel.fromJson(Map<String, dynamic> json){
    return CurrentLoginInformationsModel(
      result: json["result"] == null ? null : Result.fromJson(json["result"]),
      targetUrl: json["targetUrl"],
      success: json["success"],
      error: json["error"],
      unAuthorizedRequest: json["unAuthorizedRequest"],
      abp: json["__abp"],
    );
  }

}

class Result {
  Result({
    required this.user,
    required this.tenant,
    required this.application,
  });

  final User? user;
  final Tenant? tenant;
  final Application? application;

  Result copyWith({
    User? user,
    Tenant? tenant,
    Application? application,
  }) {
    return Result(
      user: user ?? this.user,
      tenant: tenant ?? this.tenant,
      application: application ?? this.application,
    );
  }

  factory Result.fromJson(Map<String, dynamic> json){
    return Result(
      user: json["user"] == null ? null : User.fromJson(json["user"]),
      tenant: json["tenant"] == null ? null : Tenant.fromJson(json["tenant"]),
      application: json["application"] == null ? null : Application.fromJson(json["application"]),
    );
  }

}

class Application {
  Application({
    required this.version,
    required this.releaseDate,
    required this.currency,
    required this.currencySign,
    required this.userDelegationIsEnabled,
    required this.features,
    required this.compatibleMobileClientVersion,
    required this.compatibleWebClientVersion,
  });

  final String? version;
  final DateTime? releaseDate;
  final String? currency;
  final String? currencySign;
  final bool? userDelegationIsEnabled;
  final Features? features;
  final String? compatibleMobileClientVersion;
  final String? compatibleWebClientVersion;

  Application copyWith({
    String? version,
    DateTime? releaseDate,
    String? currency,
    String? currencySign,
    bool? userDelegationIsEnabled,
    Features? features,
    String? compatibleMobileClientVersion,
    String? compatibleWebClientVersion,
  }) {
    return Application(
      version: version ?? this.version,
      releaseDate: releaseDate ?? this.releaseDate,
      currency: currency ?? this.currency,
      currencySign: currencySign ?? this.currencySign,
      userDelegationIsEnabled: userDelegationIsEnabled ?? this.userDelegationIsEnabled,
      features: features ?? this.features,
      compatibleMobileClientVersion: compatibleMobileClientVersion ?? this.compatibleMobileClientVersion,
      compatibleWebClientVersion: compatibleWebClientVersion ?? this.compatibleWebClientVersion,
    );
  }

  factory Application.fromJson(Map<String, dynamic> json){
    return Application(
      version: json["version"],
      releaseDate: DateTime.tryParse(json["releaseDate"] ?? ""),
      currency: json["currency"],
      currencySign: json["currencySign"],
      userDelegationIsEnabled: json["userDelegationIsEnabled"],
      features: json["features"] == null ? null : Features.fromJson(json["features"]),
      compatibleMobileClientVersion: json["compatibleMobileClientVersion"],
      compatibleWebClientVersion: json["compatibleWebClientVersion"],
    );
  }

}

class Features {
  Features({required this.json});
  final Map<String,dynamic> json;

  factory Features.fromJson(Map<String, dynamic> json){
    return Features(
        json: json
    );
  }

}

class Tenant {
  Tenant({
    required this.tenancyName,
    required this.name,
    required this.ownerId,
    required this.logoUrl,
    required this.watermarkUrl,
    required this.creationTime,
    required this.edition,
    required this.isInReadOnlyMode,
    required this.isSubscribed,
    required this.paymentPeriodType,
    required this.subscriptionEndDateUtc,
    required this.subscriptionCancelDateUtc,
    required this.isSubscriptionCanceled,
    required this.subscriptionCustomName,
    required this.trialPeriodStartDateUtc,
    required this.trialPeriodEndDateUtc,
    required this.allowExtendTrial,
    required this.isInTrialPeriod,
    required this.isUsingTrial,
    required this.trialPeriodDaysDuration,
    required this.hasCoupon,
    required this.isInLastPaidEdition,
    required this.waitingDayAfterExpire,
    required this.disableTenantAfterExpire,
    required this.moveToEditionAfterExpire,
    required this.setInReadOnlyModeAfterExpire,
    required this.templateCategoryId,
    required this.siloId,
    required this.apiUrl,
    required this.dnsUrl,
    required this.customerId,
    required this.id,
  });

  final String? tenancyName;
  final String? name;
  final int? ownerId;
  final dynamic logoUrl;
  final dynamic watermarkUrl;
  final DateTime? creationTime;
  final Edition? edition;
  final bool? isInReadOnlyMode;
  final bool? isSubscribed;
  final dynamic paymentPeriodType;
  final dynamic subscriptionEndDateUtc;
  final dynamic subscriptionCancelDateUtc;
  final bool? isSubscriptionCanceled;
  final dynamic subscriptionCustomName;
  final DateTime? trialPeriodStartDateUtc;
  final DateTime? trialPeriodEndDateUtc;
  final bool? allowExtendTrial;
  final bool? isInTrialPeriod;
  final bool? isUsingTrial;
  final double? trialPeriodDaysDuration;
  final bool? hasCoupon;
  final bool? isInLastPaidEdition;
  final double? waitingDayAfterExpire;
  final bool? disableTenantAfterExpire;
  final String? moveToEditionAfterExpire;
  final bool? setInReadOnlyModeAfterExpire;
  final dynamic templateCategoryId;
  final dynamic siloId;
  final dynamic apiUrl;
  final dynamic dnsUrl;
  final dynamic customerId;
  final int? id;

  Tenant copyWith({
    String? tenancyName,
    String? name,
    int? ownerId,
    dynamic? logoUrl,
    dynamic? watermarkUrl,
    DateTime? creationTime,
    Edition? edition,
    bool? isInReadOnlyMode,
    bool? isSubscribed,
    dynamic? paymentPeriodType,
    dynamic? subscriptionEndDateUtc,
    dynamic? subscriptionCancelDateUtc,
    bool? isSubscriptionCanceled,
    dynamic? subscriptionCustomName,
    DateTime? trialPeriodStartDateUtc,
    DateTime? trialPeriodEndDateUtc,
    bool? allowExtendTrial,
    bool? isInTrialPeriod,
    bool? isUsingTrial,
    double? trialPeriodDaysDuration,
    bool? hasCoupon,
    bool? isInLastPaidEdition,
    double? waitingDayAfterExpire,
    bool? disableTenantAfterExpire,
    String? moveToEditionAfterExpire,
    bool? setInReadOnlyModeAfterExpire,
    dynamic? templateCategoryId,
    dynamic? siloId,
    dynamic? apiUrl,
    dynamic? dnsUrl,
    dynamic? customerId,
    int? id,
  }) {
    return Tenant(
      tenancyName: tenancyName ?? this.tenancyName,
      name: name ?? this.name,
      ownerId: ownerId ?? this.ownerId,
      logoUrl: logoUrl ?? this.logoUrl,
      watermarkUrl: watermarkUrl ?? this.watermarkUrl,
      creationTime: creationTime ?? this.creationTime,
      edition: edition ?? this.edition,
      isInReadOnlyMode: isInReadOnlyMode ?? this.isInReadOnlyMode,
      isSubscribed: isSubscribed ?? this.isSubscribed,
      paymentPeriodType: paymentPeriodType ?? this.paymentPeriodType,
      subscriptionEndDateUtc: subscriptionEndDateUtc ?? this.subscriptionEndDateUtc,
      subscriptionCancelDateUtc: subscriptionCancelDateUtc ?? this.subscriptionCancelDateUtc,
      isSubscriptionCanceled: isSubscriptionCanceled ?? this.isSubscriptionCanceled,
      subscriptionCustomName: subscriptionCustomName ?? this.subscriptionCustomName,
      trialPeriodStartDateUtc: trialPeriodStartDateUtc ?? this.trialPeriodStartDateUtc,
      trialPeriodEndDateUtc: trialPeriodEndDateUtc ?? this.trialPeriodEndDateUtc,
      allowExtendTrial: allowExtendTrial ?? this.allowExtendTrial,
      isInTrialPeriod: isInTrialPeriod ?? this.isInTrialPeriod,
      isUsingTrial: isUsingTrial ?? this.isUsingTrial,
      trialPeriodDaysDuration: trialPeriodDaysDuration ?? this.trialPeriodDaysDuration,
      hasCoupon: hasCoupon ?? this.hasCoupon,
      isInLastPaidEdition: isInLastPaidEdition ?? this.isInLastPaidEdition,
      waitingDayAfterExpire: waitingDayAfterExpire ?? this.waitingDayAfterExpire,
      disableTenantAfterExpire: disableTenantAfterExpire ?? this.disableTenantAfterExpire,
      moveToEditionAfterExpire: moveToEditionAfterExpire ?? this.moveToEditionAfterExpire,
      setInReadOnlyModeAfterExpire: setInReadOnlyModeAfterExpire ?? this.setInReadOnlyModeAfterExpire,
      templateCategoryId: templateCategoryId ?? this.templateCategoryId,
      siloId: siloId ?? this.siloId,
      apiUrl: apiUrl ?? this.apiUrl,
      dnsUrl: dnsUrl ?? this.dnsUrl,
      customerId: customerId ?? this.customerId,
      id: id ?? this.id,
    );
  }

  factory Tenant.fromJson(Map<String, dynamic> json){
    final double? waitingDays = (json["waitingDayAfterExpire"] as num?)?.toDouble();
    final double? trialDays = (json["trialPeriodDaysDuration"] as num?)?.toDouble();
    return Tenant(
      tenancyName: json["tenancyName"],
      name: json["name"],
      ownerId: json["ownerId"],
      logoUrl: json["logoUrl"],
      watermarkUrl: json["watermarkUrl"],
      creationTime: DateTime.tryParse(json["creationTime"] ?? ""),
      edition: json["edition"] == null ? null : Edition.fromJson(json["edition"]),
      isInReadOnlyMode: json["isInReadOnlyMode"],
      isSubscribed: json["isSubscribed"],
      paymentPeriodType: json["paymentPeriodType"],
      subscriptionEndDateUtc: json["subscriptionEndDateUtc"],
      subscriptionCancelDateUtc: json["subscriptionCancelDateUtc"],
      isSubscriptionCanceled: json["isSubscriptionCanceled"],
      subscriptionCustomName: json["subscriptionCustomName"],
      trialPeriodStartDateUtc: DateTime.tryParse(json["trialPeriodStartDateUtc"] ?? ""),
      trialPeriodEndDateUtc: DateTime.tryParse(json["trialPeriodEndDateUtc"] ?? ""),
      allowExtendTrial: json["allowExtendTrial"],
      isInTrialPeriod: json["isInTrialPeriod"],
      isUsingTrial: json["isUsingTrial"],
      trialPeriodDaysDuration: trialDays,
      hasCoupon: json["hasCoupon"],
      isInLastPaidEdition: json["isInLastPaidEdition"],
      waitingDayAfterExpire: waitingDays,
      disableTenantAfterExpire: json["disableTenantAfterExpire"],
      moveToEditionAfterExpire: json["moveToEditionAfterExpire"],
      setInReadOnlyModeAfterExpire: json["setInReadOnlyModeAfterExpire"],
      templateCategoryId: json["templateCategoryId"],
      siloId: json["siloId"],
      apiUrl: json["apiUrl"],
      dnsUrl: json["dnsUrl"],
      customerId: json["customerId"],
      id: json["id"],
    );
  }

}

class Edition {
  Edition({
    required this.name,
    required this.displayName,
    required this.type,
    required this.id,
  });

  final String? name;
  final String? displayName;
  final int? type;
  final int? id;

  Edition copyWith({
    String? name,
    String? displayName,
    int? type,
    int? id,
  }) {
    return Edition(
      name: name ?? this.name,
      displayName: displayName ?? this.displayName,
      type: type ?? this.type,
      id: id ?? this.id,
    );
  }

  factory Edition.fromJson(Map<String, dynamic> json){
    return Edition(
      name: json["name"],
      displayName: json["displayName"],
      type: json["type"],
      id: json["id"],
    );
  }

}

class User {
  User({
    required this.name,
    required this.surname,
    required this.userName,
    required this.emailAddress,
    required this.profilePictureUrl,
    required this.allowSetPassword,
    required this.userType,
    required this.userToken,
    required this.lastSeen,
    required this.title,
    required this.roles,
    required this.id,
  });

  final String? name;
  final String? surname;
  final String? userName;
  final String? emailAddress;
  final dynamic profilePictureUrl;
  final bool? allowSetPassword;
  final int? userType;
  final String? userToken;
  final dynamic lastSeen;
  final dynamic title;
  final List<dynamic> roles;
  final int? id;

  User copyWith({
    String? name,
    String? surname,
    String? userName,
    String? emailAddress,
    dynamic? profilePictureUrl,
    bool? allowSetPassword,
    int? userType,
    String? userToken,
    dynamic? lastSeen,
    dynamic? title,
    List<dynamic>? roles,
    int? id,
  }) {
    return User(
      name: name ?? this.name,
      surname: surname ?? this.surname,
      userName: userName ?? this.userName,
      emailAddress: emailAddress ?? this.emailAddress,
      profilePictureUrl: profilePictureUrl ?? this.profilePictureUrl,
      allowSetPassword: allowSetPassword ?? this.allowSetPassword,
      userType: userType ?? this.userType,
      userToken: userToken ?? this.userToken,
      lastSeen: lastSeen ?? this.lastSeen,
      title: title ?? this.title,
      roles: roles ?? this.roles,
      id: id ?? this.id,
    );
  }

  factory User.fromJson(Map<String, dynamic> json){
    return User(
      name: json["name"],
      surname: json["surname"],
      userName: json["userName"],
      emailAddress: json["emailAddress"],
      profilePictureUrl: json["profilePictureUrl"],
      allowSetPassword: json["allowSetPassword"],
      userType: json["userType"],
      userToken: json["userToken"],
      lastSeen: json["lastSeen"],
      title: json["title"],
      roles: json["roles"] == null ? [] : List<dynamic>.from(json["roles"]!.map((x) => x)),
      id: json["id"],
    );
  }

}
