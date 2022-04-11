import 'package:reactive_forms/reactive_forms.dart';

import '../../../../core/utils/regex_text.dart';

class LoginController {
  final FormGroup loginForm = FormGroup(<String, AbstractControl<dynamic>>{
    'username': FormControl<String>(
      validators: <ValidatorFunction>[
        Validators.required,
        Validators.minLength(6),
        Validators.maxLength(30),
        Validators.pattern(fullTextNotSpaces)
      ],
      value: '',
    ),
    'password': FormControl<String>(
      validators: <ValidatorFunction>[
        Validators.required,
        Validators.minLength(6),
        Validators.maxLength(30),
        Validators.pattern(fullTextNotSpaces),
      ],
      value: '',
    ),
  });
  String get username => loginForm.control('username').value;
  String get password => loginForm.control('password').value;
  void cleanLoginForm() {
    loginForm.control('username').value = '';
    loginForm.control('password').value = '';
    loginForm.reset();
  }
}

final LoginController _loginController = LoginController();
LoginController get loginController => _loginController;
