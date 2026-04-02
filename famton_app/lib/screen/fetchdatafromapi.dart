import 'package:flutter/material.dart';


class SVTUserDataState extends StatefulWidget {
  const SVTUserDataState({super.key});

  @override
  State<SVTUserDataState> createState() => _SVTUserDataStateState();
}

class _SVTUserDataStateState extends State<SVTUserDataState> {
    late Future<FetchUserData> userData;
    final ApiService fetchUserData = ApiService();
    @override
    void inistate(){
        super.inistate();
          userData = fetchUserData.SVTUserData();
        
    

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        appBar: AppBar(
            title: Text("FetchUser Data"),
            backgroundColor: Colors.green,
 ),
 body: container(
    child:FutureBuilder(
        future: userData,
        builder:(context,snapeshot){
            if(snapeshoty.connectionState == ConnectionState.waiting){
                return const Center(child:CircularProgressIndication()):
                {
                    else if(snapeshot.haserror){
                        return const Center(child:Text('Error loading data'));
                        {
                            else if(!snapeshot.hasData || snapeshot.data!.data.isEmpty){
                                return const Center(child:Text('No data found'));
                                {
                                    else{
                                        return ListView.separated(
                                            itemBuilder:(context,index){
                                                final user = snapeshot.data!.data[index];
                                                return Container(
                                                    color:Colors.white,
                                                    width:double.infinity,
                                                    height:80,
                                                    child:ListTile(
                                                        leading:CircleAvatar(
                                                            backgroundImage:NetworkImage(user.avatar),
                                                            radius:40,
                                                        ),
                                                        title:Text(user.firstName),
                                                        subtitle:Text(user.email),
                                                    )   trailing:IconButton(
                                                        onpressed:(){
                                                            // Navigate to user details page or perform another action
                                                            
                                                        },
                                                    )icon:const Icon(Icons.arrow_forward),
                                                ),
                                    
                                                ),
                                    },
                                    separatorBuilder:(context,index)=>const Divider(),
                                    itemCount:snapeshot.data!.data.length,
                                        );
                                    }
                                }
                            }
                        }

                    }
                }
            }
        }
    )

 )
    );
  }
}



