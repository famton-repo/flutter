import 'package:flutter/material.dart'; 
import '../repo/api_service.dart'; 
import '../model/userdatamodel.dart'; 

class UserDetails extends StatefulWidget { 
    const UserDetails({Key? key}) : super(key: key); 
    
    @override 
    State<UserDetails> createState() => _UserDetailsState();
}

class _UserDetailsState extends State<UserDetails> { 
    late Future<GetUserDetails> futureUsers;
    final ApiService apiService = ApiService(); 
    
    @override 
    void initState() { 
        super.initState(); 
        futureUsers = apiService.getDataFromAPI(); 
    }
    
    @override
    Widget build(BuildContext context) { 
        return Scaffold( 
            backgroundColor: Colors.white,
            appBar: AppBar(
                title: const Text('Get User Details'), 
                backgroundColor: Colors.green, 
            ),
            body: FutureBuilder<GetUserDetails>( 
                future: futureUsers, 
                builder: (context, snapshot) { 
                    if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator()); 
                    } else if (snapshot.hasError) { 
                        return const Center(child: Text('Error loading data')); 
                    } else if (!snapshot.hasData || snapshot.data!.data.isEmpty) {
                        return const Center(child: Text('No data found')); 
                    } else { 
                        return ListView.separated( 
                            itemBuilder: (context, index) { 
                                final user = snapshot.data!.data[index]; 
                                return Container( 
                                    color: Colors.white, 
                                    width: double.infinity, 
                                    height: 80, 
                                    child: ListTile( 
                                        leading: CircleAvatar(
                                            backgroundImage: NetworkImage(user.avatar), 
                                            radius: 40, 
                                        ),
                                        title: Text(user.firstName), 
                                        subtitle: Text(user.email),
                                        trailing: IconButton(
                                            onPressed: () {
                                                // Navigate to user details page or perform another action 
                                            },
                                            icon: const Icon(Icons.arrow_forward), 
                                        ),
                                    ),
                                );
                            },
                            separatorBuilder: (context, index) => const Divider(), 
                            itemCount: snapshot.data!.data.length,
                        );
                    }
                },
            ),
        );
    }
}

