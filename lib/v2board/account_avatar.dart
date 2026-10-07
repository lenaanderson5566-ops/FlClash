import 'package:fastai/common/common.dart';
import 'package:fastai/icons/icons.dart';
import 'package:material_ui/material_ui.dart';

/// Compact identity for navigation; full email remains on the account page.
String maskedAccountEmail(String email) {
  final value = email.trim();
  final separator = value.lastIndexOf('@');
  if (separator <= 0 || separator == value.length - 1) return '***';
  final local = value.substring(0, separator).characters;
  final visible = local.take(local.length > 2 ? 2 : 1).join();
  return '$visible***${value.substring(separator)}';
}

class AccountAvatar extends StatelessWidget {
  const AccountAvatar({super.key, this.email, this.size = 36});

  final String? email;
  final double size;

  @override
  Widget build(BuildContext context) {
    final value = email?.trim() ?? '';
    return ExcludeSemantics(
      child: Container(
        width: size,
        height: size,
        alignment: Alignment.center,
        decoration: ShapeDecoration(
          shape: AppShape.circle,
          color: email == null
              ? context.colorScheme.surfaceContainerHighest
              : const Color(0xFF99A585),
        ),
        child: email == null
            ? GlyphIcon(AppGlyphs.account, size: size * 0.55)
            : Text(
                value.isEmpty ? '?' : value.characters.first.toUpperCase(),
                style: context.textTheme.titleMedium?.copyWith(
                  color: Colors.white,
                  fontSize: size * 0.44,
                  fontWeight: FontWeight.w600,
                ),
              ),
      ),
    );
  }
}
