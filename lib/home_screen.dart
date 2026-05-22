import 'package:coffe_app/model_drink.dart';
import 'package:coffe_app/widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ScrollController controller=ScrollController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            SizedBox(height:10),
            Expanded(
              child: ListView.builder(
                controller: controller,
                itemBuilder: (context, index) {
                  return AnimatedBuilder(animation: controller,builder: (context,child){
                    double offset=0;
                    if(controller.hasClients){
                      // to math change /100 - index
                      offset=controller.offset/100-index;
                    }
                    // to make valve of offset  0 or 1
                    offset=offset.clamp(0,1);
                    return  Transform.scale(
                      // to controller if you want to scale or smale
                      scale:1-(offset*.2),
                      child: Drink(
                        title: ModelDrink.drinksData[index].title,
                        image: ModelDrink.drinksData[index].image,
                        name: ModelDrink.drinksData[index].name,
                      ),
                    );
                  },
                  );
                },
                itemCount: ModelDrink.drinksData.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
