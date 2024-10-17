import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todo_list_for_me/common/widgets/custom_text_from_field.dart';
import 'package:todo_list_for_me/fiature/login/presentation/screens/login_screen.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool _isVisibilityPasword = true;
  bool _isVisibilityReplayPasword = true;

  final _formKey = GlobalKey<FormState>();

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
                          'Создать аккаунт',
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall
                              ?.copyWith(fontWeight: FontWeight.w600),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Создайте свою учетную запись и ощутите все преимущества',
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
                      Text('Имя пользователя',
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
                          hintText: 'Введите имя',
                          validator: (value) {
                            final trimmedValue = value?.trim();
                            if (trimmedValue == null || trimmedValue.isEmpty) {
                              return 'Введите имя';
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
                      const SizedBox(height: 12),
                      Text('Повторите пароль',
                          style: Theme.of(context).textTheme.titleMedium),
                      Focus(
                        onFocusChange: (hasFocus) {
                          if (!hasFocus) {
                            setState(() {
                              _isVisibilityReplayPasword = true;
                              _formKey.currentState!.validate();
                            });
                          }
                        },
                        child: CustomTextFromField(
                          obscureText: _isVisibilityReplayPasword,
                          hintText: 'Введите пароль повторно',
                          suffixIcon: IconButton(
                            icon: _isVisibilityReplayPasword
                                ? SvgPicture.asset(
                                    'assets/onboarding/eye_closed_icon.svg')
                                : SvgPicture.asset(
                                    'assets/onboarding/eye_open_icon.svg'),
                            onPressed: () {
                              setState(() {
                                _isVisibilityReplayPasword =
                                    !_isVisibilityReplayPasword;
                              });
                            },
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Введите пароль повторно';
                            } else if (value != passwordController.text) {
                              return 'Пароли не совпадают';
                            }
                            return null;
                          },
                        ),
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
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => const OnboardingScreen(),
                    //   ),
                    // );
                  }
                },
                child: Text(
                  'Зарегистроваться',
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
                      text: 'У вас уже есть аккаунт? ',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: const Color.fromRGBO(118, 126, 140, 1),
                          ),
                    ),
                    TextSpan(
                      text: 'Войти',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Theme.of(context).colorScheme.primary,
                          ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginScreen(),
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
