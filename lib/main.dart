import 'package:ass2/core/services/injectable_service.dart';
import 'package:ass2/core/services/theme_service.dart';
import 'package:ass2/presentation/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ThemeService()..loadTheme(),
      builder: (context, child) {
        final themeProvider = context.watch<ThemeService>();

        return MaterialApp(
          title: 'Flutter Demo',
          theme: themeProvider.themeData,
          home: const HomeView(),
        );
      },
    );
  }
}
