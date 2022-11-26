import 'package:flutter/material.dart';
import 'model/havadurumu_model.dart';
import 'weather_api/weathar_api.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  WeatherApi client = WeatherApi();
  Weather? data;

  @override
  Future<void> getData() async {
    data = await client.getCurrentWeather("konya");
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text(
              "Hava Durumu",
              style: TextStyle(color: Colors.black, fontSize: 22),
            ),
            centerTitle: true,
            backgroundColor: Colors.blue.shade300,
            elevation: 0.0,
            leading: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.menu,
                  color: Colors.black,
                ))),
        body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  stops: [0.0, 200.0],
                  tileMode: TileMode.clamp,
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [Colors.blue.shade300, Colors.white]),
              borderRadius: BorderRadius.circular(6)),
          child: FutureBuilder(
            future: getData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.sunny,
                          color: Colors.yellow,
                          size: 70,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "${data?.sehir}",
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "${data?.sicaklik} °C",
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                          ),
                        ),
                        const SizedBox(
                          height: 35,
                        ),
                        const Text(
                          "Ek Bilgiler",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 24,
                          ),
                        ),
                        const Divider(),
                        const SizedBox(
                          height: 24,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                  stops: [0.0, 200.0],
                                  tileMode: TileMode.clamp,
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [Colors.blue, Colors.white]),
                              borderRadius: BorderRadius.circular(6),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black.withOpacity(0.25),
                                    blurRadius: 4,
                                    offset: const Offset(0, 4)),
                              ]),
                          width: double.infinity,
                          height: 300,
                          padding: const EdgeInsets.all(18),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(15),
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text("Hissedilen Sıcaklık",
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.black)),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text("${data?.hissedilen}°C",
                                          style: const TextStyle(
                                              fontSize: 20,
                                              color: Colors.black)),
                                      const SizedBox(
                                        height: 25,
                                      ),
                                      const Text("Rüzgar",
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.black)),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text("${data?.ruzgar}km/s",
                                          style: const TextStyle(
                                              fontSize: 20,
                                              color: Colors.black))
                                    ]),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(15),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text("Nem",
                                        style: TextStyle(
                                            fontSize: 20, color: Colors.black)),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text("${data?.nem}%",
                                        style:const TextStyle(
                                            fontSize: 20, color: Colors.black)),
                                    const SizedBox(
                                      height: 25,
                                    ),
                                    const Text("Basınç",
                                        style: TextStyle(
                                            fontSize: 20, color: Colors.black)),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text("${data?.basinc}mbar",
                                        style: const TextStyle(
                                            fontSize: 20, color: Colors.black))
                                  ],
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              } else if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              return Container();
            },
          ),
        ));
  }

  Padding Ekbilgiler(String ilkBilgi, String ikinciBilgi) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            ilkBilgi,
            style: const TextStyle(fontSize: 20, color: Colors.black),
          ),
          Text(
            ikinciBilgi,
            style: const TextStyle(fontSize: 20, color: Colors.black),
          )
        ],
      ),
    );
  }
}
