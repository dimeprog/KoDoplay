import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:kodoplay/core/constants/endpoints.dart';
import 'package:kodoplay/core/services/token_service.dart';

import '../constants/app_logger.dart';
import '../models/album.dart';

final spotifyAlbumServiceProvider = Provider((ref) {
  return SpotifyAlbumService(tokenService: ref.read(tokenServiceProvider));
});

class SpotifyAlbumService {
  final TokenService tokenService;

  SpotifyAlbumService({required this.tokenService});

  /// get list Abum from Spotify API
  Future<List<Album>> getAlbums() async {
    final path =
        '${EndPoint.baseUrl}${EndPoint.getAlbumsUrl}?ids=382ObEPsp2rxGrnsizN5TX%2C1A2GTWGtFfWp7KSQTwWOyo%2C2noRn2Aes5aoNVsU6iWThc';
    final url = Uri.parse(path);

    try {
      final header = {
        'Authorization': ' Bearer ${await tokenService.getToken()}'
      };
      final response = await http.get(
        url,
        headers: header,
      );
      if (response.statusCode == 200) {
        final parsed = json.decode(response.body);
        logger.d(parsed['albums']);
        final data = List<dynamic>.from(parsed['albums']);
        return data.map((e) => Album.fromJson(e)).toList();
      } else {
        // debugPrint(response.body);
        throw Exception('Error while fetching albums');
      }
    } on SocketException catch (_) {
      throw Exception('No Internet Connection');
    } on TimeoutException catch (_) {
      throw Exception('Connection Timeout,try again');
    } on FormatException catch (err) {
      throw Exception(err.message);
    } catch (err, stacktrace) {
      debugPrint(stacktrace.toString());
      throw Exception(err.toString());
    }
  }

  /// get album tracks
  Future<Tracks> getAlbumsTracks(String id) async {
    final path = '${EndPoint.baseUrl}${EndPoint.getAlbumsUrl}/$id/tracks';
    final url = Uri.parse(path);

    try {
      final header = {
        'Authorization': ' Bearer ${await tokenService.getToken()}'
      };
      final response = await http.get(
        url,
        headers: header,
      );
      if (response.statusCode == 200) {
        final parsed = json.decode(response.body);
        logger.d(parsed);

        return Tracks.fromJson(parsed);
      } else {
        // debugPrint(response.body);
        throw Exception('Error while fetching albums');
      }
    } on SocketException catch (_) {
      throw Exception('No Internet Connection');
    } on TimeoutException catch (_) {
      throw Exception('Connection Timeout,try again');
    } on FormatException catch (err) {
      throw Exception(err.message);
    } catch (err, stacktrace) {
      debugPrint(stacktrace.toString());
      throw Exception(err.toString());
    }
  }
}
