import 'package:cawaf_services_api/cawaf_services_api.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import '../../../core/routes/route_manager.dart';
import '../../../core/services_sl/context_global.dart';
import '../../../core/services_sl/status_notifier.dart';
import '../../../core/services_sl/user_services.dart';
import '../../../core/utils/navigator_utils.dart';
import '../../../injection_container.dart';

enum SessionStatus {
  loading,
  authenticated,
  unauthenticated,
  error,
}

class SplashViewModel extends StatusNotifier {
  SplashViewModel(this._getSessionLocalUser, this._getInformationLocalUser) {
    checkSessionUser();
  }
  BuildContext? screenContext = sl<ContextService>().currentContext;
  SessionStatus _currentSessionStatus = SessionStatus.loading;
  SessionStatus get currentSessionStatus => _currentSessionStatus;

  set currentSessionStatus(SessionStatus sessionStatus) {
    _currentSessionStatus = sessionStatus;
    notifyListeners();
  }

  final GetSessionLocalUser _getSessionLocalUser;
  final GetInformationLocalUser _getInformationLocalUser;

  Future<void> checkSessionUser() async {
    _currentSessionStatus = SessionStatus.loading;
    Either<Failure, void> failureOrSession = await _getSessionLocalUser();
    failureOrSession.fold(
        (Failure failure) =>
            _currentSessionStatus = SessionStatus.unauthenticated, (_) async {
      await _saveInformationInUserServices();
      _currentSessionStatus = SessionStatus.authenticated;
    });
    Future<Duration?>.delayed(const Duration(milliseconds: 5000), () async {
      switch (_currentSessionStatus) {
        case SessionStatus.loading:
          break;
        case SessionStatus.authenticated:
          await pushNamedAndRemoveUntil(screenContext!, AppRoutes.synchronized);
          break;
        case SessionStatus.unauthenticated:
          await pushNamedAndRemoveUntil(screenContext!, AppRoutes.login);
          break;
        case SessionStatus.error:
          await pushNamedAndRemoveUntil(screenContext!, AppRoutes.login);
          break;
      }
      return null;
    });
  }

  Future<void> _saveInformationInUserServices() async {
    Either<Failure, Setting> failureOrInformation =
        await _getInformationLocalUser();

    failureOrInformation.fold((Failure failure) {
      debugPrint(failure.message);
    }, (Setting setting) {
      sl<UserServices>().logInUser(
        setting.token,
        setting.user,
        setting.company,
      );
    });
  }
}
