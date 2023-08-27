import 'package:flutter/material.dart';
import 'package:footage_import/widgets/outlined_card_widget.dart';
import 'package:footage_import/widgets/path_field_widget.dart';

class ImportCard extends StatelessWidget {
  const ImportCard({
    super.key,
    required this.firstFieldController,
    required this.secondFieldController,
    required this.thirdFieldController,
    this.margin,
    this.onImport,
  });

  final TextEditingController firstFieldController;
  final TextEditingController secondFieldController;
  final TextEditingController thirdFieldController;
  final EdgeInsets? margin;
  final VoidCallback? onImport;

  @override
  Widget build(BuildContext context) {
    bool isDarkTheme = Theme.of(context).brightness == Brightness.dark;
    return SizedBox(
      width: 424,
      height: 530,
      child: OutlinedCard(
        margin: margin,
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image.asset(
                isDarkTheme
                    ? 'assets/images/file_light.png'
                    : 'assets/images/file.png',
              ),
              Column(
                children: [
                  PathField(
                    fieldLabel: 'Photo source',
                    fieldHint: 'Directory path',
                    controller: firstFieldController,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  PathField(
                    fieldLabel: 'Video source',
                    fieldHint: 'Directory path',
                    controller: secondFieldController,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  PathField(
                    fieldLabel: 'Destination folder',
                    fieldHint: 'Directory path',
                    controller: thirdFieldController,
                  ),
                ],
              ),
              Align(
                alignment: Alignment.centerRight,
                child: FilledButton(
                  onPressed: onImport,
                  child: const Text('Import'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
