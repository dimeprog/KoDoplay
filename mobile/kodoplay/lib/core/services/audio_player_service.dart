import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:just_audio/just_audio.dart';

final audioPlayerProvider = Provider((ref) => AudioPlayer());

final currentTrackProvider = StateProvider((ref) => -1);
