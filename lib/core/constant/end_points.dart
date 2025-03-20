class EndPoints {
  static const String baseurl = "https://www.2b-sa.com";
  static const String register = "/wp-json/custom/v1/register/";
  static const String countries = "/wp-json/custom/v1/countries";
  static const String login = "/wp-json/custom/v1/login";
  static String catgory = "/wp-json/wc/v3/products/categories";
  static String forgetPassword = "/wp-json/custom/v1/forgot-password/";
  static String products = "//wp-json/wc/v3/products";
  static String productsDetails(String id) => "/wp-json/wc/v3/products/$id";
  static String banners = "/wp-json/wp/v2/banners";
  static String addToCart = "/wp-json/wc/store/v1/cart/add-item";
  static String carts = "/wp-json/wc/store/v1/cart";
  static String favorite = "/wp-json/custom/v1/add-to-favorites";
  static String createOrder = "/wp-json/wc/v3/orders";
  static String notification = "/wp-json/custom/v1/notifications";
  static String logout = "/wp-json/custom/v1/logout";
  static String deleteItemFromCar(String productKey) =>
      "/wp-json/wc/store/v1/cart/items/$productKey";
}
