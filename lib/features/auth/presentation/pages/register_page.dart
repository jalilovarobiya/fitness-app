import 'package:fitness_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:fitness_app/features/auth/presentation/widgets/text_form_field_widget.dart';
import 'package:fitness_app/features/navigation/pages/main_wrapper_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/di/service_locator.dart' as di;

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final _email = TextEditingController();
    final _password = TextEditingController();
    final _name = TextEditingController();

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
                      controller: _name,
                      hintText: "Name",
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Iltimos ismingizni kiriting";
                        }
                        return null;
                      },
                    ),
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
                                      Register(
                                        name: _name.text,
                                        password: _password.text,
                                        email: _email.text,
                                      ),
                                    );
                                  }
                                  _name.clear();
                                  _password.clear();
                                  _email.clear();
                                },
                        child:
                            state is AuthLoading
                                ? CircularProgressIndicator()
                                : Text("Register"),
                      ),
                    ),

                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text("Login"),
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
