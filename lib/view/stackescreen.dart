import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Pagedesign extends StatelessWidget {
  const Pagedesign({super.key});

  @override
  Widget build(BuildContext context) {
    print('ProductGrid');
    return Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Stack(
            children: [
              Container(
                height: double.infinity,
                width: double.infinity,
                color: Colors.tealAccent,
              ),
              Positioned(
                bottom: 0,
                right: 0,
                left: 0,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(40),
                  child: Container(
                    height: 400,
                    width: 200,
                    color: Colors.limeAccent,
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
