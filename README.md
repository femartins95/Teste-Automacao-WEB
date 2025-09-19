# Teste-Automacao-WEB

# 🛠️ Projeto de Testes Automatizados - Robot Framework

Este projeto contém automação de testes end-to-end para a aplicação **My Shop**, utilizando **Robot Framework** e **SeleniumLibrary**.

---

## 📋 Pré-requisitos

Antes de rodar os testes, certifique-se de ter instalado:

- [Python 3.x](https://www.python.org/downloads/)
- [pip](https://pip.pypa.io/en/stable/installation/)
- [Google Chrome](https://www.google.com/chrome/) (ou navegador de sua escolha)
- [ChromeDriver](https://chromedriver.chromium.org/downloads) compatível com sua versão do Chrome

---

## 🔧 Instalação

1. Clone este repositório:
   ```bash
      cd ROBOTFRAMEWORK
   ```

2. Crie e ative um ambiente virtual (opcional, mas recomendado):
   ```bash
   python -m venv venv
   source venv/bin/activate   # Linux/Mac
   venv\Scripts\activate      # Windows
   ```

3. Instale as dependências:
   ```bash
   pip install -r requirements.txt
   ```

📌 Caso não exista `requirements.txt`, instale manualmente:
   ```bash
   pip install robotframework
   pip install robotframework-seleniumlibrary
   pip install selenium
   ```

---

## ▶️ Como executar os testes

Na raiz do projeto (`ROBOTFRAMEWORK/`), execute:

### Rodar todos os testes
```bash
robot WebTesting
```

### Rodar um arquivo de teste específico
```bash
robot WebTesting/catalogodeprodutos_testes.robot
```

### Rodar com tags
```bash
robot -i smoke WebTesting
```

Após a execução, os relatórios serão gerados automaticamente:
- **log.html**
- **report.html**
- **output.xml**

---

## 📂 Estrutura do Projeto

```
ROBOTFRAMEWORK/
│
├── resources/                  # Recursos compartilhados
│   ├── data/                   # Massa de dados e configs
│   │   └── credentials.yml
│   ├── keywords/               # Arquivos de keywords customizadas
│   │   ├── kws_autenticacao.robot
│   │   ├── kws_catalogodeprodutos.robot
│   │   └── kws_novaconta.robot
│   └── screens/                # Page Objects (mapeamento de elementos)
│       ├── autenticacao_page.robot
│       └── catalogodeprodutos_page.robot
│
├── WebTesting/                 # Casos de teste organizados
│   ├── autenticacao_testes.robot
│   ├── catalogodeprodutos_testes.robot
│   └── novaconta_testes.robot
│
├── hooks.robot                 # Configurações globais (setup/teardown)
├── base.robot                  # Configurações base do projeto
│
├── log.html                    # Log detalhado da última execução
├── report.html                 # Relatório consolidado
├── output.xml                  # Saída padrão do Robot Framework
└── README.md                   # Este arquivo
```

---

## ✅ Boas práticas

- Centralizar os **locators** em `screens/`.
- Reaproveitar **keywords customizadas** em `resources/keywords/`.
- Manter dados sensíveis no arquivo `credentials.yml` (fora do controle de versão).
- Utilizar **tags** para rodar subconjuntos de testes (`smoke`, `regression`, etc.).

---

## 👨‍💻 Autor

Este projeto contém automação de testes end-to-end para a aplicação **My Shop** com **Robot Framework** 🚀
