# Giorno 3: Pratica - API Claude

## Setup Iniziale

### Installazione

```bash
# Crea ambiente virtuale
python -m venv venv
source venv/bin/activate  # Linux/Mac
# venv\Scripts\activate   # Windows

# Installa dipendenze
pip install anthropic python-dotenv
```

### Configurazione API Key

Crea un file `.env`:

```
ANTHROPIC_API_KEY=sk-ant-...
```

Crea un file `.gitignore`:

```
.env
venv/
__pycache__/
```

---

## Esercizio 1: Prima Chiamata API

Crea `hello_claude.py`:

```python
from anthropic import Anthropic
from dotenv import load_dotenv

load_dotenv()
client = Anthropic()

response = client.messages.create(
    model="claude-3-haiku-20240307",
    max_tokens=256,
    messages=[
        {"role": "user", "content": "Ciao Claude! Presentati brevemente."}
    ]
)

print(response.content[0].text)
print(f"\nToken usati: {response.usage.input_tokens} + {response.usage.output_tokens}")
```

**Obiettivo:** Verificare che la configurazione funzioni.

---

## Esercizio 2: Parametri del Modello

Sperimenta con diversi parametri:

```python
# Prova temperature diverse
for temp in [0, 0.5, 1.0, 1.5]:
    response = client.messages.create(
        model="claude-3-haiku-20240307",
        max_tokens=100,
        temperature=temp,
        messages=[
            {"role": "user", "content": "Scrivi una frase creativa sul mare."}
        ]
    )
    print(f"Temperature {temp}: {response.content[0].text}\n")
```

**Domanda:** Come cambia l'output con temperature diverse?

---

## Esercizio 3: System Prompt

Crea un assistente specializzato:

```python
def create_specialist(domain, rules):
    """Crea un assistente specializzato in un dominio."""
    system = f"""Sei un esperto di {domain}.

REGOLE:
{rules}

Rispondi sempre in italiano in modo professionale ma accessibile.
"""

    def ask(question):
        response = client.messages.create(
            model="claude-3-haiku-20240307",
            max_tokens=1024,
            system=system,
            messages=[{"role": "user", "content": question}]
        )
        return response.content[0].text

    return ask

# Test
chef = create_specialist(
    "cucina italiana",
    "- Suggerisci solo ricette tradizionali\n- Indica sempre il tempo di preparazione"
)

print(chef("Come si fa la carbonara?"))
```

---

## Esercizio 4: Chatbot CLI

Implementa un chatbot completo:

```python
from anthropic import Anthropic
from dotenv import load_dotenv

load_dotenv()

def main():
    client = Anthropic()
    messages = []

    system = """Sei un assistente AI amichevole e utile.
    Rispondi in italiano in modo conciso."""

    print("Chatbot con Claude (scrivi 'quit' per uscire)")
    print("-" * 50)

    while True:
        user_input = input("\nTu: ").strip()

        if user_input.lower() == 'quit':
            print("Arrivederci!")
            break

        if not user_input:
            continue

        messages.append({"role": "user", "content": user_input})

        try:
            response = client.messages.create(
                model="claude-3-haiku-20240307",
                max_tokens=1024,
                system=system,
                messages=messages
            )

            assistant_message = response.content[0].text
            print(f"\nClaude: {assistant_message}")

            messages.append({
                "role": "assistant",
                "content": assistant_message
            })

            print(f"\n[Token: {response.usage.input_tokens} + {response.usage.output_tokens}]")

        except Exception as e:
            print(f"\nErrore: {e}")
            messages.pop()

if __name__ == "__main__":
    main()
```

---

## Esercizio 5: Streaming

Implementa output in tempo reale:

```python
def stream_response(prompt):
    """Mostra la risposta in streaming."""
    print("Claude: ", end="", flush=True)

    with client.messages.stream(
        model="claude-3-haiku-20240307",
        max_tokens=1024,
        messages=[{"role": "user", "content": prompt}]
    ) as stream:
        for text in stream.text_stream:
            print(text, end="", flush=True)

    print()  # Newline finale

# Test
stream_response("Racconta una breve storia di 3 frasi.")
```

---

## Esercizio 6: Gestione Errori

Implementa retry con backoff:

```python
import time
import anthropic

def robust_call(messages, max_retries=3):
    """Chiamata API con gestione errori robusta."""
    for attempt in range(max_retries):
        try:
            response = client.messages.create(
                model="claude-3-haiku-20240307",
                max_tokens=1024,
                messages=messages
            )
            return response.content[0].text

        except anthropic.RateLimitError:
            wait = 2 ** attempt
            print(f"Rate limit! Attendo {wait}s...")
            time.sleep(wait)

        except anthropic.AuthenticationError:
            print("API key non valida!")
            raise

        except anthropic.APIError as e:
            print(f"Errore API: {e}")
            if attempt == max_retries - 1:
                raise

    raise Exception("Max retries exceeded")
```

---

## Esercizio 7: Batch Processing

Elabora multiple richieste:

```python
def analyze_texts(texts, prompt_template):
    """Analizza una lista di testi."""
    results = []

    for i, text in enumerate(texts, 1):
        print(f"Elaborando {i}/{len(texts)}...")

        prompt = prompt_template.format(text=text)

        response = client.messages.create(
            model="claude-3-haiku-20240307",
            max_tokens=256,
            messages=[{"role": "user", "content": prompt}]
        )

        results.append({
            "input": text,
            "output": response.content[0].text
        })

        time.sleep(0.5)  # Rispetta rate limits

    return results

# Test
reviews = [
    "Prodotto eccellente, lo consiglio!",
    "Pessimo servizio, mai più.",
    "Niente di speciale, fa il suo lavoro."
]

template = """Analizza questa recensione e restituisci:
- Sentiment: positivo/negativo/neutro
- Keywords: parole chiave

Recensione: {text}"""

results = analyze_texts(reviews, template)
for r in results:
    print(f"\nInput: {r['input']}")
    print(f"Output: {r['output']}")
```

---

## Sfida Finale: Assistente Completo

Crea un assistente con:

1. System prompt personalizzato
2. Gestione conversazione multi-turn
3. Comandi speciali (/help, /clear, /cost)
4. Salvataggio cronologia

```python
# Template di partenza
class SmartAssistant:
    def __init__(self, name, specialty):
        self.client = Anthropic()
        self.name = name
        self.messages = []
        self.total_tokens = 0
        self.system = f"Sei {name}, un assistente specializzato in {specialty}."

    def handle_command(self, cmd):
        """Gestisce comandi speciali."""
        if cmd == "/help":
            return "Comandi: /help, /clear, /cost, /quit"
        elif cmd == "/clear":
            self.messages = []
            return "Cronologia cancellata."
        elif cmd == "/cost":
            return f"Token totali usati: {self.total_tokens}"
        return None

    def chat(self, user_input):
        # Implementa la logica...
        pass

    def run(self):
        # Implementa il loop principale...
        pass
```

---

## Checklist di Completamento

- [ ] Prima chiamata API funzionante
- [ ] Esperimenti con temperature
- [ ] System prompt personalizzato
- [ ] Chatbot CLI funzionante
- [ ] Streaming implementato
- [ ] Gestione errori robusta
- [ ] Batch processing
- [ ] Assistente completo (sfida)
