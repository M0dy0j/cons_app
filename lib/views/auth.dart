import 'package:flutter/material.dart';
import '../components/auth_textfield.dart';
import '../components/background_curve.dart';
import '../components/toggle_button.dart';
import '../models/response_model.dart';
import '../services/auth_services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  String switched = 'login';
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmationController =
      TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const BackgroundCurve(),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 36),
                    child: Column(
                      children: [
                        Image.asset(
                          'images/logo.png',
                          width: 100,
                          height: 100,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'ديوان رئيس الوزراء',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w800,
                            fontSize: 26,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Center(
                      child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    height: switched == 'login' ? 470 : 520,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(36),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 10.0,
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 36, horizontal: 24),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ToggleButton(
                              width: 300.0,
                              height: 45.0,
                              toggleBackgroundColor: Colors.white,
                              toggleBorderColor: (Colors.grey[350])!,
                              toggleColor: const Color(0xff3A98B9),
                              activeTextColor: Colors.white,
                              inactiveTextColor: const Color(0xff3A98B9),
                              leftDescription: 'Login',
                              rightDescription: 'Register',
                              onLeftToggleActive: () {
                                setState(() {
                                  switched = 'login';
                                });
                              },
                              onRightToggleActive: () {
                                setState(() {
                                  switched = 'register';
                                });
                              },
                            ),
                            const SizedBox(
                              height: 24,
                            ),
                            AuthTextField(
                                hint: 'Enter email or username',
                                controller: emailController),
                            const SizedBox(
                              height: 12,
                            ),
                            AuthTextField(
                                hint: 'Enter password',
                                controller: passwordController),
                            AnimatedCrossFade(
                              duration: const Duration(milliseconds: 400),
                              reverseDuration:
                                  const Duration(milliseconds: 200),
                              firstChild: Container(),
                              secondChild: Column(
                                children: [
                                  const SizedBox(
                                    height: 12,
                                  ),
                                  AuthTextField(
                                      hint: 'Confirm password',
                                      controller:
                                          passwordConfirmationController),
                                ],
                              ),
                              crossFadeState: switched == 'login'
                                  ? CrossFadeState.showFirst
                                  : CrossFadeState.showSecond,
                            ),
                            const SizedBox(
                              height: 36,
                            ),
                            Material(
                              borderRadius: BorderRadius.circular(24),
                              color: const Color(0xff3A98B9),
                              child: InkWell(
                                borderRadius: BorderRadius.circular(24),
                                onTap: () async {
                                  if (_formKey.currentState!.validate()) {}

                                  ResponseModel userInfo = await AuthServices()
                                      .login(
                                          password: passwordController.text,
                                          email: emailController.text);

                                  if (userInfo.userModel != null) {
                                    print(userInfo.userModel!.token);
                                  } else {
                                    if (mounted) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(const SnackBar(
                                              content:
                                                  Text('Invalid credentials')));
                                    }
                                  }
                                },
                                child: SizedBox(
                                  width: 260,
                                  height: 50,
                                  child: Center(
                                    child: Text(
                                      switched,
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 24,
                            ),
                            const Text(
                              'OR',
                              style: TextStyle(
                                  color: Colors.grey, fontWeight: FontWeight.w600),
                            ),
                            const SizedBox(
                              height: 24,
                            ),
                            Row(
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceEvenly,
                              children: [
                                IconButton(
                                    onPressed: () {},
                                    icon: const FaIcon(
                                      FontAwesomeIcons.facebookF,
                                      color: Color(0xFF3A589B),
                                      size: 35,
                                    ),
                                ),
                                IconButton(
                                    onPressed: () {},
                                    icon: const FaIcon(
                                      FontAwesomeIcons.twitter,
                                      color: Color(0xFF03A9F4),
                                      size: 35,
                                    ),
                                ),
                                IconButton(
                                    onPressed: () {},
                                    icon: FaIcon(
                                      FontAwesomeIcons.google,
                                      color: Colors.red[800],
                                      size: 35,
                                    ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  )),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
