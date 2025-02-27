class EndPoints {
  static const String baseurl = "https://www.2b-sa.com";
  static const String register = "/wp-json/custom/v1/register/";
  static const String countries = "/wp-json/custom/v1/countries";
  static const String login = "/wp-json/custom/v1/login";
  static String catgory = "/wp-json/wc/v3/products/categories";
  static String forgetPassword = "/wp-json/custom/v1/forgot-password/";
  static String products = "//wp-json/wc/v3/products";
  static String productsDetails(String id) => "/wp-json/wc/v3/products/$id";
}
