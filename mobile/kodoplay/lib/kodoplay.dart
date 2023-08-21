import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kodoplay/utils/app_theme.dart';

import 'features/home/views/home_page.dart';

class KoDoPlay extends ConsumerStatefulWidget {
  const KoDoPlay({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _KoDoPlayState();
}

class _KoDoPlayState extends ConsumerState<KoDoPlay> {
  @override
  Widget build(BuildContext context) {
    final themeMode = ref.watch(appThemeProvider);
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, ch) => MaterialApp(
        title: 'KoDoPlay',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.light,
        darkTheme: AppTheme.dark,
        themeMode: themeMode,
        home: ch,
      ),
      child: const HomePage(),
    );
  }
}
