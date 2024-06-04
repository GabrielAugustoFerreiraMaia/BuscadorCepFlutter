# Buscador de CEP

Este é um aplicativo Flutter simples que permite ao usuário buscar informações sobre um CEP (Código de Endereçamento Postal) brasileiro. O aplicativo usa a API do [ViaCEP](https://viacep.com.br/) para obter os dados do CEP fornecido.

## Funcionalidades

- Busca de CEPs brasileiros
- Validação do formato de CEP
- Tratamento de erros de rede e CEPs inválidos
- Interface amigável e intuitiva
- Cache de resultados para evitar buscas repetidas

## Screenshots

![Screenshot 1](images\Screenshot_1.png)


## Pré-requisitos

- Flutter SDK instalado
- Um editor de texto ou IDE como Visual Studio Code ou Android Studio

## Instalação

1. Clone este repositório:

   ```sh
   git clone https://github.com/seu-usuario/buscador_cep.git
   cd buscador_cep
2. Instale as dependências:
     ```sh
     flutter pub get
3. Execute o aplicativo:
     ```sh
     flutter run
## Uso

1. Abra o aplicativo.
2. Digite um CEP válido no campo de texto.
3. Pressione o botão "Buscar".
4. As informações do CEP serão exibidas abaixo do botão.

## Estrutura do Projeto

- `lib/main.dart`: Contém a lógica principal e a interface do aplicativo.
- `pubspec.yaml`: Define as dependências do projeto.

## Melhorias Futuras

- Adicionar suporte para salvar resultados localmente.
- Melhorar a interface do usuário com design mais avançado.
- Adicionar testes unitários e de widget.

## Contribuição

Sinta-se à vontade para contribuir com este projeto. Você pode abrir uma issue para relatar bugs ou sugerir melhorias, ou abrir um pull request com suas mudanças.

## Licença

Este projeto está licenciado sob a licença MIT - veja o arquivo [LICENSE](LICENSE) para detalhes.

## Autor

- [Gabriel Augusto](https://github.com/GabrielAugustoFerreiraMaia)
