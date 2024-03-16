class RepoModel {
  final String name;
  final String fullName;
  final bool private;
  final String description;
  final String repoUrl;
  final String visibilty;
  final String defaultBranch;
  RepoModel({
    required this.name,
    required this.fullName,
    required this.private,
    required this.description,
    required this.repoUrl,
    required this.visibilty,
    required this.defaultBranch,
  });

  RepoModel copyWith({
    String? name,
    String? fullName,
    bool? private,
    String? description,
    String? repoUrl,
    String? visibilty,
    String? defaultBranch,
  }) {
    return RepoModel(
      name: name ?? this.name,
      fullName: fullName ?? this.fullName,
      private: private ?? this.private,
      description: description ?? this.description,
      repoUrl: repoUrl ?? this.repoUrl,
      visibilty: visibilty ?? this.visibilty,
      defaultBranch: defaultBranch ?? this.defaultBranch,
    );
  }

  factory RepoModel.fromJson({required Map<String, dynamic> json}) {
    return RepoModel(
      name: json['name'] ?? '',
      fullName: json['full_name'] ?? '',
      private: json['private'] ?? false,
      description: json['description'] ?? '',
      repoUrl: json['url'] ?? '',
      visibilty: json['visibility'] ?? '',
      defaultBranch: json['default_branch'] ?? '',
    );
  }

  @override
  String toString() {
    return 'RepoModel(name: $name, fullName: $fullName, private: $private, description: $description, repoUrl: $repoUrl, visibilty: $visibilty, defaultBranch: $defaultBranch)';
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
        other.visibilty == visibilty &&
        other.defaultBranch == defaultBranch;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        fullName.hashCode ^
        private.hashCode ^
        description.hashCode ^
        repoUrl.hashCode ^
        visibilty.hashCode ^
        defaultBranch.hashCode;
  }
}
