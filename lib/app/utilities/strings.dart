String apiKey = "PUT Your API  Key Here";

class UrlStrings {
  static String baseUrl = "https://api.github.com/users/";
  static String getRepo({required String userName}) => "$userName/repos";

}
