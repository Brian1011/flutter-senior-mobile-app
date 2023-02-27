import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:test_app/feature/data/feature_model.dart';
import 'package:test_app/feature/services/feature_service.dart';

class AddEditFeatureWidget extends StatefulWidget {
  final FeatureModel feature;
  const AddEditFeatureWidget({
    Key key,
    this.feature,
  }) : super(key: key);

  @override
  State<AddEditFeatureWidget> createState() => _AddEditFeatureWidgetState();
}

class _AddEditFeatureWidgetState extends State<AddEditFeatureWidget> {
  GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();
  FeatureModel existingFeature;
  bool isFeatureUpdated = false;

  onSubmit() async {
    if (isFormValid()) {
      isFeatureUpdated ? await updateFeature() : await saveNewFeature();
      Navigator.of(context).pop();
    }
  }

  bool isFormValid() {
    if (formKey.currentState.validate()) {
      return true;
    } else {
      return false;
    }
  }

  saveNewFeature() async {
    FeatureModel featureModel = FeatureModel(
      name: titleController.text,
    );

    await featureService.addNewFeature(feature: featureModel);
    Fluttertoast.showToast(msg: "Feature saved successfully");
  }

  updateFeature() async {
    FeatureModel featureModel = FeatureModel(
      id: existingFeature.id,
      name: titleController.text,
    );

    await featureService.updateFeature(feature: featureModel);
    Fluttertoast.showToast(msg: "Feature updated successfully");
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    setTexFieldValues();
  }

  setTexFieldValues() {
    if (widget.feature != null) {
      existingFeature = widget.feature;
      titleController = TextEditingController.fromValue(TextEditingValue(
          text: existingFeature.name,
          selection: new TextSelection.collapsed(
              offset: existingFeature.name.length)));
      isFeatureUpdated = true;
    }
  }

  @override
  void dispose() {
    titleController.dispose();
    contentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                isFeatureUpdated ? "Edit Feature" : "Add new Feature",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: titleController,
                decoration:
                    InputDecoration(hintText: "Title", labelText: "Title"),
                validator: (value) {
                  if (value.isEmpty) {
                    return "Title cannot be empty";
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                decoration: const InputDecoration(
                    hintText: "Features", labelText: "Features"),
                controller: contentController,
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                height: 60,
                width: MediaQuery.of(context).size.width * 0.75,
                child: TextButton(
                    onPressed: onSubmit,
                    child: Text("Submit"),
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.blue),
                        foregroundColor:
                            MaterialStateProperty.all(Colors.white))),
              )
            ],
          ),
        ),
      ),
    );
  }
}
