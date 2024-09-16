import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_location_library/location_permission_handler.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LocationPage extends HookConsumerWidget {
  const LocationPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useEffect(() {
      LocationPermissionsHandler().request();
      return null;
    }, []);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Location Page'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: const Center(
        child: Text('Location Page'),
      ),
    );
  }
}
