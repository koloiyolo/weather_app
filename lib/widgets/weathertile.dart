import 'package:weather_app/imports.dart';

class WeatherTile extends StatelessWidget {
  var data;
  WeatherTile({
    required this.data,
    super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 32),
          BuildDay(datetime: DateTime.now()),
          const SizedBox(height: 16 ),
          BuildDate(datetime: DateTime.now()),
          BuildText(text: farenheit
          ?'Temperature: ${(data['current']['temp']*1.8 + 32)}°F'
          :'Temperature: ${data['current']['temp']}°C', size: 2),
        ],
      ),
    );
  }
}