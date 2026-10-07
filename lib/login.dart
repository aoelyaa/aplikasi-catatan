import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const LoginPage(),
    );
  }
}

// HALAMAN LOGIN
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() {
    return _LoginPageState();
  }
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void login() {
    String username = usernameController.text;
    String password = passwordController.text;

    if (username == "admin" && password == "12345") {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return const HomePage();
          },
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Username atau password salah"),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(30),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              // Logo
              Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  color: Colors.pink[100],
                  borderRadius: BorderRadius.circular(30),
                ),
                child: const Center(
                  child: Text(
                    "🐰",
                    style: TextStyle(
                      fontSize: 70,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // Judul
              const Text(
                "Catatan",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 25),

              // Username kecil
              SizedBox(
                width: 280,
                height: 50,
                child: TextField(
                  controller: usernameController,
                  decoration: InputDecoration(
                    hintText: "username",
                    prefixIcon: const Icon(Icons.person),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 15),

              // Password kecil
              SizedBox(
                width: 280,
                height: 50,
                child: TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: "password",
                    prefixIcon: const Icon(Icons.lock),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // Tombol kecil
              SizedBox(
                width: 130,
                height: 45,
                child: ElevatedButton(
                  onPressed: login,
                  child: const Text(
                    "Masuk",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// HALAMAN SETELAH LOGIN
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Catatan"),
        backgroundColor: Colors.pink[100],
      ),
      body: const Center(
        child: Text(
          "Selamat datang di aplikasi Catatan!",
          style: TextStyle(
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}