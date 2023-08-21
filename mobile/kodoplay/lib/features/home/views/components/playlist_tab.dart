import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kodoplay/core/services/spotify_album_service.dart';
import '../../../../utils/app_theme.dart';


class PlaylistTab extends HookConsumerWidget {
  const PlaylistTab({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(appThemeProvider);
    return Container(
        child: Center(
      child: Column(
        children: [
          // Switch.adaptive(
          //       value: themeMode == ThemeMode.dark,
          //       onChanged: (val) {
          //         ref.read(appThemeProvider.notifier).toggleTheme();
          //       }),
          ElevatedButton(
            onPressed: () {
              ref.read(spotifyAlbumServiceProvider).getAlbums();
            },
            child: const Text('load token'),
          ),
        ],
      ),
    ));
  }
}
