import 'package:flutter/material.dart';
import 'package:epicticker/common/color.dart';
import 'package:epicticker/common/text_styles.dart';

class ProgressBarWidget extends StatelessWidget {
  final double completion;
	// TODO: create select of color
  const ProgressBarWidget({super.key, required this.completion});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Stack(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height: 12.0,
              decoration: BoxDecoration(
								color: EpicTrackerColors.main,
								borderRadius: BorderRadius.circular(10.0)
							),
            ),
            Container(
              width: MediaQuery.of(context).size.width * completion,
              height: 12.0,
              decoration: BoxDecoration(
								color: EpicTrackerColors.secondary,
								borderRadius: BorderRadius.circular(10.0)
							),
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(top: 6.0),
              child: Text(
                '${(completion * 100).toInt()}%',
                style: EpicTrackerTextStyles.caption(fontWeight: FontWeight.w900),
              ),
            )
          ],
        )
      ],
    );
  }
}
