import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_location_library/location_data_provider.dart';
import 'package:flutter_location_library/location_permission_handler.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:location/location.dart';

class LocationPage extends HookConsumerWidget {
  const LocationPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locationData = ref.watch(locationDataProvider);

    useEffect(() {
      LocationPermissionsHandler().isGranted.then((isGranted) {
        if (!isGranted) {
          LocationPermissionsHandler().request();
        }
      });
      return null;
    }, []);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Location Page'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Location Page'),
            Text(locationData.latitude.toString()),
            Text(locationData.longitude.toString()),
            FilledButton(
              onPressed: () async {
                final locationData = await Location().getLocation();
                ref.read(locationDataProvider.notifier).state = locationData;

                //     LocationData.fromMap({
                //   'latitude': 35.0,
                //   'longitude': 135.0,
                // });
              },
              child: const Text('get location'),
            ),
          ],
        ),
      ),
    );
  }
}
