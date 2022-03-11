import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:graphql_mission/screens/home_screen.dart';
import 'package:graphql_mission/screens/mission_details_screen.dart';

void main() {
  final HttpLink httplink = HttpLink("https://api.spacex.land/graphql/");

  ValueNotifier<GraphQLClient> client =
      ValueNotifier(GraphQLClient(cache: GraphQLCache(), link: httplink));
  runApp( MyApp(client: client));
}

class MyApp extends StatelessWidget {
  final ValueNotifier<GraphQLClient> client;

  const MyApp({Key? key,required this.client}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GraphQLProvider(
      client: client,
      child: CacheProvider(
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          routes: {
            '/': (context) => HomeScreen(),

            '/home': (context) => HomeScreen(),
          },
        ),
      ),
    );
  }
}
