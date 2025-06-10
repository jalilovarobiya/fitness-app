import 'dart:ui';

import 'package:fitness_app/core/constants/app_images.dart';
import 'package:fitness_app/core/routes/app_routes.dart';
import 'package:fitness_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:fitness_app/features/auth/presentation/widgets/text_form_field_widget.dart';
import 'package:fitness_app/features/splash/presentation/widgets/row_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter/material.dart';
import '../../../../core/di/service_locator.dart' as di;

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final _email = TextEditingController();
  final _password = TextEditingController();
  final _name = TextEditingController();
  final _passwordConfirmation = TextEditingController();

  bool isSelected = false;
  bool isSelected2 = false;
  String? member;

  bool get canCantinue => isSelected && isSelected2;

  @override
  void dispose() {
    super.dispose();
    _email.dispose();
    _password.dispose();
    _name.dispose();
    _passwordConfirmation.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => di.sl<AuthBloc>(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          centerTitle: true,
          title: Text(
            "Account registration",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is Authenticated) {
              Navigator.pushReplacementNamed(context, AppRoutes.onboarding1);
            } else if (state is AuthError) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(state.message)));
            }
          },
          builder: (context, state) {
            return Stack(
              children: [
                Positioned.fill(
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(AppImages.register),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Positioned.fill(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                    child: Container(color: Colors.black.withOpacity(0.8)),
                  ),
                ),
                Form(
                  key: _formKey,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 20,
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextFormFieldWidget(
                          controller: _name,
                          hintText: "Enter Your Name",
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Iltimos ismingizni kiriting";
                            }
                            return null;
                          },
                        ),
                        TextFormFieldWidget(
                          controller: _email,
                          hintText: "Enter Your Email",
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Iltimos email kiriting";
                            }
                            return null;
                          },
                        ),
                        TextFormFieldWidget(
                          controller: _password,
                          hintText: "Password",
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Iltimos parol kiriting";
                            } else if (_password.text.length < 6) {
                              return "Parol 6 ta raqamdan kop bolsh kere";
                            }
                            return null;
                          },
                        ),
                        TextFormFieldWidget(
                          controller: _passwordConfirmation,
                          hintText: "Confirm Password",
                          validator: (value) {
                            if (_passwordConfirmation.text != _password.text) {
                              return "Parolni to'g'ri kiriting";
                            }
                            return null;
                          },
                        ),
                        Row(
                          spacing: 30,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                "Do you have TOPSTRETCHING membership?",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      member = 'yes';
                                    });
                                  },
                                  child: Row(
                                    children: [
                                      Icon(
                                        member == 'yes'
                                            ? Icons.radio_button_checked
                                            : Icons.radio_button_unchecked,
                                        size: 30,
                                        color: Colors.pink[400],
                                      ),
                                      SizedBox(width: 8),
                                      Text(
                                        "Yes",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      member = 'no';
                                    });
                                  },
                                  child: Row(
                                    children: [
                                      Icon(
                                        member == 'no'
                                            ? Icons.radio_button_checked
                                            : Icons.radio_button_unchecked,
                                        size: 30,
                                        color: Colors.pink[400],
                                      ),
                                      SizedBox(width: 8),
                                      Text(
                                        "No",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Text(
                          "We’re all set. Now let’s create your account.",
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                        RowWidget(
                          text: "I agree to TOPSTRETCHING Terms & Conditions",
                          isSelected: isSelected,
                          onTap: () {
                            setState(() {
                              isSelected = !isSelected;
                            });
                          },
                        ),
                        RowWidget(
                          text: "I agree to Privacy Policy",
                          isSelected: isSelected2,
                          onTap: () {
                            setState(() {
                              isSelected2 = !isSelected2;
                            });
                          },
                        ),
                        Spacer(),
                        SizedBox(
                          width: double.infinity,
                          height: 55,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.pink[400],
                            ),
                            onPressed:
                                (canCantinue && state is! AuthLoading)
                                    ? () {
                                      if (_formKey.currentState!.validate()) {
                                        context.read<AuthBloc>().add(
                                          Register(
                                            name: _name.text,
                                            password: _password.text,
                                            email: _email.text,
                                          ),
                                        );
                                      }
                                    }
                                    : null,
                            child:
                                state is AuthLoading
                                    ? CircularProgressIndicator()
                                    : Text(
                                      "Create an account",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 25,
                                      ),
                                    ),
                          ),
                        ),
                        SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
