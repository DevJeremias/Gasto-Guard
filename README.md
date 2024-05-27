# Gasto Guard

Gasto Guard é um aplicativo desenvolvido para o gerenciamento de despesas pessoais, permitindo que os usuários registrem e acompanhem suas despesas diárias de forma organizada e conveniente. O aplicativo foi construído usando o framework Flutter e o padrão Provider para gerenciamento de estado.

## Funcionalidades

- **Tela de Login**: Permite que os usuários acessem o aplicativo inserindo seu e-mail e senha.
- **Tela de Cadastro**: Permite que novos usuários se registrem fornecendo um nome de usuário, e-mail e senha.
- **Registro de Gastos**: Os usuários podem registrar suas despesas diárias, incluindo título, valor, data e categoria.
- **Categorização de Gastos**: Os gastos podem ser categorizados em diferentes categorias como alimentação, transporte, moradia, etc.
- **Visualização de Gastos**: Visualização clara e detalhada dos gastos registrados com um gráfico de disco mostrando porcentagens por categoria.
- **Adição e Remoção de Categorias**: Flexibilidade para adicionar novas categorias e remover as existentes.
- **Configuração**: Aba de configuração para editar categorias, ícones e cores das categorias.

## Estrutura do Projeto

A estrutura do código-fonte do Gasto Guard é organizada da seguinte maneira:

lib/
├── logotipo/
│ └── gasto_guard_logo.svg
├── pages/
│ ├── appbar/
│ │ ├── app_bar.dart
│ │ ├── configura_categorias.dart
│ │ ├── configura_perfil.dart
│ │ └── configura.dart
│ ├── recursos/
│ │ ├── grafico.dart
│ │ ├── icones.dart
│ │ ├── add_gasto.dart
│ │ ├── cadastrar.dart
│ │ ├── categoria_provider.dart
│ │ ├── gasto_provider.dart
│ │ ├── gasto.dart
│ │ ├── gastos.dart
│ │ ├── home_page.dart
│ │ ├── icons.dart
│ │ └── start_page.dart
└── main.dart


## Possíveis Melhorias Futuras

Algumas melhorias futuras que podem ser implementadas incluem:

- **Banco de Dados Local**: Implementação de um banco de dados local para armazenamento persistente de dados.
- **Backup em Nuvem**: Integração com serviços de backup em nuvem para segurança adicional dos dados.
- **Versão Web**: Desenvolvimento de uma versão web do aplicativo para acessibilidade multiplataforma.
- **Planejamento Financeiro**: Adição de um módulo de planejamento financeiro para ajudar os usuários a definirem e alcançarem metas financeiras.

## Como Executar o Projeto

1. **Clone o repositório**:
    ```sh
    git clone https://github.com/usuario/gasto-guard.git
    ```

2. **Navegue até o diretório do projeto**:
    ```sh
    cd gasto-guard
    ```

3. **Instale as dependências**:
    ```sh
    flutter pub get
    ```

4. **Execute o aplicativo**:
    ```sh
    flutter run
    ```

## Tecnologias Utilizadas

- **Flutter**: Framework para desenvolvimento de aplicativos móveis.
- **Provider**: Padrão para gerenciamento de estado no Flutter.

## Contribuições

Contribuições são bem-vindas! Sinta-se à vontade para abrir issues e pull requests.
