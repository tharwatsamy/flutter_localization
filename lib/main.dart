import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart';

import 'generated/l10n.dart';

void main() {
  runApp(const FlutterLocalization());
}

class FlutterLocalization extends StatelessWidget {
  const FlutterLocalization({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: const Locale('ar'),
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      home: const HomeView(),
    );
  }
}

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).title),
      ),
      body: Row(
        children: [
          Text(
            S.of(context).hello,
            style: const TextStyle(fontSize: 30),
          ),
          Padding(
            padding: EdgeInsets.only(
                left: isArabic() ? 0 : 16, right: isArabic() ? 16 : 0),
            child: Text(
              S.of(context).name,
              style: const TextStyle(fontSize: 30),
            ),
          ),
        ],
      ),
    );
  }
}

bool isArabic() {
  return Intl.getCurrentLocale() == 'ar';
}
