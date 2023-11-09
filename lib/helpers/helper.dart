class HelperFn{
  String getWeatherAnimation(String? mainCondition){
    if(mainCondition == null) return 'assets/sunny.json';

    switch(mainCondition.toLowerCase()){
      case 'clouds':
        return 'assets/clouds.json';
      case 'rain':
        return 'assets/sunny_rain.json';
      default:
        return 'assets/sunny.json';
      
    }
  }

  String getResponseText(String? mainCondition){
    if(mainCondition == null) return 'Check your internet connectivity or try again later';
    switch(mainCondition.toLowerCase()){
      case 'clouds':
        return 'A bit chilly, I hope you warm enough pal';
      case 'rain':
        return 'I hope you are sheltered properly or armed with an umbrella';
      
      default:
        return 'Weather is looking good today';
    }

  }

}