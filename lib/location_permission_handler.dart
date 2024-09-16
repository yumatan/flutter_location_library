import 'package:permission_handler/permission_handler.dart';

enum LocationPermissionStatus {
  granted,
  denied,
  permanentlyDenied,
  restricted,
}

class LocationPermissionsHandler {
  Future<bool> get isGranted async {
    final status = await Permission.location.status;
    return switch (status) {
      PermissionStatus.granted => true,
      PermissionStatus.limited => true,
      _ => false,
    };
  }

  Future<bool> get isAlwaysGranted {
    return Permission.locationAlways.isGranted;
  }

  Future<LocationPermissionStatus> request() async {
    final status = await Permission.location.request();
    return switch (status) {
      PermissionStatus.granted => LocationPermissionStatus.granted,
      PermissionStatus.denied => LocationPermissionStatus.denied,
      PermissionStatus.limited => LocationPermissionStatus.permanentlyDenied,
      PermissionStatus.permanentlyDenied =>
        LocationPermissionStatus.permanentlyDenied,
      PermissionStatus.restricted => LocationPermissionStatus.restricted,
      _ => LocationPermissionStatus.denied,
    };
  }
}
