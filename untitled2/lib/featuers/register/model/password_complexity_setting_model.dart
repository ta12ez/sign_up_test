class PasswordComplexitySettingModel {
  PasswordComplexitySettingModel({
    required this.requireDigit,
    required this.requireLowercase,
    required this.requireNonAlphanumeric,
    required this.requireUppercase,
    required this.requiredLength,
  });

  final bool? requireDigit;
  final bool? requireLowercase;
  final bool? requireNonAlphanumeric;
  final bool? requireUppercase;
  final int? requiredLength;

  PasswordComplexitySettingModel copyWith({
    bool? requireDigit,
    bool? requireLowercase,
    bool? requireNonAlphanumeric,
    bool? requireUppercase,
    int? requiredLength,
  }) {
    return PasswordComplexitySettingModel(
      requireDigit: requireDigit ?? this.requireDigit,
      requireLowercase: requireLowercase ?? this.requireLowercase,
      requireNonAlphanumeric: requireNonAlphanumeric ?? this.requireNonAlphanumeric,
      requireUppercase: requireUppercase ?? this.requireUppercase,
      requiredLength: requiredLength ?? this.requiredLength,
    );
  }

  factory PasswordComplexitySettingModel.fromJson(Map<String, dynamic> json){
    return PasswordComplexitySettingModel(
      requireDigit: json["requireDigit"],
      requireLowercase: json["requireLowercase"],
      requireNonAlphanumeric: json["requireNonAlphanumeric"],
      requireUppercase: json["requireUppercase"],
      requiredLength: json["requiredLength"],
    );
  }

}
