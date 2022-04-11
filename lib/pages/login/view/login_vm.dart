import 'package:cawaf_services_api/cawaf_services_api.dart';
import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../core/routes/route_manager.dart';
import '../../../../core/services_sl/status_notifier.dart';
import '../../../../core/services_sl/user_services.dart';
import '../../../../core/utils/dialog.dart';
import '../../../../core/utils/navigator_utils.dart';
import '../../../../core/utils/show_dialog_message.dart';
import '../../../../injection_container.dart';
import '../../../core/services_sl/context_global.dart';
import 'login_form_controller.dart';

enum StatusLogin { none, loading, success, error }

class LoginViewModel extends StatusNotifier {
  LoginViewModel(this._validateWithCredentialUser);
  final ValidateWithCredentialUser _validateWithCredentialUser;
  String _errorMessage = '';
  final bool _isEnabled = false;
  bool get isEnabled => _isEnabled;

  BuildContext? screenContext = sl<ContextService>().currentContext;
  StatusLogin _currentStatusLogin = StatusLogin.none;
  StatusLogin get currentStatusLogin => _currentStatusLogin;
  set currentStatusLogin(StatusLogin status) {
    _currentStatusLogin = status;
    notifyListeners();
  }

  String get errorMessage => _errorMessage;
  set errorMessage(String errorMessage) {
    _errorMessage = errorMessage;
    notifyListeners();
  }

  Future<void> login() async {
    currentStatusLogin = StatusLogin.loading;
    ProgressDialogo.show(screenContext!);
    Future<dynamic>.delayed(Duration(seconds: 2), () async {
      Either<Failure, Setting> failureOrLogin =
          await _validateWithCredentialUser(
              loginController.username, loginController.password);

      failureOrLogin.fold((Failure failure) {
        errorMessage = 'errorFailure.${failure.message}'.tr();
        debugPrint(failure.toString());
        currentStatusLogin = StatusLogin.error;
      }, (Setting setting) {
        currentStatusLogin = StatusLogin.success;
        sl<UserServices>().logInUser(
          setting.token,
          setting.user,
          setting.company,
        );
      });
      if (currentStatusLogin == StatusLogin.success) {
        loginController.cleanLoginForm();
        await pushNamedAndRemoveUntil(screenContext!, AppRoutes.synchronized);
      }
      if (currentStatusLogin == StatusLogin.error) {
        ProgressDialogo.dissmiss(screenContext!);
        return showDialogMessageInformation(
          context: screenContext!,
          message: errorMessage,
        );
      }
      ProgressDialogo.dissmiss(screenContext!);
    });
  }
}
