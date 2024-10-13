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
        duration: const Duration(milliseconds: 500), // Длительность анимации
        curve: Curves.easeInOut, // Кривая анимации
      );
    } else {
      // Здесь можно добавить логику перехода на другую страницу
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const RegistrationScreen()),
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
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 3, // Количество страниц
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
            top: 55,
            right: 10,
            child: TextButton(
              onPressed: () {
                // TODO: Логика перехода на страницу регистрации
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
            child: SizedBox(
              width: 300,
              height: 50,
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

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Registration')),
      body: const Center(child: Text('Registration Page')),
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
    return Scaffold(
      body: SizedBox(
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
                bottom: 330,
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
                bottom: 240,
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
      ),
    );
  }
}

class ThirdPageOnboarding extends StatelessWidget {
  const ThirdPageOnboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
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
                bottom: 320,
                left: 0,
                right: 0,
                child: Align(
                  child: SizedBox(
                    width: 300,
                    child: Text(
                      'Оцените удобство создания вашего списка дел',
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
                bottom: 230,
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
      ),
    );
  }
}
