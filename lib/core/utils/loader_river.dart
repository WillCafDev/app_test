import '../framework/models/popup_interface.dart';
import '../framework/rive_loader.dart';
import '../template/assets_manager.dart';

PopupInterface cawafLoader = RivePopup(
  path: cawafRiv,
  animation: 'loader',
  canBeClosed: false,
  showShadow: true,
  size: 200,
);
