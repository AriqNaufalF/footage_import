import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:footage_import/bloc/importer_cubit.dart';
import 'package:footage_import/pages/settings_page.dart';
import 'package:footage_import/widgets/import_card_widget.dart';
import 'package:footage_import/widgets/outlined_card_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _imgSrc = TextEditingController();
  final _videoSrc = TextEditingController();
  final _dest = TextEditingController();

  @override
  void initState() {
    super.initState();
    var state = context.read<ImporterCubit>().state;
    _imgSrc.addListener(() => state.imgSrc = _imgSrc.text);
    _videoSrc.addListener(() => state.videoSrc = _videoSrc.text);
    _dest.addListener(() => state.finalDest = _dest.text);
  }

  @override
  void dispose() {
    super.dispose();
    _imgSrc.dispose();
    _videoSrc.dispose();
    _dest.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double breakPoint = 884;

        if (constraints.maxWidth < breakPoint) {
          return _buildNarrowContainer(_imgSrc, _videoSrc, _dest);
        } else {
          return _buildWideContainer(context, _imgSrc, _videoSrc, _dest);
        }
      },
    );
  }

  Widget _buildNarrowContainer(
    TextEditingController firstFieldController,
    TextEditingController secondFieldController,
    TextEditingController thirdFieldController,
  ) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Easily Import Your Footage File To Your PC'),
          bottom: const TabBar(tabs: [
            Tab(icon: Icon(Icons.home)),
            Tab(icon: Icon(Icons.settings))
          ]),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8),
          child: TabBarView(
            children: [
              Center(
                child: ImportCard(
                  firstFieldController: firstFieldController,
                  secondFieldController: secondFieldController,
                  thirdFieldController: thirdFieldController,
                  onImport: () => context.read<ImporterCubit>().importAll(),
                ),
              ),
              const SettingPage(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildWideContainer(
    BuildContext context,
    TextEditingController firstFieldController,
    TextEditingController secondFieldController,
    TextEditingController thirdFieldController,
  ) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Center(
              child: Text(
                'Easily Import Your Footage File To Your PC',
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .headlineLarge
                    ?.copyWith(fontWeight: FontWeight.w500),
              ),
            ),
            Container(
              constraints: const BoxConstraints(maxWidth: 1024),
              child: OutlinedCard(
                child: Row(
                  children: [
                    ImportCard(
                      margin: EdgeInsets.zero,
                      firstFieldController: firstFieldController,
                      secondFieldController: secondFieldController,
                      thirdFieldController: thirdFieldController,
                      onImport: () => context.read<ImporterCubit>().importAll(),
                    ),
                    const Spacer(),
                    Container(
                      constraints: const BoxConstraints(maxWidth: 424),
                      child: SettingPage(
                        label: Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Text(
                              'Settings',
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const Spacer(),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
