import 'package:flutter/material.dart';
import 'package:videoshare/drawable/strings/strings.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final key = GlobalKey<FormState>();
  final String _titleName = 'adelia';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: BoxDecoration(
          gradient: _pageGradientColor(),
        ),
        child: Column(
          children: [
            _SpaceSize().spaceMiddle,
            Text(
              LanguageItems.authenticatinon_title,
              style: _titleFont(),
            ),
            _SpaceSize().spaceShort,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _TopButtons().logInButton,
                _TopButtons().signInButton,
              ],
            ),
            Form(
              key: key,
              child: Padding(
                padding: _Padding().fieldPadding,
                child: Column(
                  children: [
                    _MyFields().emailField,
                    _SpaceSize().fieldSpace,
                    _MyFields().passwordField,
                    _SpaceSize().spaceLong,
                    ElevatedButton(
                      onPressed: () {
                        if (key.currentState!.validate()) {
                          // Form doğrulama işlemleri buraya eklenir
                          // Örnek: Kullanıcı adı ve şifre kontrolü
                        }
                      },
                      child: const Text(LanguageItems.log_in),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  TextStyle _titleFont() => const TextStyle(fontSize: 30, fontFamily: 'adelia');

  LinearGradient _pageGradientColor() {
    return const LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Colors.deepOrange,
        Color(0xFFEDCBC0),
        Colors.white,
      ],
    );
  }
}

class _TopButtons {
  final logInButton = ElevatedButton(
    onPressed: () {},
    style: ElevatedButton.styleFrom(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(50),
        ),
      ),
      backgroundColor: Colors.orange,
    ),
    child: const Text(
      LanguageItems.log_in,
    ),
  );

  final signInButton = ElevatedButton(
    onPressed: () {},
    style: ElevatedButton.styleFrom(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(50),
        ),
      ),
    ),
    child: const Text(LanguageItems.sign_in),
  );
}

class _MyFields {
  final emailField = TextFormField(
    keyboardType: TextInputType.emailAddress,
    autofocus: true,
    autofillHints: const [AutofillHints.email],
    focusNode: FocusNode(),
    textInputAction: TextInputAction.next,
    decoration: _InputDecorator().emailInput,
  );

  final passwordField = TextFormField(
    keyboardType: TextInputType.visiblePassword,
    obscureText: true,
    autofillHints: const [AutofillHints.password],
    focusNode: FocusNode(),
    textInputAction: TextInputAction.next,
    decoration: _InputDecorator().passwordInput,
  );
}

class _Padding {
  final fieldPadding = const EdgeInsets.all(32.0);
}

class _SpaceSize {
  final fieldSpace = const SizedBox(
    height: 16,
  );
  final spaceShort = const SizedBox(
    height: 100,
  );
  final spaceMiddle = const SizedBox(
    height: 150,
  );
  final spaceLong = const SizedBox(
    height: 200,
  );
}

class _InputDecorator {
  final emailInput = const InputDecoration(
    prefixIcon: Icon(Icons.mail),
    border: OutlineInputBorder(),
    labelText: LanguageItems.mailTitle,
  );

  final passwordInput = const InputDecoration(
    prefixIcon: Icon(Icons.key),
    border: OutlineInputBorder(),
    labelText: LanguageItems.passwordTitle,
  );
}
