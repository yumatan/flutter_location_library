import 'package:flutter/material.dart';
import 'package:flutter_location_library/location_data_provider.dart';
import 'package:flutter_location_library/location_page.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:location/location.dart';

void main() {
  runApp(
    const ProviderScope(
      child: LocationApp(),
    ),
  );
}

class LocationApp extends ConsumerStatefulWidget {
  const LocationApp({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LocationAppState();
}

class _LocationAppState extends ConsumerState<LocationApp> {
  final Location location = Location();

  @override
  void initState() {
    super.initState();

    location.onLocationChanged.listen((currentLocation) {
      ref.read(locationDataProvider.notifier).state = currentLocation;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const StartPage(),
    );
  }
}

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Start Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FilledButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const LocationPage(),
                  ),
                );
              },
              child: const Text('Location Page'),
            ),
          ],
        ),
      ),
    );
  }
}
