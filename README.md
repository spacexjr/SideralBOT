# 🌌 SideralBOT

<div align="center">

<img src="https://capsule-render.vercel.app/api?type=waving&color=800080&height=120&section=header"/>

# 🤖 SideralBOT

### Discord × Minecraft Bedrock

**Discord × Minecraft Bedrock bridge & server management bot built with Node.js and Discord.js.**

<br>

[![Node.js](https://img.shields.io/badge/Node.js-18%2B-339933?style=for-the-badge\&logo=node.js\&logoColor=white)](https://nodejs.org/)
[![Discord.js](https://img.shields.io/badge/Discord.js-14-5865F2?style=for-the-badge\&logo=discord\&logoColor=white)](https://discord.js.org/)
[![Minecraft](https://img.shields.io/badge/Minecraft-Bedrock-62B47A?style=for-the-badge\&logo=minecraft\&logoColor=white)](https://www.minecraft.net/)
[![Groq](https://img.shields.io/badge/Groq-AI-F55036?style=for-the-badge)](https://groq.com/)
[![License](https://img.shields.io/badge/License-MIT-800080?style=for-the-badge)](LICENSE)

</div>

---

## 📖 Sobre

O **SideralBOT** é um bot para Discord desenvolvido em **Node.js** que conecta comunidades do Discord a servidores **Minecraft Bedrock** através do protocolo Bedrock.

O projeto permite configurar uma conexão Minecraft por servidor Discord, sincronizar o chat entre as plataformas, acompanhar jogadores online, registrar eventos do servidor e manter estatísticas de tempo de jogo.

O SideralBOT também possui uma integração opcional com **Groq AI**, permitindo que jogadores façam perguntas diretamente pelo chat do Minecraft.

---

## ✨ Funcionalidades

### 🌉 Discord ↔ Minecraft

* 💬 Chat bidirecional entre Discord e Minecraft Bedrock
* 🔌 Conexão direta utilizando `bedrock-protocol`
* 🔄 Sistema de reconexão automática
* 📡 Monitoramento da conexão
* 👥 Lista de jogadores online
* 🌐 Configuração individual por servidor Discord

### ⚙️ Gerenciamento

* 🛠️ Configuração de IP, porta e versão do Minecraft
* 🎮 Nickname utilizado pelo bot no Minecraft
* 💬 Definição dos canais Discord utilizados pelo bridge
* 🔐 Controle de cargos autorizados
* 📊 Comando de status e ping
* 🔌 Conectar/desconectar do servidor

### 📊 Playtime

O SideralBOT acompanha o tempo de jogo dos jogadores vinculados.

* ⏱️ Contagem automática de tempo
* 🔗 Vinculação Discord ↔ Minecraft
* 👤 Consulta do próprio tempo
* 🏆 Ranking de jogadores

O tempo é atualizado enquanto o jogador vinculado está online no servidor.

### 📝 Logs

Eventos importantes do Minecraft podem ser enviados para uma thread dedicada no Discord:

```text
「🔗」logs-mine
```

Eventos suportados incluem:

* 🟢 Entrada de jogador
* 🔴 Saída de jogador
* 💀 Morte
* ⭐ Avanços/conquistas

### 🤖 Inteligência Artificial

O SideralBOT possui integração opcional com **Groq**.

No Minecraft, jogadores podem utilizar:

```text
!c sua pergunta
```

Exemplo:

```text
!c como faço uma farm de ferro?
```

A IA responde diretamente no chat do Minecraft.

O sistema possui:

* 🧠 Modelos configuráveis
* 🔄 Fallback entre modelos
* ⏳ Controle de limite de requisições
* 🛡️ Tratamento de erro `429`
* ✂️ Limitação do tamanho das respostas

A integração utiliza `GROQ_API_KEY` e pode receber um modelo preferencial através de `GROQ_MODEL`.

---

# 🛠️ Tecnologias

| Tecnologia           | Função                            |
| -------------------- | --------------------------------- |
| **Node.js**          | Runtime                           |
| **JavaScript / ESM** | Linguagem                         |
| **Discord.js 14**    | Integração com Discord            |
| **bedrock-protocol** | Comunicação com Minecraft Bedrock |
| **LowDB**            | Persistência local em JSON        |
| **Groq SDK**         | Inteligência Artificial           |
| **dotenv**           | Variáveis de ambiente             |
| **Docker**           | Containerização                   |

As dependências atuais estão definidas no `package.json`.

---

# 📦 Requisitos

* **Node.js 18 ou superior**
* Uma aplicação/bot criado no **Discord Developer Portal**
* Um servidor Minecraft Bedrock acessível pela máquina que executa o bot
* Opcional: uma chave da API da Groq para utilizar a IA

O projeto atualmente utiliza Node.js 18 na imagem Docker.

---

# 🚀 Instalação

## 1. Clone o repositório

```bash
git clone https://github.com/spacexjr/SideralBOT.git
cd SideralBOT
```

## 2. Instale as dependências

```bash
npm install
```

## 3. Configure o `.env`

Crie:

```bash
nano .env
```

Adicione:

```env
DISCORD_TOKEN=seu_token_do_bot
CLIENT_ID=id_da_aplicacao
USUARIO_AUTORIZADO_ID=id_do_usuario_autorizado

GROQ_API_KEY=sua_chave_groq
GROQ_MODEL=llama-3.3-70b-versatile
```

> `GROQ_API_KEY` e `GROQ_MODEL` são necessários apenas para o recurso de IA.

O código principal lê `DISCORD_TOKEN`, `CLIENT_ID` e `USUARIO_AUTORIZADO_ID` do ambiente.

---

# ▶️ Executando

Inicie o bot com:

```bash
./start.sh
```

O comando `start` do npm executa:

```bash
node index.js
```

Quando iniciado, o SideralBOT registra os comandos slash globalmente e conecta ao Discord.

---

# 🐳 Docker

O projeto possui um `Dockerfile` baseado em **Node.js 18**.

### Build

```bash
docker build -t sideralbot .
```

### Executar

```bash
docker run -d \
  --name sideralbot \
  --env-file .env \
  sideralbot
```

O container utiliza `/app` como diretório de trabalho e executa `npm start`.

---

# 🤖 Comandos

## `/setup`

Configura a conexão do Minecraft para o servidor Discord.

Parâmetros:

```text
/setup
  ip: endereço do servidor
  porta: porta Bedrock
  versao: versão do Minecraft
  nick: nickname do bot
  canais: canais Discord
  cargos: cargos autorizados
```

Exemplo:

```text
/setup
ip: play.example.com
porta: 19132
versao: 1.21.XX
nick: SideralBOT
canais: #minecraft
cargos: @Moderador
```

A configuração é armazenada por `guild_id`.

---

## `/setchat`

Define os canais utilizados pelo bridge Discord ↔ Minecraft.

```text
/setchat canais:#minecraft
```

---

## `/entrar`

Conecta o SideralBOT ao servidor Minecraft configurado.

```text
/entrar
```

O cliente Minecraft utiliza o host, porta, versão e nickname configurados no `/setup`.

---

## `/sair`

Desconecta o bot do servidor Minecraft.

```text
/sair
```

O acesso pode ser limitado aos cargos definidos na configuração.

---

## `/status`

Exibe informações sobre o estado do servidor e a conexão.

```text
/status
```

---

## `/baixar`

Fornece links relacionados ao download do Minecraft.

```text
/baixar
```

---

## `/tempo`

Sistema de tempo de jogo.

### Meu tempo

```text
/tempo meu
```

### Ranking

```text
/tempo top
```

---

## `/vincular`

Vincula um usuário do Discord a um nickname do Minecraft.

```text
/vincular nick:MeuNick
```

Depois da vinculação, o sistema consegue associar o jogador Minecraft ao usuário Discord para recursos como playtime.

---

## `/drakinho`

Comando de entretenimento que exibe uma imagem do Drakinho 🐉.

```text
/drakinho
```

---

# 🌉 Discord → Minecraft

Mensagens enviadas nos canais configurados podem ser encaminhadas para o Minecraft.

Exemplo:

```text
Discord
────────────────────
Space: Fala galera!

        ↓

Minecraft
────────────────────
Space: Fala galera!
```

O sistema também processa menções e informações do usuário antes de enviar a mensagem ao Minecraft.

---

# 🎮 Minecraft → Discord

Mensagens enviadas no Minecraft são encaminhadas para os canais configurados no Discord.

Exemplo:

```text
Minecraft
────────────────────
Steve: alguém online?

        ↓

Discord
────────────────────
Steve: alguém online?
```

---

# 📋 Sistema de logs

O SideralBOT mantém uma thread chamada:

```text
「🔗」logs-mine
```

Quando disponível, essa thread recebe eventos do servidor.

Exemplo:

```text
🟢 Steve entrou no servidor
```

```text
🔴 Steve saiu do servidor
```

```text
💀 Steve Morreu
Causa: caiu de um lugar alto
```

```text
⭐ Steve concluiu um avanço
```

---

# 🔗 Vinculação Discord × Minecraft

O sistema mantém uma relação entre:

```text
Discord User
      │
      ▼
Minecraft Nickname
      │
      ▼
Servidor Discord
```

Isso permite identificar jogadores vinculados e registrar o tempo jogado.

---

# ⏱️ Playtime

Enquanto um jogador vinculado estiver online, o sistema adiciona tempo de jogo automaticamente.

O contador é executado em intervalos de **60 segundos**.

Exemplo:

```text
Jogador: Space
Minecraft: Space
Discord: Space
Tempo: 124 minutos
```

---

# 💾 Banco de dados

O SideralBOT atualmente utiliza **LowDB**, armazenando os dados em:

```text
db.json
```

A estrutura inicial contém:

```json
{
  "configs": [],
  "chat": [],
  "playtime": [],
  "nick_vincular": []
}
```

### Estrutura

```text
db.json
│
├── configs
│   ├── guild_id
│   ├── host
│   ├── port
│   ├── version
│   ├── nick
│   ├── canais
│   └── cargos
│
├── chat
│   ├── guild_id
│   └── canais
│
├── playtime
│   ├── user_id
│   ├── guild_id
│   └── minutes_played
│
└── nick_vincular
```

---

# 🧠 Arquitetura

```text
                    ┌──────────────────┐
                    │     Discord      │
                    │   Discord.js     │
                    └────────┬─────────┘
                             │
                             ▼
                    ┌──────────────────┐
                    │  dc_handlers.js  │
                    │  dc_commands.js  │
                    └────────┬─────────┘
                             │
                ┌────────────┴────────────┐
                │                         │
                ▼                         ▼
       ┌────────────────┐        ┌────────────────┐
       │     db.js      │        │  mc_client.js  │
       │     LowDB      │        │ Bedrock Client │
       └────────────────┘        └────────┬───────┘
                                         │
                                         ▼
                                ┌─────────────────┐
                                │ Minecraft       │
                                │ Bedrock Server  │
                                └────────┬────────┘
                                         │
                                         ▼
                                ┌─────────────────┐
                                │ mc_handlers.js  │
                                └─────────────────┘

                         ┌──────────────────┐
                         │   Groq AI        │
                         │  ai_service.js   │
                         └──────────────────┘
```

---

# 📁 Estrutura do projeto

```text
SideralBOT/
│
├── ai_service.js       # Integração com Groq AI
├── db.js               # Persistência e operações do banco
├── db.json             # Banco de dados local
│
├── dc_commands.js      # Comandos slash do Discord
├── dc_handlers.js      # Eventos e interações Discord
│
├── mc_client.js        # Cliente Minecraft Bedrock
├── mc_handlers.js      # Eventos recebidos do Minecraft
│
├── index.js             # Ponto de entrada
├── mktables.js          # Inicialização/manutenção de dados
├── utils.js             # Funções auxiliares
│
├── index.html           # Interface web
├── style.css             # Estilos da interface
│
├── Dockerfile
├── package.json
├── package-lock.json
├── db.json
└── .gitignore
```

A estrutura corresponde aos arquivos atualmente presentes no repositório.

---

# 🔐 Segurança

Nunca publique:

```text
DISCORD_TOKEN
GROQ_API_KEY
```

O `.env` deve estar no `.gitignore`:

```gitignore
.env
node_modules/
```

Se um token do Discord for exposto, revogue-o imediatamente no Discord Developer Portal.

---

# ⚠️ Observações

### Minecraft Bedrock

O servidor precisa estar acessível a partir da máquina onde o SideralBOT está sendo executado.

Verifique:

```text
IP
Porta UDP
Versão Bedrock
Firewall
NAT / Port Forwarding
```

### `/setup`

O `/setup` precisa ser executado antes de tentar conectar o bot ao Minecraft.

Caso não exista configuração para a guild, o cliente retorna:

```text
⚠️ Use `/setup` primeiro.
```

---

# 🗺️ Roadmap

* [x] Discord ↔ Minecraft Bedrock
* [x] Configuração por servidor
* [x] Sistema de chat
* [x] Conectar / desconectar
* [x] Status
* [x] Reconexão
* [x] Lista de jogadores online
* [x] Logs de entrada e saída
* [x] Logs de mortes
* [x] Logs de avanços
* [x] Vinculação Discord ↔ Minecraft
* [x] Sistema de Playtime
* [x] Ranking de Playtime
* [x] IA via Groq
* [x] Docker
* [ ] Dashboard completo
* [ ] Sistema de métricas
* [ ] Mais opções de administração
* [ ] Melhorias no sistema de permissões
* [ ] Mais integrações Minecraft

---

# 🤝 Contribuindo

Contribuições são bem-vindas.

### 1. Fork

Faça um fork do projeto.

### 2. Clone

```bash
git clone https://github.com/spacexjr/SideralBOT.git
```

### 3. Crie uma branch

```bash
git checkout -b feature/minha-feature
```

### 4. Faça suas alterações

```bash
git add .
git commit -m "feat: adiciona minha feature"
```

### 5. Envie

```bash
git push origin feature/minha-feature
```

Depois abra um Pull Request.

---

# 📜 Licença

Este projeto é distribuído sob a licença **MIT**.

Consulte [`LICENSE`](LICENSE) para mais informações.

---

# 👨‍💻 Autor

<div align="center">

### Space

**Developer • Android • Linux • Minecraft • Open Source**

🌌 Desenvolvido por **Space**

<br>

<a href="https://github.com/spacexjr">
<img src="https://img.shields.io/badge/GitHub-spacexjr-181717?style=for-the-badge&logo=github&logoColor=white"/>
</a>

<a href="https://github.com/spacexjr/SideralBOT">
<img src="https://img.shields.io/badge/Repository-SideralBOT-800080?style=for-the-badge&logo=github&logoColor=white"/>
</a>

</div>

---

<div align="center">

## 🌌 SideralBOT

**Discord × Minecraft Bedrock**

*Conectando comunidades, um servidor de cada vez.*

<img width="100%" src="https://capsule-render.vercel.app/api?type=waving&color=800080&height=120&section=footer"/>

</div>
