import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:my_netflix_api_admin_web/src/infrastructure/responsive.dart';
import 'package:my_netflix_api_admin_web/src/modules/auth/modules/signin/widgets/login_text_field.dart';
import 'package:my_netflix_api_admin_web/src/presentation/common/widgets/logo.dart';

class SigninScreen extends StatelessWidget {
  const SigninScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          titleSpacing: size.width * 0.1,
          backgroundColor: Colors.transparent,
          title: const AppLogo(),
        ),
        body: const LoginView());
  }
}

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  String getBacgroundImage(BuildContext context) {
    if (Responsive.isMobile(context)) {
      return 'small';
    }
    return Responsive.isDesktop(context) ? 'large' : 'medium';
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: ((context, constraints) {
      final width = constraints.maxWidth;

      return Stack(
        children: <Widget>[
          if (width >= 600)
            Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                          'assets/images/netflix_login_bg_${getBacgroundImage(context)}.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  color: Colors.black54,
                ),
              ],
            ),
          const LoginForm()
        ],
      );
    }));
  }
}

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      margin: const EdgeInsets.only(bottom: 50, top: kToolbarHeight),
      width: 450,
      color: Colors.black.withAlpha(178),
      child: const FormMainWrapper(),
    ));
  }
}

class FormMainWrapper extends StatelessWidget {
  const FormMainWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 48, horizontal: 68),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppLocalizations.of(context)!.signIn,
            style: const TextStyle(fontSize: 32, fontWeight: FontWeight.w700),
            textAlign: TextAlign.left,
          ),
          const SizedBox(
            height: 28,
          ),
          Form(
              child: Column(
            children: [
              const LoginTextField(
                label: 'Email o número de teléfono',
              ),
              const SizedBox(
                height: 10,
              ),
              const LoginTextField(
                label: 'Contraseña',
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {},
                    child: Text("Iniciar sesión"),
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(primaryColor),
                    )),
              )
            ],
          ))
        ],
      ),
    );
  }
}
