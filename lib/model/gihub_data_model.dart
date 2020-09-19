class DataModel {
  int totalCount;
  List<Items> items;

  DataModel({this.totalCount, this.items});

  DataModel.fromJson(Map<String, dynamic> json) {
    totalCount = json['total_count'];
    if (json['items'] != null) {
      items = new List<Items>();
      json['items'].forEach((v) {
        items.add(new Items.fromJson(v));
      });
    }
  }
}

class Items {
  String name;
  Owner owner;
  String description;
  int stargazersCount;

  Items({this.name, this.owner, this.description, this.stargazersCount});

  Items.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    owner = json['owner'] != null ? new Owner.fromJson(json['owner']) : null;
    description = json['description'];
    stargazersCount = json['stargazers_count'];
  }
}

class Owner {
  String login;
  String avatarUrl;

  Owner({this.login, this.avatarUrl});

  Owner.fromJson(Map<String, dynamic> json) {
    login = json['login'];
    avatarUrl = json['avatar_url'];
  }
}
