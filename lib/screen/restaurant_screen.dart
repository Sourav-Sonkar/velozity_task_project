import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:velozity_project/bloc/restaurantCubit/restaurant_list_cubit.dart';
import 'package:velozity_project/network/network_connection.dart';

class RestaurantScreen extends StatefulWidget {
  const RestaurantScreen({Key? key}) : super(key: key);
  static String routeName = '/restaurant-list';

  @override
  State<RestaurantScreen> createState() => _RestaurantScreenState();
}

class _RestaurantScreenState extends State<RestaurantScreen> {
  late final RestaurantListCubit _restaurantListCubit;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    _restaurantListCubit =
        RestaurantListCubit(context.read<NetworkConnection>());
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _restaurantListCubit.getMoreRestaurants();
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _restaurantListCubit..getRestaurants(),
      child: BlocListener<RestaurantListCubit, RestaurantListState>(
        listener: (context, state) {
          // TODO: implement listener
          if (state.errMsg.isNotEmpty) {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                SnackBar(
                  content: Text(state.errMsg),
                  backgroundColor: Colors.red,
                ),
              );
          }
        },
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Restaurant List'),
          ),
          body: BlocBuilder<RestaurantListCubit, RestaurantListState>(
            builder: (context, state) {
              if (state.isLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              return ListView.builder(
                  controller: _scrollController,
                  itemCount: (state.restaurntList?.length ?? 0) + 1,
                  itemBuilder: (context, index) {
                    if (index == ((state.restaurntList?.length ?? 0))) {
                      return const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                    }
                    return Column(
                      children: [
                        const Divider(),
                        ListTile(
                          title: Text(state.restaurntList?[index].name ?? ""),
                          subtitle:
                              Text(state.restaurntList?[index].address ?? ""),
                          trailing: Text("Avergae Price:" +
                              (state.restaurntList?[index].averagePrice ?? 0)
                                  .toString()),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 20),
                          child: ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder: (c, i) {
                              return Text("*" +
                                  (state.restaurntList?[index].features?[i] ??
                                          "")
                                      .toString());
                            },
                            itemCount:
                                state.restaurntList?[index].features?.length ??
                                    0,
                          ),
                        ),
                      ],
                    );
                  });
            },
          ),
        ),
      ),
    );
  }
}
