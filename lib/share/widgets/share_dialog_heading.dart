import 'package:flutter/material.dart';
import 'package:holobooth/l10n/l10n.dart';
import 'package:holobooth_ui/holobooth_ui.dart';

class ShareDialogHeading extends StatelessWidget {
  const ShareDialogHeading({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final theme = Theme.of(context);
    final small =
        MediaQuery.of(context).size.width <= HoloboothBreakpoints.small;

    return GradientText(
      text: l10n.shareDialogHeading,
      style:
          small ? theme.textTheme.headlineLarge : theme.textTheme.headlineSmall,
      textAlign: small ? TextAlign.center : TextAlign.start,
    );
  }
}
