class PostsModel {
  PostsModel({
    required this.id,
    required this.title,
    required this.description,
    required this.pinned,
    required this.sponserName,
    required this.sponserImage,
    required this.postLinks,
  });

  final int? id;
  final String? title;
  final String? description;
  final bool? pinned;
  final String? sponserName;
  final String? sponserImage;
  final List<PostLink> postLinks;

  PostsModel copyWith({
    int? id,
    String? title,
    String? description,
    bool? pinned,
    String? sponserName,
    String? sponserImage,
    List<PostLink>? postLinks,
  }) {
    return PostsModel(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      pinned: pinned ?? this.pinned,
      sponserName: sponserName ?? this.sponserName,
      sponserImage: sponserImage ?? this.sponserImage,
      postLinks: postLinks ?? this.postLinks,
    );
  }

  factory PostsModel.fromJson(Map<String, dynamic> json) {
    return PostsModel(
      id: json["id"],
      title: json["title"],
      description: json["description"],
      pinned: json["pinned"],
      sponserName: json["sponserName"],
      sponserImage: json["sponserImage"],
      postLinks: json["postLinks"] == null
          ? []
          : List<PostLink>.from(
              json["postLinks"]!.map((x) => PostLink.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "pinned": pinned,
        "sponserName": sponserName,
        "sponserImage": sponserImage,
        "postLinks": postLinks.map((x) => x.toJson()).toList(),
      };

  @override
  String toString() {
    return "$id, $title, $description, $pinned, $sponserName, $sponserImage, $postLinks, ";
  }
}

class PostLink {
  PostLink({
    required this.id,
    required this.link,
    required this.icon,
    required this.title,
    required this.description,
  });

  final int? id;
  final String? link;
  final String? icon;
  final String? title;
  final String? description;

  PostLink copyWith({
    int? id,
    String? link,
    String? icon,
    String? title,
    String? description,
  }) {
    return PostLink(
      id: id ?? this.id,
      link: link ?? this.link,
      icon: icon ?? this.icon,
      title: title ?? this.title,
      description: description ?? this.description,
    );
  }

  factory PostLink.fromJson(Map<String, dynamic> json) {
    return PostLink(
      id: json["id"],
      link: json["link"],
      icon: json["icon"],
      title: json["title"],
      description: json["description"],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "link": link,
        "icon": icon,
        "title": title,
        "description": description,
      };

  @override
  String toString() {
    return "$id, $link, $icon, $title, $description, ";
  }
}
