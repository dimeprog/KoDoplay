// To parse this JSON data, do
//
//     final playList = playListFromJson(jsonString);

import 'dart:convert';

PlayList playListFromJson(String str) => PlayList.fromJson(json.decode(str));

String playListToJson(PlayList data) => json.encode(data.toJson());

class PlayList {
  String message;
  Playlists playlists;

  PlayList({
    required this.message,
    required this.playlists,
  });

  factory PlayList.fromJson(Map<String, dynamic> json) => PlayList(
        message: json["message"],
        playlists: Playlists.fromJson(json["playlists"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "playlists": playlists.toJson(),
      };
}

class Playlists {
  String href;
  int limit;
  dynamic next;
  int offset;
  dynamic previous;
  int total;
  List<Item> items;

  Playlists({
    required this.href,
    required this.limit,
    required this.next,
    required this.offset,
    required this.previous,
    required this.total,
    required this.items,
  });

  factory Playlists.fromJson(Map<String, dynamic> json) => Playlists(
        href: json["href"],
        limit: json["limit"],
        next: json["next"],
        offset: json["offset"],
        previous: json["previous"],
        total: json["total"],
        items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "href": href,
        "limit": limit,
        "next": next,
        "offset": offset,
        "previous": previous,
        "total": total,
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
      };
}

class Item {
  bool collaborative;
  String description;
  ExternalUrls externalUrls;
  String href;
  String id;
  List<Image> images;
  String name;
  Owner owner;
  dynamic public;
  String snapshotId;
  Tracks tracks;
  ItemType type;
  String uri;
  dynamic primaryColor;

  Item({
    required this.collaborative,
    required this.description,
    required this.externalUrls,
    required this.href,
    required this.id,
    required this.images,
    required this.name,
    required this.owner,
    required this.public,
    required this.snapshotId,
    required this.tracks,
    required this.type,
    required this.uri,
    required this.primaryColor,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        collaborative: json["collaborative"],
        description: json["description"],
        externalUrls: ExternalUrls.fromJson(json["external_urls"]),
        href: json["href"],
        id: json["id"],
        images: List<Image>.from(json["images"].map((x) => Image.fromJson(x))),
        name: json["name"],
        owner: Owner.fromJson(json["owner"]),
        public: json["public"],
        snapshotId: json["snapshot_id"],
        tracks: Tracks.fromJson(json["tracks"]),
        type: itemTypeValues.map[json["type"]]!,
        uri: json["uri"],
        primaryColor: json["primary_color"],
      );

  Map<String, dynamic> toJson() => {
        "collaborative": collaborative,
        "description": description,
        "external_urls": externalUrls.toJson(),
        "href": href,
        "id": id,
        "images": List<dynamic>.from(images.map((x) => x.toJson())),
        "name": name,
        "owner": owner.toJson(),
        "public": public,
        "snapshot_id": snapshotId,
        "tracks": tracks.toJson(),
        "type": itemTypeValues.reverse[type],
        "uri": uri,
        "primary_color": primaryColor,
      };
}

class ExternalUrls {
  String spotify;

  ExternalUrls({
    required this.spotify,
  });

  factory ExternalUrls.fromJson(Map<String, dynamic> json) => ExternalUrls(
        spotify: json["spotify"],
      );

  Map<String, dynamic> toJson() => {
        "spotify": spotify,
      };
}

class Image {
  String url;
  dynamic height;
  dynamic width;

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

class Owner {
  ExternalUrls externalUrls;
  String href;
  Id id;
  OwnerType type;
  Uri uri;
  DisplayName displayName;

  Owner({
    required this.externalUrls,
    required this.href,
    required this.id,
    required this.type,
    required this.uri,
    required this.displayName,
  });

  factory Owner.fromJson(Map<String, dynamic> json) => Owner(
        externalUrls: ExternalUrls.fromJson(json["external_urls"]),
        href: json["href"],
        id: idValues.map[json["id"]]!,
        type: ownerTypeValues.map[json["type"]]!,
        uri: uriValues.map[json["uri"]]!,
        displayName: displayNameValues.map[json["display_name"]]!,
      );

  Map<String, dynamic> toJson() => {
        "external_urls": externalUrls.toJson(),
        "href": href,
        "id": idValues.reverse[id],
        "type": ownerTypeValues.reverse[type],
        "uri": uriValues.reverse[uri],
        "display_name": displayNameValues.reverse[displayName],
      };
}

enum DisplayName { SPOTIFY }

final displayNameValues = EnumValues({"Spotify": DisplayName.SPOTIFY});

enum Id { SPOTIFY }

final idValues = EnumValues({"spotify": Id.SPOTIFY});

enum OwnerType { USER }

final ownerTypeValues = EnumValues({"user": OwnerType.USER});

enum Uri { SPOTIFY_USER_SPOTIFY }

final uriValues =
    EnumValues({"spotify:user:spotify": Uri.SPOTIFY_USER_SPOTIFY});

class Tracks {
  String href;
  int total;

  Tracks({
    required this.href,
    required this.total,
  });

  factory Tracks.fromJson(Map<String, dynamic> json) => Tracks(
        href: json["href"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "href": href,
        "total": total,
      };
}

enum ItemType { PLAYLIST }

final itemTypeValues = EnumValues({"playlist": ItemType.PLAYLIST});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
