import 'package:fitness_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:fitness_app/features/auth/presentation/pages/register_page.dart';
import 'package:fitness_app/features/auth/presentation/widgets/text_form_field_widget.dart';
import 'package:fitness_app/features/navigation/pages/main_wrapper_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/di/service_locator.dart' as di;

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final _email = TextEditingController();
    final _password = TextEditingController();

    return BlocProvider(
      create: (_) => di.sl<AuthBloc>(),
      child: Scaffold(
        body: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is Authenticated) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => MainScreen()),
              );
            } else if (state is AuthError) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(state.message)));
            }
          },
          builder: (context, state) {
            return Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  spacing: 20,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextFormFieldWidget(
                      controller: _email,
                      hintText: "Email",
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
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
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
                                  _email.clear();
                                  _password.clear();
                                },
                        child:
                            state is AuthLoading
                                ? CircularProgressIndicator()
                                : Text("Login"),
                      ),
                    ),

                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => RegisterPage()),
                        );
                      },
                      child: Text("Register"),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
