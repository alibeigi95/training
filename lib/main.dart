import 'package:flutter/material.dart';

import 'pages/switch_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.tealAccent),
          useMaterial3: true,
          /* fontFamily: 'WalgreensScript',
          textTheme: Theme.of(context).textTheme.apply(
                fontFamily: 'WalgreensScript',
              ),*/
        ),
        home: const SwitchListScreen(),
      );
}

//https://wallpapercave.com/land-rover-defender-wallpapers
