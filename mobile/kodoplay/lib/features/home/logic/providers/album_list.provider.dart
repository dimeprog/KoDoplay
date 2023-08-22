import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kodoplay/features/home/data/home_repository.dart';

final albumListProvider = FutureProvider.autoDispose((ref) {
  return ref.watch(homeRepoProvider).fetchAlbums();
});
