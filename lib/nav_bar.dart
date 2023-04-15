import 'package:weather_app/private/private.dart';
import 'package:http/http.dart' as http;
import 'imports.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  bool farenheit = false;
  int index = 0;
  Widget page = Placeholder();
  String title = '';

    Future<Map<String, dynamic>> getWeather() async {
    var _permissionGranted = await Geolocator.checkPermission();

    if (_permissionGranted != LocationPermission.always ||
        _permissionGranted != LocationPermission.whileInUse) {
      await Geolocator.requestPermission();
    }

    final position = await Geolocator.getCurrentPosition();
    
    final url = 'https://api.openweathermap.org/data/3.0/onecall?lat=${position.latitude}&lon=${position.longitude}.04&appid=key';
    final response = await http.get(Uri.parse(url));
    if(response.statusCode==200){
      return jsonDecode(response.body);
    }else{
      throw Exception(response.statusCode);
    }

  }
  @override
  void initState() {
    futureWeather = getWeather();
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    switch (index) {
      case 0:
        page = HomePage();
        title = 'Today\'s weather';
        break;
      case 1:
        page = const WeekPage();
        title = 'Week weather';
        break;
    }
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
          titleTextStyle: const TextStyle(
            fontSize: 23,
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                farenheit = !farenheit;
                setState(() {});
              },
              child: farenheit ? const Text('°F') : const Text('°C'),
            )
          ],
        ),
        body: Column(
          children: [
            Expanded(child: page),
            NavigationBar(
              destinations: const [
                NavigationDestination(icon: Icon(Icons.home), label: ''),
                NavigationDestination(icon: Icon(Icons.list), label: '')
              ],
              selectedIndex: index,
              onDestinationSelected: (value) {
                setState(() {
                  index = value;
                });
              },
            )
          ],
        ));
  }
}
