import 'package:weather_app/imports.dart';

class BuildDay extends StatelessWidget {
  const BuildDay({
    super.key,
    required this.datetime,
  });

  final DateTime datetime;

  @override
  Widget build(BuildContext context) {
    return BuildText(
        text: (datetime.weekday == 1)
            ? 'Monday'
            : (datetime.weekday == 2)
                ? 'Tuesday'
                : (datetime.weekday == 3)
                    ? 'Wednesday'
                    : (datetime.weekday == 4)
                        ? 'Thursday'
                        : (datetime.weekday == 5)
                            ? 'Friday'
                            : (datetime.weekday == 6)
                                ? 'Saturday'
                                : 'Sunday',
        size: 3);
  }
}