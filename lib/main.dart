import 'package:clean_project/core/utils/theme.dart' as customTheme;
import 'presentation/pages/list_users/list_users_page.dart';
import 'package:flutter/material.dart';
import 'package:global_configuration/global_configuration.dart';
import 'injection_container.dart' as ic;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ic.init();
  await GlobalConfiguration().loadFromAsset('configurations');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: customTheme.mainTheme,
      home: ListUsersPage(),
    );
  }
}
