class GitHubUser {
  final String login;
  final int id;
  final String nodeId;
  final String avatarUrl;
  final String url;
  final String htmlUrl;
  final String followersUrl;
  final String followingUrl;
  final String gistsUrl;
  final String starredUrl;
  final String subscriptionsUrl;
  final String organizationsUrl;
  final String reposUrl;
  final String eventsUrl;
  final String receivedEventsUrl;
  final String type;
  final bool siteAdmin;
  final String name;
  final String company;
  final String blog;
  final String location;
  final String email;
  final bool hireable;
  final String bio;
  final String twitterUsername;
  final int publicRepos;
  final int publicGists;
  final int followers;
  final int following;

  GitHubUser({
    required this.login,
    required this.id,
    required this.nodeId,
    required this.avatarUrl,
    required this.url,
    required this.htmlUrl,
    required this.followersUrl,
    required this.followingUrl,
    required this.gistsUrl,
    required this.starredUrl,
    required this.subscriptionsUrl,
    required this.organizationsUrl,
    required this.reposUrl,
    required this.eventsUrl,
    required this.receivedEventsUrl,
    required this.type,
    required this.siteAdmin,
    required this.name,
    required this.company,
    required this.blog,
    required this.location,
    required this.email,
    required this.hireable,
    required this.bio,
    required this.twitterUsername,
    required this.publicRepos,
    required this.publicGists,
    required this.followers,
    required this.following,
  });

  factory GitHubUser.fromJson({required Map<String, dynamic> json}) {
    return GitHubUser(
      login: json['login'] ?? "No Users Found",
      id: json['id'] ?? -1,
      nodeId: json['node_id'] ?? "Not Available",
      avatarUrl: json['avatar_url'] ?? "Not Available",
      url: json['url'] ?? "Not Available",
      htmlUrl: json['html_url'] ?? "Not Available",
      followersUrl: json['followers_url'] ?? "Not Available",
      followingUrl: json['following_url'] ?? "Not Available",
      gistsUrl: json['gists_url'] ?? "Not Available",
      starredUrl: json['starred_url'] ?? "Not Available",
      subscriptionsUrl: json['subscriptions_url'] ?? "Not Available",
      organizationsUrl: json['organizations_url'] ?? "Not Available",
      reposUrl: json['repos_url'] ?? "Not Available",
      eventsUrl: json['events_url'] ?? "Not Available",
      receivedEventsUrl: json['received_events_url'] ?? "Not Available",
      type: json['type'] ?? "Not Available",
      siteAdmin: json['site_admin'] ?? false,
      name: json['name'] ?? "Not Available",
      company: json['company'] ?? "Not Available",
      blog: json['blog'] ?? "Not Available",
      location: json['location'] ?? "Not Available",
      email: json['email'] ?? "Not Available",
      hireable: json['hireable'] ?? false,
      bio: json['bio'] ?? "Not Available",
      twitterUsername: json['twitter_username'] ?? "Not Available",
      publicRepos: json['public_repos'] ?? -1,
      publicGists: json['public_gists'] ?? -1,
      followers: json['followers'] ?? -1,
      following: json['following'] ?? -1,
    );
  }

  GitHubUser copyWith({
    String? login,
    int? id,
    String? nodeId,
    String? avatarUrl,
    String? url,
    String? htmlUrl,
    String? followersUrl,
    String? followingUrl,
    String? gistsUrl,
    String? starredUrl,
    String? subscriptionsUrl,
    String? organizationsUrl,
    String? reposUrl,
    String? eventsUrl,
    String? receivedEventsUrl,
    String? type,
    bool? siteAdmin,
    String? name,
    String? company,
    String? blog,
    String? location,
    String? email,
    bool? hireable,
    String? bio,
    String? twitterUsername,
    int? publicRepos,
    int? publicGists,
    int? followers,
    int? following,
  }) {
    return GitHubUser(
      login: login ?? this.login,
      id: id ?? this.id,
      nodeId: nodeId ?? this.nodeId,
      avatarUrl: avatarUrl ?? this.avatarUrl,
      url: url ?? this.url,
      htmlUrl: htmlUrl ?? this.htmlUrl,
      followersUrl: followersUrl ?? this.followersUrl,
      followingUrl: followingUrl ?? this.followingUrl,
      gistsUrl: gistsUrl ?? this.gistsUrl,
      starredUrl: starredUrl ?? this.starredUrl,
      subscriptionsUrl: subscriptionsUrl ?? this.subscriptionsUrl,
      organizationsUrl: organizationsUrl ?? this.organizationsUrl,
      reposUrl: reposUrl ?? this.reposUrl,
      eventsUrl: eventsUrl ?? this.eventsUrl,
      receivedEventsUrl: receivedEventsUrl ?? this.receivedEventsUrl,
      type: type ?? this.type,
      siteAdmin: siteAdmin ?? this.siteAdmin,
      name: name ?? this.name,
      company: company ?? this.company,
      blog: blog ?? this.blog,
      location: location ?? this.location,
      email: email ?? this.email,
      hireable: hireable ?? this.hireable,
      bio: bio ?? this.bio,
      twitterUsername: twitterUsername ?? this.twitterUsername,
      publicRepos: publicRepos ?? this.publicRepos,
      publicGists: publicGists ?? this.publicGists,
      followers: followers ?? this.followers,
      following: following ?? this.following,
    );
  }

