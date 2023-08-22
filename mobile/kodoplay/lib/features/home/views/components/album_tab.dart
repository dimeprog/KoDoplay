import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kodoplay/features/details/views/album_details.dart';
import 'package:kodoplay/features/home/logic/providers/album_list.provider.dart';

class AlbumTab extends HookConsumerWidget {
  const AlbumTab({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final albumsAsync = ref.watch(albumListProvider);
    return albumsAsync.when(
      data: (albums) {
        return AlignedGridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 10.w,
          crossAxisSpacing: 10.h,
          itemCount: albums.length,
          itemBuilder: (context, index) {
            final album = albums[index];
            return AlbumTile(
              key: ValueKey(album.id),
              id: album.id!,
              // title: album.name ?? album.label!,
              url: album.images![0].url,
            );
          },
        );
      },
      error: (e, _) => Center(child: Text(e.toString())),
      loading: () => const Center(
        child: CircularProgressIndicator.adaptive(),
      ),
    );
  }
}

class AlbumTile extends StatelessWidget {
  final String id;
  final String url;
  const AlbumTile({
    super.key,
    required this.id,
    required this.url,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => AlbumDetail(albumId:id , url: url,),
          ),
        );
      },
      child: Container(
        height: 170.h,
        width: 170.w,
        margin: EdgeInsets.only(top: 20.h),
        decoration: BoxDecoration(
          // color: Colors.white,
          shape: BoxShape.circle,
          image: DecorationImage(
            fit: BoxFit.contain,
            image: NetworkImage(url),
          ),
        ),
        // child: Center(
        // child: Text(
        //   title,
        //   style: Theme.of(context)
        //       .textTheme
        //       .bodyLarge!
        //       .copyWith(color: Theme.of(context).primaryColor),
        // ),
        // ),
      ),
    );
  }
}
