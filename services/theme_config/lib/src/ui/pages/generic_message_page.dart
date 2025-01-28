import 'package:flutter/material.dart';
import 'package:network_service/network_service.dart';
import 'package:theme_config/theme_config.dart';

enum GenericMessageAsset {
  success('assets/message/generic_success.png'),
  successMoney('assets/message/generic_success_money.png'),
  error('assets/message/generic_error.png'),
  pendingAccount('/assets/message/generic_pending_account.png');

  const GenericMessageAsset(this.asset);
  final String asset;
  final String package = 'theme_config';
}

class GenericMessagePage extends StatelessWidget {
  final String title;
  final String? labelSecondary, labelPrimary, description;
  final AppException? error;
  final GenericMessageAsset asset;
  final void Function()? onPressPrimary, onpressSecondary;

  const GenericMessagePage(this.title,
      {super.key,
      this.error,
      this.description,
      this.labelSecondary,
      this.onpressSecondary,
      this.labelPrimary,
      this.onPressPrimary,
      this.asset = GenericMessageAsset.error});

  Future show(BuildContext context) =>
      Navigator.of(context).push(MaterialPageRoute(
          settings: RouteSettings(
            name: 'generc-error',
          ),
          builder: (context) => this));

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Material(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                    child: Center(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Image.asset(
                          asset.asset,
                          package: asset.package,
                        ),
                        const SizedBox(height: 20),
                        Text(
                          title,
                          style: context.textTheme.headlineMedium,
                          textAlign: TextAlign.center,
                        ),
                        if (description case final description?)
                          Text(
                            description,
                            textAlign: TextAlign.center,
                          ),
                        if (error?.message case final err?)
                          Text(
                            err,
                            textAlign: TextAlign.center,
                          ),
                      ],
                    ),
                  ),
                )),
                BottomButtons(
                  labelPrimary: labelPrimary ?? 'Aceptar',
                  onPressPrimary: onPressPrimary,
                  labelSecondary: labelSecondary,
                  onPressSecondary: onpressSecondary,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
