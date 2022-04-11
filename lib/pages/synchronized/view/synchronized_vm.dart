import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../../../core/routes/route_manager.dart';
import '../../../core/services_sl/context_global.dart';
import '../../../core/services_sl/status_notifier.dart';
import '../../../core/services_sl/user_services.dart';
import '../../../core/utils/navigator_utils.dart';
import '../../../injection_container.dart';

enum StatusSynchronization {
  none,
  loading,
  success,
  notInternet,
  error,
}

class SynchronizedViewModel extends StatusNotifier {
  SynchronizedViewModel() {
    mapEventToState();
  }
  String _messageError = '';
  String get messageError => _messageError;
  String _progress = '0.00';
  String get progress => _progress;
  String _descriptionProgress = 'Preparando para Sincronización...';
  String get descriptionProgress => _descriptionProgress;
  TypeUserAccount typeUserAccount = sl<UserServices>().currentTypeUserAccount!;
  int currentStage = 0;

  BuildContext? screenContext = sl<ContextService>().currentContext;
  StatusSynchronization _currentStatus = StatusSynchronization.none;
  StatusSynchronization get currentStatus => _currentStatus;
  set currentStatus(StatusSynchronization status) {
    _currentStatus = status;
    if (_currentStatus == StatusSynchronization.notInternet) {
      _descriptionProgress = 'No hay conexión a internet ';
      _progress = '0.00';
    }
    notifyListeners();
  }

  set messageError(String value) {
    _messageError = value;
    notifyListeners();
  }

  set progress(String value) {
    _progress = value;
    notifyListeners();
  }

  set descriptionProgress(String value) {
    _descriptionProgress = value;
    notifyListeners();
  }

  Future<void> mapEventToState() async {
    if (typeUserAccount == TypeUserAccount.admin) {
      _synchAllAdmin(stage: currentStage).listen((StatusSynchronization event) {
        currentStatus = event;
      });
      if (currentStatus == StatusSynchronization.notInternet) {}
    } else {
      _synchAllEmployed(stage: currentStage)
          .listen((StatusSynchronization event) {
        currentStatus = event;
      });
      if (currentStatus == StatusSynchronization.notInternet) {}
    }
  }

