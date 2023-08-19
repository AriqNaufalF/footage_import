import 'package:flutter/material.dart';
import 'package:footage_import/widgets/path_field.dart';

class SectionCard extends StatelessWidget {
  const SectionCard({
    super.key,
    required this.imageIcon,
    required this.firstFieldController,
    required this.secondFieldController,
    this.firstLabel = 'Source:',
    this.secondLabel = 'Destination:',
    this.fieldHint = 'Source path',
  });

  final String imageIcon;
  final String firstLabel;
  final String secondLabel;
  final String fieldHint;
  final TextEditingController firstFieldController;
  final TextEditingController secondFieldController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 487,
      height: 487,
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
            side: BorderSide(color: Theme.of(context).colorScheme.outline),
            borderRadius: const BorderRadius.all(Radius.circular(12))),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 18),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(imageIcon),
              const Spacer(),
              PathField(
                fieldLabel: firstLabel,
                fieldHint: fieldHint,
                controller: firstFieldController,
              ),
              const SizedBox(
                height: 16,
              ),
              PathField(
                fieldLabel: secondLabel,
                fieldHint: fieldHint,
                controller: secondFieldController,
              )
            ],
          ),
        ),
      ),
    );
  }
}
