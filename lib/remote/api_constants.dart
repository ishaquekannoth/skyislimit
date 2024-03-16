const String adminAccesstoken = "";
const String storeFrontAccessToken = "";

class APIHeaders {
  final Map<String, String> _storeFrontHeaders = {
    "X-Shopify-Storefront-Access-Token": storeFrontAccessToken
  };
  APIHeaders._private();
  static final APIHeaders _instance = APIHeaders._private();
  factory APIHeaders() => _instance;
  Map<String, String> get storeFrontHeaders => _storeFrontHeaders;

}