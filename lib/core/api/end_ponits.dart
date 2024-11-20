class EndPoints {
  ///https://e-learning-0wji.onrender.com/api/v1/auth/login
  static String baseUrl = 'https://e-learning-0wji.onrender.com/api/v1/';
  static String login = '/auth/login';
  static String register = 'auth/register';
  static String sendCode = 'send-code';
  static String verfiyCode = 'verify-code';
  static String forgetPass = 'auth/forgot-password';
  static String resetPass = 'auth/reset-password';
  static String refreshToken = 'refresh-token';
  static String getAllCategories = 'category';
  static String getAllTasks = 'tasks';
  static String createTask = 'tasks';
  static String getTaskById = 'tasks/';
  static String deleteTaskById = 'tasks/';
  static String updateTaskById = 'tasks/';
  static String getTaskByUserId = 'user-tasks';
  static String getUserFeedTasks = 'feed';
  static String updateProfile = 'profile';
  static String deleteProfile = 'profile';
  static String deleteProfileTasker = 'delete-profile-tasker';
  static String updateProfilePicture = 'profile/picture';
  static String changePass = 'profile/change-password';
  static String getProfile = 'profile';
  static String becomeTasker = 'become-tasker';
  static String aboutTasker = 'about-tasker';
  static String aboutTaskerByTaskerId = 'tasker/';
  static String updateTasker = 'update-tasker';
  static String deleteTasker = 'delete-tasker';
  // static String deleteTasker = 'delete-tasker';
}

class ApiKey {
  static String token = 'token';
  static String email = 'email';
  static String password = 'password';
  static String name = 'name';
  static String phoneNumber = 'phoneNumber';
  static String user = 'user';
  static String message = 'message';
  static String id = 'id';
  static String profilePicture = 'profilePicture';
  static String code = 'code';
}
