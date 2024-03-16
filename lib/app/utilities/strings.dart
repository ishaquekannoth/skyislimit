class UrlStrings {
  static String baseUrl = "https://api.github.com/users/";
  static String get({required String userName})=> "$userName/repos";
}
