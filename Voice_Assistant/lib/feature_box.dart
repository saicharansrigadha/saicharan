import 'package:flutter/material.dart';
import 'package:voice_assistant/pallete.dart';

class FeatureBox extends StatelessWidget {
  //This featurebox class have two properites color and headerText
  final Color color;
  final String headerText;
  final String descriptionText;

  const FeatureBox(
      {super.key,
      required this.color,
      required this.headerText,
      required this.descriptionText});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  headerText,
                  style: const TextStyle(
                      fontFamily: 'Cera Pro',
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Pallete.blackColor),
                ),
              ),
              const SizedBox(
                height: 4,
              ),
              const Padding(
                padding: EdgeInsets.only(right: 20),
              ),
              Text(
                descriptionText,
                style: const TextStyle(
                    fontFamily: 'Cera Pro',
                    // fontWeight: FontWeight.bold,
                    // fontSize: 18,
                    color: Pallete.blackColor),
              )
            ],
          )),
    );
  }
}
