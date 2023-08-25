import 'package:file_selector/file_selector.dart';
import 'package:flutter/material.dart';

class PathField extends StatefulWidget {
  const PathField(
      {super.key,
      required this.fieldLabel,
      required this.fieldHint,
      required this.controller});

  final String fieldLabel;
  final String fieldHint;
  final TextEditingController controller;

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

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _selectDir() async {
    String? selectedDirectory = await getDirectoryPath();

    if (selectedDirectory == null) return;

    _controller.value = TextEditingValue(
        text: selectedDirectory,
        selection: TextSelection.collapsed(offset: selectedDirectory.length));
  }

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Expanded(
          flex: 1,
          child: Text(
            widget.fieldLabel,
            style: Theme.of(context).textTheme.titleMedium,
          )),
      Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: 268,
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
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
      )
    ]);
  }
}
