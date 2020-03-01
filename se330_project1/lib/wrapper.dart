import 'package:se330_project1/auth/bloc/auth_bloc.dart';
import 'package:se330_project1/auth/bloc/auth_state.dart'; 
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:se330_project1/screens/home.dart';

class Wrapper extends StatelessWidget {
  Widget build(BuildContext context) {   
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
         
      },
     child: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) { 
            return HomePage( );
           
        }
      ),
    );
  }

}