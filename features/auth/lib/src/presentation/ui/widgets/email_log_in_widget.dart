import 'package:auth/src/data/models/email_login_req.dart';
import 'package:auth/src/router/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:theme_config/theme_config.dart';

import '../../providers/login_provider.dart';

class EmailLogInWidget extends ConsumerStatefulWidget {
  final String? title, description;
  const EmailLogInWidget({
    super.key,
    this.description,
    this.title,
  });

  @override
  ConsumerState<EmailLogInWidget> createState() => __EamilLogInState();
}

class __EamilLogInState extends ConsumerState<EmailLogInWidget>
    with LoadingOverlayMixin {
  late final TextEditingController emailController = TextEditingController(),
      passwordController = TextEditingController();

  void onSignIn(BuildContext context) => AccountRoute().go(context);

  bool validEmail = false, validPassword = false;

  bool get enableButton => validEmail && validPassword;

  @override
  void initState() {
    super.initState();
    emailController.addListener(() {
      setState(() {
        final regExpEmail =
            RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$");
        validEmail = regExpEmail.hasMatch(emailController.text);
      });
    });
    passwordController.addListener(() {
      setState(() {
        validPassword = passwordController.text.length >= 3;
      });
    });
  }

  @override
  void dispose() {
    passwordController.dispose();
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 20,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (widget.title case final title?)
          Text(
            title.capitalized,
            style: context.theme.textTheme.headlineLarge,
            textAlign: TextAlign.center,
          ),
        if (widget.description case final description?)
          Text(
            description.capitalized,
            style: context.theme.textTheme.bodyMedium?.copyWith(
              color: context.colors.neutral_400,
            ),
            textAlign: TextAlign.center,
          ),
        _FormField(
          label: 'Email',
          controller: emailController,
        ),
        _FormField(
          label: 'Password',
          controller: passwordController,
          obscureText: true,
        ),
        PrimaryButton(
          onPressed: !enableButton
              ? null
              : () async {
                  await insetOverlay(
                    context,
                    () async => await ref
                        .read(loginProvider(
                          EmailLoginReq(
                            email: emailController.text.trim(),
                            password: emailController.text.trim(),
                          ),
                        ).future)
                        .then(
                          (val) {},
                          onError: (err) {},
                        ),
                  );
                },
          label: 'Login',
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _TextButton(
              onPressed: () {},
              label: 'Forgot password?',
            ),
            _TextButton(
              onPressed: () {},
              label: 'Create account',
            )
          ],
        ),
      ],
    );
  }
}

class _TextButton extends StatelessWidget {
  final String label;
  final void Function()? onPressed;
  const _TextButton({
    required this.label,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return CustomTextButton(
      onPressed: onPressed,
      label: label,
      textStyle: TextStyle(
        fontSize: 10,
      ),
    );
  }
}

class _FormField extends StatelessWidget {
  final TextEditingController controller;
  final String? label;
  final bool obscureText;
  const _FormField({
    required this.controller,
    this.label,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: label,
      ),
    );
  }
}
