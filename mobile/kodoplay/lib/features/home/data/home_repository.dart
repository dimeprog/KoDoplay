import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kodoplay/core/models/album.dart';
import 'package:kodoplay/core/services/spotify_album_service.dart';

class HomeRepository {
  final SpotifyAlbumService albumService;
  HomeRepository({required this.albumService});

  /// get albums- list of albums
  Future<List<Album>> fetchAlbums() async {
    try {
      return await albumService.getAlbums();
    } catch (e) {
      rethrow;
    }
  }
}

final homeRepoProvider = Provider(
  (ref) => HomeRepository(
    albumService: ref.read(spotifyAlbumServiceProvider),
  ),
);
