import 'package:flutter/material.dart';
import 'package:epicticker/common/color.dart';
import 'package:epicticker/common/text_styles.dart';

class DayLeftCardWidget extends StatelessWidget {
  const DayLeftCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8.0),
      height: 107.0,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        color: EpicTickerColors.lightPink,
        borderRadius: BorderRadius.all(Radius.circular(10.0))
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Get out from company',
            style: EpicTickerTextStyles.heading(
              color: EpicTickerColors.dark,
              fontWeight: FontWeight.bold
            ),
          ),
          Text(
            '32 days',
            style: EpicTickerTextStyles.heading(
              color: EpicTickerColors.brown
            ),
          )
        ],
      ),
    );
  }
}
