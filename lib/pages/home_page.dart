import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:footage_import/bloc/importer_cubit.dart';
import 'package:footage_import/widgets/section_card_widget.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _imgSrc = TextEditingController();
  final _imgDest = TextEditingController();
  final _videoSrc = TextEditingController();
  final _videoDest = TextEditingController();

  @override
  void initState() {
    super.initState();
    var state = context.read<ImporterCubit>().state;
    _imgSrc.addListener(() => state.imgSrc = _imgSrc.text);
    _imgDest.addListener(() => state.imgDest = _imgDest.text);
    _videoSrc.addListener(() => state.videoSrc = _videoSrc.text);
    _videoDest.addListener(() => state.videoDest = _videoDest.text);
  }

  @override
  Widget build(BuildContext context) {
    bool isDarkTheme = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 32),
              child: Text(
                'Easily Import Your Footage File To Your PC',
                style: Theme.of(context)
                    .textTheme
                    .headlineLarge
                    ?.copyWith(fontWeight: FontWeight.w500),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SectionCard(
                  imageIcon: isDarkTheme
                      ? 'assets/images/gallery_light.png'
                      : 'assets/images/gallery.png',
                  firstFieldController: _imgSrc,
                  secondFieldController: _imgDest,
                  fieldHint: 'Images directory path',
                ),
                FilledButton(
                    style: FilledButton.styleFrom(
                        minimumSize: const Size(172, 51)),
                    onPressed: () => context.read<ImporterCubit>().importAll(),
                    child: const Text('Import All')),
                SectionCard(
                  imageIcon: isDarkTheme
                      ? 'assets/images/video_files_light.png'
                      : 'assets/images/video_files.png',
                  firstFieldController: _videoSrc,
                  secondFieldController: _videoDest,
                  fieldHint: 'Videos directory path',
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: IconButton(
                // TODO: Move to settings page
                onPressed: () {},
                icon: const Icon(Icons.settings),
              ),
            )
          ],
        ),
      ),
    );
  }
}