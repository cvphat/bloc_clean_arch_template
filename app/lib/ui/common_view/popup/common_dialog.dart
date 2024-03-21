import 'package:flutter/material.dart';

class CommonDialog extends StatelessWidget {
  const CommonDialog({
    this.actions = const <TextButton>[],
    this.title,
    this.message,
    super.key,
  });

  final List<TextButton> actions;
  final String? title;
  final String? message;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      actions: actions,
      title: title != null
          ? Text(
              title ?? '',
              // style: AppTextStyles.s14w400Primary(),
            )
          : null,
      content: message != null
          ? Text(
              message ?? '',
              // style: AppTextStyles.s14w400Primary(),
            )
          : null,
    );
  }
}
