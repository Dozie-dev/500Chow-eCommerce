import 'package:chow_500/models/food_model.dart';
import 'package:chow_500/ui/home/food_details.dart';
import 'package:chow_500/utils/app_colors.dart';
import 'package:chow_500/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<({String image, String title})> foodItems = [
    (image: AppImages.burger, title: 'Burger'),
    (image: AppImages.pizzaSlice, title: 'Pizza'),
    (image: AppImages.burger, title: 'Fried Rice'),
    (image: AppImages.burger, title: 'Spaghetti'),
    (image: AppImages.burger, title: 'Tacos'),
  ];

  final List<Food> foodList = [
    Food(
      name: 'Classic Cheese burger',
      description:
          'A juicy, perfectly seasoned beef patty grilled to perfection, topped with a slice of melted cheddar cheese, crisp lettuce, ripe tomato, crunchy pickles, and tangy ketchup, all tucked inside a soft, toasted brioche bun. Simple, timeless, and irresistibly satisfying.',
      image: AppImages.burgerfull,
      price: 3.33,
    ),
    Food(
      name: 'Pepperoni Pizza',
      description:
          'Crafted with a golden, hand-tossed crust, smothered in rich tomato sauce, and topped with a generous layer of melted mozzarella. Finished with perfectly seasoned, smoky pepperoni slices that crisp at the edges, every bite delivers a satisfying balance of cheesy goodness and bold, savory flavor.',
      image: AppImages.pizza,
      price: 3.33,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.mainbackground,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 32),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 300,
                        child: Text(
                          'Order Your Favourite Fast Food!',
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            wordSpacing: 2,
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: AppColors.contbord),
                          shape: BoxShape.circle,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Icon(
                            Icons.notifications,
                            color: AppColors.primaryColor,
                            size: 27,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                TextField(
                  decoration: InputDecoration(
                    prefixIcon: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Icon(Icons.search_outlined, size: 35),
                    ),
                    hintText: 'Search food, drinks and desert',
                    hintStyle: TextStyle(fontSize: 14),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                SizedBox(height: 15),
                Container(
                  height: 200,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColors.contColor,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        top: 20,
                        right: -60,
                        child: Image.asset(AppImages.burger, height: 250),
                      ),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 100, top: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Grab Our Exclusive \nFood Discounts \nNow!',
                                style: TextStyle(
                                  color: AppColors.white,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 10),
                              Container(
                                height: 30,
                                width: 100,
                                decoration: BoxDecoration(
                                  color: AppColors.blackCont,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Center(
                                  child: Text(
                                    'Order Now',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: AppColors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                SizedBox(
                  height: 100,
                  child: ListView.builder(
                    itemCount: foodItems.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      final items = foodItems[index];
                      return Padding(
                        padding: const EdgeInsets.only(right: 15),
                        child: Container(
                          width: 90,
                          decoration: BoxDecoration(
                            color: AppColors.greyCont,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(items.image, height: 70),
                              Text(
                                items.title,
                                style: TextStyle(
                                  fontSize: 14,
                                  color: AppColors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Recommended For You',
                      style: TextStyle(
                        color: AppColors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text('See all'),
                  ],
                ),
                SizedBox(height: 10),
                SizedBox(
                  height: 300,
                  child: ListView.builder(
                    itemCount: foodList.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      final food = foodList[index];
                      return SizedBox(
                        width: 250,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 15),
                              child: GestureDetector(
                                onTap: () {
                                  Get.to(() => FoodDetails(food: food));
                                },
                                child: Container(
                                  height: 170,
                                  width: 250,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      fit: BoxFit.fitWidth,
                                      image: AssetImage(food.image),
                                    ),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                              ),
                            ),

                            Text(
                              food.name,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              food.description,
                              style: TextStyle(fontSize: 14),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text(
                              '\$${food.price}',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
