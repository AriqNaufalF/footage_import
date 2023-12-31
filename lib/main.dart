import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:footage_import/bloc/importer_cubit.dart';
import 'package:footage_import/bloc/settings_cubit.dart';
import 'package:footage_import/pages/home_page.dart';
import 'package:footage_import/themes/color_schemes.g.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ImporterCubit>(create: (_) => ImporterCubit()),
        BlocProvider<SettingsCubit>(create: (_) => SettingsCubit())
      ],
      child: MaterialApp(
        theme: ThemeData(useMaterial3: true, colorScheme: lightColorScheme),
        darkTheme: ThemeData(useMaterial3: true, colorScheme: darkColorScheme),
        home: const HomePage(),
        builder: EasyLoading.init(),
      ),
    );
  }
}
