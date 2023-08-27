import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:footage_import/bloc/settings_cubit.dart';
import 'package:footage_import/widgets/setting_tile_widget.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key, this.label});

  final Widget? label;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SettingsCubit, SettingsState>(
      listener: (context, state) {
        if (!state.isFileGrouping) {
          context.read<SettingsCubit>().setIsRawGrouping(false);
        }
      },
      builder: (context, state) {
        return Column(
          children: [
            if (label != null) label!,
            SettingTile(
              title: 'File grouping',
              subtitle: 'Split photo and video files into different folders.',
              value: state.isFileGrouping,
              onChanged: (value) =>
                  context.read<SettingsCubit>().setIsFileGrouping(value),
            ),
            SettingTile(
              enabled: state.isFileGrouping,
              opacity: state.isFileGrouping ? 1 : 0.75,
              title: 'RAW grouping',
              subtitle:
                  'Split compressed and uncompressed photos into separate folders.',
              value: state.isRawGrouping,
              onChanged: (value) =>
                  context.read<SettingsCubit>().setIsRawGrouping(value),
            ),
          ],
        );
      },
    );
  }
}
