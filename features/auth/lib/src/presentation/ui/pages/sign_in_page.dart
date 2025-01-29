import 'package:auth/src/presentation/ui/widgets/email_log_in_widget.dart';
import 'package:auth/src/presentation/ui/widgets/social_buttons_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:theme_config/theme_config.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            sliver: SliverFillRemaining(
              hasScrollBody: false,
              child: Center(
                child: ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: 320),
                  child: Column(
                    spacing: 12,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Card(
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Consumer(
                            builder: (context, ref, _) {
                              final title =
                                  ref.watch(appFlavorProvider).appTitle;
                              return EmailLogInWidget(
                                title: 'Welcome to $title!',
                                description: 'Log in to your $title account',
                              );
                            },
                          ),
                        ),
                      ),
                      TextDivider(label: 'or'),
                      SocialButtonsWidget(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
