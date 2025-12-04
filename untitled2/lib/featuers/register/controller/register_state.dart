part of 'register_bloc.dart';

@immutable
sealed class RegisterState {}

final class RegisterInitial extends RegisterState {}
class GetCurrentLoginInformationsSuccess extends RegisterState{
 final CurrentLoginInformationsModel currentLoginInformationsModel;
  GetCurrentLoginInformationsSuccess({required this.currentLoginInformationsModel});
}
class GetCurrentLoginInformationsLoading extends RegisterState{}
class GetCurrentLoginInformationsError extends RegisterState{}


class GetEditionsForSelectSuccess extends RegisterState{
 final EditionsForSelectModel editionsForSelectModel;
  GetEditionsForSelectSuccess({required this.editionsForSelectModel});
}
class GetEditionsForSelectLoading extends RegisterState{}
class GetEditionsForSelectError extends RegisterState{}

class SelectEditionsForSelectState extends RegisterState {
  final EditionsWithFeature editionsWithFeature;
  SelectEditionsForSelectState({required this.editionsWithFeature});
}


class GetPasswordComplexitySettingSuccess extends RegisterState{
final  PasswordComplexitySettingModel passwordComplexitySettingModel;
  GetPasswordComplexitySettingSuccess({required this.passwordComplexitySettingModel});
}
class GetPasswordComplexitySettingLoading extends RegisterState{}
class GetPasswordComplexitySettingError extends RegisterState{}

class IsTenantAvailableSuccess extends RegisterState{
 final IsTenantAvailableModel isTenantAvailableModel;
  IsTenantAvailableSuccess({required this.isTenantAvailableModel});
}
class IsTenantAvailableLoading extends RegisterState{}
class IsTenantAvailableError extends RegisterState{}


class RegisterTenantSuccess extends RegisterState{
  final RegisterTenantModel registerTenant;
  RegisterTenantSuccess({required this.registerTenant});
}
class RegisterTenantLoading extends RegisterState{}
class RegisterTenantError extends RegisterState{}


class AuthenticateSuccess extends RegisterState{
  final AuthenticateModel authenticateModel;
  AuthenticateSuccess({required this.authenticateModel});
}
class AuthenticateLoading extends RegisterState{}
class AuthenticateError extends RegisterState{}