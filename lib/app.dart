import 'package:alan_todo/presentation/view/home/home_view.dart';
import 'package:alan_todo/presentation/view/task_info/task_info_view.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AlanTodoApp extends HookConsumerWidget {
  const AlanTodoApp({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          useMaterial3: true,
          colorSchemeSeed: Colors.red,
          platform: TargetPlatform.iOS,
          inputDecorationTheme: InputDecorationTheme(
            border: OutlineInputBorder(),
            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          ),
          dialogTheme: DialogTheme(surfaceTintColor: Colors.transparent)),
      initialRoute: '/',
      routes: {
        '/': (context) => HomeView(),
        '/task': (context) => TaskInfoView(),
      },
    );
  }
}
