class Constants {
  // ignore: non_constant_identifier_names
  static String TOP_HEADLINES_URL =
      "https://newsapi.org/v2/top-headlines?country=us&apiKey=299c95d433ab4a3494fa57f47469d85e";

  static String headlinesFor(String keyword) {
    return "https://newsapi.org/v2/everything?q=$keyword&apiKey=299c95d433ab4a3494fa57f47469d85e";
  }
}
