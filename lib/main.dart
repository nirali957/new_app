import 'dart:math';

import 'package:devlopment_app/common_widget/common_button.dart';
import 'package:devlopment_app/screens/model_calling_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        // fontFamily: "Sevillana",
      ),
      home: const ModelCallingScreen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  AnimationController? animationController;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  bool light = true;
  double currentSliderValue = 20;

  dynamic colorCode = 0xff000000;
  Random random = Random();

  int index = 0;
  List colorList = [];

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  int navigationIndex = 0;

  void generateColor() {
    colorCode = random.nextInt(0xffffffff);
    index++;
    colorList.add(colorCode);
    setState(() {});
  }

  void changeColor() {
    if (index != 0) {
      index--;
    }
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    colorList.add(colorCode);
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    );

    super.initState();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            scaffoldKey.currentState!.openDrawer();
          },
          icon: const Icon(Icons.lens_blur_outlined),
        ),
      ),
      // backgroundColor: Color(colorList[index]),
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Drawer Header'),
            ),
            ListTile(
              leading: const Icon(
                Icons.home,
              ),
              title: const Text('Page 1'),
              onTap: () {
                scaffoldKey.currentState!.closeDrawer();
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.train,
              ),
              title: const Text('Page 2'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: ListView(
        children: [
          Form(
            key: formKey,
            child: Column(
              children: [
                const SizedBox(height: 20),
                TextFormField(
                  controller: emailController,

                  onChanged: (value) {
                    debugPrint("onChanged ------------>> $value");
                    setState(() {});
                  },
                  onTap: () {
                    debugPrint("onTap ------------>> ");
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                  autocorrect: false,
                  autofocus: false,
                  style: const TextStyle(
                    color: Colors.red,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                  minLines: 1,
                  // maxLines: 10,
                  keyboardAppearance: Brightness.dark,
                  keyboardType: TextInputType.multiline,
                  // maxLength: 20,
                  // obscureText: true,
                  textAlign: TextAlign.start,
                  // enabled: false,
                  textInputAction: TextInputAction.next,
                  // obscuringCharacter: ">",
                  decoration: InputDecoration(
                    // hintText: "Enter Email",
                    fillColor: Colors.black,
                    // contentPadding: EdgeInsets.all(20),
                    // isDense: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.black),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.green),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.yellow),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.blue),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.black),
                    ),
                    floatingLabelBehavior: FloatingLabelBehavior.auto,
                    // floatingLabelStyle: TextStyle(color: Colors.red),
                    floatingLabelAlignment: FloatingLabelAlignment.start,
                    labelText: "Email",
                    suffixIcon: const Icon(Icons.search),
                    suffixIconColor: Colors.red,
                    focusColor: Colors.pinkAccent,
                    icon: const Icon(Icons.anchor_outlined),
                    iconColor: Colors.red,
                  ),
                ),
                const SizedBox(height: 15),
                TextFormField(
                  controller: passwordController,

                  onChanged: (value) {
                    debugPrint("onChanged ------------>> $value");
                    setState(() {});
                  },
                  onTap: () {
                    debugPrint("onTap ------------>> ");
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    } else if (value.length != 4) {
                      return 'Please enter 4 Word';
                    }

                    return null;
                  },
                  autocorrect: false,
                  autofocus: false,
                  style: const TextStyle(
                    color: Colors.red,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    // fontFamily: "Sevillana",
                  ),
                  minLines: 1,
                  // maxLines: 10,
                  keyboardAppearance: Brightness.dark,
                  keyboardType: TextInputType.multiline,
                  // maxLength: 20,
                  // obscureText: true,
                  textAlign: TextAlign.start,
                  // enabled: false,
                  textInputAction: TextInputAction.next,
                  // obscuringCharacter: ">",
                  decoration: InputDecoration(
                    // hintText: "Enter Email",
                    fillColor: Colors.black,
                    // contentPadding: EdgeInsets.all(20),
                    // isDense: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.black),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.green),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.yellow),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.red),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.black),
                    ),
                    floatingLabelBehavior: FloatingLabelBehavior.auto,
                    // floatingLabelStyle: TextStyle(color: Colors.red),
                    floatingLabelAlignment: FloatingLabelAlignment.start,
                    labelText: "Password",
                    suffixIcon: const Icon(Icons.search),
                    suffixIconColor: Colors.red,
                    focusColor: Colors.pinkAccent,
                    icon: const Icon(Icons.anchor_outlined),
                    iconColor: Colors.red,
                  ),
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {
                    if (validter()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Processing Data')),
                      );
                    }
                  },
                  child: const Text('Submit'),
                ),
                CommonButton(
                  onTap: () {
                    // Fluttertoast.showToast(
                    //   msg: "This is Center Short Toast",
                    //   toastLength: Toast.LENGTH_SHORT,
                    //   gravity: ToastGravity.BOTTOM,
                    //   timeInSecForIosWeb: 1,
                    //   backgroundColor: Colors.black26,
                    //   textColor: Colors.white,
                    //   fontSize: 16.0,
                    // );

                    final snackBar = SnackBar(
                      content: const Text('Yay! A SnackBar!'),
                      duration: const Duration(seconds: 2),
                      animation: CurvedAnimation(
                        parent: animationController!,
                        curve: Curves.bounceOut,
                      ),
                      behavior: SnackBarBehavior.floating,
                      action: SnackBarAction(
                        label: 'Undo',
                        onPressed: () {
                          // Some code to undo the change.
                        },
                      ),
                    );

                    // Find the ScaffoldMessenger in the widget tree
                    // and use it to show a SnackBar.
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  },
                  height: 50,
                  isShadowFull: false,
                  title: "Confirmer le paiement",
                  // buttonColor: Color(0xFFFFFFFF),
                  // shadowColor: Color(0x99D7D9DB),
                  // textColor: Color(0xFF000000),
                  // icon: Icon(Icons.arrow_forward),
                ),
                TextButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      // barrierColor: Colors.red,
                      // barrierDismissible: false,
                      // useSafeArea: false,

                      builder: (BuildContext context) => AlertDialog(
                        title: const Text('AlertDialog Title'),
                        content: const Text('AlertDialog description'),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () => Navigator.pop(context, 'Cancel'),
                            child: const Text('Cancel'),
                          ),
                          TextButton(
                            onPressed: () => Navigator.pop(context, 'OK'),
                            child: const Text('OK'),
                          ),
                        ],
                      ),
                    ).then((value) {
                      debugPrint("Value ------------>>> $value");
                    });
                  },
                  child: const Text('Show Dialog'),
                ),
                CupertinoButton(
                  onPressed: () {
                    showCupertinoModalPopup(
                      context: context,
                      builder: (BuildContext context) => CupertinoAlertDialog(
                        title: const Text('Alert'),
                        content: const Text('Proceed with destructive action?'),
                        actions: <CupertinoDialogAction>[
                          CupertinoDialogAction(
                            isDefaultAction: true,
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text('No'),
                          ),
                          CupertinoDialogAction(
                            isDestructiveAction: true,
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text('Yes'),
                          ),
                        ],
                      ),
                    );
                  },
                  child: const Text('CupertinoAlertDialog'),
                ),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    trackHeight: 10.0,
                    trackShape: const RoundedRectSliderTrackShape(),
                    activeTrackColor: Colors.purple.shade800,
                    inactiveTrackColor: Colors.purple.shade100,
                    thumbShape: const RoundSliderThumbShape(
                      enabledThumbRadius: 14.0,
                      pressedElevation: 8.0,
                    ),
                    thumbColor: Colors.pinkAccent,
                    overlayColor: Colors.pink.withOpacity(0.2),
                    overlayShape: const RoundSliderOverlayShape(overlayRadius: 32.0),
                    tickMarkShape: const RoundSliderTickMarkShape(),
                    activeTickMarkColor: Colors.pinkAccent,
                    inactiveTickMarkColor: Colors.white,
                    valueIndicatorShape: const PaddleSliderValueIndicatorShape(),
                    valueIndicatorColor: Colors.black,
                    valueIndicatorTextStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                    ),
                  ),
                  child: Slider(
                    min: 0.0,
                    max: 100.0,
                    value: currentSliderValue.round().toDouble(),
                    divisions: 5,
                    label: '${currentSliderValue.round()}',
                    onChanged: (value) {
                      currentSliderValue = value;
                      setState(() {});
                    },
                  ),
                ),
                Switch(
                  // This bool value toggles the switch.
                  value: light,
                  // activeColor: Colors.red,

                  onChanged: (bool value) {
                    // This is called when the user toggles the switch.
                    setState(() {
                      light = value;
                    });
                  },
                ),
                const SizedBox(height: 10),
                CupertinoSwitch(
                  // This bool value toggles the switch.
                  value: light,

                  activeColor: CupertinoColors.activeBlue,
                  onChanged: (bool? value) {
                    // This is called when the user toggles the switch.
                    setState(() {
                      light = value ?? false;
                    });
                  },
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  child: const Text('showModalBottomSheet'),
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      shape: const RoundedRectangleBorder(
                        // <-- SEE HERE
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(25.0),
                        ),
                      ),
                      builder: (context) {
                        return SizedBox(
                          height: 200,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: const <Widget>[],
                          ),
                        );
                      },
                    );
                  },
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    FloatingActionButton(
                      child: const Icon(Icons.add),
                      onPressed: () {
                        generateColor();
                      },
                    ),
                    FloatingActionButton(
                      child: const Icon(Icons.remove),
                      onPressed: () {
                        changeColor();
                      },
                    ),
                    Text(
                      "$index",
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey.shade500,
        currentIndex: navigationIndex,
        elevation: 50,
        onTap: (value) {
          debugPrint("value ---------->> $value");
          navigationIndex = value;
          setState(() {});
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: "Search",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: "Favorite",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Person",
          ),
        ],
      ),
    );
  }

  bool validter() {
    if (emailController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(' Data'),
        ),
      );
      return false;
    }

    return true;
  }
}
