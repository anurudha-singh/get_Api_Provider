
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get_request/provider/userinfo_Provider.dart';
import 'package:provider/provider.dart';

//In this class we are going to render the data on UI which is coming from the API's.
class UserInformation extends StatefulWidget {
  const UserInformation({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<UserInformation> {
  /////////////////////////////////////////////////////////////////////////

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<UserInformationProvider>(context, listen: false).getData();
    });
  }

//////////////////////////////////////////////////////////////////////////////
  @override
  Widget build(BuildContext context) {
    final userinfo = Provider.of<UserInformationProvider>(context);

    print('userinfo ${userinfo.response![0].description}');
    return Scaffold(
      appBar: AppBar(
        title: const Text('REST API Example'),
      ),
      body: userinfo.response == null || userinfo.response!.isEmpty
          ? const Center(
        child: CircularProgressIndicator(),
      )
          : ListView.builder(
        itemCount: userinfo.response!.length,
        itemBuilder: (context, index) {
          return Card(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(userinfo.response![index].id.toString()),
                  ],
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(userinfo.response![index].roleName.toString()),
                    Text(
                        userinfo.response![index].description.toString()),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}



class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}


// import 'dart:io';
//
// import 'package:flutter/material.dart';
// import 'package:get_request/provider/userinfo_Provider.dart';
// import 'package:get_request/user_model.dart';
// import 'package:provider/provider.dart';
// import './user_model.dart';
// import 'api_Services.dart';
// //In this class we are going to render the data on UI which is coming from the API's.
//
//
//
// class Home extends StatefulWidget {
//   const Home({Key? key}) : super(key: key);
//
//   @override
//   _HomeState createState() => _HomeState();
// }
//
// class _HomeState extends State<Home> {
//
//   /////////////////////////////////////////////////////////////////////////
//   late List<UserModel>? _userModel = [];
//   @override
//   void initState() {
//     super.initState();
//
//     _getData();
//     // final postModel = Provider.of<UserModel>(context, listen: false);
//     // postModel.getData();
//
//   }
//   //
//   void _getData() async {
//     _userModel = (await ApiService().getUsers())!;
//     Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
//   }
// //////////////////////////////////////////////////////////////////////////////
//   @override
//   Widget build(BuildContext context) {
//     final user = Provider.of<UserInformationProvider>(context);
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('REST API Example'),
//       ),
//       body: _userModel == null || _userModel!.isEmpty
//           ? const Center(
//         child: CircularProgressIndicator(),
//       )
//           : ListView.builder(
//         itemCount: _userModel!.length,
//         itemBuilder: (context, index) {
//           return Card(
//             child: Column(
//               children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     Text(_userModel![index].id.toString()),
//                   ],
//                 ),
//                 const SizedBox(
//                   height: 20.0,
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     Text(_userModel![index].roleName),
//                     Text(_userModel![index].description),
//                   ],
//                 ),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
