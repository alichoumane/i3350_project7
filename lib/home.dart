import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Home extends StatefulWidget {
  const Home({super.key});
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  FToast fToast = FToast();

  @override
  void initState() {
    super.initState();
    fToast.init(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("User feedbacks", style: TextStyle(fontSize: 25),),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 20,),

            ElevatedButton(onPressed: (){
              Fluttertoast.showToast(
                  msg: "This is Center Short Toast",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.CENTER,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.red,
                  textColor: Colors.white,
                  fontSize: 16.0
              );
            }, child: Text('Show Toast with NO context')),
            const SizedBox(height: 20,),
            ElevatedButton(onPressed: (){
                fToast.showToast(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25.0),
                        color: Colors.greenAccent,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.check),
                          SizedBox(
                            width: 12.0,
                          ),
                          Text("This is a Custom Toast"),
                        ],
                      ),
                    ),
                    gravity: ToastGravity.BOTTOM,
                    toastDuration: Duration(seconds: 2),
                );
            }, child: Text('Show Toast with context')),
            const SizedBox(height: 20,),
            ElevatedButton(onPressed: (){
              showDialog(
                  context: context,
                  builder: (BuildContext context){
                    return AlertDialog(
                      title: const Text("AlertDialog title"),
                      content: const Text("Description ...."),
                      actions: [
                        TextButton(onPressed: (){Navigator.pop(context);}, child: const Text('Cancel')),
                        TextButton(onPressed: (){Navigator.pop(context);}, child: const Text('Ok')),
                      ],
                    );
                  });
            }, child: Text("Show Ok/Cancel Dialog")),
            const SizedBox(height: 20,),
            ElevatedButton(onPressed: (){
              showDialog(
                  context: context,
                  builder: (BuildContext context){
                    return AlertDialog(
                      title: const Text("Choose an action:"),
                      actions: [
                        Center(
                          child: Column(
                            children: [
                              TextButton(onPressed: (){Navigator.pop(context);}, child: const Text('Share', style: TextStyle(fontSize: 25),)),
                              TextButton(onPressed: (){Navigator.pop(context);}, child: const Text('Delete', style: TextStyle(fontSize: 25),)),
                              TextButton(onPressed: (){Navigator.pop(context);}, child: const Text('Move', style: TextStyle(fontSize: 25),)),
                            ],
                          ),
                        )
                      ],
                    );
                  });
            }, child: Text("Show Dialog with Vertical Actions")),
            const SizedBox(height: 20,),

            ElevatedButton(onPressed: (){
              SnackBar snackBar = SnackBar(
                content: Text('Message Deleted!', style: TextStyle(fontSize: 18.0),),
                duration: Duration(seconds: 5),
                action: SnackBarAction(label: "Undo", onPressed: (){
                  // Do something
                },),
              );

              ScaffoldMessenger.of(context).showSnackBar(snackBar);

            }, child: Text('Show SnackBar')),
          ],

        ),
      ),
    );
  }
}