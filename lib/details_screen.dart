import 'package:coffe_app/model_drink.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  PageController controller = PageController(viewportFraction: 0.50);
  int select = 0;
  int number = 1;
  double currentPage = 0;
  bool selectButton=true;

  @override
  void initState() {
    // TODO: implement initState
    controller.addListener(() {
      setState(() {
        currentPage = controller.page ?? 1;
      });
    });
    super.initState();
  }

  final drink = ModelDrink.drinksData;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    spacing: 5,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        drink[currentPage.round()].name,
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        drink[currentPage.round()].title,
                        style: TextStyle(color: Colors.black45),
                      ),
                    ],
                  ),
                  Text(
                    "€" + drink[currentPage.round()].price,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: PageView.builder(
                controller: controller,
                scrollDirection: Axis.horizontal,
                itemCount: drink.length,
                itemBuilder: (context, index) {
                  final offset = 1 - (currentPage - index).abs() * 1;
                  // to controller to position
                  final dx = 1 + (currentPage - index).abs() * 300;

                  return Transform.translate(
                    offset: Offset(dx, 0),
                    child: Transform.scale(
                      scale: offset.clamp(0.5, 1.0),
                      child: Column(
                        children: [
                          Image.asset(
                            drink[index].image,
                            fit: BoxFit.fill,
                            height: 300,
                          ),
                          Image.asset("assets/drinks/Ellipse 2.png"),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(4, (index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      select = index;
                    });
                  },
                  child: CircleAvatar(
                    backgroundColor: index == select
                        ? Colors.orangeAccent
                        : Colors.black12,
                    child: SvgPicture.asset("assets/Vector.svg", height: 20),
                  ),
                );
              }, growable: false),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: Container(
                   height: 55,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Colors.black12,
                    ),
                    child: Row(

                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: (){
                              setState(() {
                                selectButton=true;
                              });
                            },
                            child: AnimatedContainer(

                              duration: Duration(microseconds: 400),
                              height: 55,
                              padding: EdgeInsetsGeometry.symmetric(horizontal: 30,vertical: 15),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                color:selectButton? Colors.white:Colors.transparent,
                              ),
                              child: Text("Hot",style: TextStyle(
                                color: selectButton? Colors.black:Colors.white,
                              ),),
                            ),
                          ),
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: (){
                              setState(() {
                                selectButton=false;
                              });
                            },
                            child: AnimatedContainer(

                              duration: Duration(microseconds: 400),
                              height: 55,
                              padding: EdgeInsetsGeometry.symmetric(horizontal: 30,vertical: 15),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                color:!selectButton? Colors.white:Colors.transparent,
                              ),
                              child: Text("Iced",style: TextStyle(
                                color: !selectButton? Colors.black:Colors.white,
                              ),),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
                  child: Container(
                    padding: EdgeInsetsGeometry.symmetric(
                      horizontal: 30,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Colors.black12,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              if (number > 1) {
                                number--;
                              }
                            });
                          },
                          child: Text("-", style: TextStyle(fontSize: 24)),
                        ),
                        Text(
                          number.toString(),
                          style: TextStyle(fontSize: 28),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              number++;
                            });
                          },
                          child: Text("+", style: TextStyle(fontSize: 24)),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
