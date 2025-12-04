class IsTenantAvailableModel {
  IsTenantAvailableModel({
    required this.state,
    required this.tenantId,
    required this.serverRootAddress,
    required this.apiUrl,
    required this.dnsUrl,
  });

  final int? state;
  final int? tenantId;
  final String? serverRootAddress;
  final dynamic apiUrl;
  final dynamic dnsUrl;

  IsTenantAvailableModel copyWith({
    int? state,
    int? tenantId,
    String? serverRootAddress,
    dynamic? apiUrl,
    dynamic? dnsUrl,
  }) {
    return IsTenantAvailableModel(
      state: state ?? this.state,
      tenantId: tenantId ?? this.tenantId,
      serverRootAddress: serverRootAddress ?? this.serverRootAddress,
      apiUrl: apiUrl ?? this.apiUrl,
      dnsUrl: dnsUrl ?? this.dnsUrl,
    );
  }

  factory IsTenantAvailableModel.fromJson(Map<String, dynamic> json){
    return IsTenantAvailableModel(
      state: json["state"],
      tenantId: json["tenantId"],
      serverRootAddress: json["serverRootAddress"],
      apiUrl: json["apiUrl"],
      dnsUrl: json["dnsUrl"],
    );
  }

}
