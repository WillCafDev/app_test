import 'package:cawaf_services_api/cawaf_services_api.dart';

enum TypeUserAccount {
  employed,
  admin,
}

class UserServices {
  String _token = '';
  String get token => _token;
  set token(String value) => _token = value;
  User? _user;
  Company? _company;
  User get user => _user!;
  set user(User value) => _user = value;
  Company get company => _company!;
  set company(Company value) => _company = value;
  TypeUserAccount? _currentTypeUserAccount;
  TypeUserAccount? get currentTypeUserAccount => _currentTypeUserAccount;

  void logInUser(String token, User user, Company company) {
    _user = user;
    _company = company;
    _token = token;
    _currentTypeUserAccount = user.typeUser == 'Administrador'
        ? TypeUserAccount.admin
        : TypeUserAccount.employed;
  }
}
