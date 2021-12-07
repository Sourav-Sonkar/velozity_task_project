import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:velozity_project/bloc/loginCubit/login_cubit.dart';
import 'package:velozity_project/network/network_connection.dart';
import 'package:velozity_project/screen/restaurant_screen.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  static String routeName = '/login';

  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _editPassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(context.read<NetworkConnection>()),
      child: BlocListener<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state.errMsg.isNotEmpty) {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                SnackBar(
                  content: Text(state.errMsg),
                  backgroundColor: Colors.red,
                ),
              );
          }
          if (state.isSuccess) {
            Navigator.pushNamed(context, RestaurantScreen.routeName);
          }
        },
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextField(
                    controller: _phoneController,
                    keyboardType: TextInputType.phone,
                    maxLength: 10,
                    decoration: const InputDecoration(
                      hintText: 'Phone Number',
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: _editPassword,
                    obscureText: true,
                    decoration: const InputDecoration(
                      hintText: 'Password',
                    ),
                  ),
                  const SizedBox(height: 10),
                  BlocBuilder<LoginCubit, LoginState>(
                    builder: (context, state) {
                      if (state.isLoading) {
                        return const CircularProgressIndicator();
                      }
                      return ElevatedButton(
                        onPressed: () {
                          if (_phoneController.text.isEmpty ||
                              _editPassword.text.isEmpty) {
                            ScaffoldMessenger.of(context)
                              ..hideCurrentSnackBar()
                              ..showSnackBar(
                                const SnackBar(
                                  content: Text('Please fill all the fields'),
                                  backgroundColor: Colors.red,
                                ),
                              );
                            return;
                          }
                          if (_phoneController.text.length != 10) {
                            ScaffoldMessenger.of(context)
                              ..hideCurrentSnackBar()
                              ..showSnackBar(
                                const SnackBar(
                                  content:
                                      Text('Please enter a valid phone number'),
                                  backgroundColor: Colors.red,
                                ),
                              );
                            return;
                          }
                          context.read<LoginCubit>().login(
                                _phoneController.text.trim(),
                                _editPassword.text.trim(),
                              );
                        },
                        child: const Text('Login'),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
