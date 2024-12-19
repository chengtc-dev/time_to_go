import 'package:flutter_config/flutter_config.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class GoogleMapService {
  final googleApiKey = FlutterConfig.get('GOOGLE_API_KEY');

  Future<List<String>> queryAutocomplete(String input) async {
    final url = Uri.parse(
        'https://maps.googleapis.com/maps/api/place/queryautocomplete/json?input=$input&key=$googleApiKey');

    final response = await http.get(url);
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      List<String> predictions = [];
      for (var prediction in data['predictions']) {
        predictions.add(prediction['description']);
      }
      return predictions;
    } else {
      throw Exception('Failed to load autocomplete suggestions');
    }
  }
}
