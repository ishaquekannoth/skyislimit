class UrlStrings {
  static String baseUrl = "https://api.github.com/users/";
  static String get({required String userName}) => "$userName/repos";
  static Map<String,String> gitHubTokenHeader = {
    'Authorization': 'Bearer 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'
  };
}
