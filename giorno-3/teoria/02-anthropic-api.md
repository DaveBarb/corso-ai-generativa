# Blocco 2: Anthropic API in Dettaglio (1h)

## Obiettivi di Apprendimento

Al termine di questo blocco, gli studenti saranno in grado di:
- Strutturare richieste all'API di Claude
- Usare system prompt, user e assistant messages
- Configurare i parametri del modello
- Implementare conversazioni multi-turn

---

## 1. Struttura della Richiesta Claude

### Esempio Completo

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

```
┌─────────────────────────────────────────────────────────────────┐
│                    PARAMETRI RICHIESTA                           │
│                                                                  │
│  model        → Quale modello usare                             │
│  max_tokens   → Limite token risposta                           │
│  system       → Istruzioni per il modello (opzionale)          │
│  messages     → La conversazione (obbligatorio)                 │
│  temperature  → Creatività (opzionale)                          │
│  top_p        → Campionamento (opzionale)                       │
│  stop         → Sequenze di stop (opzionale)                   │
│                                                                  │
└─────────────────────────────────────────────────────────────────┘
```

---

## 2. System Prompt vs User Message vs Assistant Message

### I Tre Ruoli

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

### Esempio Pratico

```python
response = client.messages.create(
    model="claude-3-haiku-20240307",
    max_tokens=1024,

    # SYSTEM: Istruzioni generali (invisibili all'utente)
    system="""Sei un insegnante di matematica paziente.
    Rispondi sempre in italiano.
    Usa esempi pratici.
    Se lo studente sbaglia, incoraggialo.""",

    # MESSAGES: La conversazione
    messages=[
        {"role": "user", "content": "Cos'è una derivata?"},
        {"role": "assistant", "content": "Ottima domanda!"},  # Pre-fill
    ]
)
```

### Quando Usare il System Prompt

**Ideale per:**
- Definire il ruolo/persona
- Impostare regole di risposta
- Specificare formato output
- Dare contesto persistente

**Esempio System Prompt Efficace:**
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

### Assistant Pre-fill

Puoi "iniziare" la risposta di Claude:

```python
messages=[
    {"role": "user", "content": "Elenca 3 frutti"},
    {"role": "assistant", "content": "Ecco tre frutti:\n1."}
]
# Claude continuerà da "1." con la lista
```

Utile per:
- Forzare un formato specifico
- Iniziare risposte JSON
- Guidare lo stile

---

## 3. Parametri del Modello

### model (obbligatorio)

```python
# Modelli disponibili
models = [
    "claude-3-opus-20240229",    # Più capace, più costoso
    "claude-3-sonnet-20240229",  # Bilanciato
    "claude-3-haiku-20240307",   # Veloce, economico
]
```

### max_tokens (obbligatorio)

```python
max_tokens=1024  # Limite risposta

# Tipici valori
# 256  - Risposte brevi
# 1024 - Risposte medie
# 4096 - Risposte lunghe
```

**Nota:** Se la risposta viene troncata, `stop_reason` sarà `"max_tokens"`.

### temperature (opzionale, default 1.0)

Controlla la "creatività" della risposta.

```
Temperature = 0.0  →  Deterministico, ripetibile
Temperature = 0.5  →  Bilanciato
Temperature = 1.0  →  Default, buon mix
Temperature = 2.0  →  Molto creativo/casuale
```

```python
# Per task precisi (codice, matematica)
temperature=0

# Per task creativi (storie, brainstorming)
temperature=0.8
```

### top_p (opzionale, default 1.0)

Nucleus sampling: considera solo i token più probabili.

```python
top_p=0.9  # Considera token che cumulano 90% probabilità
```

**Consiglio:** Usa temperature O top_p, non entrambi.

### stop (opzionale)

Sequenze che fermano la generazione.

```python
stop_sequences=["FINE", "---"]
# Claude si ferma quando genera una di queste
```

---

## 4. Struttura della Risposta

### Oggetto Response

```python
response = client.messages.create(...)

# Struttura
response.id           # ID univoco
response.model        # Modello usato
response.role         # "assistant"
response.content      # Lista di blocchi
response.stop_reason  # Perché si è fermato
response.usage        # Token usati
```

### Accedere al Testo

```python
# Il testo è nel primo blocco content
text = response.content[0].text

# Oppure
for block in response.content:
    if block.type == "text":
        print(block.text)
```

### Stop Reason

```python
response.stop_reason
# "end_turn"    - Risposta completa naturalmente
# "max_tokens"  - Raggiunto limite token
# "stop_sequence" - Trovata sequenza di stop
```

