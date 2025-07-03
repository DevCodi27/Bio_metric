import 'package:app_settings/app_settings.dart';
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

  Future<bool> authenticate() async {
    try {
      bool canCheckBiometrics = await _auth.canCheckBiometrics;
      bool isDeviceSupported = await _auth.isDeviceSupported();

      if (!canCheckBiometrics || !isDeviceSupported) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Biometric not supported on this device")),
        );
        return false;
      }

      List<BiometricType> availableBioMetric = await _auth
          .getAvailableBiometrics();

      if (availableBioMetric.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              "No biometric registerd. Redirecting to settings....",
            ),
          ),
        );
        await Future.delayed(Duration(seconds: 1));
        AppSettings.openAppSettings(); // Open settings
        return false;
      }

      bool didAuthenticated = await _auth.authenticate(
        localizedReason: "Please connect to authenticate",
      );

      return didAuthenticated;
    } catch (e) {
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
