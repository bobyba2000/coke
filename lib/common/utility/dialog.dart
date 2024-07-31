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
                color: Theme.of(context).colorScheme.onPrimary,
              ),
        ),
        content: Text(
          message,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(context).colorScheme.onPrimary,
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
                    color: Colors.white,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
