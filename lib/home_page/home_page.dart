import 'package:weather_app/imports.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final now = DateTime.now();

  Future<Position> getUserPosition() async {
    var _permissionGranted = await Geolocator.checkPermission();

    if (_permissionGranted != LocationPermission.always ||
        _permissionGranted != LocationPermission.whileInUse) {
      await Geolocator.requestPermission();
    }

    final position = await Geolocator.getCurrentPosition();
    return position;
  }

  late final Future<Position> futureGeo;
  @override
  void initState() {
    futureGeo = getUserPosition();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: futureGeo,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Scaffold(
                body: Column(
              children: [
                const SizedBox(height: 32),
                BuildText(
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
                    size: 2.5),
                    const SizedBox(height: 8),
                    BuildText(text: snapshot.data!.latitude.toString(), size: 2),
                    const SizedBox(height: 8),
                    BuildText(text: snapshot.data!.longitude.toString(), size: 2)
              ],
            ));
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        });
  }
}

class BuildText extends StatelessWidget {
  String text;
  double size = 1;
  BuildText({
    required this.text,
    required this.size,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        text,
        style: TextStyle(fontSize: 15 * size),
      ),
    ));
  }
}
