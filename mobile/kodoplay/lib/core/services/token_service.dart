import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:kodoplay/core/constants/endpoints.dart';
import 'package:kodoplay/core/constants/keys.dart';

final tokenServiceProvider = Provider((ref) {
  return TokenService();
});

class TokenService {
  /// get spotify token
  Future<String> getToken() async {
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
        debugPrint(parsed['access_token']);
        return parsed['access_token'];
      } else {
        final parsed = json.decode(response.body);
        return ('status code: ${response.statusCode}, data: $parsed');
      }
    } catch (e) {
      debugPrint(e.toString());
      throw Exception('Error while fetching token');
    }
  }
}
