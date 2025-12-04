part of 'register_bloc.dart';

@immutable
sealed class RegisterEvent {}

class GetCurrentLoginInformationsEvent extends RegisterEvent {}
class GetEditionsForSelectEvent extends RegisterEvent {}
class SelectEditionsForSelectEvent extends RegisterEvent {
 final EditionsWithFeature editionsWithFeature;
  SelectEditionsForSelectEvent({required this.editionsWithFeature});
}

class GetPasswordComplexitySettingEvent extends RegisterEvent {}
class IsTenantAvailableEvent extends RegisterEvent {
 final String tenantName;
 IsTenantAvailableEvent({required this.tenantName});
}
class RegisterTenantEvent extends RegisterEvent{
 final String adminFirstName;
 final String adminLastName;
 final String tenancyName;
 RegisterTenantEvent({required this.adminFirstName,required this.adminLastName,required this.tenancyName});

}

class AuthenticateEvent extends RegisterEvent{
 final String emailAddress;
 final String passWord;
 final String tenancyName;
 AuthenticateEvent({required this.emailAddress,required this.passWord,required this.tenancyName});

}