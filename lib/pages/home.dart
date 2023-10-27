import '../widgets/racelist.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Formula 1",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.red,
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
        textTheme: GoogleFonts.titilliumWebTextTheme().copyWith(
          titleMedium: const TextStyle(color: Colors.white),
          bodySmall: const TextStyle(color: Colors.white),
          titleLarge: const TextStyle(color: Colors.white),
        ),
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Formula 1"),
          titleTextStyle: Theme.of(context).textTheme.titleLarge,
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        ),
        backgroundColor: Theme.of(context).colorScheme.background,
        body: Container(
          margin: const EdgeInsets.all(16),
          // This allows the Column to take up all available vertical space
          constraints: const BoxConstraints.expand(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                child: Text(
                  "Races (2023)",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
              const Expanded(child: RaceList()),
            ],
          ),
        ));
  }
}
