import 'package:flutter/material.dart';

import '../utils/dimensions.dart';
import '../utils/images.dart';
import '../utils/styles.dart';

class TitleRow extends StatelessWidget {
  final String? title;
  final Function? onTap;
  final Duration? eventDuration;
  final bool? isDetailsPage;
  TitleRow(
      {required this.title,
      this.onTap,
      this.eventDuration,
      this.isDetailsPage});

  @override
  Widget build(BuildContext context) {
    int? days, hours, minutes, seconds;
    if (eventDuration != null) {
      days = eventDuration!.inDays;
      hours = eventDuration!.inHours - days * 24;
      minutes = eventDuration!.inMinutes - (24 * days * 60) - (hours * 60);
      seconds = eventDuration!.inSeconds -
          (24 * days * 60 * 60) -
          (hours * 60 * 60) -
          (minutes * 60);
    }

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
            Radius.circular(Dimensions.PADDING_SIZE_EXTRA_SMALL)),
        color: Theme.of(context).primaryColor.withOpacity(0.05),
      ),
      child: Row(children: [
        Image.asset(Images.flash_deal, scale: 4),
        SizedBox(width: Dimensions.PADDING_SIZE_SMALL),
        Text(title!, style: poppinsMedium),
        SizedBox(width: Dimensions.PADDING_SIZE_SMALL),
        Expanded(
            child: Row(children: [
          SizedBox(width: 5),
          TimerBox(time: days, day: "Day"),
          Text(':', style: TextStyle(color: Theme.of(context).primaryColor)),
          TimerBox(time: hours, day: "Hour"),
          Text(':', style: TextStyle(color: Theme.of(context).primaryColor)),
          TimerBox(time: minutes, day: "Min"),
          Text(':', style: TextStyle(color: Theme.of(context).primaryColor)),
          TimerBox(time: seconds, day: "Sec"),
        ])),
        onTap != null
            ? InkWell(
                child: Row(children: [
                  isDetailsPage == null
                      ? Text(
                          "View All",
                          style: poppinsRegular.copyWith(
                              fontSize: Dimensions.FONT_SIZE_SMALL,
                              color: Theme.of(context)
                                  .primaryColor
                                  .withOpacity(0.8)),
                        )
                      : SizedBox.shrink(),
                  Padding(
                    padding: EdgeInsets.all(Dimensions.PADDING_SIZE_SMALL),
                    child: Icon(
                      Icons.arrow_forward_ios,
                      color: isDetailsPage == null
                          ? Theme.of(context).primaryColor
                          : Theme.of(context).hintColor,
                      size: Dimensions.FONT_SIZE_SMALL,
                    ),
                  ),
                ]),
              )
            : SizedBox.shrink(),
        Expanded(
            child: Container(
          child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
            SizedBox(width: 5),
            TimerBox(time: days, day: "Day"),
            Text(':', style: TextStyle(color: Theme.of(context).primaryColor)),
            TimerBox(time: hours, day: "Hour"),
            Text(':', style: TextStyle(color: Theme.of(context).primaryColor)),
            TimerBox(time: minutes, day: "Min"),
            Text(':', style: TextStyle(color: Theme.of(context).primaryColor)),
            TimerBox(time: seconds, day: "Sec"),
          ]),
        )),
      ]),
    );
  }
}

class TimerBox extends StatelessWidget {
  final int? time;
  final bool isBorder;
  final String? day;

  TimerBox({required this.time, this.isBorder = false, this.day});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 2),
      width: MediaQuery.of(context).size.width / 9.5,
      height: MediaQuery.of(context).size.width / 9.5,
      decoration: BoxDecoration(
        color: isBorder ? null : Theme.of(context).primaryColor,
        border: isBorder
            ? Border.all(width: 2, color: Theme.of(context).primaryColor)
            : null,
        borderRadius: BorderRadius.circular(3),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              time! < 10 ? '0$time' : time.toString(),
              style: poppinsRegular.copyWith(
                color: isBorder ? Theme.of(context).primaryColor : Colors.white,
                fontSize: Dimensions.FONT_SIZE_SMALL,
              ),
            ),
            Text(day!,
                style: poppinsRegular.copyWith(
                  color:
                      isBorder ? Theme.of(context).primaryColor : Colors.white,
                  fontSize: Dimensions.FONT_SIZE_SMALL,
                )),
          ],
        ),
      ),
    );
  }
}
