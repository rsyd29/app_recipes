import 'package:flutter/material.dart';
import 'recipe.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  /// 1. A widget’s build() method is the entry point for composing together other widgets to make a new widget.
  @override
  Widget build(BuildContext context) {
    /// 2. A theme determines visual aspects like color. The default ThemeData will show the standard Material defaults.
    final ThemeData theme = ThemeData();

    /// 3. MaterialApp uses Material Design and is the widget that will be included in RecipeApp.
    return MaterialApp(
      /// 4. The title of the app is a description that the device uses to identify the app. The UI won’t display this.
      title: 'Recipe Calculator',

      /// 5. By copying the theme and replacing the color scheme with an updated copy lets you change the app’s colors. Here, the primary color is Colors.grey and the secondary color is Colors.black.
      theme: theme.copyWith(
        colorScheme: theme.colorScheme.copyWith(
          primary: Colors.grey,
          secondary: Colors.black,
        ),
      ),

      /// 6. This still uses the same MyHomePage widget as before, but now, you’ve updated the title and displayed it on the device.
      home: const MyHomePage(title: 'Recipe Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // 1. A Scaffold provides the high-level structure for a screen. In this case, you’re using two properties.
    return Scaffold(
      // 2. AppBar gets a title property by using a Text widget that has a title passed in from home: MyHomePage(title: 'Recipe Calculator') in the previous step.
      appBar: AppBar(
        title: Text(widget.title),
      ),
      // 3. body has SafeArea, which keeps the app from getting too close to the operating system interfaces such as the notch or interactive areas like the Home Indicator at the bottom of some iOS screens.
      body: SafeArea(
        // 4. SafeArea has a child widget, Builds a list using ListView.
        child: ListView.builder(
          // 5. itemCount determines the number of rows the list has. In this case, length is the number of objects in the Recipe.samples list.
          itemCount: Recipe.samples.length,
          // 6. itemBuilder builds the widget tree for each row.
          itemBuilder: (context, index) {
            // 7. A Text widget displays the name of the recipe.
            // TODO: Add GestureDetector
            return buildRecipeCard(Recipe.samples[index]);
          },
        ),
      ),
    );
  }

  Widget buildRecipeCard(Recipe recipe) {
    // 1. You return a Card from buildRecipeCard().
    return Card(
      // A card’s elevation determines how high off the screen the card is, affecting its shadow.
      elevation: 2.0,
      // shape handles the shape of the card. This code defines a rounded rectangle with a 10.0 corner radius.
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      // Padding insets its child’s contents by the specified padding value.
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        // 2. The Card’s child property is a Column. A Column is a widget that defines a vertical layout.
        child: Column(
          // 3. The Column has two children.
          children: <Widget>[
            // 4. The first child is an Image widget. AssetImage states that the image is fetched from the local asset bundle defined in pubspec.yaml.
            Image(
              image: AssetImage(
                recipe.imageUrl,
              ),
            ),
            // Between the image and text is a SizedBox. This is a blank view with a fixed size.
            const SizedBox(
              height: 14.0,
            ),
            // 5. A Text widget is the second child. It will contain the recipe.label value.
            // You can customize Text widgets with a style object. In this case, you’ve specified a Palatino font with a size of 20.0 and a bold weight of w700.
            Text(
              recipe.label,
              style: const TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w700,
                fontFamily: 'Palatino',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
