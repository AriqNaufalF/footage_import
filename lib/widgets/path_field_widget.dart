import 'package:file_selector/file_selector.dart';
import 'package:flutter/material.dart';

class PathField extends StatefulWidget {
  const PathField({
    super.key,
    required this.fieldLabel,
    required this.fieldHint,
    required this.controller,
    this.fieldWidth = 326,
  });

  final String fieldLabel;
  final String fieldHint;
  final TextEditingController controller;
  final double fieldWidth;

  @override
  State<PathField> createState() => _PathFieldState();
}

class _PathFieldState extends State<PathField> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller;
  }

  void _selectDir() async {
    String? selectedDirectory = await getDirectoryPath();

    if (selectedDirectory == null) return;

    _controller.value = TextEditingValue(
      text: selectedDirectory,
      selection: TextSelection.collapsed(offset: selectedDirectory.length),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: widget.fieldWidth,
              child: TextField(
                controller: _controller,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  labelText: widget.fieldLabel,
                  hintText: widget.fieldHint,
                ),
              ),
            ),
            const SizedBox(
              width: 16,
            ),
            InputChip(
              label: const Text('...'),
              onPressed: _selectDir,
            ),
          ],
        ),
      ],
    );
  }
}
