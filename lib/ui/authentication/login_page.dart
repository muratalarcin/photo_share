import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:videoshare/drawable/strings/strings.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final key = GlobalKey<FormState>(); // Form key'i eklendi
  final focusNodeTextFieldOne = FocusNode();
  final focusNodeTextFieldTwo = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(LanguageItems.log_in),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _log_in_navigation_button(),
              _sign_in_navigation_button(),
            ],
          ),
          const SizedBox(
            height: 100,
          ),
          Form(
            key: key, // Form key'i eklendi
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        autofocus: true,
                        autofillHints: const [AutofillHints.email],
                        focusNode: focusNodeTextFieldOne,
                        textInputAction: TextInputAction.next,
                        decoration: _InputDecarotor().emailInput,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        maxLength: 20,
                        keyboardType: TextInputType.visiblePassword,
                        autofillHints: const [AutofillHints.password],
                        focusNode: focusNodeTextFieldTwo,
                        textInputAction: TextInputAction.next,
                        decoration: _InputDecarotor().passwordInput,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 70,
                ),
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
        ],
      ),
    );
  }

  ElevatedButton _sign_in_navigation_button() {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
        bottomRight: Radius.circular(50),
      ))),
      child: const Text(LanguageItems.sign_in),
    );
  }

  ElevatedButton _log_in_navigation_button() {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
        topLeft: Radius.circular(50),
      ))),
      child: const Text(LanguageItems.log_in),
    );
  }
}

class _InputDecarotor {
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
