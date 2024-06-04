import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Buscador de CEP',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _controller = TextEditingController();
  String _result = "";
  bool _isLoading = false;
  Map<String, String> _cache = {};

  Future<void> _buscarCep() async {
    final cep = _controller.text;

    // Validação de CEP
    if (cep.length != 8 || int.tryParse(cep) == null) {
      setState(() {
        _result = 'Por favor, insira um CEP válido com 8 dígitos.';
      });
      return;
    }

    // Verificar o cache
    if (_cache.containsKey(cep)) {
      setState(() {
        _result = _cache[cep]!;
      });
      return;
    }

    setState(() {
      _isLoading = true;
      _result = '';
    });

    final url = Uri.parse('https://viacep.com.br/ws/$cep/json/');

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        if (data.containsKey('erro')) {
          setState(() {
            _result = 'CEP não encontrado.';
          });
        } else {
          final resultado = """
CEP: ${data['cep']}
Logradouro: ${data['logradouro']}
Complemento: ${data['complemento']}
Bairro: ${data['bairro']}
Cidade: ${data['localidade']}
Estado: ${data['uf']}
          """;
          setState(() {
            _result = resultado;
            _cache[cep] = resultado;
          });
        }
      } else {
        setState(() {
          _result = 'Erro ao buscar o CEP.';
        });
      }
    } catch (e) {
      setState(() {
        _result = 'Erro de rede. Verifique sua conexão.';
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Buscador de CEP'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Digite o CEP',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
              maxLength: 8,
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _isLoading ? null : _buscarCep,
              child: _isLoading
                  ? CircularProgressIndicator(
                      color: Colors.white,
                    )
                  : Text('Buscar'),
            ),
            SizedBox(height: 16),
            Text(
              _result,
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
