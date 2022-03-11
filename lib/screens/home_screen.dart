import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:graphql_mission/constants/query_string.dart';
import 'package:graphql_mission/screens/mission_details_screen.dart';
import 'package:graphql_mission/widgets/misson_details_initial.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mission List"),
      ),
      body: Container(
        margin: const EdgeInsets.all(16),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Query(
                options: QueryOptions(
                  document: gql(QueryString.readCounters),
                  // pollInterval: Duration(seconds: 10),
                ),
                builder: (QueryResult result,
                    {VoidCallback? refetch, FetchMore? fetchMore}) {
                  if (result.hasException) {
                    return Text(result.exception.toString());
                  }

                  if (result.isLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (result == null) {
                    return const Text('No Data found');
                  }

                  List mission = result.data?["launchesPast"];

                  return Expanded(
                    child: ListView.builder(
                        itemCount: mission.length,
                        itemBuilder: (context, index) {
                          final missionItem = mission[index];
                          return InkWell(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => MissionDetailsScreen(title: missionItem["mission_name"],launchSiteName: missionItem["launch_site"]["site_name_long"],rocketName: missionItem["rocket"]["rocket_name"], ships: missionItem["ships"], links: missionItem["links"],)));
                            },
                            child: MissionName(
                                launchDate: missionItem["launch_date_local"],
                                missionName: missionItem["mission_name"]),
                          );
                        }),
                  );
                })
          ],
        ),
      ),
    );
  }
}
