// ignore_for_file: prefer_typing_uninitialized_variables, prefer_const_constructors

import 'dart:async';

import 'package:flutter/material.dart';
import 'dart:ui' as ui;

import 'package:slide_to_confirm/slide_to_confirm.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: BodyClass(),
    );
  }
}

class BodyClass extends StatefulWidget {
  const BodyClass({Key? key}) : super(key: key);

  @override
  _BodyClassState createState() => _BodyClassState();
}

class _BodyClassState extends State<BodyClass> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (context, constraints) => Column(
              children: [
                Expanded(
                  flex: 5,
                  child: Container(
                    child: rowImage(constraints),
                  ),
                ),
                Expanded(
                    flex: 5,
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 25),
                        child: Row(
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Discover, Collect, \nand Sell Awesome",
                                    style:
                                        Theme.of(context).textTheme.headline4),
                                const SizedBox(
                                  height: 15,
                                ),
                                imgMaskToText(context),
                                SizedBox(height: 16),
                                Text(
                                  "More then 500+ Abstract NFTs \nare ready to be yours.",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey),
                                ),
                                SizedBox(
                                  height: constraints.maxHeight * .1,
                                ),
                                ConfirmationSlider(
                                    height: 70.0,
                                    width: constraints.maxWidth * .85,
                                    foregroundColor: Colors.green,
                                    text: "Swipe and get started",
                                    onConfirmation: () {})
                              ],
                            )
                          ],
                        ),
                      ),
                    ))
              ],
            ));
  }

  Column rowImage(BoxConstraints constraints) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 50, left: 30),
          child: Row(
            children: [
              ImgRow(
                height: constraints.maxHeight * .12,
                width: constraints.maxWidth * .52,
                imagePath: 'assets/images/img1.jpg',
              ),
              const SizedBox(
                width: 15,
              ),
              ImgRow(
                height: constraints.maxHeight * .12,
                width: constraints.maxWidth * .3,
                imagePath: 'assets/images/img3.jpg',
              ),
            ],
          ),
        ),
        const SizedBox(height: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ImgRow(
              height: constraints.maxHeight * .12,
              width: constraints.maxWidth * .3,
              imagePath: 'assets/images/img6.jpg',
            ),
            const SizedBox(
              width: 15,
            ),
            ImgRow(
              height: constraints.maxHeight * .12,
              width: constraints.maxWidth * .52,
              imagePath: 'assets/images/img4.jpg',
            ),
          ],
        ),
        const SizedBox(height: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ImgRow(
              height: constraints.maxHeight * .12,
              width: constraints.maxWidth * .52,
              imagePath: 'assets/images/img5.jpg',
            ),
            const SizedBox(
              width: 15,
            ),
            ImgRow(
              height: constraints.maxHeight * .12,
              width: constraints.maxWidth * .3,
              imagePath: 'assets/images/img2.jpg',
            ),
          ],
        ),
      ],
    );
  }

  MaskedImage imgMaskToText(BuildContext context) {
    return MaskedImage(
        image: AssetImage("assets/images/img6.jpg"),
        child: Text(
          "Abstract NFT's",
          style: Theme.of(context).textTheme.headline4,
        ));
  }
}

class ImgRow extends StatelessWidget {
  final height;
  final width;
  final imagePath;
  const ImgRow({Key? key, this.height, this.width, @required this.imagePath})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
          // ignore: prefer_const_literals_to_create_immutables
          boxShadow: [
            const BoxShadow(
                color: Colors.grey, blurRadius: 10, offset: Offset(8, 8))
          ],
          borderRadius: BorderRadius.circular(20),
          color: Colors.black,
          image: DecorationImage(
              colorFilter: ColorFilter.mode(
                  Colors.red.withOpacity(0.25), BlendMode.color),
              image: AssetImage(imagePath),
              fit: BoxFit.cover)),
    );
  }
}

class MaskedImage extends StatelessWidget {
  final ImageProvider image;
  final Widget child;
  const MaskedImage({
    Key? key,
    required this.image,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => FutureBuilder<ui.Image>(
      future: loadImage(),
      builder: (context, snap) => snap.hasData
          ? ShaderMask(
              blendMode: BlendMode.srcATop,
              shaderCallback: (bounds) => ImageShader(snap.data!,
                  TileMode.clamp, TileMode.clamp, Matrix4.identity().storage),
              child: child,
            )
          : Container());

  Future<ui.Image> loadImage() async {
    final completer = Completer<ui.Image>();
    final stream = image.resolve(const ImageConfiguration());
    stream.addListener(
      ImageStreamListener((info, _) => completer.complete(info.image)),
    );
    return completer.future;
  }
}
