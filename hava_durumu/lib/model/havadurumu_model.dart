
class Weather{
  String? sehir;
  double? sicaklik;
  double? ruzgar;
  int? nem;
  double? hissedilen;
  int? basinc;

  Weather({this.sehir, this.sicaklik, this.ruzgar, this.nem, this.hissedilen,
      this.basinc});


  Weather.fromJson(Map<String,dynamic> json){

    sehir=json["name"];
    sicaklik=json["main"]["temp"];
    ruzgar=json["wind"]["speed"];
    nem = json["main"]["humidity"];
    hissedilen = json["main"]["feels_like"];
    basinc = json["main"]["pressure"];



  }
}