// import 'package:weather_app/imports.dart';



// class HomePage extends StatefulWidget {
//   const HomePage({super.key});

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   final now = DateTime.now();

//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder(
//         future: futureWeather,
//         builder: (context, snapshot) {
//           if (snapshot.hasData) {
//             return Scaffold(
//                 body: Column(
//               children: [
//                 const SizedBox(height: 32),
//                 BuildDay(now: now),
//                     const SizedBox(height: 8),
//                     const DateToMonth(),
//                     const SizedBox(height: 8),
//                     BuildText(text: snapshot.data!['current']['sunset'].toString(), size: 2)
//               ],
//             ));
//           } else {
//             return const Center(child: CircularProgressIndicator());
//           }
//         });
//   }
// }


