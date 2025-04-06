import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

import 'bridge.dart';
import 'core/inject/inject.dart';
import 'core/theme/app_colors.dart';
import 'core/theme/app_themes.dart';
import 'features/auth/presentation/ui/pages/sign_in_page.dart';

Future<double> calcularValorizacaoBitcoin(
    double valorInvestido, DateTime dataCompra) async {
  // Função para garantir que o mês e o dia tenham dois dígitos
  String doisDigitos(int n) => n.toString().padLeft(2, '0');

  // Formata a data para o formato necessário na API (YYYY-MM-DD)
  String dataCompraFormatada =
      '${dataCompra.year}-${doisDigitos(dataCompra.month)}-${doisDigitos(dataCompra.day)}';

  // API endpoint para preço do Bitcoin na data de compra (em USD)
  final String urlCompra =
      'https://api.coindesk.com/v1/bpi/historical/close.json?currency=USD&start=$dataCompraFormatada&end=$dataCompraFormatada';

  // API endpoint para preço atual do Bitcoin (em BRL)
  const String urlAtual =
      'https://api.coindesk.com/v1/bpi/currentprice/BRL.json';

  try {
    // Requisição para obter o preço do Bitcoin na data da compra
    final responseCompra = await http.get(Uri.parse(urlCompra));
    final dataCompraJson = json.decode(responseCompra.body);
    double precoBitcoinNaCompraUSD = dataCompraJson['bpi'][dataCompraFormatada];

    // Requisição para obter o preço atual do Bitcoin em BRL
    final responseAtual = await http.get(Uri.parse(urlAtual));
    final dataAtualJson = json.decode(responseAtual.body);
    double precoBitcoinAtualBRL = dataAtualJson['bpi']['BRL']['rate_float'];

    // API para conversão de dólar para real (cotação atual)
    const urlCambio = 'https://api.exchangerate-api.com/v4/latest/USD';
    final responseCambio = await http.get(Uri.parse(urlCambio));
    final cambioJson = json.decode(responseCambio.body);
    double taxacambiousdBrl = cambioJson['rates']['BRL'];

    // Convertendo o preço do Bitcoin na data da compra de USD para BRL
    double precoBitcoinNaCompraBRL = precoBitcoinNaCompraUSD * taxacambiousdBrl;

    // Calcula a quantidade de Bitcoin comprada
    double quantidadeBitcoinComprado = valorInvestido / precoBitcoinNaCompraBRL;

    // Calcula o valor atual do investimento em BRL
    double valorAtual = quantidadeBitcoinComprado * precoBitcoinAtualBRL;

    // Retorna a valorização do investimento
    return valorAtual - valorInvestido;
  } catch (e) {
    print('Erro ao calcular a valorização: $e');
    return 0.0;
  }
}

void main() async {
  Inject.initialize();
  double valorizacao = await calcularValorizacaoBitcoin(
      100, DateTime.now().subtract(const Duration(days: 1)));
  print('Valorização do Bitcoin: $valorizacao');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: ColorsApp.i.backgroundColor,
    ));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Variacao Ativo',
      theme: theme(),
      home: const CommunicationWithNativeWidget(),
    );
  }
}

class CommunicationWithNativeWidget extends StatefulWidget {
  const CommunicationWithNativeWidget({super.key});

  @override
  State<CommunicationWithNativeWidget> createState() =>
      _CommunicationWithNativeWidgetState();
}

class ApiHandler implements FApi {
  final Function(bool) callBack;

  ApiHandler(this.callBack);

  @override
  void currentState(bool state) {
    callBack(state);
  }
}

class _CommunicationWithNativeWidgetState
    extends State<CommunicationWithNativeWidget> {
  var state = true;

  @override
  void initState() {
    super.initState();
    FApi.setup(ApiHandler(currentState));
  }

  @override
  Widget build(BuildContext context) {
    return const SignInPage();
  }

  void currentState(bool state) {
    setState(() {
      this.state = state;
    });
  }
}
