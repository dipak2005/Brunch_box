import 'package:flutter/material.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  GlobalKey<FormState> gkey = GlobalKey<FormState>();
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  bool issave = false;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
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
          "Sign up",
          style: TextStyle(
              color: Colors.black,
              fontSize: MediaQuery.devicePixelRatioOf(context) * 5.9,
              fontWeight: FontWeight.w700),
        ),
      ),
    );
  }
}
