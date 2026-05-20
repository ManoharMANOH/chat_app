import 'package:chat_app/core/theme/app_colors.dart';
import 'package:chat_app/core/theme/app_sizes.dart';
import 'package:chat_app/ui/bloc/auth/auth_bloc.dart';
import 'package:chat_app/ui/bloc/auth/auth_event.dart';
import 'package:chat_app/ui/bloc/auth/auth_state.dart';
import 'package:chat_app/ui/validations/validator.dart';
import 'package:chat_app/ui/widgets/gradient_header.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isSignUpPage = false;
  bool obscurePassword = true;
  late TapGestureRecognizer _authToggleRecognizer;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _authToggleRecognizer = TapGestureRecognizer()
      ..onTap = () {
        setState(() {
          isSignUpPage = !isSignUpPage;
        });
      };
  }

  @override
  void dispose() {
    _authToggleRecognizer.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthAuthenticated) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                isSignUpPage ? "SignUp Successfully" : "Login Successfully",
              ),
            ),
          );
        }
        if (state is AuthError) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message)));
        }
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                GradientHeader(
                  descriptionText: isSignUpPage
                      ? "Create your account to get started"
                      : "Login to continue",
                ),
                Transform.translate(
                  offset: const Offset(0, -80),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: AppSizes.md),
                    child: Container(
                      padding: const EdgeInsets.all(AppSizes.md),
                      decoration: BoxDecoration(
                        color: colorScheme.surface,
                        borderRadius: BorderRadius.circular(
                          AppSizes.borderRadiusMd,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: colorScheme.onSurface,
                            blurRadius: 12,
                            offset: Offset(0, 6),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        spacing: AppSizes.md,
                        children: [
                          TextFormField(
                            controller: emailController,
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return "Email is required";
                              } else if (!Validators.isValidEmail(
                                value.trim(),
                              )) {
                                return "Enter a valid Email";
                              }
                              return null;
                            },
                            decoration: const InputDecoration(
                              labelText: "Email",
                              prefixIcon: Icon(Icons.email_outlined),
                            ),
                            textInputAction: TextInputAction.next,
                          ),
                          TextFormField(
                            controller: passwordController,
                            obscureText: obscurePassword,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Password is required";
                              }
                              if (value.length < 6) {
                                return "Password must be at least 6 characters";
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              labelText: "Password",
                              prefixIcon: const Icon(Icons.lock_outline),
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    obscurePassword = !obscurePassword;
                                  });
                                },
                                icon: Icon(
                                  obscurePassword
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  color: AppColors.primaryColor,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: double.maxFinite,
                            child: FilledButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  if (isSignUpPage) {
                                    context.read<AuthBloc>().add(
                                      AuthSignupRequested(
                                        email: emailController.text.trim(),
                                        password: passwordController.text
                                            .trim(),
                                      ),
                                    );
                                  } else {
                                    context.read<AuthBloc>().add(
                                      AuthSigninRequested(
                                        email: emailController.text.trim(),
                                        password: passwordController.text
                                            .trim(),
                                      ),
                                    );
                                  }
                                }
                              },
                              child: Text(isSignUpPage ? "Sign Up" : "Login"),
                            ),
                          ),
                          SizedBox(height: AppSizes.xs),
                          Text.rich(
                            TextSpan(
                              text: isSignUpPage
                                  ? "Already have an account? "
                                  : "Don't have an account? ",
                              style: textTheme.bodyMedium?.copyWith(
                                color: Colors.grey,
                              ),
                              children: [
                                TextSpan(
                                  text: isSignUpPage ? "Login" : "Sign Up",
                                  style: textTheme.bodyMedium?.copyWith(
                                    color: AppColors.primaryColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  recognizer: _authToggleRecognizer,
                                ),
                              ],
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
