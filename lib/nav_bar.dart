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

    Future<Position> getUserPosition() async {
    var _permissionGranted = await Geolocator.checkPermission();

    if (_permissionGranted != LocationPermission.always ||
        _permissionGranted != LocationPermission.whileInUse) {
      await Geolocator.requestPermission();
    }

    final position = await Geolocator.getCurrentPosition();
    return position;
  }
  @override
  void initState() {
    futurePosition = getUserPosition();
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
