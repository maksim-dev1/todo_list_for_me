import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BottomSheetFillTask extends StatelessWidget {
  const BottomSheetFillTask({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      //height: 200,
      width: double.infinity,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 8,
            ),
            SizedBox(
              width: 54,
              height: 5,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(225, 231, 241, 1),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  TextField(
                    autofocus: true,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'например: Встреча с клиентом',
                      hintStyle:
                          Theme.of(context).textTheme.bodyLarge?.copyWith(
                                color: const Color.fromRGBO(169, 176, 197, 1),
                              ),
                      contentPadding: EdgeInsets.zero,
                      isDense: true,
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  TextField(
                    autofocus: true,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Описание',
                      hintStyle:
                          Theme.of(context).textTheme.bodyLarge?.copyWith(
                                color: const Color.fromRGBO(169, 176, 197, 1),
                              ),
                      contentPadding: EdgeInsets.zero,
                      isDense: true,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            // TODO: Доделать строку с кнопками в аиде иконок
            Row(
              children: [
                SvgPicture.asset('assets/add_task/inbox.svg'),
                SvgPicture.asset('assets/add_task/calendar.svg'),
                SvgPicture.asset('assets/add_task/clock.svg'),
                SvgPicture.asset('assets/add_task/flag.svg'),
                // IconButton(
                //   onPressed: () {},
                //   icon: SvgPicture.asset('assets/add_task/inbox.svg'),
                // ),
                // IconButton(
                //   onPressed: () {},
                //   icon: SvgPicture.asset('assets/add_task/calendar.svg'),
                // ),
                // IconButton(
                //   onPressed: () {},
                //   icon: SvgPicture.asset('assets/add_task/clock.svg'),
                // ),
                // IconButton(
                //   onPressed: () {},
                //   icon: SvgPicture.asset('assets/add_task/flag.svg'),
                // ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
