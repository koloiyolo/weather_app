import 'package:weather_app/imports.dart';

class BuildDay extends StatelessWidget {
  const BuildDay({
    super.key,
    required this.now,
  });

  final DateTime now;

  @override
  Widget build(BuildContext context) {
    return BuildText(
        text: (now.weekday == 1)
            ? 'Monday'
            : (now.weekday == 2)
                ? 'Tuesday'
                : (now.weekday == 3)
                    ? 'Wednesday'
                    : (now.weekday == 4)
                        ? 'Thursday'
                        : (now.weekday == 5)
                            ? 'Friday'
                            : (now.weekday == 6)
                                ? 'Saturday'
                                : 'Sunday',
        size: 2.5);
  }
}