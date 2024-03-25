String apiKey = "Bearer YourApiKeyHere";

class UrlStrings {
  static String baseUrl = "https://api.github.com/users/";
  static String getRepo({required String userName}) => "$userName/repos";
  static Map<String, String> gitHubTokenHeader = {'Authorization': apiKey};
}
