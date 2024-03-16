class RepoModel {
  final String name;
  final String fullName;
  final bool private;
  final String description;
  final String repoUrl;
  final String visibility;
  final String defaultBranch;
  final String login;
  final String htmlUrl;
  RepoModel(
      {required this.name,
      required this.fullName,
      required this.private,
      required this.description,
      required this.repoUrl,
      required this.htmlUrl,
      required this.visibility,
      required this.defaultBranch,
      required this.login});

  RepoModel copyWith({
    String? name,
    String? fullName,
    bool? private,
    String? description,
    String? repoUrl,
    String? visibilty,
    String? htmlUrl,
    String? defaultBranch,
    String? login,
  }) {
    return RepoModel(
      name: name ?? this.name,
      fullName: fullName ?? this.fullName,
      private: private ?? this.private,
      description: description ?? this.description,
      repoUrl: repoUrl ?? this.repoUrl,
      visibility: visibilty ?? visibility,
      login: login ?? this.login,
      htmlUrl: htmlUrl ?? this.htmlUrl,
      defaultBranch: defaultBranch ?? this.defaultBranch,
    );
  }

  RepoModel.dummy()
      : name = "Not Available",
        fullName = "Not Available",
        private = false,
        description = "Not Available",
        repoUrl = "Not Available",
        visibility = "Not Available",
        defaultBranch = "Not Available",
        htmlUrl = "Not Available",
        login = "Not Available";

  factory RepoModel.fromJson({required Map<String, dynamic> json}) {
    return RepoModel(
        name: json['name'] ?? '',
        fullName: json['full_name'] ?? '',
        private: json['private'] ?? false,
        description: json['description'] ?? '',
        repoUrl: json['url'] ?? '',
        visibility: json['visibility'] ?? '',
        defaultBranch: json['default_branch'] ?? '',
        htmlUrl: json['html_url'],
        login: json['owner']['login'] ?? '');
  }

  @override
  String toString() {
    return 'RepoModel(name: $name,login: $login, fullName: $fullName, private: $private, description: $description, repoUrl: $repoUrl, visibilty: $visibility, defaultBranch: $defaultBranch)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is RepoModel &&
        other.name == name &&
        other.fullName == fullName &&
        other.private == private &&
        other.description == description &&
        other.repoUrl == repoUrl &&
        other.visibility == visibility &&
        other.login == login &&
        other.htmlUrl == htmlUrl &&
        other.defaultBranch == defaultBranch;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        fullName.hashCode ^
        private.hashCode ^
        description.hashCode ^
        repoUrl.hashCode ^
        htmlUrl.hashCode ^
        visibility.hashCode ^
        login.hashCode ^
        defaultBranch.hashCode;
  }
}
