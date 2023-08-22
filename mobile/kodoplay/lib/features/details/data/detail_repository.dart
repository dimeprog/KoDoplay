import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kodoplay/core/services/spotify_album_service.dart';

import '../../../core/models/album.dart';
final detailRepositoryProvider= Provider((ref) {
  return  DetailRepository(albumService: ref.read(spotifyAlbumServiceProvider));
});


class DetailRepository {
  final SpotifyAlbumService albumService;
  DetailRepository({required this.albumService});

  Future<Tracks> fetchAlbumTracks(String id) async {
    try {
      return await albumService.getAlbumsTracks(id);
    } catch (e) {
      rethrow;
    }
  }
}
