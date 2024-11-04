import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo_list_for_me/common/colors/colors.dart';
import 'package:todo_list_for_me/fiature/add_task/presentation/widgets/bottom_sheet/bottom_sheet_fill_task.dart';

class HomeScreen extends StatelessWidget {
  final int colorIndex;
  const HomeScreen({super.key, required this.colorIndex});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 80, right: 20, left: 20),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Today',
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall
                          ?.copyWith(fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      'Лучшая платформа для создания задач',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: const Color.fromRGBO(118, 126, 140, 1),
                          ),
                    ),
                  ],
                ),
                const Spacer(),
              ],
            ),
            const SizedBox(
              height: 34,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 36,
                  width: double.infinity,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: colorsTask[colorIndex],
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(8),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.onPrimary,
                      boxShadow: const [
                        BoxShadow(
                          color: Color.fromRGBO(15, 22, 58, 0.1),
                          blurRadius: 20,
                        ),
                      ],
                      borderRadius: const BorderRadius.vertical(
                        bottom: Radius.circular(8),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 8, bottom: 16, right: 16, left: 8),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              IconButton(
                                onPressed: () {
                                  showModalBottomSheet(
                                    context: context,
                                    builder: (context) {
                                      return BottomSheetFillTask();
                                    },
                                  );
                                },
                                icon: SvgPicture.asset(
                                  'assets/home/add_task.svg',
                                  colorFilter: ColorFilter.mode(
                                      colorsTask[colorIndex], BlendMode.srcIn),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  'Нажмите плюс, чтобы создать новую задачу',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium
                                      ?.copyWith(height: 1),
                                  softWrap: true,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 8),
                            child: Divider(
                              height: 1,
                              color: Color.fromRGBO(224, 229, 237, 1),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: Row(
                              children: [
                                Text(
                                  'Добавьте свою задачу',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall
                                      ?.copyWith(
                                        color: const Color.fromRGBO(
                                            118, 126, 140, 1),
                                      ),
                                ),
                                const Spacer(),
                                //TODO: Добавить форматирование даты (Today . Mon 20 Jul 2022)
                                Text(
                                  DateTime.now().toString(),
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall
                                      ?.copyWith(
                                        color: const Color.fromRGBO(
                                            118, 126, 140, 1),
                                      ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}


// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   int currentPageIndex = 0;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       bottomNavigationBar: NavigationBar(
//         destinations: [
//           NavigationDestination(
//             selectedIcon: Icon(Icons.home),
//             icon: Icon(Icons.home_outlined),
//             label: 'Home',
//           ),
//           NavigationDestination(
//             icon: Badge(child: Icon(Icons.notifications_sharp)),
//             label: 'Notifications',
//           ),
//         ],
//         onDestinationSelected: (int index) {
//           setState(() {
//             currentPageIndex = index;
//           });
//         },
//       ),
//       body: <Widget>[
        
//       ][currentPageIndex],
//     );
//   }
// }
