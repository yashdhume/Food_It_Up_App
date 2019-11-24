import 'package:flutter_ibm_watson/flutter_ibm_watson.dart';
import 'dart:async';
import 'package:flutter/services.dart' show rootBundle; 
import 'dart:io';
Future<List<ClassResult>> visualRecognitionFile(File image) async {
    print('Running Watson');
    IamOptions options = await IamOptions(iamApiKey: "jCK7v9Hu-yqcR7CPyo9Ew8IN_PPhPf5hdTb9bToIoQru", url: "https://gateway.watsonplatform.net/visual-recognition/api").build();
    print('Expiration ' + options.expiresIn.toString());
    VisualRecognition visualRecognition = new VisualRecognition(
        iamOptions: options, language: Language.ENGLISH);
    print(visualRecognition.urlApi);
    ClassifiedImages classifiedImages =
        await visualRecognition.classifyImageFile(image.path); 
    print(classifiedImages.toString()); 
    print('----------------------------------------------------------');
    print(classifiedImages
        .getImages()[0]
        .getClassifiers()[0]
        .getClasses()[0]
        .className);
    return classifiedImages.getImages()[0].getClassifiers()[0].getClasses();

}

Future<Set<String>> readFile() async {
  try {
    String contents = await rootBundle.loadString('assets/IngredientsSorted.txt');
    Set<String> items = Set<String>(); 
    // Read the file.
    contents.split('\n').forEach((value){
      items.add(value); 
    }); 
    return items; 
  } catch (e) {
    // If encountering an error, return 0.
    print('Error reading file'); 
    return Set();
  }
}
Future<List<String>> ParseIngredients(List<ClassResult> classItems)async{
    Set<String> ingredients = await readFile(); 
    List<String> items = []; 
    classItems.forEach((item){
      items.add(item.className); 
    }); 
    items = items.where((test) => ingredients.contains(test)).toList(); 
    return items; 
}