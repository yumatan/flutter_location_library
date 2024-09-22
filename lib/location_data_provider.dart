import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:location/location.dart';

final locationDataProvider = StateProvider((ref) => LocationData.fromMap({
      'latitude': 35.360652,
      'longitude': 138.727323,
    }));
