import 'package:coke_platform/common/extension/num_extension.dart';
import 'package:coke_platform/common/utility/locale.dart';
import 'package:coke_platform/common/widget/language.dart';
import 'package:coke_platform/generated/l10n.dart';
import 'package:flutter/material.dart';

class DialogUtility {
  static Future<void> showErrorDialog(
    BuildContext context, {
    required String title,
    required String message,
  }) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        insetPadding: const EdgeInsets.all(24),
        contentPadding: const EdgeInsets.all(24).copyWith(bottom: 0),
        actionsPadding: const EdgeInsets.all(24),
        titlePadding: const EdgeInsets.all(24).copyWith(bottom: 0),
        backgroundColor: Theme.of(context).colorScheme.background,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        title: Text(
          title,
          style: Theme.of(context).textTheme.displayLarge?.copyWith(
                color: Theme.of(context).colorScheme.error,
              ),
        ),
        content: Text(
          message,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(context).colorScheme.error,
              ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              S.current.ok,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(context).colorScheme.error,
                  ),
            ),
          ),
        ],
      ),
    );
  }

  static Future<T?> showConfirmDialog<T>(
    BuildContext context, {
    required String title,
    required String message,
    required VoidCallback onConfirm,
    String? confirmText,
  }) {
    return showDialog<T>(
      context: context,
      builder: (context) => AlertDialog(
        insetPadding: const EdgeInsets.all(24),
        contentPadding: const EdgeInsets.all(24).copyWith(bottom: 0),
        actionsPadding: const EdgeInsets.all(24),
        titlePadding: const EdgeInsets.all(24).copyWith(bottom: 0),
        backgroundColor: Theme.of(context).colorScheme.background,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        title: Text(
          title,
          style: Theme.of(context).textTheme.displayLarge?.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
              ),
        ),
        content: Text(
          message,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
              ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              S.current.cancel,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(context).colorScheme.error,
                  ),
            ),
          ),
          TextButton(
            onPressed: onConfirm,
            child: Text(
              confirmText ?? S.current.confirm,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
          ),
        ],
      ),
    );
  }

  static Future<void> showLanguagePicker(BuildContext context, {required String title}) {
    LanguageType language = LocaleUtility.locale.value.languageCode == 'vi' ? LanguageType.vietnamese : LanguageType.english;
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        insetPadding: const EdgeInsets.all(24),
        contentPadding: const EdgeInsets.all(24).copyWith(bottom: 0),
        actionsPadding: const EdgeInsets.all(24).copyWith(top: 0),
        titlePadding: const EdgeInsets.all(24).copyWith(bottom: 0),
        backgroundColor: Theme.of(context).colorScheme.background,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        content: SizedBox(
          width: 600,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.displaySmall?.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              8.hSpace,
              LanguageDialog(
                onChange: (value) {
                  language = value;
                },
                initLanguage: language,
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              S.current.cancel,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(context).colorScheme.error,
                  ),
            ),
          ),
          TextButton(
            onPressed: () {
              final languageCode = language == LanguageType.vietnamese ? 'vi' : 'en';
              LocaleUtility.saveLocale(languageCode);
              LocaleUtility.locale.value = Locale(languageCode);
              Navigator.pop(context);
            },
            child: Text(
              S.current.confirm,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}

class LanguageDialog extends StatefulWidget {
  final Function(LanguageType language) onChange;
  final LanguageType initLanguage;
  const LanguageDialog({
    super.key,
    required this.onChange,
    required this.initLanguage,
  });

  @override
  State<LanguageDialog> createState() => _LanguageDialogState();
}

class _LanguageDialogState extends State<LanguageDialog> {
  late LanguageType type;

  @override
  void initState() {
    type = widget.initLanguage;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    const values = LanguageType.values;
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(
        values.length,
        (index) {
          final language = values[index];
          return RadioListTile(
            value: language,
            groupValue: type,
            onChanged: (value) {
              type = language;
              setState(() {});
              widget.onChange.call(type);
            },
            title: Text(
              language.toString(),
            ),
          );
        },
      ),
    );
  }
}
