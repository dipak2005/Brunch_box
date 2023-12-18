import 'package:flutter/material.dart';

import '../buttons/emailbutton.dart';
import '../buttons/login.dart';
import '../buttons/signup.dart';

class Second extends StatefulWidget {
  const Second({super.key});

  @override
  State<Second> createState() => _SecondState();
}

class _SecondState extends State<Second> {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  int page = 0;
  bool acc = true;
  bool log = false;
  GlobalKey<FormState> gkey = GlobalKey<FormState>();
  bool issave = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: gkey,
      child: Container(
        height: MediaQuery.sizeOf(context).height * 0.7,
        width: MediaQuery.sizeOf(context).width,
        decoration: BoxDecoration(
          color: const Color(0xff8D6C0E),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: MediaQuery.sizeOf(context).height * 0.008,
              width: MediaQuery.sizeOf(context).width * 0.1,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: Colors.white),
            ),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.005,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: TextButton(
                    onPressed: () {
                      setState(() {
                        page = 0;
                        acc = true;
                        log = false;
                      });
                    },
                    child: Column(
                      children: [
                        FittedBox(
                          fit: BoxFit.cover,
                          child: Text(
                            "Create Account",
                            style: TextStyle(
                              fontSize:
                                  MediaQuery.devicePixelRatioOf(context) * 5.5,
                              color: acc ? Colors.amber : Colors.white,
                            ),
                          ),
                        ),
                        acc
                            ? Divider(
                                height:
                                    MediaQuery.sizeOf(context).height * 0.04,
                                indent:
                                    MediaQuery.sizeOf(context).width * 0.020,
                                endIndent:
                                    MediaQuery.sizeOf(context).width * 0.020,
                                color: acc ? Colors.amber : Colors.white,
                                thickness: 2,
                              )
                            : Divider(
                                color: Colors.transparent,
                              ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: TextButton(
                    onPressed: () {
                      setState(() {
                        page = 1;
                        acc = false;
                        log = true;
                      });
                    },
                    child: Column(
                      children: [
                        FittedBox(
                          fit: BoxFit.cover,
                          child: Text(
                            "Login",
                            style: TextStyle(
                              fontSize:
                                  MediaQuery.devicePixelRatioOf(context) * 5.5,
                              color: log ? Colors.amber : Colors.white,
                            ),
                          ),
                        ),
                        log
                            ? Divider(
                                height:
                                    MediaQuery.sizeOf(context).height * 0.04,
                                indent:
                                    MediaQuery.sizeOf(context).width * 0.020,
                                endIndent:
                                    MediaQuery.sizeOf(context).width * 0.020,
                                color: log ? Colors.amber : Colors.white,
                                thickness: 2,
                              )
                            : Divider(
                                color: Colors.transparent,
                              ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: SingleChildScrollView(
                child: IndexedStack(
                  index: page,
                  children: [
                    SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(
                            height: MediaQuery.sizeOf(context).height * 0.01,
                          ),
                          Align(
                            alignment: Alignment(-0.73, 0),
                            child: FittedBox(
                              fit: BoxFit.cover,
                              child: Text(
                                "Full Name",
                                style: TextStyle(
                                    fontSize:
                                        MediaQuery.devicePixelRatioOf(context) *
                                            4.5,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 8, right: 30, left: 40),
                            child: TextFormField(
                              controller: name,
                              keyboardType: TextInputType.name,
                              validator: (value) {
                                if (value?.isEmpty ?? true) {
                                  return " * Plz Enter User Name";
                                } else {
                                  return null;
                                }
                              },
                              decoration: InputDecoration(
                                hintText: "User Name",
                                hintStyle: TextStyle(color: Colors.white),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.black,
                                      style: BorderStyle.solid,
                                      width: 2),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.sizeOf(context).height * 0.01,
                          ),
                          Align(
                            alignment: const Alignment(-0.73, 0),
                            child: FittedBox(
                              fit: BoxFit.cover,
                              child: Text(
                                "Email address",
                                style: TextStyle(
                                    fontSize:
                                        MediaQuery.devicePixelRatioOf(context) *
                                            4.5,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 8, right: 30, left: 40),
                            child: TextFormField(
                              controller: email,
                              keyboardType: TextInputType.emailAddress,
                              validator: (value) {
                                if (value?.isEmpty ?? true) {
                                  return " * Plz Enter User EmailAddress";
                                } else if (value?.contains("@gmail.com") ??
                                    true) {
                                  return null;
                                } else {
                                  return " * Invalied EmailAddress";
                                }
                              },
                              decoration: InputDecoration(
                                hintText: "User Email Address",
                                hintStyle: TextStyle(color: Colors.white),
                                border: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Colors.black,
                                      style: BorderStyle.solid,
                                      width: 2),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height:
                                MediaQuery.devicePixelRatioOf(context) * 3.4,
                          ),
                          Align(
                            alignment: const Alignment(-0.73, 0),
                            child: FittedBox(
                              fit: BoxFit.cover,
                              child: Text(
                                "Password",
                                style: TextStyle(
                                    fontSize:
                                        MediaQuery.devicePixelRatioOf(context) *
                                            4.5,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 8, right: 30, left: 40),
                            child: TextFormField(
                              controller: password,
                              keyboardType: TextInputType.name,
                              validator: (value) {
                                if (value?.isEmpty ?? true) {
                                  return " * Plz Enter Password";
                                } else if (value?.contains("#") ?? false) {
                                  return " * Plz Make A Strong Password Using # ";
                                } else {
                                  return null;
                                }
                              },
                              decoration: InputDecoration(
                                hintText: "User Password",
                                hintStyle: TextStyle(
                                    color: Colors.white,
                                    fontSize:
                                        MediaQuery.devicePixelRatioOf(context) *
                                            4.5),
                                border: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Colors.black,
                                      style: BorderStyle.solid,
                                      width: 2),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height:
                                MediaQuery.devicePixelRatioOf(context) * 8.4,
                          ),
                          const Signup(),
                          Divider(
                            height: MediaQuery.sizeOf(context).height * 0.04,
                            indent: MediaQuery.sizeOf(context).height * 0.13,
                            endIndent: MediaQuery.sizeOf(context).height * 0.13,
                            color: Colors.white,
                            thickness: 1,
                          ),
                          const Emailbutton(),
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        SizedBox(
                          height: MediaQuery.sizeOf(context).height * 0.01,
                        ),
                        Align(
                          alignment: const Alignment(-0.73, 0),
                          child: FittedBox(
                            fit: BoxFit.cover,
                            child: Text(
                              "Email address",
                              style: TextStyle(
                                  fontSize:
                                      MediaQuery.devicePixelRatioOf(context) *
                                          4.5,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 8, right: 30, left: 40),
                          child: TextFormField(
                            controller: email,
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) {
                              if (value?.isEmpty ?? true) {
                                return " * Plz Enter User EmailAddress";
                              } else if (value?.contains("@gmail.com") ??
                                  true) {
                                return null;
                              } else {
                                return " * Invalied EmailAddress";
                              }
                            },
                            decoration: InputDecoration(
                              hintText: "User Email Address",
                              hintStyle: const TextStyle(color: Colors.white),
                              border: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Colors.black,
                                    style: BorderStyle.solid,
                                    width: 2),
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.sizeOf(context).height * 0.01,
                        ),
                        Align(
                          alignment: const Alignment(-0.73, 0),
                          child: FittedBox(
                            fit: BoxFit.cover,
                            child: Text(
                              "Password",
                              style: TextStyle(
                                  fontSize:
                                      MediaQuery.devicePixelRatioOf(context) *
                                          4.5,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 8, right: 30, left: 40),
                          child: TextFormField(
                            controller: password,
                            keyboardType: TextInputType.visiblePassword,
                            validator: (value) {
                              if (value?.isEmpty ?? true) {
                                return " * Plz Enter Password";
                              } else if (value?.contains("#") ?? false) {
                                return " * Plz Make A Strong Password Using # ";
                              } else {
                                return null;
                              }
                            },
                            decoration: InputDecoration(
                              hintText: "User Password",
                              hintStyle: TextStyle(
                                  color: Colors.white,
                                  fontSize:
                                      MediaQuery.devicePixelRatioOf(context) *
                                          4.5),
                              border: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Colors.black,
                                    style: BorderStyle.solid,
                                    width: 2),
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: const Alignment(0.9, 0),
                          child: TextButton(
                              onPressed: () {},
                              child: FittedBox(
                                fit: BoxFit.cover,
                                child: Text(
                                  "Forget Password ?",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: MediaQuery.devicePixelRatioOf(
                                              context) *
                                          4.5),
                                ),
                              )),
                        ),
                        SizedBox(
                          height: MediaQuery.sizeOf(context).height * 0.1,
                        ),
                        const Login(),
                        Divider(
                          height: MediaQuery.sizeOf(context).height * 0.04,
                          indent: MediaQuery.sizeOf(context).height * 0.13,
                          endIndent: MediaQuery.sizeOf(context).height * 0.13,
                          color: Colors.white,
                          thickness: 1,
                        ),
                        const Emailbutton(),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
