import 'dart:async';

import 'package:page_demo/pages/stream/stream_value.dart';


class StreamItem{

  final String lista  ="N";
  late  StreamSubscription<String>  streamSubscription  ;

  final StreamValue  streamvalue ;

  StreamItem({required  this.streamvalue}){
    streamSubscription  =  streamvalue.stream.listen((state) {
         print("Estou ouvisto outra stream .....");
        _controller.sink.add(state);
    });
  }

  final StreamController<String> _controller = StreamController.broadcast();
  Stream<String> get stream =>_controller.stream;


  void add(String value){
    _controller.sink.add(value);
  }

  void dispose(){
    _controller.close();
  }

  StreamValue  get Streamvalues => streamvalue;

}