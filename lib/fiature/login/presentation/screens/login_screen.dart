import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo_list_for_me/common/widgets/custom_text_from_field.dart';
import 'package:todo_list_for_me/fiature/onboarding/presentation/screens/onboarding_screen.dart';
import 'package:todo_list_for_me/fiature/registration/presentation/screens/registration_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool _isVisibilityPasword = true;

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 84, left: 24, right: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Text(
                          'С возвращением!',
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall
                              ?.copyWith(fontWeight: FontWeight.w600),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'С приложением To Do ваша работа станет быстрее и структурированнее',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: const Color.fromRGBO(118, 126, 140, 1),
                            ),
                      ),
                      const SizedBox(height: 49),
                      Text('Email',
                          style: Theme.of(context).textTheme.titleMedium),
                      Focus(
                        onFocusChange: (hasFocus) {
                          if (!hasFocus) {
                            setState(() {
                              _formKey.currentState!.validate();
                            });
                          }
                        },
                        child: CustomTextFromField(
                          controller: emailController,
                          hintText: 'name@example.com',
                          validator: (value) {
                            final trimmedValue = value?.trim();
                            if (trimmedValue == null || trimmedValue.isEmpty) {
                              return 'Введите email';
                            }

                            final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
                            if (!emailRegex.hasMatch(trimmedValue)) {
                              return 'Введите корректный email';
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text('Пароль',
                          style: Theme.of(context).textTheme.titleMedium),
                      Focus(
                        onFocusChange: (hasFocus) {
                          if (!hasFocus) {
                            setState(() {
                              _isVisibilityPasword = true;
                              _formKey.currentState!.validate();
                            });
                          }
                        },
                        child: CustomTextFromField(
                          controller: passwordController,
                          obscureText: _isVisibilityPasword,
                          hintText: 'Введите пароль',
                          suffixIcon: IconButton(
                            icon: _isVisibilityPasword
                                ? SvgPicture.asset(
                                    'assets/onboarding/eye_closed_icon.svg')
                                : SvgPicture.asset(
                                    'assets/onboarding/eye_open_icon.svg'),
                            onPressed: () {
                              setState(() {
                                _isVisibilityPasword = !_isVisibilityPasword;
                              });
                            },
                          ),
                          validator: (value) {
                            if (value != null) {
                              if (value.startsWith(' ')) {
                                return 'Пароль не должен начинаться с пробела';
                              } else if (value.endsWith(' ')) {
                                return 'Пароль не должен заканчиваться пробелом';
                              }
                            }

                            if (value == null || value.isEmpty) {
                              return 'Введите пароль';
                            }
                            if (value.length < 6) {
                              return 'Пароль должен содержать не менее 6 символов';
                            }

                            return null;
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(
                      Theme.of(context).colorScheme.primary),
                  shape: WidgetStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const OnboardingScreen(),
                      ),
                    );
                  }
                },
                child: Text(
                  'Войти',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontSize: 18,
                      color: Theme.of(context).colorScheme.onPrimary),
                ),
              ),
            ),
            const SizedBox(
              height: 7,
            ),
            Center(
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'У вас ещё нет аккаунта? ',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: const Color.fromRGBO(118, 126, 140, 1),
                          ),
                    ),
                    TextSpan(
                      text: 'Создать',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Theme.of(context).colorScheme.primary,
                          ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const RegistrationScreen(),
                            ),
                          );
                        },
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
