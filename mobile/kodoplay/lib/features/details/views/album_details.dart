import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:just_audio/just_audio.dart';
import 'package:kodoplay/core/services/audio_player_service.dart';
import 'package:kodoplay/features/details/logic/track_provider.dart';

import '../../../core/models/album.dart';

class AlbumDetail extends HookConsumerWidget {
  final String albumId;
  final String url;
  const AlbumDetail({super.key, required this.albumId, required this.url});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final detailAsync = ref.watch(trackProvider(albumId));
    return Scaffold(
      body: detailAsync.when(
        data: (details) {
          return SizedBox(
            child: Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.3,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(url),
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: details.items!.length,
                    itemBuilder: (context, index) {
                      final item = details.items![index];
                      return TrackTile(
                        item: item,
                        index: index,
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
        error: (error, stackTrace) => Center(
          child: Text(error.toString()),
        ),
        loading: () => const Center(
          child: CircularProgressIndicator.adaptive(),
        ),
      ),
    );
  }
}

class TrackTile extends ConsumerWidget {
  final Item item;
  final int index;
  const TrackTile({
    super.key,
    required this.item,
    required this.index,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final curTrack = ref.watch(currentTrackProvider);
    final audioPlayer = ref.watch(audioPlayerProvider);
    return Container(
      margin: const EdgeInsets.all(8.0),
      height: 100.h,
      padding: EdgeInsets.all(8.h),
      decoration: BoxDecoration(
        color: Theme.of(context).iconTheme.color,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: ListTile(
        autofocus: true,
        title: Text(item.name!),
        subtitle: Text(item.type!),
        trailing: IconButton(
          icon: curTrack == index
              ? const Icon(Icons.pause)
              : const Icon(Icons.play_arrow),
          onPressed: () {
            if (item.uri.isEmpty) return;
            ref.read(currentTrackProvider.notifier).update((state) => index);

            if (curTrack == index && audioPlayer.playing) {
              audioPlayer.pause();
              ref.read(currentTrackProvider.notifier).update((state) => -1);
              return;
            }
            audioPlayer.setUrl(item.uri);
            final audioSource = AudioSource.uri(
              Uri.parse(item.uri),
              tag: item.id.toString(),
            );
            audioPlayer.setAudioSource(audioSource);
            audioPlayer.play();
          },
        ),
      ),
    );
  }
}
