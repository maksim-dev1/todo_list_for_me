import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  void _onContinuePressed() {
    if (_currentIndex < 2) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const WelcomePage(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          PageView.builder(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            //physics: const NeverScrollableScrollPhysics(),
            itemCount: 3,
            itemBuilder: (context, index) {
              switch (index) {
                case 0:
                  return const FirstPageOnboarding();
                case 1:
                  return const SecondPageOnboarding();
                case 2:
                  return const ThirdPageOnboarding();
                default:
                  return const SizedBox.shrink();
              }
            },
          ),
          Positioned(
            top: 25,
            right: 10,
            child: TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const WelcomePage(),
                  ),
                );
              },
              child: Text(
                'Пропустить',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: _currentIndex == 0
                      ? Theme.of(context).colorScheme.onPrimary
                      : Theme.of(context).colorScheme.primary,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 170,
            child: SmoothPageIndicator(
              controller: _pageController,
              count: 3,
              effect: ExpandingDotsEffect(
                activeDotColor: _currentIndex == 0
                    ? Theme.of(context).colorScheme.onPrimary
                    : Theme.of(context).colorScheme.primary,
                dotColor: _currentIndex == 0
                    ? Theme.of(context).colorScheme.onPrimary.withOpacity(0.3)
                    : Theme.of(context).colorScheme.primary.withOpacity(0.3),
                dotHeight: 8,
                dotWidth: 8,
              ),
            ),
          ),
          Positioned(
            bottom: 50,
            right: 16,
            left: 16,
            child: SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(
                    _currentIndex == 0
                        ? Theme.of(context).colorScheme.onPrimary
                        : Theme.of(context).colorScheme.primary,
                  ),
                  shape: WidgetStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ),
                onPressed: _onContinuePressed,
                child: Text(
                  'Продолжить',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: _currentIndex == 0
                        ? Theme.of(context).colorScheme.primary
                        : Theme.of(context).colorScheme.onPrimary,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class FirstPageOnboarding extends StatelessWidget {
  const FirstPageOnboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                'assets/onboarding/logo_onboarding.svg',
              ),
              Text(
                'ToDo List',
                style: TextStyle(
                    color: Theme.of(context).colorScheme.onPrimary,
                    fontSize: 26,
                    fontWeight: FontWeight.w700),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 5),
                child: Text(
                  'Лучшее приложение для планирования задач — это то, что вам нужно!',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onPrimary,
                    fontSize: 14,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SecondPageOnboarding extends StatelessWidget {
  const SecondPageOnboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: DecoratedBox(
        decoration:
            BoxDecoration(color: Theme.of(context).colorScheme.onPrimary),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Positioned(
                top: 110,
                left: 0,
                right: 0,
                child: Image.asset(
                    'assets/onboarding/onboarding_second_image.webp')),
            Positioned(
              bottom: 295,
              left: 0,
              right: 0,
              child: Align(
                child: SizedBox(
                  width: 300,
                  child: Text(
                    'Для вашего удобства составьте список дел',
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w600,
                      color: Theme.of(context).colorScheme.onSurface,
                      height: 1,
                    ),
                    textAlign: TextAlign.center,
                    softWrap: true,
                  ),
                ),
              ),
            ),
            const Positioned(
              bottom: 200,
              left: 0,
              right: 0,
              child: Align(
                child: SizedBox(
                  width: 330,
                  child: Text(
                    'Вот мобильная платформа, которая поможет вам создавать задачи или составлять списки, чтобы выполнять любую работу проще и быстрее.',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Color.fromRGBO(118, 126, 140, 1),
                    ),
                    textAlign: TextAlign.center,
                    softWrap: true,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ThirdPageOnboarding extends StatelessWidget {
  const ThirdPageOnboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: DecoratedBox(
        decoration:
            BoxDecoration(color: Theme.of(context).colorScheme.onPrimary),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Positioned(
                top: 100,
                left: 0,
                right: 0,
                child: Image.asset(
                    'assets/onboarding/onboarding_third_image.webp')),
            Positioned(
              bottom: 295,
              left: 0,
              right: 0,
              child: Align(
                child: SizedBox(
                  width: 350,
                  child: Text(
                    'Оцените удобство создания вашего списка дел',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: Theme.of(context).colorScheme.onSurface,
                      height: 1,
                    ),
                    textAlign: TextAlign.center,
                    softWrap: true,
                  ),
                ),
              ),
            ),
            const Positioned(
              bottom: 200,
              left: 0,
              right: 0,
              child: Align(
                child: SizedBox(
                  width: 350,
                  child: Text(
                    'Простой и понятный интерфейс, который делает работу с приложением удобнее при создании задач или списков дел, может также повысить вашу продуктивность.',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Color.fromRGBO(118, 126, 140, 1),
                    ),
                    textAlign: TextAlign.center,
                    softWrap: true,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:
            const EdgeInsets.only(left: 16, right: 16, top: 76, bottom: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Добро пожаловать в ',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Theme.of(context).colorScheme.onSurface),
                  ),
                  TextSpan(
                      text: 'To Do List',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Theme.of(context).colorScheme.primary))
                ],
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Image.asset('assets/onboarding/onboarding_last_image.webp'),
            const Spacer(),
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
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset('assets/onboarding/email_icon.svg'),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      'Продолжить с email',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Theme.of(context).colorScheme.onPrimary),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            const Row(
              children: [
                Expanded(
                  child: Divider(
                    color: Color.fromRGBO(118, 126, 140, 1),
                    thickness: 0.5,
                  ),
                ),
                SizedBox(
                  width: 16,
                ),
                Text(
                  'Продолжить с',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Color.fromRGBO(118, 126, 140, 1),
                  ),
                ),
                SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: Divider(
                    color: Color.fromRGBO(118, 126, 140, 1),
                    thickness: 0.5,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 56,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: const WidgetStatePropertyAll(
                          Color.fromRGBO(243, 245, 249, 1),
                        ),
                        shape: WidgetStatePropertyAll(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                      ),
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                              'assets/onboarding/brend_vk_icon.svg'),
                          const SizedBox(
                            width: 13,
                          ),
                          Text(
                            'Вконтакте',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Theme.of(context).colorScheme.onSurface),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: SizedBox(
                    height: 56,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: const WidgetStatePropertyAll(
                          Color.fromRGBO(243, 245, 249, 1),
                        ),
                        shape: WidgetStatePropertyAll(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                      ),
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                              'assets/onboarding/brend_google_icon.svg'),
                          const SizedBox(
                            width: 13,
                          ),
                          Text(
                            'Google',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Theme.of(context).colorScheme.onSurface),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
