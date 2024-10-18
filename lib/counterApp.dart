import 'package:bloc_sample_project/bloc/counterBloc.dart';
import 'package:bloc_sample_project/bloc/counterEvents.dart';
import 'package:bloc_sample_project/bloc/counterState.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Counter App"),
      ),
      body: BlocBuilder<CounterBloc,CounterState>(builder: (context,state){
        return Center(
          child: Text(state.count.toString(),style: TextStyle(fontSize: 35),),
        );
      }),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FloatingActionButton(
            onPressed: () {
              BlocProvider.of<CounterBloc>(context).add(IncrementEvents());
              //context.read<CounterBloc>().add(IncrementEvents());
            },
            child: const Icon(Icons.add),
          ),
          FloatingActionButton(
            onPressed: () {
              BlocProvider.of<CounterBloc>(context).add(DecrementEvents());
              //context.read<CounterBloc>().add(IncrementEvents());
            },
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
