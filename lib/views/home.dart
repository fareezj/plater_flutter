import 'package:flutter/material.dart';
import 'package:plater_flutter/models/recipe_model.dart';
import 'package:plater_flutter/services/api_services.dart';
import 'package:plater_flutter/views/recipe_details.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<RecipeModel> _recipes = List<RecipeModel>();
  TextEditingController textEditingController = new TextEditingController();

  Future<List<RecipeModel>> getRecipeData(String query) async {
    var recipes = List<RecipeModel>();
    Map<String, dynamic> recipeData = await ApiServices().getRecipe(query);
    recipeData["hits"].forEach((element) {
      RecipeModel recipeModel = new RecipeModel();
      recipeModel = RecipeModel.fromJson(element['recipe']);
      recipes.add(recipeModel);
    });
    return recipes;
  }

  @override
  void initState() {
    getRecipeData("chicken").then((value) {
      setState(() {
        _recipes.addAll(value);
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Plater'),
      ),
      body: Stack(children: [
        SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 30.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: textEditingController,
                        decoration:
                            InputDecoration(
                                hintText: 'Enter recipe name',
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.orange)
                                ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.pink)
                              )
                            ),
                      ),
                    ),
                    IconButton(
                        icon: Icon(Icons.search),
                        onPressed: () {
                          var queryData = textEditingController.text;
                          setState(() {
                            _recipes.clear();
                            getRecipeData(queryData).then((value) {
                              setState(() {
                                _recipes.addAll(value);
                              });
                            });
                          });
                        }),
                  ],
                ),
                SizedBox(
                  height: 40.0,
                ),
                Column(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
                      child: GridView(
                        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                            mainAxisSpacing: 10.0, maxCrossAxisExtent: 200.0),
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        physics: ClampingScrollPhysics(),
                        children: List.generate(_recipes.length, (index) {
                          return GridTile(
                              child: RecipeTile(
                            label: _recipes[index].label,
                            image: _recipes[index].image,
                            source: _recipes[index].source,
                            url: _recipes[index].url,
                            recipeDetailsWidgetData: [_recipes[index]],
                          ));
                        }),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ]),
    );
  }
}

class RecipeTile extends StatefulWidget {
  final String label, image, source, url;
  final List<RecipeModel> recipeDetailsWidgetData;
  RecipeTile(
      {this.label,
      this.image,
      this.source,
      this.url,
      this.recipeDetailsWidgetData});

  @override
  _RecipeTileState createState() => _RecipeTileState();
}

class _RecipeTileState extends State<RecipeTile> {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => RecipeDetails(
                          recipeDetailsData: widget.recipeDetailsWidgetData,
                        )));
          },
          child: Container(
            width: 200,
            padding: EdgeInsets.all(10.0),
            child: Stack(
              children: [
                Image.network(
                  widget.image,
                  width: 200,
                  height: 200,
                  fit: BoxFit.cover,
                ),
                Container(
                  width: 200,
                  child: Column(
                    children: [
                      Text(widget.label),
                      Text(widget.source),
                    ],
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}

//Expanded(
//   child: ListView.builder(
//     itemBuilder: (context, index) {
//       return InkWell(
//         onTap: () {
//           print('${_recipes[index].label}');
//           Navigator.push(
//             context,
//             MaterialPageRoute(
//               builder: (context) => RecipeDetails(
//                 recipeDetailsData: [_recipes[index]],
//               ),
//             ),
//           );
//         },
//         child: Card(
//           child: Column(
//             children: [Text(_recipes[index].label)],
//           ),
//         ),
//       );
//     },
//     itemCount: _recipes.length,
//   ),
// )
