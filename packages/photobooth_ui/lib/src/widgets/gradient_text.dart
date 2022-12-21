import 'package:flutter/material.dart';

/// {@template gradient_text}
/// A widget that wraps [ShaderMask] around [SelectableText] to
/// create a text with gradient color.
/// {@endtemplate}
class GradientText extends StatelessWidget {
  /// {@macro gradient_text}
  const GradientText({
    super.key,
    required this.text,
    this.style,
    this.textAlign,
  });

  /// The text.
  final String text;

  /// Optional text style.
  final TextStyle? style;

  /// Optional text alignment.
  final TextAlign? textAlign;

  static const _defaultTextStyle = TextStyle(color: Colors.white);

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) {
        return const LinearGradient(
          colors: [
            // TODO(willhlas): use theme colors once it's ready.
            Color(0xFFEFBDCF),
            Color(0xFF9E81EF),
          ],
        ).createShader(Offset.zero & bounds.size);
      },
      child: SelectableText(
        text,
        style: style?.merge(_defaultTextStyle) ?? _defaultTextStyle,
        textAlign: textAlign,
      ),
    );
  }
}