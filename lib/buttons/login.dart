import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  GlobalKey<FormState> gkey = GlobalKey<FormState>();
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  bool issave = false;
  @override
  Widget build(BuildContext context) {
    return
      ElevatedButton(
      style: ButtonStyle(
          fixedSize: MaterialStatePropertyAll(
            Size(
              MediaQuery.sizeOf(context).width * 0.87,
              MediaQuery.sizeOf(context).height * 0.07,
            ),
          ),
          shape: MaterialStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(35),
            ),
          ),
          backgroundColor: const MaterialStatePropertyAll(Colors.amber)),
      onPressed: () {
        bool issave = gkey.currentState?.validate() ?? true;
        if (issave) {
          gkey.currentState?.save();
          FocusScope.of(context).unfocus();
          Navigator.pushNamed(context, "Homepage");
        }

      },
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: Text(
          "Login",
          style: TextStyle(
              color: Colors.black,
              fontSize:   MediaQuery.devicePixelRatioOf(context) * 5.5,

              fontWeight: FontWeight.w700),
        ),
      ),
    );
  }
}
