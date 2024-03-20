import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Roboto',
      ),
      initialRoute: '/register', // Redirect to RegisterPage by default
      routes: {
        '/login': (context) => LoginPage(),
        '/register': (context) => RegisterPage(),
        '/dashboard': (context) => DashboardPage(),
      },
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool _isLoading = false;

  Future<void> login() async {
    setState(() {
      _isLoading = true;
    });

    final String url =
        'http://localhost:8080/login'; // Replace with your actual backend URL
    final Map<String, String> body = {
      'email': emailController.text,
      'password': passwordController.text,
    };

    try {
      final response = await http.post(Uri.parse(url), body: json.encode(body));
      if (response.statusCode == 200) {
        final username = response.headers['Username'];
        final email = response.headers['Email'];
        // Login successful, navigate to dashboard or any other page
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DashboardPage(),
            ));
      } else {
        // Login failed, display error message
        print('Login Failed: ${response.body}');
        showErrorToast('Login failed. Please check your credentials.');
      }
    } catch (e) {
      print('Error: $e');
      showErrorToast('Login failed. Please check your credentials.');
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  void showErrorToast(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
      ),
    );
  }

  void navigateToRegisterPage() {
    Navigator.pushNamed(context, '/register');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Login Page",style: TextStyle(fontSize: 40)),
            Icon(Icons.login,size: 50,),
            SizedBox(height: 50),
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                prefixIcon: Icon(Icons.email),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                prefixIcon: Icon(Icons.lock),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _isLoading ? null : login,
              child: _isLoading
                  ? CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    )
                  : Text('Login'),
            ),
            SizedBox(height: 10),
            TextButton(
              onPressed: navigateToRegisterPage,
              child: Text(
                'Register new user',
                style: TextStyle(color: Colors.blue),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool _isLoading = false;

  Future<void> register() async {
    setState(() {
      _isLoading = true;
    });

    final String url =
        'http://localhost:8080/register'; // Replace with your actual backend URL
    final Map<String, String> body = {
      'username': usernameController.text,
      'email': emailController.text,
      'password': passwordController.text,
    };

    try {
      final response = await http.post(Uri.parse(url), body: json.encode(body));

      if (response.statusCode == 200) {
        // Registration successful, navigate to login
        Navigator.pushNamed(context, '/login');
      } else {
        // Registration failed, display error message
        print('Registration Failed: ${response.body}');
        showErrorToast('Registration failed. Please try again.');
      }
    } catch (e) {
      print('Error: $e');
      showErrorToast('Registration failed. Please try again.');
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  void showErrorToast(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
      ),
    );
  }

  void navigateToLoginPage(BuildContext context) {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registration'),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Registration Page",style: TextStyle(fontSize: 40)),
            Icon(Icons.app_registration_rounded,size: 50,),
            SizedBox(height: 50),
            TextField(
              controller: usernameController,
              decoration: InputDecoration(
                labelText: 'Name',
                prefixIcon: Icon(Icons.person), // Add icon here
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                prefixIcon: Icon(Icons.email), // Add icon here
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                prefixIcon: Icon(Icons.lock), // Add icon here
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _isLoading ? null : register,
              child: _isLoading
                  ? CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    )
                  : Text('Register'),
            ),
            SizedBox(height: 10),
            TextButton(
              onPressed: () => navigateToLoginPage(context),
              child: Text(
                'Back to Login',
                style: TextStyle(color: Colors.blue),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DashboardPage extends StatelessWidget {
  final List<Map<String, String>> items = [
    {
      'image':
          'https://i.natgeofe.com/n/8eba070d-14e5-4d07-8bab-9db774029063/93080_4x3.jpg',
      'description':
          'The Taj Mahal was designated as a UNESCO World Heritage Site in 1983 for being “the jewel of Muslim art in India and one of the universally admired masterpieces of the world’s heritage'
    },
    {
      'image':
          'https://images.nationalgeographic.org/image/upload/t_edhub_resource_key_image/v1638892506/EducationHub/photos/the-great-wall-of-china.jpg',
      'description':
          'The Great Wall is reputed as one of the seven construction wonders in the world not only for its long history, but its massive construction size, and its unique architectural style as well. A great army of manpower, composed of soldiers, prisoners, and local people, built the wall.'
    },
    {
      'image': 'https://cdn.mos.cms.futurecdn.net/BiNbcY5fXy9Lra47jqHKGK.jpg',
      'description':
          'The Colosseum in Rome, Italy, is a large amphitheater that hosted events like gladiatorial games.'
    },
    {
      'image':
          'https://www.treehugger.com/thmb/Pn_r1ugQRKa_YO2awHGLOu6y3tc=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/__opt__aboutcom__coeus__resources__content_migration__mnn__images__2018__12__LeaningTowerofPisa-2018-a457c638a23e4be39e8d7ac054ba871f.jpg',
      'description':
          'The leaning Tower of Pisa does not fall because its center of gravity has been carefully kept within its base. … In short, this is why the Tower of Pisa does not topple over. The Leaning Tower doesn’t fall because its center of gravity is carefully kept within its base.'
    },
    {
      'image':
          'https://cdn.mos.cms.futurecdn.net/YMa7Wx2FyjQFUjEeqa72Rm-1200-80.jpg',
      'description':
          'The Great Pyramid is the only extant one of the Seven Wonders of the Ancient World. Ancient Egyptian pyramids were, in most cases, placed west of the river Nile because the divine pharaoh’s soul was meant to join with the sun during its descent before continuing with the sun in its eternal round.'
    },
    // Add more images and descriptions as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
        backgroundColor: Colors.blue,
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: List.generate(items.length, (index) {
          return GestureDetector(
            onTap: () {
              _showDescriptionDialog(context, items[index]['description']!);
            },
            child: Card(
              elevation: 3,
              margin: EdgeInsets.all(8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(15)),
                        image: DecorationImage(
                          image: NetworkImage(items[index]['image']!),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Tap for Description',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 4),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }

  void _showDescriptionDialog(BuildContext context, String description) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Description'),
          content: Text(description),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }
}
