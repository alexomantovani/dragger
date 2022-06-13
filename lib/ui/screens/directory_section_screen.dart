import 'package:flutter/material.dart';

import '/data/db_wherehouse.dart';
import '/ui/screens/aisle_section_screen.dart';

class DirectorySectionScreen extends StatefulWidget {
  //Create static const routeName
  static const routeName = '/DirectorySectionScreen';
  //Turn DirectorySectionScreen into a StatefulWidget
  const DirectorySectionScreen({Key? key}) : super(key: key);

  @override
  State<DirectorySectionScreen> createState() => _DirectorySectionScreenState();
}

class _DirectorySectionScreenState extends State<DirectorySectionScreen>
    with TickerProviderStateMixin {
  //Create 4 Animation<double> and 4 AnimationController() for the Directory boards side animations
  //The boards will come out of the screen from the sides(left and right) and reach it's positions.
  late Animation<double> sideAnimationOne;
  late AnimationController sideAnimationOneController;

  late Animation<double> sideAnimationTwo;
  late AnimationController sideAnimationTwoController;

  late Animation<double> sideAnimationThree;
  late AnimationController sideAnimationThreeController;

  late Animation<double> sideAnimationFour;
  late AnimationController sideAnimationFourController;

  //Create an Animation<double> and an AnimationController() to set the vertical drop of the Directory Structure.
  //The central structure will drop from the top center of the screen and stop at the last 2 boards mid center.
  late Animation<double> dropAnimation;
  late AnimationController dropAnimationController;

  //Create an Animation<double> and an AnimationController() to set the horizontal expansion of the Directory Structure.
  //The 4 secondary parts of the Directory Structure will expand verticaly at the mid center of the boards level.
  late Animation<double> expansionAnimation;
  late AnimationController expansionAnimationController;

  late Size size;

  @override
  void initState() {
    dropAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(
        seconds: 1,
      ),
    );

    dropAnimation = Tween<double>(begin: 0.0, end: 0.805).animate(
      CurvedAnimation(
        parent: dropAnimationController,
        curve: Curves.fastOutSlowIn,
      ),
    )..addListener(() {
        setState(() {});
      });

    expansionAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(
        seconds: 1,
      ),
    );

    expansionAnimation = Tween<double>(begin: 0.1, end: 0.0).animate(
      CurvedAnimation(
        parent: dropAnimationController,
        curve: Curves.fastOutSlowIn,
      ),
    )..addListener(() {
        setState(() {});
      });

    sideAnimationOneController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );

    sideAnimationOne = Tween<double>(begin: -0.41, end: 0.0).animate(
      CurvedAnimation(
        parent: sideAnimationOneController,
        curve: Curves.fastOutSlowIn,
      ),
    )
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          sideAnimationTwoController.forward();
        }
      });
    Future.delayed(const Duration(seconds: 2));
    sideAnimationOneController.forward();

    sideAnimationTwoController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
    sideAnimationTwo = Tween<double>(begin: -0.41, end: 0.0).animate(
      CurvedAnimation(
        parent: sideAnimationTwoController,
        curve: Curves.fastOutSlowIn,
      ),
    )
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          sideAnimationThreeController.forward();
        }
      });

    sideAnimationThreeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    sideAnimationThree = Tween<double>(begin: -0.41, end: 0.0).animate(
      CurvedAnimation(
        parent: sideAnimationThreeController,
        curve: Curves.fastOutSlowIn,
      ),
    )
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          sideAnimationFourController.forward();
          dropAnimationController.forward();
        }
      });

    sideAnimationFourController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
    sideAnimationFour = Tween<double>(begin: -0.41, end: 0.0).animate(
      CurvedAnimation(
        parent: sideAnimationFourController,
        curve: Curves.fastOutSlowIn,
      ),
    )
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          expansionAnimationController.forward();
        }
      });
    super.initState();
  }

  @override
  void didChangeDependencies() {
    size = MediaQuery.of(context).size;
    super.didChangeDependencies();
  }

  //Create a method to be reused for navigation purposes
  void navigateToAisle(Category category) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const AisleSectionScreen(),
        settings: RouteSettings(
          arguments: category,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    //All Animation<double> and AnimationController will be of type late and will be initialized in the initState() method.

    //In the Scafold's body create a Container that will get the whole screen size and an image in the background.
    //As the Containers's child, create a Stack.
    //the Stack will have 2 children, the one on top will be the Column that will contain 8 squares
    //100x100 in proportion with the device screen size. In the squares's child will contain 8 Text widget with the section's names(Categories DbWherehouse).

    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          final width = constraints.maxWidth;
          final height = constraints.maxHeight;

          return Stack(
            children: [
              Transform.translate(
                offset: Offset(width / 2, 0.0),
                child: Container(
                  width: width * 0.007,
                  height: height * dropAnimation.value,
                  color: Colors.black,
                ),
              ),
              Container(
                transformAlignment: FractionalOffset.center,
                transform: Matrix4.identity()
                  ..translate(width / 2.48, height / 6.7),
                height: height * 0.75,
                width: width * 0.2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          right: width * expansionAnimation.value,
                          left: width * expansionAnimation.value),
                      child: Container(
                        alignment: FractionalOffset.center,
                        width: width / 4,
                        height: height * 0.003,
                        color: Colors.black,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          right: width * expansionAnimation.value,
                          left: width * expansionAnimation.value),
                      child: Container(
                        alignment: FractionalOffset.center,
                        width: width / 4,
                        height: height * 0.003,
                        color: Colors.black,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          right: width * expansionAnimation.value,
                          left: width * expansionAnimation.value),
                      child: Container(
                        alignment: FractionalOffset.center,
                        width: width / 4,
                        height: height * 0.003,
                        color: Colors.black,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          right: width * expansionAnimation.value,
                          left: width * expansionAnimation.value),
                      child: Container(
                        alignment: FractionalOffset.center,
                        width: width / 4,
                        height: height * 0.003,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              Transform.translate(
                offset: Offset(width / 19, height / 6.7),
                child: SizedBox(
                  height: height * 0.75,
                  width: width * 0.9,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            transformAlignment: Alignment.center,
                            transform: Matrix4.identity()
                              ..translate(
                                  (width * sideAnimationOne.value)
                                      .roundToDouble(),
                                  0.0),
                            width: width * 0.28,
                            height: height * 0.13,
                            decoration: BoxDecoration(
                              color: Colors.lightBlue.shade100,
                              border: Border.all(
                                color: Colors.black.withOpacity(0.5),
                                width: 1.5,
                              ),
                            ),
                            alignment: Alignment.center,
                            child: TextButton(
                              onPressed: () {
                                navigateToAisle(Category.bebidas);
                              },
                              child: Text(
                                Category.bebidas.name.characters
                                    .toUpperCase()
                                    .toString(),
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 18.0,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          Container(
                            transformAlignment: Alignment.center,
                            transform: Matrix4.identity()
                              ..translate(
                                  (-width * sideAnimationOne.value)
                                      .roundToDouble(),
                                  0.0),
                            width: width * 0.28,
                            height: height * 0.13,
                            decoration: BoxDecoration(
                              color: Colors.lightBlue.shade100,
                              border: Border.all(
                                color: Colors.black.withOpacity(0.5),
                                width: 1.5,
                              ),
                            ),
                            alignment: Alignment.center,
                            child: TextButton(
                              onPressed: () => navigateToAisle(Category.carnes),
                              child: Text(
                                Category.carnes.name.characters
                                    .toUpperCase()
                                    .toString(),
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 18.0,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            transformAlignment: Alignment.center,
                            transform: Matrix4.identity()
                              ..translate((width * sideAnimationTwo.value)
                                  .roundToDouble()),
                            width: width * 0.28,
                            height: height * 0.13,
                            decoration: BoxDecoration(
                              color: Colors.lightBlue.shade100,
                              border: Border.all(
                                color: Colors.black.withOpacity(0.5),
                                width: 1.5,
                              ),
                            ),
                            alignment: Alignment.center,
                            padding: EdgeInsets.all(size.width * 0.01),
                            child: TextButton(
                              onPressed: () =>
                                  navigateToAisle(Category.graosEmassas),
                              child: Text(
                                Category.graosEmassas.name.characters
                                    .toUpperCase()
                                    .toString()
                                    .replaceFirst('E', ' & ')
                                    .replaceFirst('A', 'Ã'),
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 18.0,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          Container(
                            transformAlignment: Alignment.center,
                            transform: Matrix4.identity()
                              ..translate(-(width * sideAnimationTwo.value)
                                  .roundToDouble()),
                            width: width * 0.28,
                            height: height * 0.13,
                            decoration: BoxDecoration(
                              color: Colors.lightBlue.shade100,
                              border: Border.all(
                                color: Colors.black.withOpacity(0.5),
                                width: 1.5,
                              ),
                            ),
                            alignment: Alignment.center,
                            child: TextButton(
                              onPressed: () =>
                                  navigateToAisle(Category.higiene),
                              child: Text(
                                Category.higiene.name.characters
                                    .toUpperCase()
                                    .toString(),
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 18.0,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            transformAlignment: Alignment.center,
                            transform: Matrix4.identity()
                              ..translate((width * sideAnimationThree.value)
                                  .roundToDouble()),
                            width: width * 0.28,
                            height: height * 0.13,
                            decoration: BoxDecoration(
                              color: Colors.lightBlue.shade100,
                              border: Border.all(
                                color: Colors.black.withOpacity(0.5),
                                width: 1.5,
                              ),
                            ),
                            alignment: Alignment.center,
                            margin: const EdgeInsets.symmetric(horizontal: 0.0),
                            padding:
                                const EdgeInsets.symmetric(horizontal: 0.0),
                            child: TextButton(
                              onPressed: () =>
                                  navigateToAisle(Category.hortifruti),
                              child: Text(
                                Category.hortifruti.name.characters
                                    .toUpperCase()
                                    .toString()
                                    .replaceFirst('UT', 'ÚT'),
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 18.0,
                                  letterSpacing: -2.5,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          Container(
                            transformAlignment: Alignment.center,
                            transform: Matrix4.identity()
                              ..translate(-(width * sideAnimationThree.value)
                                  .roundToDouble()),
                            width: width * 0.28,
                            height: height * 0.13,
                            decoration: BoxDecoration(
                              color: Colors.lightBlue.shade100,
                              border: Border.all(
                                color: Colors.black.withOpacity(0.5),
                                width: 1.5,
                              ),
                            ),
                            alignment: Alignment.center,
                            child: TextButton(
                              onPressed: () =>
                                  navigateToAisle(Category.laticinios),
                              child: Text(
                                Category.laticinios.name.characters
                                    .toUpperCase()
                                    .toString()
                                    .replaceFirst('CI', 'CÍ'),
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 18.0,
                                  letterSpacing: -1.5,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            transformAlignment: Alignment.center,
                            transform: Matrix4.identity()
                              ..translate((width * sideAnimationFour.value)
                                  .roundToDouble()),
                            width: width * 0.28,
                            height: height * 0.13,
                            decoration: BoxDecoration(
                              color: Colors.lightBlue.shade100,
                              border: Border.all(
                                color: Colors.black.withOpacity(0.5),
                                width: 1.5,
                              ),
                            ),
                            alignment: Alignment.center,
                            child: TextButton(
                              onPressed: () =>
                                  navigateToAisle(Category.limpeza),
                              child: Text(
                                Category.limpeza.name.characters
                                    .toUpperCase()
                                    .toString(),
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 18.0,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          Container(
                            transformAlignment: Alignment.center,
                            transform: Matrix4.identity()
                              ..translate(-(width * sideAnimationFour.value)
                                  .roundToDouble()),
                            width: width * 0.28,
                            height: height * 0.13,
                            decoration: BoxDecoration(
                              color: Colors.lightBlue.shade100,
                              border: Border.all(
                                color: Colors.black.withOpacity(0.5),
                                width: 1.5,
                              ),
                            ),
                            alignment: Alignment.center,
                            child: TextButton(
                              onPressed: () =>
                                  navigateToAisle(Category.padaria),
                              child: Text(
                                Category.padaria.name.characters
                                    .toUpperCase()
                                    .toString(),
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 18.0,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
