import 'package:get/get.dart';
import 'package:weather_app/models/location_model.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/repositories/weather_repository.dart';

class HomeController extends GetxController{
    // By using Get.find(), Get will find the object in the binding class and give it to you.
  final WeatherRepository _repository = Get.find();

   // A nullable Rx instance of LocationData. Initial value is null.
  Rxn<LocationData> locationData = Rxn();

   // A nullable Rx instance of weatherData. Initial value is null.

   Rxn<WeatherData> weatherData = Rxn();

  // This will be retrieved by the UI for  display.
  String get name => "${weatherData.value?.cityName}";
  String get condition => "${weatherData.value?.minCondition}";
  String? get description => "${weatherData.value?.description}";
  String get temperature => "${weatherData.value?.temperature}";
  String get address =>
      "${locationData.value?.regionName}, ${locationData.value?.country}";

       @override
  void onInit() async{
    super.onInit();
    await getCurrentLocation();
    await getWeatherForCurrentLocation();
    
  }
   getCurrentLocation() async {
    //  logic to fetch current city
      LocationData? location = await _repository.getCurrentLocation();
    print(location?.regionName);
    // We assign the response from our API call to our Rx object.
    locationData.value = location;
  }

  getWeatherForCurrentLocation() async {
    // logic to fetch weather for current city
    if(locationData.value != null){
      weatherData.value = await _repository.getWeatherForLocation(locationData.value!);
    }


  }
}