### Usage (per monitorare costi)

```python
response.usage.input_tokens   # Token nel prompt
response.usage.output_tokens  # Token nella risposta

print(f"Usati: {response.usage.input_tokens} + {response.usage.output_tokens} token")
```

---

## 5. Streaming delle Risposte

### Perché Streaming?

- Feedback immediato (non aspettare tutta la risposta)
- Migliore UX per risposte lunghe
- Timeout meno probabili

### Implementazione

```python
# Senza streaming (aspetta tutto)
response = client.messages.create(
    model="claude-3-haiku-20240307",
    max_tokens=1024,
    messages=[{"role": "user", "content": "Racconta una storia"}]
)
print(response.content[0].text)

# Con streaming (token per token)
with client.messages.stream(
    model="claude-3-haiku-20240307",
    max_tokens=1024,
    messages=[{"role": "user", "content": "Racconta una storia"}]
) as stream:
    for text in stream.text_stream:
        print(text, end="", flush=True)
```

### Eventi nello Stream

```python
with client.messages.stream(...) as stream:
    for event in stream:
        if event.type == "content_block_delta":
            print(event.delta.text, end="")
        elif event.type == "message_stop":
            print("\n[Fine]")
```

---

## 6. Gestione delle Conversazioni (Multi-turn)

### Il Concetto

Claude non ha memoria tra chiamate API. Devi passare tutta la cronologia ogni volta.

```
┌──────────────────────────────────────────────────────────────────┐
│                    CHIAMATA 1                                     │
│  messages: [                                                      │
│    {"role": "user", "content": "Mi chiamo Marco"}                │
│  ]                                                                │
│  → Claude: "Ciao Marco! Come posso aiutarti?"                    │
├──────────────────────────────────────────────────────────────────┤
│                    CHIAMATA 2                                     │
│  messages: [                                                      │
│    {"role": "user", "content": "Mi chiamo Marco"},               │
│    {"role": "assistant", "content": "Ciao Marco!..."},          │
│    {"role": "user", "content": "Come mi chiamo?"}                │
│  ]                                                                │
│  → Claude: "Ti chiami Marco."                                    │
└──────────────────────────────────────────────────────────────────┘
```

### Implementazione

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

### Gestione della Lunghezza

La cronologia può diventare troppo lunga. Strategie:

```python
# 1. Limitare i messaggi
if len(self.messages) > 20:
    self.messages = self.messages[-20:]

# 2. Riassumere periodicamente
if len(self.messages) > 10:
    summary = self.summarize_conversation()
    self.messages = [{"role": "user", "content": f"Riassunto: {summary}"}]

# 3. Sliding window con contesto
def get_recent_messages(self, n=10):
    return self.messages[-n:] if len(self.messages) > n else self.messages
```

---

## 7. Esempio Completo: Chatbot CLI

```python
from anthropic import Anthropic
import os

def main():
    client = Anthropic()
    messages = []

    system = """Sei un assistente AI amichevole e utile.
    Rispondi in italiano in modo conciso."""

    print("Chatbot con Claude (scrivi 'quit' per uscire)")
    print("-" * 50)

    while True:
        # Input utente
        user_input = input("\nTu: ").strip()

        if user_input.lower() == 'quit':
            print("Arrivederci!")
            break

        if not user_input:
            continue

        # Aggiungi messaggio utente
        messages.append({"role": "user", "content": user_input})

        try:
            # Chiama Claude
            response = client.messages.create(
                model="claude-3-haiku-20240307",
                max_tokens=1024,
                system=system,
                messages=messages
            )

            # Estrai e mostra risposta
            assistant_message = response.content[0].text
            print(f"\nClaude: {assistant_message}")

            # Aggiungi alla cronologia
            messages.append({
                "role": "assistant",
                "content": assistant_message
            })

            # Info token
            print(f"\n[Token usati: {response.usage.input_tokens} + {response.usage.output_tokens}]")

        except Exception as e:
            print(f"\nErrore: {e}")
            messages.pop()  # Rimuovi messaggio fallito

if __name__ == "__main__":
    main()
```

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

1. Quando useresti temperature=0 vs temperature=1?

2. Perché dobbiamo passare tutta la cronologia ad ogni chiamata?

3. Come gestiresti una conversazione molto lunga senza eccedere il context?

---

## Risorse

- [Anthropic Python SDK](https://github.com/anthropics/anthropic-sdk-python)
- [Messages API Reference](https://docs.anthropic.com/claude/reference/messages_post)
- [Prompt Caching](https://docs.anthropic.com/claude/docs/prompt-caching)
