class EditionsForSelectModel {
  EditionsForSelectModel({
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

  EditionsForSelectModel copyWith({
    Result? result,
    dynamic? targetUrl,
    bool? success,
    dynamic? error,
    bool? unAuthorizedRequest,
    bool? abp,
  }) {
    return EditionsForSelectModel(
      result: result ?? this.result,
      targetUrl: targetUrl ?? this.targetUrl,
      success: success ?? this.success,
      error: error ?? this.error,
      unAuthorizedRequest: unAuthorizedRequest ?? this.unAuthorizedRequest,
      abp: abp ?? this.abp,
    );
  }

  factory EditionsForSelectModel.fromJson(Map<String, dynamic> json){
    return EditionsForSelectModel(
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
    required this.allFeatures,
    required this.editionsWithFeatures,
    required this.tenantEditionId,
  });

  final List<AllFeature> allFeatures;
  final List<EditionsWithFeature> editionsWithFeatures;
  final dynamic tenantEditionId;

  Result copyWith({
    List<AllFeature>? allFeatures,
    List<EditionsWithFeature>? editionsWithFeatures,
    dynamic? tenantEditionId,
  }) {
    return Result(
      allFeatures: allFeatures ?? this.allFeatures,
      editionsWithFeatures: editionsWithFeatures ?? this.editionsWithFeatures,
      tenantEditionId: tenantEditionId ?? this.tenantEditionId,
    );
  }

  factory Result.fromJson(Map<String, dynamic> json){
    return Result(
      allFeatures: json["allFeatures"] == null ? [] : List<AllFeature>.from(json["allFeatures"]!.map((x) => AllFeature.fromJson(x))),
      editionsWithFeatures: json["editionsWithFeatures"] == null ? [] : List<EditionsWithFeature>.from(json["editionsWithFeatures"]!.map((x) => EditionsWithFeature.fromJson(x))),
      tenantEditionId: json["tenantEditionId"],
    );
  }

}

class AllFeature {
  AllFeature({
    required this.name,
    required this.parentName,
    required this.displayName,
    required this.description,
    required this.defaultValue,
    required this.metadata,
    required this.inputType,
  });

  final String? name;
  final dynamic parentName;
  final String? displayName;
  final String? description;
  final String? defaultValue;
  final Metadata? metadata;
  final InputType? inputType;

  AllFeature copyWith({
    String? name,
    dynamic? parentName,
    String? displayName,
    String? description,
    String? defaultValue,
    Metadata? metadata,
    InputType? inputType,
  }) {
    return AllFeature(
      name: name ?? this.name,
      parentName: parentName ?? this.parentName,
      displayName: displayName ?? this.displayName,
      description: description ?? this.description,
      defaultValue: defaultValue ?? this.defaultValue,
      metadata: metadata ?? this.metadata,
      inputType: inputType ?? this.inputType,
    );
  }

  factory AllFeature.fromJson(Map<String, dynamic> json){
    return AllFeature(
      name: json["name"],
      parentName: json["parentName"],
      displayName: json["displayName"],
      description: json["description"],
      defaultValue: json["defaultValue"],
      metadata: json["metadata"] == null ? null : Metadata.fromJson(json["metadata"]),
      inputType: json["inputType"] == null ? null : InputType.fromJson(json["inputType"]),
    );
  }

}

class InputType {
  InputType({
    required this.name,
    required this.attributes,
    required this.validator,
    required this.itemSource,
  });

  final String? name;
  final InputTypeAttributes? attributes;
  final Validator? validator;
  final dynamic itemSource;

  InputType copyWith({
    String? name,
    InputTypeAttributes? attributes,
    Validator? validator,
    dynamic? itemSource,
  }) {
    return InputType(
      name: name ?? this.name,
      attributes: attributes ?? this.attributes,
      validator: validator ?? this.validator,
      itemSource: itemSource ?? this.itemSource,
    );
  }

  factory InputType.fromJson(Map<String, dynamic> json){
    return InputType(
      name: json["name"],
      attributes: json["attributes"] == null ? null : InputTypeAttributes.fromJson(json["attributes"]),
      validator: json["validator"] == null ? null : Validator.fromJson(json["validator"]),
      itemSource: json["itemSource"],
    );
  }

}

class InputTypeAttributes {
  InputTypeAttributes({required this.json});
  final Map<String,dynamic> json;

  factory InputTypeAttributes.fromJson(Map<String, dynamic> json){
    return InputTypeAttributes(
        json: json
    );
  }

}

class Validator {
  Validator({
    required this.name,
    required this.attributes,
    required this.minValue,
    required this.maxValue,
  });

  final String? name;
  final ValidatorAttributes? attributes;
  final int? minValue;
  final int? maxValue;

  Validator copyWith({
    String? name,
    ValidatorAttributes? attributes,
    int? minValue,
    int? maxValue,
  }) {
    return Validator(
      name: name ?? this.name,
      attributes: attributes ?? this.attributes,
      minValue: minValue ?? this.minValue,
      maxValue: maxValue ?? this.maxValue,
    );
  }

  factory Validator.fromJson(Map<String, dynamic> json){
    return Validator(
      name: json["name"],
      attributes: json["attributes"] == null ? null : ValidatorAttributes.fromJson(json["attributes"]),
      minValue: json["minValue"],
      maxValue: json["maxValue"],
    );
  }

}

class ValidatorAttributes {
  ValidatorAttributes({
    required this.minValue,
    required this.maxValue,
  });

  final int? minValue;
  final int? maxValue;

  ValidatorAttributes copyWith({
    int? minValue,
    int? maxValue,
  }) {
    return ValidatorAttributes(
      minValue: minValue ?? this.minValue,
      maxValue: maxValue ?? this.maxValue,
    );
  }

  factory ValidatorAttributes.fromJson(Map<String, dynamic> json){
    return ValidatorAttributes(
      minValue: json["MinValue"],
      maxValue: json["MaxValue"],
    );
  }

}

class Metadata {
  Metadata({
    required this.dataType,
    required this.isVisibleOnPricingTable,
    required this.isVisibleOnTenantSubscription,
  });

  final int? dataType;
  final bool? isVisibleOnPricingTable;
  final bool? isVisibleOnTenantSubscription;

  Metadata copyWith({
    int? dataType,
    bool? isVisibleOnPricingTable,
    bool? isVisibleOnTenantSubscription,
  }) {
    return Metadata(
      dataType: dataType ?? this.dataType,
      isVisibleOnPricingTable: isVisibleOnPricingTable ?? this.isVisibleOnPricingTable,
      isVisibleOnTenantSubscription: isVisibleOnTenantSubscription ?? this.isVisibleOnTenantSubscription,
    );
  }

  factory Metadata.fromJson(Map<String, dynamic> json){
    return Metadata(
      dataType: json["dataType"],
      isVisibleOnPricingTable: json["isVisibleOnPricingTable"],
      isVisibleOnTenantSubscription: json["isVisibleOnTenantSubscription"],
    );
  }

}

class EditionsWithFeature {
  EditionsWithFeature({
    required this.edition,
    required this.featureValues,
  });

  final Edition? edition;
  final List<FeatureValue> featureValues;

  EditionsWithFeature copyWith({
    Edition? edition,
    List<FeatureValue>? featureValues,
  }) {
    return EditionsWithFeature(
      edition: edition ?? this.edition,
      featureValues: featureValues ?? this.featureValues,
    );
  }

  factory EditionsWithFeature.fromJson(Map<String, dynamic> json){
    return EditionsWithFeature(
      edition: json["edition"] == null ? null : Edition.fromJson(json["edition"]),
      featureValues: json["featureValues"] == null ? [] : List<FeatureValue>.from(json["featureValues"]!.map((x) => FeatureValue.fromJson(x))),
    );
  }

}

class Edition {
  Edition({
    required this.name,
    required this.displayName,
    required this.publicDescription,
    required this.internalDescription,
    required this.isPublished,
    required this.isRegistrable,
    required this.type,
    required this.minimumUsersCount,
    required this.monthlyPrice,
    required this.annualPrice,
    required this.waitingDayAfterExpire,
    required this.trialDayCount,
    required this.countAllowExtendTrial,
    required this.hasTrial,
    required this.disableWorkspaceAfterExpire,
    required this.isMostPopular,
    required this.doNotSendVerifyEmail,
    required this.expiringEdition,
    required this.seatsText,
    required this.buttonText,
    required this.buttonLink,
    required this.starterLineText,
    required this.editionColor,
    required this.id,
  });

  final String? name;
  final String? displayName;
  final String? publicDescription;
  final dynamic internalDescription;
  final bool? isPublished;
  final bool? isRegistrable;
  final int? type;
  final int? minimumUsersCount;
  final double? monthlyPrice;
  final double? annualPrice;
  final int? waitingDayAfterExpire;
  final int? trialDayCount;
  final int? countAllowExtendTrial;
  final bool? hasTrial;
  final bool? disableWorkspaceAfterExpire;
  final bool? isMostPopular;
  final dynamic doNotSendVerifyEmail;
  final ExpiringEdition? expiringEdition;
  final dynamic seatsText;
  final dynamic buttonText;
  final dynamic buttonLink;
  final dynamic starterLineText;
  final dynamic editionColor;
  final int? id;

  Edition copyWith({
    String? name,
    String? displayName,
    String? publicDescription,
    dynamic? internalDescription,
    bool? isPublished,
    bool? isRegistrable,
    int? type,
    int? minimumUsersCount,
    double? monthlyPrice,
    double? annualPrice,
    int? waitingDayAfterExpire,
    int? trialDayCount,
    int? countAllowExtendTrial,
    bool? hasTrial,
    bool? disableWorkspaceAfterExpire,
    bool? isMostPopular,
    dynamic? doNotSendVerifyEmail,
    ExpiringEdition? expiringEdition,
    dynamic? seatsText,
    dynamic? buttonText,
    dynamic? buttonLink,
    dynamic? starterLineText,
    dynamic? editionColor,
    int? id,
  }) {
    return Edition(
      name: name ?? this.name,
      displayName: displayName ?? this.displayName,
      publicDescription: publicDescription ?? this.publicDescription,
      internalDescription: internalDescription ?? this.internalDescription,
      isPublished: isPublished ?? this.isPublished,
      isRegistrable: isRegistrable ?? this.isRegistrable,
      type: type ?? this.type,
      minimumUsersCount: minimumUsersCount ?? this.minimumUsersCount,
      monthlyPrice: monthlyPrice ?? this.monthlyPrice,
      annualPrice: annualPrice ?? this.annualPrice,
      waitingDayAfterExpire: waitingDayAfterExpire ?? this.waitingDayAfterExpire,
      trialDayCount: trialDayCount ?? this.trialDayCount,
      countAllowExtendTrial: countAllowExtendTrial ?? this.countAllowExtendTrial,
      hasTrial: hasTrial ?? this.hasTrial,
      disableWorkspaceAfterExpire: disableWorkspaceAfterExpire ?? this.disableWorkspaceAfterExpire,
      isMostPopular: isMostPopular ?? this.isMostPopular,
      doNotSendVerifyEmail: doNotSendVerifyEmail ?? this.doNotSendVerifyEmail,
      expiringEdition: expiringEdition ?? this.expiringEdition,
      seatsText: seatsText ?? this.seatsText,
      buttonText: buttonText ?? this.buttonText,
      buttonLink: buttonLink ?? this.buttonLink,
      starterLineText: starterLineText ?? this.starterLineText,
      editionColor: editionColor ?? this.editionColor,
      id: id ?? this.id,
    );
  }

  factory Edition.fromJson(Map<String, dynamic> json){
    return Edition(
      name: json["name"],
      displayName: json["displayName"],
      publicDescription: json["publicDescription"],
      internalDescription: json["internalDescription"],
      isPublished: json["isPublished"],
      isRegistrable: json["isRegistrable"],
      type: json["type"],
      minimumUsersCount: json["minimumUsersCount"],
      monthlyPrice: json["monthlyPrice"],
      annualPrice: json["annualPrice"],
      waitingDayAfterExpire: json["waitingDayAfterExpire"],
      trialDayCount: json["trialDayCount"],
      countAllowExtendTrial: json["countAllowExtendTrial"],
      hasTrial: json["hasTrial"],
      disableWorkspaceAfterExpire: json["disableWorkspaceAfterExpire"],
      isMostPopular: json["isMostPopular"],
      doNotSendVerifyEmail: json["doNotSendVerifyEmail"],
      expiringEdition: json["expiringEdition"] == null ? null : ExpiringEdition.fromJson(json["expiringEdition"]),
      seatsText: json["seatsText"],
      buttonText: json["buttonText"],
      buttonLink: json["buttonLink"],
      starterLineText: json["starterLineText"],
      editionColor: json["editionColor"],
      id: json["id"],
    );
  }

}

class ExpiringEdition {
  ExpiringEdition({
    required this.name,
    required this.displayName,
    required this.id,
  });

  final String? name;
  final String? displayName;
  final int? id;

  ExpiringEdition copyWith({
    String? name,
    String? displayName,
    int? id,
  }) {
    return ExpiringEdition(
      name: name ?? this.name,
      displayName: displayName ?? this.displayName,
      id: id ?? this.id,
    );
  }

  factory ExpiringEdition.fromJson(Map<String, dynamic> json){
    return ExpiringEdition(
      name: json["name"],
      displayName: json["displayName"],
      id: json["id"],
    );
  }

}

class FeatureValue {
  FeatureValue({
    required this.name,
    required this.value,
  });

  final String? name;
  final String? value;

  FeatureValue copyWith({
    String? name,
    String? value,
  }) {
    return FeatureValue(
      name: name ?? this.name,
      value: value ?? this.value,
    );
  }

  factory FeatureValue.fromJson(Map<String, dynamic> json){
    return FeatureValue(
      name: json["name"],
      value: json["value"],
    );
  }

}