  Stream<StatusSynchronization> _synchAllAdmin({required int stage}) async* {
    _currentStatus = StatusSynchronization.loading;
    int totalStages = 2;
    int stageNumber = stage;
    bool _failureOrOk = false;

    if (await InternetConnectionChecker().hasConnection) {
      progress =
          (stageNumber / totalStages * 100).toStringAsFixed(2).toString();
      descriptionProgress = 'Preparando para Sincronización...';
      _failureOrOk =
          await Future<dynamic>.delayed(Duration(seconds: 2), () => true);
      if (!_failureOrOk) {
        yield StatusSynchronization.error;
        return;
      }
    } else {
      currentStatus = StatusSynchronization.notInternet;
      return;
    }

    if (await InternetConnectionChecker().hasConnection) {
      stageNumber++;
      progress =
          (stageNumber / totalStages * 100).toStringAsFixed(2).toString();
      descriptionProgress = 'Sincronizando articulos...';
      _failureOrOk =
          await Future<dynamic>.delayed(Duration(seconds: 2), () => true);
      if (!_failureOrOk) {
        yield StatusSynchronization.error;
        return;
      }
    } else {
      currentStatus = StatusSynchronization.notInternet;
      return;
    }
    /* 
    if (await InternetConnectionChecker().hasConnection) {
      stageNumber++;
      progress =
          (stageNumber / totalStages * 100).toStringAsFixed(2).toString();
      descriptionProgress = 'Sincronizando familias...';
      _failureOrOk =
          await Future<dynamic>.delayed(Duration(seconds: 2), () => true);
      if (!_failureOrOk) {
        yield StatusSynchronization.error;
        return;
      }
    } else {
      currentStatus = StatusSynchronization.notInternet;
      return;
    }
    if (await InternetConnectionChecker().hasConnection) {
      stageNumber++;
      progress =
          (stageNumber / totalStages * 100).toStringAsFixed(2).toString();
      descriptionProgress = 'Sincronizando companias...';
      _failureOrOk =
          await Future<dynamic>.delayed(Duration(seconds: 2), () => true);
      if (!_failureOrOk) {
        yield StatusSynchronization.error;
        return;
      }
    } else {
      currentStatus = StatusSynchronization.notInternet;
      return;
    }
    if (await InternetConnectionChecker().hasConnection) {
      stageNumber++;
      progress =
          (stageNumber / totalStages * 100).toStringAsFixed(2).toString();
      descriptionProgress = 'Sincronizando clientes...';
      _failureOrOk =
          await Future<dynamic>.delayed(Duration(seconds: 2), () => true);
      if (!_failureOrOk) {
        yield StatusSynchronization.error;
        return;
      }
    } else {
      currentStatus = StatusSynchronization.notInternet;
      return;
    }
    if (await InternetConnectionChecker().hasConnection) {
      stageNumber++;
      progress =
          (stageNumber / totalStages * 100).toStringAsFixed(2).toString();
      descriptionProgress = 'Sincronizando rutas...';
      _failureOrOk =
          await Future<dynamic>.delayed(Duration(seconds: 2), () => true);
      if (!_failureOrOk) {
        yield StatusSynchronization.error;
        return;
      }
    } else {
      currentStatus = StatusSynchronization.notInternet;
      return;
    }
    if (await InternetConnectionChecker().hasConnection) {
      stageNumber++;
      progress =
          (stageNumber / totalStages * 100).toStringAsFixed(2).toString();
      descriptionProgress = 'Sincronizando modulos...';
      _failureOrOk =
          await Future<dynamic>.delayed(Duration(seconds: 2), () => true);
      if (!_failureOrOk) {
        yield StatusSynchronization.error;
        return;
      }
    } else {
      currentStatus = StatusSynchronization.notInternet;
      return;
    }
    if (await InternetConnectionChecker().hasConnection) {
      stageNumber++;
      progress =
          (stageNumber / totalStages * 100).toStringAsFixed(2).toString();
      descriptionProgress = 'Sincronizando ventas...';
      _failureOrOk =
          await Future<dynamic>.delayed(Duration(seconds: 2), () => true);
      if (!_failureOrOk) {
        yield StatusSynchronization.error;
        return;
      }
    } else {
      currentStatus = StatusSynchronization.notInternet;
      return;
    }
    if (await InternetConnectionChecker().hasConnection) {
      stageNumber++;

      descriptionProgress = 'Sincronizando mapas...';
      _failureOrOk =
          await Future<dynamic>.delayed(Duration(seconds: 2), () => true);
      progress =
          (stageNumber / totalStages * 100).toStringAsFixed(2).toString();
      if (!_failureOrOk) {
        yield StatusSynchronization.error;
        return;
      }
    } else {
      currentStatus = StatusSynchronization.notInternet;
      return;
    } */
    if (stageNumber == 1) {
      yield StatusSynchronization.success;
    } else {
      yield StatusSynchronization.error;
      return;
    }
    if (currentStatus == StatusSynchronization.success) {
      await pushNamedAndRemoveUntil(screenContext!, AppRoutes.base);
    } else {
      currentStatus = StatusSynchronization.error;
      return;
    }
  }

