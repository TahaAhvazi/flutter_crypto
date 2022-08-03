import 'package:crfl/blocs/crypto/crypto_bloc.dart';
import 'package:crfl/routes/currency_detail.dart';
import 'package:crfl/services/crypto_service.dart';
import 'package:crfl/widgets/crypto_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CryptoPage extends StatefulWidget {
  const CryptoPage({Key? key}) : super(key: key);

  @override
  State<CryptoPage> createState() => _CryptoPageState();
}

class _CryptoPageState extends State<CryptoPage> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return RepositoryProvider(
      create: (context) => GetCryptoListService(),
      child: SingleChildScrollView(
        child: BlocProvider(
          create: (context) =>
              CryptoBloc(RepositoryProvider.of<GetCryptoListService>(context))
                ..add(CryptoListFetchedEvent()),
          child: Container(
            height: height,
            width: width,
            color: const Color.fromARGB(255, 255, 255, 255),
            child: BlocBuilder<CryptoBloc, CryptoState>(
              builder: (context, state) {
                if (state is CryptoLoadingState) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (state is CryptoLoadedState) {
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              "Name",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "Last Price",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "Last 24 changes",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: width,
                        height: height * 80 / 100,
                        child: RefreshIndicator(
                          color: Colors.green,
                          onRefresh: () async {
                            await Future.delayed(
                                const Duration(milliseconds: 1500));
                            setState(() {});
                          },
                          child: ListView.builder(
                            itemCount: state.cryptoList.length,
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  const Divider(
                                    color: Colors.black,
                                  ),
                                  GestureDetector(
                                    onTap: () => Navigator.of(context)
                                        .push(MaterialPageRoute(
                                      builder: (context) =>
                                          const CryptoDetail(),
                                    )),
                                    child: CryptoItem(
                                      imagesrc: state.cryptoList[index].image,
                                      cryptoName: state.cryptoList[index].name,
                                      cryptoLastPrice:
                                          state.cryptoList[index].currentPrice,
                                      cryptochangePrice24: state
                                          .cryptoList[index]
                                          .priceChangePercentage24H,
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                      )
                    ],
                  );
                }
                return const Center(
                  child: Text("Something went wrong"),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
