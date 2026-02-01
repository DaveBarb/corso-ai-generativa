# Giorno 3: API Claude

## Obiettivi della Giornata

- Capire cos'è un'API e perché usarla
- Gestire autenticazione con API key
- Strutturare richieste all'API di Claude
- Implementare conversazioni multi-turn

---

## Blocco 1: Introduzione alle API

### Cos'è un'API?

**API** = Application Programming Interface

Un'API è un "contratto" che definisce come due software possono comunicare tra loro.

### Analogia: Il Ristorante

```
┌─────────────────────────────────────────────────────────────────┐
│                        RISTORANTE                                │
│                                                                  │
│   TU (Cliente)  →  CAMERIERE (API)  →  CUCINA (Server)          │
│                                                                  │
│   "Vorrei una pizza"    "Ecco l'ordine"    [prepara pizza]      │
│        ↓                                          ↓              │
│   [ricevi pizza]   ←   "Ecco la pizza"   ←   [pizza pronta]     │
│                                                                  │
└─────────────────────────────────────────────────────────────────┘
```

- **Tu** = il tuo programma Python
- **Cameriere** = l'API (interfaccia)
- **Cucina** = i server di Anthropic con Claude

### Perché Usare l'API vs l'Interfaccia Web?

| Aspetto | Interfaccia Web | API |
|---------|-----------------|-----|
| Uso interattivo | Ideale | Non pratico |
| Automazione | Manuale | Programmabile |
| Integrazione in app | No | Sì |
| Elaborazione batch | No | Sì |
| Personalizzazione | Limitata | Totale |
| Costi | Gratis (limiti) | Pay per use |

---

### Anatomia di una Richiesta HTTP

```
┌─────────────────────────────────────────────────────────────────┐
│                      RICHIESTA HTTP                              │
│                                                                  │
│  1. METODO     →  POST (per inviare dati)                       │
│  2. ENDPOINT   →  https://api.anthropic.com/v1/messages        │
│  3. HEADERS    →  Authorization, Content-Type                   │
│  4. BODY       →  I dati della richiesta (JSON)                │
│                                                                  │
└─────────────────────────────────────────────────────────────────┘
                              ↓
                        [Server elabora]
                              ↓
┌─────────────────────────────────────────────────────────────────┐
│                       RISPOSTA HTTP                              │
│                                                                  │
│  1. STATUS CODE  →  200 (OK), 400 (errore), 429 (rate limit)   │
│  2. HEADERS      →  Metadata della risposta                     │
│  3. BODY         →  I dati di risposta (JSON)                  │
│                                                                  │
└─────────────────────────────────────────────────────────────────┘
```

---

### Autenticazione con API Key

#### Cos'è un'API Key?
Una **chiave segreta** che identifica chi sei e ti autorizza a usare l'API.

```
sk-ant-api03-xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
└─prefix──┘ └──────────identificativo unico────────┘
```

!!! danger "Sicurezza delle API Key"
    **MAI fare:**

    - Committare la key su GitHub
    - Condividerla con altri
    - Metterla direttamente nel codice
    - Mostrarla in screenshot

    **SEMPRE fare:**

    - Usare variabili d'ambiente
    - Usare file .env (escluso da git)
    - Rigenerare se compromessa

#### Come Gestire le API Key in Python

```python
# Metodo 1: Variabile d'ambiente
import os
api_key = os.environ.get("ANTHROPIC_API_KEY")

# Metodo 2: File .env con python-dotenv
from dotenv import load_dotenv
load_dotenv()
api_key = os.getenv("ANTHROPIC_API_KEY")

# Metodo 3: Input interattivo (per test)
import getpass
api_key = getpass.getpass("Inserisci API key: ")
```

---

### Rate Limits e Costi

#### Rate Limits Anthropic (approssimativi)

| Tier | Richieste/minuto | Token/minuto |
|------|------------------|--------------|
| Free | 5 | 10,000 |
| Tier 1 | 50 | 40,000 |
| Tier 2 | 100 | 80,000 |

#### Gestire i Rate Limits

```python
import time

def call_api_with_retry(prompt, max_retries=3):
    for attempt in range(max_retries):
        try:
            response = client.messages.create(...)
            return response
        except anthropic.RateLimitError:
            wait_time = 2 ** attempt  # Exponential backoff
            print(f"Rate limit. Attendo {wait_time}s...")
            time.sleep(wait_time)
    raise Exception("Max retries exceeded")
```

#### Prezzi Claude (approssimativi)

| Modello | Input (per 1M token) | Output (per 1M token) |
|---------|---------------------|----------------------|
| Claude 3 Haiku | $0.25 | $1.25 |
| Claude 3 Sonnet | $3.00 | $15.00 |
| Claude 3 Opus | $15.00 | $75.00 |

---

## Blocco 2: Anthropic API in Dettaglio

### Struttura della Richiesta Claude

```python
from anthropic import Anthropic

client = Anthropic()

response = client.messages.create(
    model="claude-3-haiku-20240307",
    max_tokens=1024,
    system="Sei un assistente utile che risponde in italiano.",
    messages=[
        {"role": "user", "content": "Ciao! Come stai?"}
    ]
)

print(response.content[0].text)
```

### Anatomia della Richiesta

