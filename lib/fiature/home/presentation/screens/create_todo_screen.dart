import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo_list_for_me/common/colors/colors.dart';

import 'menu_screen.dart';

class CreateTodoScreen extends StatefulWidget {
  const CreateTodoScreen({super.key});

  @override
  State<CreateTodoScreen> createState() => _CreateTodoScreenState();
}

class _CreateTodoScreenState extends State<CreateTodoScreen> {
  int? colorIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 84, left: 16, right: 16),
        child: Column(
          children: [
            Text(
              'Создайте свою первую задачу',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontSize: 26,
                    fontWeight: FontWeight.w600,
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
              textAlign: TextAlign.center,
              softWrap: true,
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              'Выберите цвет для вашей задачи:',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: const Color.fromRGBO(118, 126, 140, 1),
                  ),
              textAlign: TextAlign.center,
              softWrap: true,
            ),
            const SizedBox(
              height: 33,
            ),
            Column(
              children: List.generate(
                4,
                (index) {
                  return Column(
                    children: [
                      Stack(
                        clipBehavior: Clip.none,
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                colorIndex = index;
                              });
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 36,
                                  width: double.infinity,
                                  child: DecoratedBox(
                                    decoration: BoxDecoration(
                                      color: colorsTask[index],
                                      borderRadius: const BorderRadius.vertical(
                                        top: Radius.circular(8),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 68,
                                  width: double.infinity,
                                  child: DecoratedBox(
                                    decoration: BoxDecoration(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onPrimary,
                                      boxShadow: const [
                                        BoxShadow(
                                          color:
                                              Color.fromRGBO(15, 22, 58, 0.1),
                                          blurRadius: 20,
                                        ),
                                      ],
                                      borderRadius: const BorderRadius.vertical(
                                        bottom: Radius.circular(8),
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(16),
                                      child: Row(
                                        children: [
                                          const SizedBox(
                                            height: 34,
                                            width: 34,
                                            child: CircleAvatar(
                                              backgroundColor: Color.fromRGBO(
                                                  231, 236, 245, 1),
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 16,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                height: 5,
                                                width: 185,
                                                child: DecoratedBox(
                                                  decoration: BoxDecoration(
                                                      color:
                                                          const Color.fromRGBO(
                                                              231, 236, 245, 1),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8)),
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 8,
                                              ),
                                              SizedBox(
                                                height: 5,
                                                width: 128,
                                                child: DecoratedBox(
                                                  decoration: BoxDecoration(
                                                    color: const Color.fromRGBO(
                                                        231, 236, 245, 1),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 8,
                                              ),
                                              SizedBox(
                                                height: 5,
                                                width: 156,
                                                child: DecoratedBox(
                                                  decoration: BoxDecoration(
                                                    color: const Color.fromRGBO(
                                                        231, 236, 245, 1),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Positioned(
                            left: -10,
                            top: -10,
                            child: Builder(
                              builder: (context) {
                                if (colorIndex == index) {
                                  return SizedBox(
                                    width: 32,
                                    height: 32,
                                    child: Badge(
                                      backgroundColor:
                                          Theme.of(context).colorScheme.primary,
                                      label: SvgPicture.asset(
                                          'assets/onboarding/chec_icon.svg'),
                                    ),
                                  );
                                }
                                return const SizedBox.shrink();
                              },
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      )
                    ],
                  );
                },
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
                //TODO: Переделать баннер, так чтобы он появляся сверху
                onPressed: () {
                  if (colorIndex == null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: const Text('Выберите цвет для задачи'),
                        backgroundColor: Theme.of(context).colorScheme.surface,
                        action: SnackBarAction(
                          label: 'Закрыть',
                          textColor: Theme.of(context).colorScheme.primary,
                          onPressed: () {
                            ScaffoldMessenger.of(context).hideCurrentSnackBar();
                          },
                        ),
                      ),
                    );
                  } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MenuScreen(
                          colorIndex: colorIndex!,
                        ),
                      ),
                    );
                  }
                },
                child: Text(
                  'Открыть ToDo',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontSize: 18,
                      color: Theme.of(context).colorScheme.onPrimary),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
