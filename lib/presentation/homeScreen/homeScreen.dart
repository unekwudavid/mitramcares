import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mitramcares/presentation/Items/items.dart';
import 'package:mitramcares/presentation/homeScreen/Controller/controller.dart';
import 'package:mitramcares/presentation/homeScreen/model/homeScreen_model.dart';
import 'package:mitramcares/widgets/motion_loading_text.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

final HomeController homeController = Get.put(HomeController());

class _HomescreenState extends State<Homescreen> {
  @override
  Widget build(BuildContext context) {
return  Scaffold(
   appBar: AppBar(
    automaticallyImplyLeading: false,
    backgroundColor: Colors.blue[200],
    centerTitle: true,
    title: const Text('chroniclingAmerica')
   ),

   body: 
   Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 1),
        child: Column(
          children: [
            const Text(
              'Available Data',
               style: TextStyle(
              fontSize: 20,
              color: Colors.grey
              ),
            ),
           const SizedBox(height: 15.0),
            Expanded(
              //future builder used when expecting data from a future function.
              child: FutureBuilder<Chronicles>(
                  future: homeController.documents,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Column(
                          children: [
                       //shimmer effect , used while fetching data     
                            MotionLoadingText(),
                            SizedBox(height: 20.0,),
                            MotionLoadingText(),
                            SizedBox(height: 20.0,),
                            MotionLoadingText(),
                            SizedBox(height: 20.0,),
                            MotionLoadingText(),
                            SizedBox(height: 20.0,),
                            MotionLoadingText(),
                            SizedBox(height: 20.0,),
                            MotionLoadingText(),
                          ],
                        ),
                      );
                    } else if (snapshot.hasError) {
                     return  const Text('Error');
                    } else if (!snapshot.hasData) {
                      return ListView(children: const [
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "We couldn't find any result!",
                              ),
                            SizedBox(
                                child: Padding(
                              padding: EdgeInsets.only(
                                  right: 65.0, left: 65.0, top: 5.0),
                              child: Text(
                                "Please check your search for any typos or spelling errors, or try a different search term.",
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.center,
                                
                              ),
                            )),
                          ],
                        ),
                      ]);
                    }

                    return 
                 //list view builder widget used to display  data gotten from endpoint  
                    ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: 1,
                        itemBuilder: (context, index) {
                          Chronicles chronicles = snapshot.data!;
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 20),
                        child: 
                        Column(
                          children: [
                            ListTile(
                            title: const Text('Total Items',
                            style:  TextStyle(
                              fontSize: 15
                            ),
                            ),
                            trailing: Text('${chronicles.totalItems}',
                            style: const TextStyle(
                              fontSize: 15
                            ),
                            ),  
                            ),
                            const SizedBox(height: 15.0),
                          ListTile(
                            title: const Text('End Index',
                            style: TextStyle(
                              fontSize: 15
                            ),
                            ),
                            trailing: Text('${chronicles.endIndex}',
                            style: const TextStyle(
                              fontSize: 15
                            ),
                            ),  
                            ),
                              const SizedBox(height: 15.0),
                          ListTile(
                            title: const Text('Start Index'),
                            trailing: Text('${chronicles.startIndex}',
                            style: const TextStyle(
                              fontSize: 15
                            ),
                            ),  
                            ),
                              const SizedBox(height: 15.0),
                          ListTile(
                            title: const Text('Items per Page',
                            style: TextStyle(
                              fontSize: 15
                            ),
                            ),
                            trailing: Text('${chronicles.itemsPerPage}',
                            style: const TextStyle(
                              fontSize: 15
                            ),
                            ),  
                            ),
                            const SizedBox(height: 15.0),
                          ListTile(
                            title: const Text('Items',
                            style:  TextStyle(
                              fontSize: 15
                            ),
                            ),
                            trailing: GestureDetector(
                              onTap: (){
                                Get.to(()=>const Items(),
                                arguments: homeController.documents
                                );
                              },
                              child: const Icon(
                                Icons.arrow_forward_outlined,
                                color: Colors.blueAccent,
                              ),
                            )  
                            ),   
                          ],
                        )
                          );
                        }
                        ); 
                  }
                  ),
            ),
          ],
        ),
      ),

);
   
     }
}