import 'package:flutter/material.dart';

class ShipListItem extends StatelessWidget {
  const ShipListItem({Key? key, this.image , this.launchSiteName, this.rocketName}) : super(key: key);

  final String? image;
  final String? launchSiteName;
  final String? rocketName;


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      
      child: Wrap(
        
          direction: Axis.horizontal,
          alignment: WrapAlignment.spaceEvenly,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            SizedBox(
                height: 150,
                width: 150,
                child: Image.network(image ?? "https://i.imgur.com/7VMC0Gn.jpg")),
                const SizedBox(
                  width: 2 ,
                ),
            Wrap(
              direction: Axis.vertical,
              children:  [
                
                const Expanded(
                  child: Text(
                    "Ship Name",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    rocketName?? "Unable to Load",
                    
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
                const Expanded(
                  child:  Text(
                    "Home Port",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    
                    launchSiteName ?? "Unable to Load",
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
               
              ],
            ),
              const Divider(
                  color: Colors.black,
                  thickness: 1,
                )
          ]),
    );
  }
}
