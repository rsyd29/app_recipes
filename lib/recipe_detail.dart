import 'package:flutter/material.dart';
import 'recipe.dart';

class RecipeDetail extends StatefulWidget {
  final Recipe recipe;
  const RecipeDetail({
    Key? key,
    required this.recipe,
  }) : super(key: key);

  @override
  _RecipeDetailState createState() => _RecipeDetailState();
}

class _RecipeDetailState extends State<RecipeDetail> {
  int _sliderVal = 1;
  @override
  Widget build(BuildContext context) {
    // 1. Scaffold defines the page’s general structure.
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.recipe.label),
      ),
      // 2. In the body, there’s a SafeArea, a Column with a Container, a SizedBox and Text children.
      body: SafeArea(
        // 3. SafeArea keeps the app from getting too close to the operating system interfaces, such as the notch or the interactive area of most iPhones.
        child: Column(
          children: <Widget>[
            // 4. One new thing is the SizedBox around the Image, which defines resizable bounds for the image. Here, the height is fixed at 300 but the width will adjust to fit the aspect ratio. The unit of measurement in Flutter is logical pixels.
            SizedBox(
              height: 300,
              width: double.infinity,
              child: Image(
                image: AssetImage(widget.recipe.imageUrl),
              ),
            ),
            // 5. There is a spacer SizedBox.
            const SizedBox(
              height: 4,
            ),
            // 6. The Text for the label has a style that’s a little different than the main Card, to show you how much customizability is available.
            Text(
              widget.recipe.label,
              style: const TextStyle(fontSize: 18),
            ),
            // 7. An Expanded widget, which expands to fill the space in a Column. This way, the ingredient list will take up the space not filled by the other widgets.
            Expanded(
              // 8. A ListView, with one row per ingredient.
              child: ListView.builder(
                padding: const EdgeInsets.all(7.0),
                itemCount: widget.recipe.ingredients.length,
                itemBuilder: (context, index) {
                  final ingredient = widget.recipe.ingredients[index];
                  // 9. A Text that uses string interpolation to populate a string with runtime values. You use the ${expression} syntax inside the string literal to denote these.
                  return Text('${ingredient.quantity * _sliderVal} '
                      '${ingredient.measure} '
                      '${ingredient.name} ');
                },
              ),
            ),
            Slider(
              // 10. You use min, max and divisions to define how the slider moves. In this case, it moves between the values of 1 and 10, with 10 discreet stops. That is, it can only have values of 1, 2, 3, 4, 5, 6, 7, 8, 9 or 10.
              min: 1,
              max: 10,
              divisions: 10,
              // 11. label updates as the _sliderVal changes and displays a scaled number of servings.
              label: '${_sliderVal * widget.recipe.servings} servings',
              // 12. The slider works in double values, so this converts the int variable.
              value: _sliderVal.toDouble(),
              // 13. Conversely, when the slider changes, this uses round() to convert the double slider value to an int, then saves it in _sliderVal.
              onChanged: (newValue) {
                setState(() {
                  _sliderVal = newValue.round();
                });
              },
              // 14. This sets the slider’s colors to something more “on brand”. The activeColor is the section between the minimum value and the thumb, and the inactiveColor represents the rest.
              activeColor: Colors.green,
              inactiveColor: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
