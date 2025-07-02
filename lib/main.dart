import 'package:bio_metric_app/home.dart';
import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';

void main() {
  runApp(BioMetric_App());
}

class BioMetric_App extends StatelessWidget {
  const BioMetric_App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Authenticate(),
      theme: ThemeData(primaryColor: Color.fromARGB(30, 56, 11, 170)),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Authenticate extends StatefulWidget {
  const Authenticate({super.key});

  @override
  State<Authenticate> createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  final _auth = LocalAuthentication();
  var snack = SnackBar(content: Text("Not Authenticated"));
  // String _status = "Not Authenticated";

  Future<bool> authenticate() async {
    try {
      bool canCheckBiometrics = await _auth.canCheckBiometrics;
      bool isDeviceSupported = await _auth.isDeviceSupported();

      if (!canCheckBiometrics || !isDeviceSupported) {
        // _status = "Biometric not Supported";
        return false;
      }

      bool didAuthenticated = await _auth.authenticate(
        localizedReason: "Please connect to authenticate",
      );

      // setState(() {
      //   _status = didAuthenticated
      //       ? "Authenticated"
      //       : "Failed to Authenticated";
      // });
      return didAuthenticated;
    } catch (e) {
      // setState(() => _status = "Error: $e");
      print("Error Found $e");
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Biometric Login'),
          centerTitle: true,
          backgroundColor: Colors.indigoAccent,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: Text(_status, style: TextStyle(fontSize: 25)),
              // ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(Icons.android, size: 100),
              ),

              ElevatedButton.icon(
                onPressed: () async {
                  bool auth = await authenticate();
                  if (auth) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MyHomePage()),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(snack);
                  }
                },
                icon: Icon(Icons.fingerprint),
                label: Text('Login with Biometric'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
