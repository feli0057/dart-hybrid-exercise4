import 'dart:convert';
import 'package:http/http.dart' as http;

void main(List<String> arguments) async {
  try {
    //Fetch 20 random users from the Random Data API
    final response = await http.get(Uri.parse('https://random-data-api.com/api/v2/users?size=20'));

    if (response.statusCode == 200) {
      final List<dynamic> users = jsonDecode(response.body);
      
      // Loop through each user and print their details.
      for (var user in users) {
        print('Full name: ${user['first_name']} ${user['last_name']}, username: ${user['username']}, email: ${user['email']}, gender: ${user['gender']}');
      }
    } else {
      print('Failed to fetch users. Status code: ${response.statusCode}');
    }
  } catch (e) {
    print('Error fetching data: $e');
  }
}