import 'package:fitness_app/core/routes/app_routes.dart';
import 'package:fitness_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:fitness_app/features/auth/presentation/pages/login_page.dart';
import 'package:fitness_app/features/user/presentation/bloc/user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/di/service_locator.dart' as di;

class ProfilePage extends StatefulWidget {
  final String userId;
  const ProfilePage({super.key, required this.userId});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late UserBloc _userBloc;
  // late AuthBloc _authBloc;

  @override
  void initState() {
    super.initState();
    _userBloc = di.sl<UserBloc>();
    // _authBloc = di.sl<AuthBloc>();
    _userBloc.add(FetchUsers(userId: widget.userId));
  }

  @override
  void dispose() {
    super.dispose();
    _userBloc.close();
    // _authBloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _userBloc,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Profile"),
          automaticallyImplyLeading: false,
        ),
        body: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is Unauthenticated) {
              Navigator.pushNamedAndRemoveUntil(
                context,
                AppRoutes.login,
                (route) => false,
              );
            }
          },
          builder: (context, authState) {
            return BlocBuilder<UserBloc, UserState>(
              builder: (context, userState) {
                if (userState is UserLoading) {
                  return Center(child: CircularProgressIndicator());
                } else if (userState is UserError) {
                  return Center(
                    child: Column(
                      spacing: 18,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.error, color: Colors.red, size: 60),
                        Text(
                          "Xatolik yuz berd",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(userState.error),
                        ElevatedButton(
                          onPressed: () {
                            _userBloc.add(FetchUsers(userId: widget.userId));
                          },
                          child: Text("Qayta urnb koring"),
                        ),
                      ],
                    ),
                  );
                } else if (userState is UserSuccess) {
                  final user = userState.user;
                  return SingleChildScrollView(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 50,
                          child:
                              user.photoUrl != null
                                  ? Image.network(
                                    user.photoUrl!,
                                    fit: BoxFit.cover,
                                  )
                                  : Icon(Icons.person),
                        ),
                        Text(user.name),
                        Text(user.email),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton.icon(
                            onPressed:
                                authState is AuthLoading
                                    ? null
                                    : () {
                                      _logOutDialog(context);
                                    },
                            icon:
                                authState is AuthLoading
                                    ? SizedBox(
                                      height: 20,
                                      width: 20,
                                      child: CircularProgressIndicator(
                                        strokeWidth: 2,
                                        valueColor: AlwaysStoppedAnimation(
                                          Colors.white,
                                        ),
                                      ),
                                    )
                                    : Icon(Icons.logout),
                            label: Text(
                              authState is AuthLoading
                                  ? "chiqilmoqda"
                                  : "chiqish",
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }
                return Center(child: Text("Profile ma'lumotlari yuklanmoqda"));
              },
            );
          },
        ),
      ),
    );
  }
}

void _logOutDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext dialogContext) {
      return AlertDialog(
        title: Text("Chiqish"),
        content: Text("Xisobni tark etmoxchmsz"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(dialogContext).pop();
            },
            child: Text("Bekor qilish"),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            onPressed: () {
              Navigator.of(dialogContext).pop();
              // context.read<AuthBloc>().add(Logout());
              BlocProvider.of<AuthBloc>(context).add(Logout());
            },
            child: Text("Chiqish"),
          ),
        ],
      );
    },
  );
}
