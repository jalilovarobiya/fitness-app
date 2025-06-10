import 'package:fitness_app/core/constants/app_images.dart';
import 'package:fitness_app/core/routes/app_routes.dart';
import 'package:fitness_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:fitness_app/features/auth/presentation/widgets/text_form_field_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/di/service_locator.dart' as di;
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _email = TextEditingController();
  final _password = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _email.clear();
    _password.clear();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => di.sl<AuthBloc>(),
      child: Scaffold(
        body: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is Authenticated) {
              Navigator.pushReplacementNamed(context, AppRoutes.main);
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
                        image: AssetImage(AppImages.login),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Positioned.fill(
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(AppImages.blur),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Form(
                  key: _formKey,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      spacing: 20,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextFormFieldWidget(
                          controller: _email,
                          hintText: "Enter your email",
                          prefixicon: Icon(
                            size: 40,
                            Icons.person_outline_rounded,
                            color: Colors.pink[400],
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Iltimos email kiriting";
                            }
                            return null;
                          },
                        ),
                        TextFormFieldWidget(
                          prefixicon: Icon(
                            size: 40,
                            Icons.lock_outline,
                            color: Colors.pink[400],
                          ),
                          controller: _password,
                          hintText: "Enter your password",
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Iltimos parol kiriting";
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          width: double.infinity,
                          height: 55,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.pink[400],
                            ),
                            onPressed:
                                state is AuthLoading
                                    ? null
                                    : () {
                                      if (_formKey.currentState!.validate()) {
                                        context.read<AuthBloc>().add(
                                          Login(
                                            email: _email.text,
                                            password: _password.text,
                                          ),
                                        );
                                      }
                                    },
                            child:
                                state is AuthLoading
                                    ? CircularProgressIndicator()
                                    : Text(
                                      "LOG IN",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 25,
                                      ),
                                    ),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, AppRoutes.register);
                          },
                          child: Text(
                            "Create a new account",
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                        ),
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
