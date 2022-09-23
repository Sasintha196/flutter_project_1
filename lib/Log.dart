import 'package:flutter/material.dart';
import 'package:flutter_application_slt/LoginCard.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          ClipPath(
            clipper: CustomClipPath(),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  color: Colors.blue.shade700,
                  height: 500,
                  width: 500,
                  child: Container(
                    padding: const EdgeInsets.only(
                        top: 80.0, bottom: 70.0, left: 30.0, right: 30.0),
                    child: Column(
                      children: const [
                        Text(
                          "Sri Lanka Telecom",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                          textScaleFactor: 2,
                        ),
                        Text(
                          "Polonnaruwa",
                          style: TextStyle(color: Colors.white),
                          textScaleFactor: 1,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 30),
            child: Card1(),
          ),
        ],
      ),
    );
  }
}

class CustomClipPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double w = size.width;
    double h = size.height;

    final path = Path();

    // (0,0) //bydefault it represent Point number 1
    //also we can change the (0,0) point as path.moveTo(0, 100);
    path.lineTo(0, h - 200); // 2. Point
    path.quadraticBezierTo(
      w * 0.6, // 3. Point
      h, // 3. Point
      w, // 4. Point
      h - 300, // 4. Point
    );
    path.lineTo(w, h); // 4. Point
    path.lineTo(w, 0); // 5. Point
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
