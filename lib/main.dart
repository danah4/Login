import 'package:flutter/material.dart';

class User {
  final String email;
  final String password;

  User({required this.email, required this.password});
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Color.fromRGBO(232, 97, 192, 0.667),
        ),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

Map<String, User> users = {
  "Danah@gmail.com": User(email: "Danah@gmail.com", password: "1234"),
  "Tariq@gmail.com": User(email: "Tariq@gmail.com", password: "abcd"),
};
bool isSecured = true;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isSecured = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // هنا نكتب الهيدر وتصميمه
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(232, 97, 192, 0.667),
        centerTitle: true,
        title: Text(
          "Login Your Account",
          style: TextStyle(fontSize: 25, color: Colors.white),
        ),
      ),
      // السنقل سكرول ذي تخليه يروح فوق وتحت
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          // هنا الصورة اللي بالبداية
          children: [
            Image.asset(
              "android/asset/pic.webp",
              height: 350,
              width: 350,
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  TextFormField(
                    controller: emailController,
                    decoration: const InputDecoration(
                      label: Text("Email Address"),
                      prefixIcon: Icon(Icons.email),
                      border: OutlineInputBorder(borderSide: BorderSide()),
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  TextFormField(
                    obscureText: isSecured,
                    controller: passwordController,
                    decoration: InputDecoration(
                      label: Text("Password"),
                      prefixIcon: Icon(Icons.lock),
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            isSecured = !isSecured;
                          });
                        },
                        icon: Icon(Icons.remove_red_eye),
                      ),
                      border: OutlineInputBorder(borderSide: BorderSide()),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  InkWell(
                    onTap: () {
                      String email = emailController.text;
                      String password = passwordController.text;
                      User? user = users[email];
                      if (user != null &&
                          email == user.email &&
                          password == user.password) {
                        print('logged');
                      } else {
                        print('email or password is wrong');
                      }
                    },
                    child: Container(
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(232, 97, 192, 0.667),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.login,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "SUBMIT",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
