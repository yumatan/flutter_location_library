import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:location/location.dart';

final locationDataProvider = StateProvider((ref) => LocationData.fromMap({}));
