import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kodoplay/features/details/data/detail_repository.dart';

import '../../../core/models/album.dart';

final trackProvider = FutureProvider.family<Tracks, String>((ref, id) {
  return ref.read(detailRepositoryProvider).fetchAlbumTracks(id);
});
