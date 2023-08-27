import 'package:flutter/material.dart';
import 'package:footage_import/widgets/setting_tile_widget.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key, this.label});

  final Widget? label;
  @override
  State<SettingPage> createState() => SettingPageState();
}

class SettingPageState extends State<SettingPage> {
  bool _isFileGrouping = true;
  bool _isRawGrouping = true;

  @override
  Widget build(BuildContext context) {
    var widgets = <Widget>[
      SettingTile(
        title: 'File grouping',
        subtitle: 'Split photo and video files into different folders.',
        value: _isFileGrouping,
        onChanged: (value) => setState(() {
          _isFileGrouping = value;
        }),
      ),
      SettingTile(
        title: 'RAW grouping',
        subtitle:
            'Split compressed and uncompressed photos into separate folders.',
        value: _isRawGrouping,
        onChanged: (value) => setState(() {
          _isRawGrouping = value;
        }),
      ),
    ];

    if (widget.label != null) {
      widgets.insert(0, widget.label!);
    }

    return Column(
      children: widgets,
    );
  }
}
