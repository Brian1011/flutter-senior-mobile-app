import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:test_app/feature/data/feature_model.dart';
import 'package:test_app/feature/presentation/widgets/add_edit_feature.dart';
import 'package:test_app/feature/services/feature_service.dart';

class ListFeaturesScreen extends StatefulWidget {
  const ListFeaturesScreen({Key key}) : super(key: key);

  @override
  State<ListFeaturesScreen> createState() => _ListFeaturesScreenState();
}

class _ListFeaturesScreenState extends State<ListFeaturesScreen> {
  editFeature(FeatureModel model) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (BuildContext context) {
          return AddEditFeatureWidget(feature: model);
        });
  }

  deleteNote(FeatureModel model) async {
    await featureService.deleteFeature(feature: model);
    Fluttertoast.showToast(msg: "Feature erased successfully");
  }

  addFeature() {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (BuildContext context) {
          return AddEditFeatureWidget();
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List features default'),
      ),
      body: Container(
        child: Center(
            child: Column(
          children: [
            Consumer<FeatureService>(builder: (context, notesService, _) {
              return Expanded(
                  child: ListView.builder(
                      itemCount: featureService.features.length,
                      itemBuilder: (context, index) {
                        FeatureModel model = featureService.features[index];
                        return GestureDetector(
                          onTap: () {
                            editFeature(model);
                          },
                          child: Container(
                            color: index % 2 == 0
                                ? Colors.white
                                : Colors.grey[200],
                            child: ListTile(
                              title: Text("${model.name}"),
                              trailing: IconButton(
                                  icon: Icon(Icons.delete),
                                  color: Colors.red,
                                  onPressed: () {
                                    deleteNote(model);
                                  }),
                            ),
                          ),
                        );
                      }));
            })
          ],
        )),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          addFeature();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
