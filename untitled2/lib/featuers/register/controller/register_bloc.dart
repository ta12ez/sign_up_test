import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:meta/meta.dart';
import '../../../core/component/showToast.dart';
import '../../../core/network/api_constance.dart';
import '../../../core/network/dio_helper.dart';
import '../../../core/network/header_constant.dart';
import '../../../core/services/cache_helper.dart';
import '../model/authenticate_model.dart';
import '../model/current_login_informations_model.dart';
import '../model/editions_for_select_model.dart';
import '../model/is_tenant_available_model.dart';
import '../model/password_complexity_setting_model.dart';
import '../model/register_tenant_model.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(RegisterInitial()) {
    on<RegisterEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<GetCurrentLoginInformationsEvent>(_getCurrentLoginInformations);
    on<GetEditionsForSelectEvent>(_getEditionsForSelect);
    on<GetPasswordComplexitySettingEvent>(_getPasswordComplexitySettingModel);
    on<SelectEditionsForSelectEvent>(_selectEditionsWithFeature);
    on<IsTenantAvailableEvent>(_isTenantAvailable);
    on<RegisterTenantEvent>(_registerTenant);
    on<AuthenticateEvent>(_authenticate);
  }
 CurrentLoginInformationsModel? currentLoginInformationsModel;
  FutureOr<void>_getCurrentLoginInformations(GetCurrentLoginInformationsEvent event,Emitter<RegisterState>emit) async{
    emit(GetCurrentLoginInformationsLoading());
    try {
      final response = await DioHelper.getData(
        url: ApiConstance.getCurrentLoginInformations,
        token: HeaderConstant.token
      );

      if (response.statusCode == 200) {

        currentLoginInformationsModel=CurrentLoginInformationsModel.fromJson(response.data);
        emit(GetCurrentLoginInformationsSuccess(currentLoginInformationsModel: currentLoginInformationsModel!));


      } else {
        emit(GetCurrentLoginInformationsError());

      }
    }catch( e){
      if (e is DioException) {
        if (e.response != null) {
          if(e.response?.statusCode==422&&e.response?.data!=null){
            showToast(msg:e.response?.data["message"], state: ToastState.ERORR);

          }
          else if(e.response?.statusCode==401&&e.response?.data!=null){
            showToast(msg:e.response?.data["message"], state: ToastState.ERORR);

          }

          else {
            showToast(msg: "حدث خطأ غير متوقع الرجاء اعادة المحاولة",
                state: ToastState.ERORR);
          } } else {
          showToast(msg: "  تأكد من جودة الاتصال او صحة URL", state: ToastState.WARNING);
        }
      } else {
        showToast(msg: "حدث خطأ غير متوقع", state: ToastState.ERORR);
      }
      emit(GetCurrentLoginInformationsError());
    }

  }
  EditionsForSelectModel? editionsForSelectModel;
  EditionsWithFeature?selectedEditionsWithFeature;
  FutureOr<void> _selectEditionsWithFeature(SelectEditionsForSelectEvent event,Emitter<RegisterState>emit){
    selectedEditionsWithFeature = event.editionsWithFeature;
    emit(SelectEditionsForSelectState(editionsWithFeature: selectedEditionsWithFeature!));
  }
  FutureOr<void>_getEditionsForSelect(GetEditionsForSelectEvent event,Emitter<RegisterState>emit) async{
    emit(GetEditionsForSelectLoading());
    try {
      final response = await DioHelper.getData(
        url: ApiConstance.getEditionsForSelect,

      );

      if (response.statusCode == 200) {
        editionsForSelectModel=EditionsForSelectModel.fromJson(response.data);
        emit(GetEditionsForSelectSuccess(editionsForSelectModel: editionsForSelectModel!));


      } else {
        emit(GetEditionsForSelectError());

      }
    }catch( e){
      if (e is DioException) {
        if (e.response != null) {
          if(e.response?.statusCode==422&&e.response?.data!=null) {
            showToast(msg:e.response?.data["message"], state: ToastState.ERORR);

          }
          else if(e.response?.statusCode==401&&e.response?.data!=null) {
            showToast(msg:e.response?.data["message"], state: ToastState.ERORR);

          }

          else {
            showToast(msg: "حدث خطأ غير متوقع الرجاء اعادة المحاولة",
                state: ToastState.ERORR);
          } } else {
          showToast(msg: "  تأكد من جودة الاتصال او صحة URL", state: ToastState.WARNING);
        }
      } else {
        showToast(msg: "حدث خطأ غير متوقع", state: ToastState.ERORR);
      }
      emit(GetEditionsForSelectError());
    }

  }
  PasswordComplexitySettingModel? passwordComplexitySettingModel;
  FutureOr<void>_getPasswordComplexitySettingModel(GetPasswordComplexitySettingEvent event,Emitter<RegisterState>emit) async{
    emit(GetPasswordComplexitySettingLoading());
    try {
      final response = await DioHelper.getData(
        url: ApiConstance.getPasswordComplexitySetting,

      );

      if (response.statusCode == 200) {
        passwordComplexitySettingModel=PasswordComplexitySettingModel.fromJson(response.data["result"]["setting"]);
        emit(GetPasswordComplexitySettingSuccess(passwordComplexitySettingModel: passwordComplexitySettingModel!));


      } else {
        emit(GetPasswordComplexitySettingError());

      }
    }catch( e){
      if (e is DioException) {
        if (e.response != null) {
          if(e.response?.statusCode==422&&e.response?.data!=null) {
            showToast(msg:e.response?.data["message"], state: ToastState.ERORR);

          }
          else if(e.response?.statusCode==401&&e.response?.data!=null) {
            showToast(msg:e.response?.data["message"], state: ToastState.ERORR);

          }

          else {
            showToast(msg: "حدث خطأ غير متوقع الرجاء اعادة المحاولة",
                state: ToastState.ERORR);
          } } else {
          showToast(msg: "  تأكد من جودة الاتصال او صحة URL", state: ToastState.WARNING);
        }
      } else {
        showToast(msg: "حدث خطأ غير متوقع", state: ToastState.ERORR);
      }
      emit(GetPasswordComplexitySettingError());
    }

  }


   TextEditingController passController = TextEditingController();
   TextEditingController emailController = TextEditingController();
