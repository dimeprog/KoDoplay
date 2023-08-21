import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kodoplay/features/home/views/components/album_tab.dart';
import 'package:kodoplay/features/home/views/components/playlist_tab.dart';
import 'package:kodoplay/utils/app_extension.dart';
import 'package:kodoplay/utils/custom_widget.dart';


class HomePage extends HookConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = useTextEditingController();
   
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'KoDoPlay',
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: Theme.of(context).primaryColor,
                ),
          ),
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  CupertinoIcons.search,
                )),
          ],
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Find the best music\nfor your banger',
                style: Theme.of(context)
                    .textTheme
                    .displayMedium!
                    .copyWith(
                      fontWeight: FontWeight.w500,
                      color: Theme.of(context).iconTheme.color,
                    ),
              ),
              20.sH,
              SizedBox(
                height: 50.h,
                child: customField(
                  controller: controller,
                  hint: 'Search',
                  icon: CupertinoIcons.search,
                  obscure: false,
                  type: TextInputType.text,
                ),
              ),
              20.sH,
              TabBar(
                  labelColor: Theme.of(context).primaryColor,
                  unselectedLabelColor: Theme.of(context).disabledColor,
                  indicatorColor: Theme.of(context).primaryColor,
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicatorWeight: 1.0,
                  tabs: const [
                    Tab(
                      text: 'Playlists',
                    ),
                    Tab(
                      text: 'Albums',
                    ),
                  ]),
              const Expanded(
                child: TabBarView(
                  children: [
                    PlaylistTab(),
                    AlbumTab(),
                  ],
                ),
              ),

            
            ],
          ),
        ),
      ),
    );
  }
}
