import 'package:clean_arctheture/config/theme/app_theme.dart';
import 'package:clean_arctheture/feature/daily_news/presentation/bloc/article/remote/remote_article_bloc.dart';
import 'package:clean_arctheture/feature/daily_news/presentation/bloc/article/remote/remote_article_event.dart';
import 'package:clean_arctheture/feature/daily_news/presentation/page/home/daily_news.dart';
import 'package:clean_arctheture/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RemoteArticlesBloc>(
      create: (context) => sl()..add(const GetArticles()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: theme(),
        home: const DailyNews(),
      ),
    );
  }
}