IsTenantAvailableModel? isTenantAvailableModel;

  FutureOr<void>_isTenantAvailable(IsTenantAvailableEvent event,Emitter<RegisterState>emit) async{
    emit(IsTenantAvailableLoading());

    try {
      final response = await DioHelper.postData(
        url: ApiConstance.isTenantAvailable,
        data: {
          "tenancyName":event.tenantName,
        }

      );

      if (response.statusCode == 200) {
        isTenantAvailableModel=IsTenantAvailableModel.fromJson(response.data["result"]);
        emit(IsTenantAvailableSuccess(isTenantAvailableModel: isTenantAvailableModel!));


      } else {
        emit(IsTenantAvailableError());

      }
    }catch( e){
      if (e is DioException) {
        if (e.response != null) {
          if(e.response?.statusCode==422&&e.response?.data!=null) {
            showToast(msg:e.response?.data["message"], state: ToastState.ERORR);

          }
          else if(e.response?.statusCode==401&&e.response?.data!=null) {
            showToast(msg:e.response?.data["message"], state: ToastState.ERORR);

          }

          else {
            showToast(msg: "حدث خطأ غير متوقع الرجاء اعادة المحاولة",
                state: ToastState.ERORR);
          } } else {
          showToast(msg: "  تأكد من جودة الاتصال او صحة URL", state: ToastState.WARNING);
        }
      } else {
        showToast(msg: "حدث خطأ غير متوقع", state: ToastState.ERORR);
      }
      emit(IsTenantAvailableError());
    }

  }
  RegisterTenantModel? registerTenantModel;
  FutureOr<void>_registerTenant(RegisterTenantEvent event,Emitter<RegisterState>emit) async{
    emit(RegisterTenantLoading());
    final TimezoneInfo currentTimeZone = await FlutterTimezone.getLocalTimezone();
    try {
      final response = await DioHelper.postData(
          url: ApiConstance.registerTenant,
          data: {
            "adminEmailAddress": "${emailController.text}",
            "adminFirstName": "${event.adminFirstName}",
            "adminLastName": "${event.adminLastName}",
            "adminPassword": "${passController.text}",
            "captchaResponse": null,
            "editionId": selectedEditionsWithFeature!.edition!.id,
            "name": "${event.tenancyName}",
            "tenancyName": "${event.tenancyName}"
          },
          qury: {
          "timeZone":"${currentTimeZone.identifier}"
          }

      );

      if (response.statusCode == 200) {
        registerTenantModel=RegisterTenantModel.fromJson(response.data["result"]);
        emit(RegisterTenantSuccess(registerTenant: registerTenantModel!));


      } else {
        emit(RegisterTenantError());

      }
    }catch( e){
      if (e is DioException) {
        if (e.response != null) {
          if(e.response?.statusCode==422&&e.response?.data!=null) {
            showToast(msg:e.response?.data["message"], state: ToastState.ERORR);

          }
          else if(e.response?.statusCode==401&&e.response?.data!=null) {
            showToast(msg:e.response?.data["message"], state: ToastState.ERORR);

          }

          else {
            showToast(msg: "حدث خطأ غير متوقع الرجاء اعادة المحاولة",
                state: ToastState.ERORR);
          } } else {
          showToast(msg: "  تأكد من جودة الاتصال او صحة URL", state: ToastState.WARNING);
        }
      } else {
        showToast(msg: "حدث خطأ غير متوقع", state: ToastState.ERORR);
      }
      emit(RegisterTenantError());
    }

  }
  AuthenticateModel?authenticateModel;
  FutureOr<void>_authenticate(AuthenticateEvent event,Emitter<RegisterState>emit) async{
    emit(AuthenticateLoading());
    final TimezoneInfo currentTimeZone = await FlutterTimezone.getLocalTimezone();
    try {
      final response = await DioHelper.postData(
          url: ApiConstance.authenticate,
          data: {
            "ianaTimeZone": "${currentTimeZone.identifier}",
            "password": "${event.passWord}",
            "rememberClient": false,
            "returnUrl": null,
            "singleSignIn": false,
            "tenantName": "${event.tenancyName}",
            "userNameOrEmailAddress": "${event.emailAddress}"
          },


      );

      if (response.statusCode == 200) {
        authenticateModel=AuthenticateModel.fromJson(response.data["result"]);
        CacheHelper.saveData(key: "accessToken", value: authenticateModel!.accessToken);
        CacheHelper.saveData(key: "encryptedAccessToken", value: authenticateModel!.encryptedAccessToken);
        CacheHelper.saveData(key: "refreshToken", value: authenticateModel!.refreshToken);
        emit(AuthenticateSuccess(authenticateModel: authenticateModel!));


      } else {
        emit(AuthenticateError());

      }
    }catch( e){
      if (e is DioException) {
        if (e.response != null) {
          if(e.response?.statusCode==422&&e.response?.data!=null) {
            showToast(msg:e.response?.data["message"], state: ToastState.ERORR);

          }
          else if(e.response?.statusCode==401&&e.response?.data!=null) {
            showToast(msg:e.response?.data["message"], state: ToastState.ERORR);

          }

          else {
            showToast(msg: "حدث خطأ غير متوقع الرجاء اعادة المحاولة",
                state: ToastState.ERORR);
          } } else {
          showToast(msg: "  تأكد من جودة الاتصال او صحة URL", state: ToastState.WARNING);
        }
      } else {
        showToast(msg: "حدث خطأ غير متوقع", state: ToastState.ERORR);
      }
      emit(AuthenticateError());
    }

  }

}
