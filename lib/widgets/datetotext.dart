import 'package:weather_app/imports.dart';

class DateToMonth extends StatelessWidget {
  const DateToMonth({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BuildText(text: (DateTime.now().month==1) ? '${DateTime.now().day} January ${DateTime.now().year}'
                            : (DateTime.now().month==2) ? '${DateTime.now().day} February ${DateTime.now().year}'
                            : (DateTime.now().month==3) ? '${DateTime.now().day} March ${DateTime.now().year}'
                            : (DateTime.now().month==4) ? '${DateTime.now().day} April ${DateTime.now().year}'
                            : (DateTime.now().month==5) ? '${DateTime.now().day} May ${DateTime.now().year}'
                            : (DateTime.now().month==6) ? '${DateTime.now().day} June ${DateTime.now().year}'
                            : (DateTime.now().month==7) ? '${DateTime.now().day} July ${DateTime.now().year}'
                            : (DateTime.now().month==8) ? '${DateTime.now().day} August ${DateTime.now().year}'
                            : (DateTime.now().month==9) ? '${DateTime.now().day} September ${DateTime.now().year}'
                            : (DateTime.now().month==10) ? '${DateTime.now().day} October ${DateTime.now().year}'
                            : (DateTime.now().month==11) ? '${DateTime.now().day} November ${DateTime.now().year}'
                            :'${DateTime.now().day} December ${DateTime.now().year}', size: 2);
  }
}