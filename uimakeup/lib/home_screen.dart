// ignore_for_file: constant_identifier_names, avoid_print, duplicate_ignore

import 'package:flutter/material.dart';

const PRIMARY = "primary";
const WHITE = "white";
const SECONDARY = "secondary";

const Map<String, Color> myColors = {
  PRIMARY: Color.fromRGBO(226, 115, 138, 1),
  WHITE: Colors.white,
  SECONDARY: Color.fromRGBO(247, 225, 227, 1),
};
// ignore: prefer_const_constructors
var pricestyle = TextStyle(
  fontSize: 18,
  fontWeight: FontWeight.bold,
);

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: _myAppBar(),
        preferredSize: const Size.fromHeight(70),
      ),
      backgroundColor: myColors[PRIMARY],
      body: _Body(),
    );
  }
}

AppBar _myAppBar() {
  return AppBar(
    backgroundColor: myColors[WHITE],
    elevation: 0,
    leading: Padding(
      padding: const EdgeInsets.only(
        top: 15,
        left: 15,
      ),
      child: IconButton(
        icon: Icon(
          Icons.menu,
          color: myColors[PRIMARY],
          size: 30,
        ),
        // ignore: avoid_print
        onPressed: () => print("Menu pressed"),
      ),
    ),
    actions: [
      Padding(
        padding: const EdgeInsets.only(top: 15, right: 15),
        child: IconButton(
          // ignore: avoid_print
          onPressed: () => print("Search pressed"),
          icon: Icon(
            Icons.search,
            color: myColors[PRIMARY],
            size: 30,
          ),
        ),
      ),
    ],
  );
}

class _Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 7,
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: myColors[WHITE],
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(
                    left: 30,
                    bottom: 20,
                  ),
                  child: Text(
                    'Cosmetics that Everyone loves!',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.5,
                    ),
                  ),
                ),
                Expanded(
                  child: LayoutBuilder(builder: (context, constraints) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _ImageTile(
                          height: constraints.maxHeight * .85,
                          imagePath: 'assets/images/makeup1.png',
                          addCallback: () => print("Main item added"),
                          favoriteCallback: () => print("Main item favorited"),
                          price: 15.00,
                        ),
                        Column(
                          children: [
                            _ImageTile(
                              height: constraints.maxHeight * .37,
                              imagePath: 'assets/images/makeup2.png',
                              addCallback: () => print("2nd item added"),
                              favoriteCallback: () =>
                                  print("2nd item favorited"),
                              price: 75.00,
                            ),
                            const SizedBox(height: 4),
                            _ImageTile(
                              height: constraints.maxHeight * .37,
                              imagePath: 'assets/images/makeup3.png',
                              addCallback: () => print("3rd item added"),
                              favoriteCallback: () =>
                                  print("3rd item favorited"),
                              price: 55.00,
                            ),
                          ],
                        ),
                      ],
                    );
                  }),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 15, left: 40, right: 30),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Recommended",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                            color: Colors.white),
                      ),
                      InkWell(
                          onTap: () {},
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(15)),
                                color: myColors[WHITE]),
                            // ignore: prefer_const_constructors
                            child: Padding(
                              padding: const EdgeInsets.all(3),
                              child: Icon(
                                Icons.arrow_forward_rounded,
                                color: myColors[PRIMARY],
                                size: 22,
                              ),
                            ),
                          )),
                    ]),
              ),
              Expanded(
                  child: LayoutBuilder(
                      builder: (context, constraints) => Stack(
                            children: [
                              Positioned(
                                  right: 10,
                                  bottom: 25,
                                  child: Container(
                                    height: constraints.maxHeight * .7,
                                    width: constraints.maxWidth * .8,
                                    decoration: BoxDecoration(
                                        color: myColors[WHITE],
                                        borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(60),
                                            topRight: Radius.circular(30),
                                            bottomLeft: Radius.circular(30),
                                            bottomRight: Radius.circular(30))),
                                  )),
                              Positioned(
                                  left: 48,
                                  top: 25,
                                  // ignore: avoid_unnecessary_containers
                                  child: Container(
                                    height: constraints.maxHeight * .65,
                                    width: constraints.maxWidth * .9,
                                    child: Row(
                                      // ignore: prefer_const_literals_to_create_immutables
                                      children: [
                                        const Image(
                                            image: AssetImage(
                                                'assets/images/makeup4.png')),
                                        const SizedBox(
                                          width: 8,
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              width: constraints.maxWidth * .48,
                                              child: Text(
                                                "This is Product very excelent also useful because this is 100% natural.",
                                                style: TextStyle(
                                                    color: Colors.grey[700],
                                                    fontSize: 12),
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 12,
                                            ),
                                            Text(
                                              "\$75.00",
                                              style: pricestyle,
                                            )
                                          ],
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            FavoritecallbackButton(
                                                favoriteCallback: () => print(
                                                    'pressed favoride button')),
                                            const SizedBox(
                                              height: 30,
                                            ),
                                            AddcallbackButton(
                                                addCallback: () =>
                                                    print("add button"))
                                          ],
                                        )
                                      ],
                                    ),
                                  ))
                            ],
                          )))
            ],
          ),
        ),
      ],
    );
  }
}

class _ImageTile extends StatelessWidget {
  final double? height;
  final double? price;
  final imagePath;
  final Function? favoriteCallback;
  final Function? addCallback;

  // highlight this press cntrl + d
  const _ImageTile({
    Key? key,
    @required this.height,
    @required this.price,
    @required this.imagePath,
    @required this.favoriteCallback,
    @required this.addCallback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(
              height: height,
              image: AssetImage(imagePath),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: FavoritecallbackButton(favoriteCallback: favoriteCallback),
            ),
          ],
        ),
        const SizedBox(height: 5),
        Row(
          children: [
            Text(
              '\$$price',
              style: pricestyle,
            ),
            const SizedBox(width: 20),
            AddcallbackButton(addCallback: addCallback),
          ],
        ),
      ],
    );
  }
}

class AddcallbackButton extends StatelessWidget {
  const AddcallbackButton({
    Key? key,
    required this.addCallback,
  }) : super(key: key);

  final Function? addCallback;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => addCallback,
      child: Container(
        decoration: BoxDecoration(
          color: myColors[SECONDARY],
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(7),
            topRight: Radius.circular(7),
            bottomLeft: Radius.circular(7),
            bottomRight: Radius.circular(15),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: Icon(
            Icons.add,
            color: myColors[PRIMARY],
            size: 15,
          ),
        ),
      ),
    );
  }
}

class FavoritecallbackButton extends StatelessWidget {
  const FavoritecallbackButton({
    Key? key,
    required this.favoriteCallback,
  }) : super(key: key);

  final Function? favoriteCallback;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => favoriteCallback,
      icon: Icon(
        Icons.favorite_border,
        color: myColors[PRIMARY],
        size: 25,
      ),
    );
  }
}
