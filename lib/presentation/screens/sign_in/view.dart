import 'package:chikitsa_assign/gen/assets.gen.dart';
import 'package:chikitsa_assign/presentation/screens/sign_in/bloc.dart';
import 'package:chikitsa_assign/presentation/screens/sign_in/event.dart';
import 'package:chikitsa_assign/presentation/screens/sign_in/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignInBloc()..add(InitEvent()),
      child: BlocConsumer<SignInBloc, SignInState>(
        listener: (context, state) {
          switch (state.status) {
            case SignInStatus.initial:
              break;
            case SignInStatus.loading:
              break;
            case SignInStatus.loaded:
              break;
            case SignInStatus.error:
              break;
            case null:
          }
        },
        builder: (context, state) {
          return _buildPage(context, state);
        },
      ),
    );
  }

  Widget _buildPage(BuildContext context, SignInState state) {
    switch (state.status) {
      case SignInStatus.initial:
        return const Scaffold(
          body: Center(child: CircularProgressIndicator()),
        );
      case SignInStatus.loading:
        return const Scaffold(body: Center(child: CircularProgressIndicator()));
      case SignInStatus.loaded:
        return Page(
          state: state,
        );
      default:
        return const Scaffold(
          body: Center(child: Text("SignIn default")),
        );
    }
  }
}

class Page extends StatelessWidget {
  const Page({super.key, required SignInState state});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 80),
            Center(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 36,
                    backgroundColor: Colors.blue[100],
                    child: Icon(Icons.local_hospital,
                        size: 36, color: Colors.blue),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Adhicine',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
            const Text(
              'Sign In',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 28,
              ),
            ),
            const SizedBox(height: 24),
            TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.email, color: Colors.teal),
                labelText: 'Email',
                errorText: 'Incorrect Email Address',
              ),
            ),
            const SizedBox(height: 16),
            TextFormField(
              obscureText: true,
              decoration: InputDecoration(
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                prefixIcon: Icon(Icons.lock, color: Colors.teal),
                labelText: 'Password',
                suffixIcon: Icon(Icons.visibility_off),
              ),
            ),
            const SizedBox(height: 8),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {},
                child: const Text('Forgot Password?'),
              ),
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(22),
                  ),
                ),
                onPressed: () {},
                child: const Text('Sign In',
                    style: TextStyle(color: Colors.white)),
              ),
            ),
            const SizedBox(height: 16),
            const Row(
              children: [
                Expanded(child: Divider()),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  child: Text('OR'),
                ),
                Expanded(child: Divider()),
              ],
            ),
            const SizedBox(height: 16),
            Container(
              width: double.infinity,
              height: 50,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(22),
              ),
              child: OutlinedButton.icon(
                onPressed: () {},
                icon: SvgPicture.asset(Assets.googleLogo),
                label: const Text('Continue with Google'),
                style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),
            Center(
              child: RichText(
                text: TextSpan(
                  text: 'New to Adhicine? ',
                  style: const TextStyle(color: Colors.black),
                  children: [
                    TextSpan(
                      text: 'Sign Up',
                      style: const TextStyle(
                          color: Colors.blue, fontWeight: FontWeight.bold),
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
