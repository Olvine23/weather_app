class WeatherData{
  String? cityName;
  int? temperature;
  String? minCondition;

  WeatherData({
    this.cityName,
    this.minCondition,
    this.temperature
  });
  WeatherData.fromJson(dynamic json){
    cityName = json['name'];
   var tempInKelvin = json['main']['temp'];
   temperature = (tempInKelvin - 273.15).round();
    minCondition = json['weather'][0]['main'];
  }

}