import 'package:flutter/material.dart';
import 'package:footage_import/widgets/section_card.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // TODO: Get path value after selection
  final _imgSrc = TextEditingController();
  final _imgDest = TextEditingController();
  final _videoSrc = TextEditingController();
  final _videoDest = TextEditingController();
  @override
  Widget build(BuildContext context) {
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
                  imageIcon: 'assets/images/gallery.png',
                  firstFieldController: _imgSrc,
                  secondFieldController: _imgDest,
                  fieldHint: 'Images directory path',
                ),
                FilledButton(
                    style: FilledButton.styleFrom(
                        minimumSize: const Size(172, 51)),
                    // TODO: Import all footage when button click
                    onPressed: () {},
                    child: const Text('Import All')),
                SectionCard(
                  imageIcon: 'assets/images/video_files.png',
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