| Parametro | Descrizione |
|-----------|-------------|
| `model` | Quale modello usare |
| `max_tokens` | Limite token risposta |
| `system` | Istruzioni per il modello (opzionale) |
| `messages` | La conversazione (obbligatorio) |
| `temperature` | Creatività (opzionale) |
| `stop` | Sequenze di stop (opzionale) |

---

### System Prompt vs User Message vs Assistant Message

```
┌─────────────────────────────────────────────────────────────────┐
│  SYSTEM                                                          │
│  ├─ Definisce il comportamento generale                         │
│  ├─ Dà contesto e istruzioni "meta"                            │
│  └─ NON fa parte della conversazione visibile                  │
├─────────────────────────────────────────────────────────────────┤
│  USER                                                            │
│  ├─ I messaggi dell'utente                                      │
│  └─ Le domande/richieste                                        │
├─────────────────────────────────────────────────────────────────┤
│  ASSISTANT                                                       │
│  ├─ Le risposte di Claude                                       │
│  └─ Può essere "pre-compilato" per guidare la risposta         │
└─────────────────────────────────────────────────────────────────┘
```

#### Esempio System Prompt Efficace

```python
system = """Sei un assistente per sviluppatori Python.

REGOLE:
1. Rispondi sempre in italiano
2. Includi esempi di codice quando rilevante
3. Spiega gli errori in modo chiaro
4. Se non sei sicuro, dillo esplicitamente

FORMATO:
- Usa markdown per il codice
- Sii conciso ma completo
"""
```

---

### Parametri del Modello

#### temperature (opzionale, default 1.0)

Controlla la "creatività" della risposta.

```python
# Per task precisi (codice, matematica)
temperature=0

# Per task creativi (storie, brainstorming)
temperature=0.8
```

#### max_tokens (obbligatorio)

```python
max_tokens=1024  # Limite risposta

# Tipici valori
# 256  - Risposte brevi
# 1024 - Risposte medie
# 4096 - Risposte lunghe
```

!!! note "Stop Reason"
    Se la risposta viene troncata, `stop_reason` sarà `"max_tokens"`.

---

### Struttura della Risposta

```python
response = client.messages.create(...)

# Accedere al testo
text = response.content[0].text

# Stop reason
response.stop_reason
# "end_turn"    - Risposta completa
# "max_tokens"  - Raggiunto limite token

# Usage (per monitorare costi)
print(f"Input: {response.usage.input_tokens}")
print(f"Output: {response.usage.output_tokens}")
```

---

### Gestione delle Conversazioni (Multi-turn)

Claude non ha memoria tra chiamate API. Devi passare tutta la cronologia ogni volta.

```python
class ChatSession:
    def __init__(self, system_prompt=""):
        self.client = Anthropic()
        self.system = system_prompt
        self.messages = []

    def send(self, user_message):
        # Aggiungi messaggio utente
        self.messages.append({
            "role": "user",
            "content": user_message
        })

        # Chiama API
        response = self.client.messages.create(
            model="claude-3-haiku-20240307",
            max_tokens=1024,
            system=self.system,
            messages=self.messages
        )

        # Estrai risposta
        assistant_message = response.content[0].text

        # Aggiungi risposta alla cronologia
        self.messages.append({
            "role": "assistant",
            "content": assistant_message
        })

        return assistant_message

# Uso
chat = ChatSession("Sei un assistente amichevole.")
print(chat.send("Ciao! Mi chiamo Anna."))
print(chat.send("Ti ricordi come mi chiamo?"))
```

---

### Streaming delle Risposte

```python
# Con streaming (token per token)
with client.messages.stream(
    model="claude-3-haiku-20240307",
    max_tokens=1024,
    messages=[{"role": "user", "content": "Racconta una storia"}]
) as stream:
    for text in stream.text_stream:
        print(text, end="", flush=True)
```

**Vantaggi:**

- Feedback immediato (non aspettare tutta la risposta)
- Migliore UX per risposte lunghe
- Timeout meno probabili

---

## Riassunto

```
┌─────────────────────────────────────────────────────────────────┐
│                CHIAMATA API CLAUDE                               │
│                                                                  │
│  client.messages.create(                                         │
│      model="claude-3-haiku-...",    # Quale modello             │
│      max_tokens=1024,               # Limite risposta            │
│      system="Istruzioni...",        # Comportamento             │
│      messages=[...],                # Conversazione              │
│      temperature=0.7,               # Creatività                 │
│  )                                                               │
│                                                                  │
│  Response:                                                       │
│  ├── .content[0].text    → Il testo                             │
│  ├── .stop_reason        → Perché si è fermato                  │
│  └── .usage              → Token usati                          │
│                                                                  │
└─────────────────────────────────────────────────────────────────┘
```

---

## Domande di Riflessione

1. Perché è importante non condividere mai l'API key?

2. Quale modello useresti per un chatbot ad alto volume? Perché?

3. Come gestiresti un'applicazione che deve fare 1000 richieste?

4. Quando useresti temperature=0 vs temperature=1?

---

## Risorse

- [Anthropic API Documentation](https://docs.anthropic.com/claude/reference/getting-started-with-the-api)
- [Anthropic Python SDK](https://github.com/anthropics/anthropic-sdk-python)
- [Anthropic Pricing](https://www.anthropic.com/pricing)
