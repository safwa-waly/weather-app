import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/providers/weather_proviser.dart';
import 'package:weather_app/services/weather_services.dart';

class SearchPage extends StatelessWidget {
 String? cityName ;
 SearchPage({this.updateUi});
 VoidCallback? updateUi;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search a City'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: TextField(
            onChanged: (data){
              cityName=data;
            },
            onSubmitted: (data) async{
              cityName=data;
              WeatherService service = WeatherService();

              WeatherModel? weather =
              await service.getweather(cityName: cityName!);

              Provider.of<WeatherProvider>(context,listen: false).weatherData = weather;
              Provider.of<WeatherProvider>(context,listen: false).cityName = cityName;

              Navigator.pop(context);
            },
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 35,horizontal: 22),
              label: Text('search'),
              suffixIcon: Icon(Icons.search),
              border: OutlineInputBorder(),
              hintText: 'Enter city name'
            ),
          ),
        ),
      ),
    );
  }
}

