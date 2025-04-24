# Robot Framework Web Testing

Este projeto utiliza **Robot Framework** para automação de testes funcionais do site da Amazon (https://www.amazon.com.br), usando **SeleniumLibrary** para interagir com o navegador Firefox.

---

## 📋 Pré-requisitos

Antes de rodar os testes, instale no seu ambiente local (Windows/Linux/Mac):

- **Python** 3.12 ou superior
- **pip** (gerenciador de pacotes Python)
- **Robot Framework**
- **Robot Framework SeleniumLibrary**
- **Firefox** (versão compatível com Geckodriver)
- **Geckodriver** (v0.36.0) no PATH

### Instalação rápida de dependências Python

```bash
python -m pip install --upgrade pip
pip install robotframework robotframework-seleniumlibrary
```

### Instalação de Firefox e Geckodriver (Linux)

```bash
# Remover Firefox via snap se existir
sudo snap remove firefox || true

# Adicionar PPA Mozilla e priorizar instalação
sudo add-apt-repository ppa:mozillateam/ppa -y
sudo tee /etc/apt/preferences.d/mozilla-firefox << 'EOF'
Package: firefox
Pin: release o=LP-PPA-mozillateam
Pin-Priority: 501
EOF

# Instalar Firefox e dependências
sudo apt-get update
sudo apt-get install -y firefox libgtk-3-0 libdbus-glib-1-2 libxt6

# Instalar Geckodriver v0.36.0
GECKODRIVER_VERSION=v0.36.0
wget -qO- https://github.com/mozilla/geckodriver/releases/download/${GECKODRIVER_VERSION}/geckodriver-${GECKODRIVER_VERSION}-linux64.tar.gz | tar xz
chmod +x geckodriver
sudo mv geckodriver /usr/local/bin/
```

---

## 🚀 Estrutura de pastas

```
webTesting/
├── .github/workflows/
│   └── robot-tests.yml      # Pipeline GitHub Actions
├── Tests/
│   ├── amazon_tests.robot
│   ├── amazon_gherkin.robot
│   └── amazon_resources.robot
└── requirements.txt         # (opcional)
```

---

## ⚙️ Executando localmente

Na raiz do projeto, rode:

```bash
robot Tests/
```

Isso executa todos os arquivos `.robot` dentro de `Tests/` e gera:

- `output.xml`
- `log.html`
- `report.html`

Abra `log.html` e `report.html` no navegador para ver relatórios detalhados.

---

## 🤖 Pipeline de CI: GitHub Actions

O workflow está em `.github/workflows/robot-tests.yml`:

1. **Triggers**: executa em `push` e `pull_request` no branch `main`.
2. **Setup**:
   - Checkout do código
   - Configuração do Python 3.12
   - Instalação de dependências Python
3. **Instalação do navegador**:
   - Instala Firefox via APT (PPA)
   - Instala Geckodriver v0.36.0
4. **Execução**:
   - Roda `robot Tests/` em `ubuntu-latest`
5. **Publicação**:
   - Faz upload de `output.xml`, `log.html` e `report.html` como artefatos do workflow

Para detalhes e configuração completa, consulte o arquivo:

```
.github/workflows/robot-tests.yml
```

---

## 🚧 Versões recomendadas

| Ferramenta                       | Versão mínima |
|----------------------------------|---------------|
| Python                           | 3.12          |
| Robot Framework                  | 6.0           |
| RobotFramework-SeleniumLibrary   | 6.0           |
| Firefox                          | 136.x         |
| Geckodriver                      | 0.36.0        |

---

_Desenvolvido com ❤️ por Edcarlos_