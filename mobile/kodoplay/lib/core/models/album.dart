// To parse this JSON data, do
//
//     final album = albumFromJson(jsonString);

import 'dart:convert';

Album albumFromJson(String str) => Album.fromJson(json.decode(str));

String albumToJson(Album data) => json.encode(data.toJson());

class Album {
  String? albumType;
  int? totalTracks;
  String? id;
  List<Image>? images;
  String? name;
  String? releaseDate;
  List<String>? genres;
  String? label;
  int? popularity;
  List<Artist>? artists;
  Tracks? tracks;

  Album({
    required this.albumType,
    required this.totalTracks,
    required this.id,
    required this.images,
    required this.name,
    required this.releaseDate,
    required this.genres,
    required this.label,
    required this.popularity,
    required this.artists,
    required this.tracks,
  });

  factory Album.fromJson(Map<String, dynamic> json) => Album(
        albumType: json["album_type"],
        totalTracks: json["total_tracks"],
        id: json["id"],
        images: List<Image>.from(json["images"].map((x) => Image.fromJson(x))),
        name: json["name"],
        releaseDate: json["release_date"],
        genres: List<String>.from(json["genres"].map((x) => x)),
        label: json["label"],
        popularity: json["popularity"],
        artists:
            List<Artist>.from(json["artists"].map((x) => Artist.fromJson(x))),
        tracks: Tracks.fromJson(json["tracks"]),
      );

  Map<String, dynamic> toJson() => {
        "album_type": albumType,
        "total_tracks": totalTracks,
        "id": id,
        "images": List<dynamic>.from(images!.map((x) => x.toJson())),
        "name": name,
        "release_date": releaseDate,
        "genres": List<dynamic>.from(genres!.map((x) => x)),
        "label": label,
        "popularity": popularity,
        "artists": List<dynamic>.from(artists!.map((x) => x.toJson())),
        "tracks": tracks!.toJson(),
      };
}

class Artist {
  List<String>? genres;
  String id;
  List<Image>? images;
  String? name;
  int? popularity;
  String? type;

  Artist({
    required this.genres,
    required this.id,
    required this.images,
    required this.name,
    required this.popularity,
    required this.type,
  });

  factory Artist.fromJson(Map<String, dynamic> json) => Artist(
        genres: json["genres"] == null
            ? null
            : List<String>.from(json["genres"].map((x) => x)),
        id: json["id"],
        images: json["images"] == null
            ? null
            : List<Image>.from(json["images"].map((x) => Image.fromJson(x))),
        name: json["name"],
        popularity: json["popularity"],
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "genres":
            genres == null ? null : List<dynamic>.from(genres!.map((x) => x)),
        "id": id,
        "images": images == null
            ? null
            : List<dynamic>.from(images!.map((x) => x.toJson())),
        "name": name,
        "popularity": popularity,
        "type": type,
      };
}

class Followers {
  String href;
  int total;

  Followers({
    required this.href,
    required this.total,
  });

  factory Followers.fromJson(Map<String, dynamic> json) => Followers(
        href: json["href"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "href": href,
        "total": total,
      };
}

class Image {
  String url;
  int height;
  int width;

  Image({
    required this.url,
    required this.height,
    required this.width,
  });

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        url: json["url"],
        height: json["height"],
        width: json["width"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "height": height,
        "width": width,
      };
}

class Tracks {
  String? href;
  int? limit;
  String? next;
  int? offset;
  String? previous;
  int? total;
  List<Item>? items;

  Tracks({
    required this.href,
    required this.limit,
    required this.next,
    required this.offset,
    required this.previous,
    required this.total,
    required this.items,
  });

  factory Tracks.fromJson(Map<String, dynamic> json) => Tracks(
        href: json["href"],
        limit: json["limit"],
        next: json["next"],
        offset: json["offset"],
        previous: json["previous"],
        total: json["total"],
        items: json["items"] == null
            ? null
            : List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "href": href,
        "limit": limit,
        "next": next,
        "offset": offset,
        "previous": previous,
        "total": total,
        "items": items == null
            ? null
            : List<dynamic>.from(items!.map((x) => x.toJson())),
      };
}

class Item {
  // List<LinkedFrom> artists;
  int? discNumber;
  int? durationMs;
  bool? explicit;
  String? href;
  String? id;
  bool? isPlayable;
  String? name;
  int? trackNumber;
  String? type;
  bool? isLocal;
  final String uri;

  Item({
    // required this.artists,

    required this.discNumber,
    required this.durationMs,
    required this.explicit,
    required this.href,
    required this.id,
    required this.isPlayable,
    required this.name,
    required this.trackNumber,
    required this.type,
    required this.isLocal,
    required this.uri,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        // artists: List<LinkedFrom>.from(
        //     json["artists"].map((x) => LinkedFrom.fromJson(x))),
        discNumber: json["disc_number"],
        durationMs: json["duration_ms"],
        explicit: json["explicit"],
        href: json["href"],
        id: json["id"],
        isPlayable: json["is_playable"],
        name: json["name"],
        trackNumber: json["track_number"],
        type: json["type"],
        isLocal: json["is_local"],
      uri: json['uri']
      );

  Map<String, dynamic> toJson() => {
        // "artists": List<dynamic>.from(artists.map((x) => x.toJson())),
        "disc_number": discNumber,
        "duration_ms": durationMs,
        "explicit": explicit,
        "href": href,
        "id": id,
        "is_playable": isPlayable,
        "name": name,
        "track_number": trackNumber,
        "type": type,
        "is_local": isLocal,
        "uri":uri
      };
}

class LinkedFrom {
  String href;
  String id;
  String? name;
  String type;
  String uri;

  LinkedFrom({
    required this.href,
    required this.id,
    this.name,
    required this.type,
    required this.uri,
  });

  factory LinkedFrom.fromJson(Map<String, dynamic> json) => LinkedFrom(
        href: json["href"],
        id: json["id"],
        name: json["name"],
        type: json["type"],
        uri: json["uri"],
      );

  Map<String, dynamic> toJson() => {
        "href": href,
        "id": id,
        "name": name,
        "type": type,
        "uri": uri,
      };
}
