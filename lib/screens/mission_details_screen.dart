import 'package:flutter/material.dart';
import 'package:graphql_mission/widgets/shipsListItem.dart';
import 'package:url_launcher/url_launcher.dart';

class MissionDetailsScreen extends StatefulWidget {
  const MissionDetailsScreen(
      {Key? key,
      required this.title,
      this.launchSiteName,
      this.rocketName,
      this.links,
      this.ships})
      : super(key: key);
  final String? title, launchSiteName, rocketName;

  final Map? links;
  final List? ships;

  @override
  State<MissionDetailsScreen> createState() => _MissionDetailsScreenState();
}

class _MissionDetailsScreenState extends State<MissionDetailsScreen> {
  // void _launchURL() async {
  //   String _url = widget.links?["article_link"];
  //   if (!await launch(_url)) throw 'Could not launch $_url';
  // }

  Future<void> _launchYoutubeVideo(String _youtubeUrl) async {
    if (_youtubeUrl != null && _youtubeUrl.isNotEmpty) {
      if (await canLaunch(_youtubeUrl)) {
        final bool _nativeAppLaunchSucceeded = await launch(
          _youtubeUrl,
          forceSafariVC: false,
          universalLinksOnly: true,
        );
        if (!_nativeAppLaunchSucceeded) {
          await launch(_youtubeUrl, forceSafariVC: true);
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title ?? "Not Found"),
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        alignment: Alignment.center,
        child: Column(children: <Widget>[
          const Text(
            "Launch Site Name:",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            widget.launchSiteName ?? "Unable to Load",
            //missionName ?? "Unable to Load",
            style: const TextStyle(
              fontSize: 18,
            ),
          ),
          const Text(
            "Rocket Name",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            widget.rocketName ?? "Unable to Load",
            //missionName ?? "Unable to Load",
            style: const TextStyle(
              fontSize: 18,
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          const Divider(
            thickness: 1,
            color: Colors.black,
          ),
          const Text(
            "Ships",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Divider(
            thickness: 1,
            color: Colors.black,
          ),
          Expanded(
            child: ListView.builder(
                itemCount: widget.ships?.length,
                itemBuilder: (context, index) {
                  return ShipListItem(
                    image: widget.ships?[index]["image"],
                    launchSiteName: widget.ships?[index]["home_port"],
                    rocketName: widget.ships?[index]["name"],
                  );
                }),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                  onPressed: () {
                    String? _url = widget.links?["video_link"];
                    if (_url == null) {
                      showDialog(
                        context: context,
                        builder: (_) => const AlertDialog(
                          title: Text("No Video Provided"),
                        ),
                      );
                    } else {
                      _launchYoutubeVideo(_url);
                    }
                  },
                  icon: const Icon(Icons.play_arrow, size: 55, color: Colors.red)),
              IconButton(
                  onPressed: () {
                    String? _urlarticle = widget.links?["article_link"];
                    if (_urlarticle == null) {
                      showDialog(
                        context: context,
                        builder: (_) => const AlertDialog(
                          title: Text("No Article Provided"),
                        ),
                      );
                    } else {
                      _launchYoutubeVideo(_urlarticle);
                    }
                  },
                  icon: const Icon(Icons.article, size: 50 ,color: Colors.blue,)),
                  
            ],
          )
        ]),
      ),
    );
  }
}