  Stream<StatusSynchronization> _synchAllEmployed({required int stage}) async* {
    _currentStatus = StatusSynchronization.loading;
    int totalStages = 8;
    int stageNumber = stage;
    bool _failureOrOk = false;

    if (await InternetConnectionChecker().hasConnection && stageNumber == 0) {
      progress =
          (stageNumber / totalStages * 100).toStringAsFixed(2).toString();
      descriptionProgress = 'Preparando para Sincronización...';
      _failureOrOk =
          await Future<dynamic>.delayed(Duration(seconds: 2), () => true);
      if (!_failureOrOk) {
        yield StatusSynchronization.error;
        return;
      }
      stageNumber++;
    } else {
      currentStatus = StatusSynchronization.notInternet;
      currentStage = stageNumber;
      return;
    }

    if (await InternetConnectionChecker().hasConnection) {
      progress =
          (stageNumber / totalStages * 100).toStringAsFixed(2).toString();
      descriptionProgress = 'Sincronizando articulos...';
      _failureOrOk =
          await Future<dynamic>.delayed(Duration(seconds: 2), () => true);
      if (!_failureOrOk) {
        yield StatusSynchronization.error;
        return;
      }
      stageNumber++;
    } else {
      currentStatus = StatusSynchronization.notInternet;
      currentStage = stageNumber;
      return;
    }
    if (await InternetConnectionChecker().hasConnection) {
      progress =
          (stageNumber / totalStages * 100).toStringAsFixed(2).toString();
      descriptionProgress = 'Sincronizando familias...';
      _failureOrOk =
          await Future<dynamic>.delayed(Duration(seconds: 2), () => true);
      if (!_failureOrOk) {
        yield StatusSynchronization.error;
        return;
      }
      stageNumber++;
    } else {
      currentStatus = StatusSynchronization.notInternet;
      currentStage = stageNumber;
      return;
    }
    if (await InternetConnectionChecker().hasConnection) {
      progress =
          (stageNumber / totalStages * 100).toStringAsFixed(2).toString();
      descriptionProgress = 'Sincronizando companias...';
      _failureOrOk =
          await Future<dynamic>.delayed(Duration(seconds: 2), () => true);
      if (!_failureOrOk) {
        yield StatusSynchronization.error;
        return;
      }
      stageNumber++;
    } else {
      currentStatus = StatusSynchronization.notInternet;
      currentStage = stageNumber;
      return;
    }
    if (await InternetConnectionChecker().hasConnection) {
      progress =
          (stageNumber / totalStages * 100).toStringAsFixed(2).toString();
      descriptionProgress = 'Sincronizando clientes...';
      _failureOrOk =
          await Future<dynamic>.delayed(Duration(seconds: 2), () => true);
      if (!_failureOrOk) {
        yield StatusSynchronization.error;
        return;
      }
      stageNumber++;
    } else {
      currentStatus = StatusSynchronization.notInternet;
      currentStage = stageNumber;
      return;
    }
    if (await InternetConnectionChecker().hasConnection) {
      progress =
          (stageNumber / totalStages * 100).toStringAsFixed(2).toString();
      descriptionProgress = 'Sincronizando rutas...';
      _failureOrOk =
          await Future<dynamic>.delayed(Duration(seconds: 2), () => true);
      if (!_failureOrOk) {
        yield StatusSynchronization.error;
        return;
      }
      stageNumber++;
    } else {
      currentStatus = StatusSynchronization.notInternet;
      currentStage = stageNumber;
      return;
    }
    if (await InternetConnectionChecker().hasConnection) {
      progress =
          (stageNumber / totalStages * 100).toStringAsFixed(2).toString();
      descriptionProgress = 'Sincronizando modulos...';
      _failureOrOk =
          await Future<dynamic>.delayed(Duration(seconds: 2), () => true);
      if (!_failureOrOk) {
        yield StatusSynchronization.error;
        return;
      }
      stageNumber++;
    } else {
      currentStatus = StatusSynchronization.notInternet;
      currentStage = stageNumber;
      return;
    }
    if (await InternetConnectionChecker().hasConnection) {
      progress =
          (stageNumber / totalStages * 100).toStringAsFixed(2).toString();
      descriptionProgress = 'Sincronizando ventas...';
      _failureOrOk =
          await Future<dynamic>.delayed(Duration(seconds: 2), () => true);
      if (!_failureOrOk) {
        yield StatusSynchronization.error;
        return;
      }
      stageNumber++;
    } else {
      currentStatus = StatusSynchronization.notInternet;
      currentStage = stageNumber;
      return;
    }
    if (await InternetConnectionChecker().hasConnection) {
      progress =
          (stageNumber / totalStages * 100).toStringAsFixed(2).toString();
      descriptionProgress = 'Sincronizando mapas...';
      _failureOrOk =
          await Future<dynamic>.delayed(Duration(seconds: 2), () => true);
      if (!_failureOrOk) {
        yield StatusSynchronization.error;
        return;
      }
      stageNumber++;
    } else {
      currentStatus = StatusSynchronization.notInternet;
      currentStage = stageNumber;
      return;
    }
    if (stageNumber == 8) {
      yield StatusSynchronization.success;
    } else {
      yield StatusSynchronization.error;
      return;
    }
    if (currentStatus == StatusSynchronization.success) {
      await pushNamedAndRemoveUntil(screenContext!, AppRoutes.baseEmployed);
    } else {
      currentStatus = StatusSynchronization.error;
      return;
    }
  }
}
