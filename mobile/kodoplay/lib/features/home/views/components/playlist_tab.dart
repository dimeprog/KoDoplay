import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kodoplay/core/services/token_service.dart';

class PlaylistTab extends HookConsumerWidget {
  const PlaylistTab({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
        child: Center(
      child: ElevatedButton(
        onPressed: () {
          TokenService().getToken();
        },
        child: const Text('load token'),
      ),
    ));
  }
}
