class ApiUrls {
  static String baseUrl = "https://jsonplaceholder.typicode.com";

  /// Add other url's here
  /// For urls with parameters set it as a function with parameters
  /// ex., given below
  /// Or return it with variables in curly braces and replace in provider
  /// ex., static String login = "/users/{{id}}";
  /// in provider ApiUrls.login.replaceAll("{{id}}", "1");
  static String login({String id = ""}) {
    return "/users/" + id;
  }
}
