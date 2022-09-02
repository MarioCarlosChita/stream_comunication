import 'package:flutter/material.dart';
import 'package:page_demo/pages/stream/stream_item.dart';
import 'package:page_demo/pages/stream/stream_value.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  late  StreamValue streamvalue ;
  final StreamItem streamItem = StreamItem(streamvalue: StreamValue());

  @override
  void initState() {
    streamvalue =  streamItem.Streamvalues;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size _mediaDeviceSize  =  MediaQuery.of(context).size;

    return Scaffold(
      body: SizedBox(
        width: _mediaDeviceSize.width,
        height: _mediaDeviceSize.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            StreamBuilder<String>(
              stream: streamItem.stream,
              builder: (context , snapshot){
                if (!snapshot.hasError){
                  String data = snapshot.data??"";
                  return  Container(
                    child: Text(data),
                  );
                } else {
                  return Container(
                    child: const Text("Ha Errors"),
                  );
                }
              },
            )  ,
            const SizedBox(height:10,),
            MaterialButton(
              onPressed: () =>streamItem.add("S"),
              minWidth: 120,
              height:50,
              color: Colors.blue,
              child: Text("Add", style: TextStyle(
                color: Colors.white,

              ),),
            ) ,
            const SizedBox(height:20,) ,
            StreamBuilder<String>(
                stream:streamvalue.stream ,
                builder: (context ,snapshot){
                  String data = snapshot.data ??"";
                  return Container(
                     child: Text(data),
                  );
                }
            ) ,


            TextButton(
                onPressed: () => streamvalue.add("F"),
                child: const Text("Ola")
            )

          ],
        ),
      ),
    );
  }
}
