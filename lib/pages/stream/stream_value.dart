import 'dart:async';


class StreamValue{
  String state ="S";

  final StreamController<String> _controller = StreamController.broadcast();
  Stream<String>  get stream =>_controller.stream;



  // adicionando valores
  void add(String item){
     state = item;
    _controller.sink.add(state);
  }


  void  dispose(){
    _controller.close();
  }


}