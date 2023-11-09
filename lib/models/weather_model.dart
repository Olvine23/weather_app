class WeatherData{
  String? cityName;
  int? temperature;
  String? description;
  String? minCondition;

  WeatherData({
    this.cityName,
    this.minCondition,
    this.temperature,
    this.description

  });
  WeatherData.fromJson(dynamic json){
    cityName = json['name'];
   var tempInKelvin = json['main']['temp'];
   temperature = (tempInKelvin - 273.15).round();
    minCondition = json['weather'][0]['main'];
    description = json['weather'][0]['description'];
  }

}