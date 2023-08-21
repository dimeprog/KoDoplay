import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:kodoplay/core/constants/endpoints.dart';
import 'package:kodoplay/core/constants/keys.dart';
import 'package:kodoplay/core/services/local_storage_service.dart';

final tokenServiceProvider = Provider((ref) {
  return TokenService();
});

class TokenService {
  
  /// get token from local storage
  /// if token is not available, request for new token
  /// if token is available, check if token is expired
  /// if token is expired, request for new token
  Future<String> getToken() async {
    final espTiime = LocalStorageSevice.getTokenExpireTime();
    if (!LocalStorageSevice.isTokenExist || DateTime.now().isAfter(espTiime!)) {
      await requestToken();
    }
    return LocalStorageSevice.getToken()!;
  }

  /// request for spotify token
  Future<String> requestToken() async {
    final url = Uri.parse(EndPoint.getTokenUrl);
    final header = {
      'Content-Type': 'application/x-www-form-urlencoded',
    };
    final body = {
      'grant_type': 'client_credentials',
      'client_id': CLIENT_ID,
      'client_secret': CLIENT_SECRET,
    };

    try {
      
      final response = await http.post(url, headers: header, body: body);
      if (response.statusCode == 200) {
        final parsed = json.decode(response.body);
        await LocalStorageSevice.saveToken(parsed['access_token']);
        await LocalStorageSevice.saveTokenExpireTime();
        return parsed['access_token'];
      } else {
        final parsed = json.decode(response.body);
        throw ('status code: ${response.statusCode}, data: $parsed');
      }
    } on SocketException catch (_) {
      throw Exception('No Internet Connection');
    } on TimeoutException catch (_) {
      throw Exception('Connection Timeout,try again');
    } on FormatException catch (err) {
      throw Exception(err.message);
    } catch (err) {
      throw Exception(err.toString());
    }
  }
}
