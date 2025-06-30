
import 'package:flutter/material.dart';
import 'package:pokidex/component/my_appbar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: MyAppbar( title: 'Pokedex', ),
      body: Expanded(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Card(
              color: Colors.black,
              child: SizedBox(
                height: 200,
                width: 160,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Text('This is card', style: TextStyle( color: Colors.white),),
                  ),
                ),
              )
            ),
            Card(
                color: Colors.black,
                child: SizedBox(
                  height: 200,
                  width: 160,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Text('This is card', style: TextStyle( color: Colors.white),),
                    ),
                  ),
                )
            ),
          ],
        ),
      )
    );
  }
}
