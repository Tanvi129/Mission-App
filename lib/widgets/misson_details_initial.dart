import 'package:flutter/material.dart';

class MissionName extends StatelessWidget {
  const MissionName({Key? key, this.missionName, this.launchDate})
      : super(key: key);

  final String? missionName;
  final String? launchDate;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          width: 2
        ),
      ),
      padding: EdgeInsets.all(16),
      child: Column(
        
        children: [
          Wrap(
            direction: Axis.horizontal,
           
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              const Text(
                "Mission Name: ",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                missionName ?? "Unable to Load",
                style: const TextStyle(
                  fontSize: 18,
                ),
              ),
            ],
          ),
          Wrap(
            direction: Axis.horizontal,
            crossAxisAlignment: WrapCrossAlignment.center,
            
            children: [
              const Text(
                "Launch Date: ",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(launchDate ?? "Unable to Load",
              style: const TextStyle(
                  fontSize: 18,
                ),),
            ],
          )
        ],
      ),
    );
  }
}
