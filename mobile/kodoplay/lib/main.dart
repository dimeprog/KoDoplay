import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kodoplay/core/services/local_storage_service.dart';
import 'package:kodoplay/kodoplay.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  LocalStorageSevice.initialize();
  // await LocalStorageSevice.saveTokenExpireTime();
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const KoDoPlay();
  }
}