  @override
  String toString() {
    return '''
  Login Name:$login,
  Other Details
  Name: $name, 
  Url: $url,
  FollowersUrl: $followersUrl,
  ReposUrl: $reposUrl,
  Type: $type, 
  Location: $location,
  Email: $email,
  Hireable: ${hireable ? "Yes" : "No"}, 
  Bio: $bio, 
  TwitterUsername: $twitterUsername,
  PublicRepos: $publicRepos, 
  Followers: $followers, 
  Following: $following''';
  }

  GitHubUser.dummy()
      : login = "Not Available",
        id = -1,
        nodeId = "Not Available",
        avatarUrl = "Not Available",
        url = "Not Available",
        htmlUrl = "Not Available",
        followersUrl = "Not Available",
        followingUrl = "Not Available",
        gistsUrl = "Not Available",
        starredUrl = "Not Available",
        subscriptionsUrl = "Not Available",
        organizationsUrl = "Not Available",
        reposUrl = "Not Available",
        eventsUrl = "Not Available",
        receivedEventsUrl = "Not Available",
        type = "Not Available",
        siteAdmin = false,
        name = "Not Available",
        company = "Not Available",
        blog = "Not Available",
        location = "Not Available",
        email = "Not Available",
        hireable = false,
        bio = "Not Available",
        twitterUsername = "Not Available",
        publicRepos = -1,
        publicGists = -1,
        followers = -1,
        following = -1;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is GitHubUser &&
        other.login == login &&
        other.id == id &&
        other.nodeId == nodeId &&
        other.avatarUrl == avatarUrl &&
        other.url == url &&
        other.htmlUrl == htmlUrl &&
        other.followersUrl == followersUrl &&
        other.followingUrl == followingUrl &&
        other.gistsUrl == gistsUrl &&
        other.starredUrl == starredUrl &&
        other.subscriptionsUrl == subscriptionsUrl &&
        other.organizationsUrl == organizationsUrl &&
        other.reposUrl == reposUrl &&
        other.eventsUrl == eventsUrl &&
        other.receivedEventsUrl == receivedEventsUrl &&
        other.type == type &&
        other.siteAdmin == siteAdmin &&
        other.name == name &&
        other.company == company &&
        other.blog == blog &&
        other.location == location &&
        other.email == email &&
        other.hireable == hireable &&
        other.bio == bio &&
        other.twitterUsername == twitterUsername &&
        other.publicRepos == publicRepos &&
        other.publicGists == publicGists &&
        other.followers == followers &&
        other.following == following;
  }

  @override
  int get hashCode {
    return login.hashCode ^
        id.hashCode ^
        nodeId.hashCode ^
        avatarUrl.hashCode ^
        url.hashCode ^
        htmlUrl.hashCode ^
        followersUrl.hashCode ^
        followingUrl.hashCode ^
        gistsUrl.hashCode ^
        starredUrl.hashCode ^
        subscriptionsUrl.hashCode ^
        organizationsUrl.hashCode ^
        reposUrl.hashCode ^
        eventsUrl.hashCode ^
        receivedEventsUrl.hashCode ^
        type.hashCode ^
        siteAdmin.hashCode ^
        name.hashCode ^
        company.hashCode ^
        blog.hashCode ^
        location.hashCode ^
        email.hashCode ^
        hireable.hashCode ^
        bio.hashCode ^
        twitterUsername.hashCode ^
        publicRepos.hashCode ^
        publicGists.hashCode ^
        followers.hashCode ^
        following.hashCode;
  }
}
