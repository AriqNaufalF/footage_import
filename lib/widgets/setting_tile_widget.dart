import 'package:flutter/material.dart';

class SettingTile extends StatelessWidget {
  const SettingTile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.value,
    required this.onChanged,
    this.enabled = true,
    this.opacity = 1,
  });

  final String title;
  final String subtitle;
  final bool value;
  final bool enabled;
  final double opacity;
  final void Function(bool)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: opacity,
      child: ListTile(
        enabled: enabled,
        title: Text(title),
        subtitle: Text(subtitle),
        trailing: Switch(value: value, onChanged: onChanged),
      ),
    );
  }
}
