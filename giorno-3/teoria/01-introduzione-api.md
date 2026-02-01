# Blocco 1: Introduzione alle API (1h)

## Obiettivi di Apprendimento

Al termine di questo blocco, gli studenti saranno in grado di:
- Capire cos'è un'API e perché usarla
- Conoscere l'anatomia di una richiesta HTTP
- Gestire autenticazione con API key
- Comprendere rate limits e costi

---

## 1. Cos'è un'API?

### Definizione
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
| Uso interattivo | ✅ Ideale | ❌ Non pratico |
| Automazione | ❌ Manuale | ✅ Programmabile |
| Integrazione in app | ❌ No | ✅ Sì |
| Elaborazione batch | ❌ No | ✅ Sì |
| Personalizzazione | Limitata | Totale |
| Costi | Gratis (limiti) | Pay per use |

---

## 2. Anatomia di una Richiesta HTTP

### I Componenti

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

### Metodi HTTP Comuni

| Metodo | Scopo | Esempio |
|--------|-------|---------|
| GET | Leggere dati | Ottenere lista modelli |
| POST | Inviare dati | Mandare prompt a Claude |
| PUT | Aggiornare | Modificare configurazione |
| DELETE | Cancellare | Rimuovere risorsa |

Per le API di LLM, usiamo quasi sempre **POST**.

### Headers Comuni

```python
headers = {
    "Authorization": "Bearer sk-ant-...",    # API key
    "Content-Type": "application/json",      # Tipo dati
    "anthropic-version": "2023-06-01"        # Versione API
}
```

---

## 3. Autenticazione con API Key

### Cos'è un'API Key?
Una **chiave segreta** che identifica chi sei e ti autorizza a usare l'API.

```
sk-ant-api03-xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
└─prefix──┘ └──────────identificativo unico────────┘
```

### Sicurezza delle API Key

**⚠️ MAI fare:**
- Committare la key su GitHub
- Condividerla con altri
- Metterla direttamente nel codice
- Mostrarla in screenshot

**✅ SEMPRE fare:**
- Usare variabili d'ambiente
- Usare file .env (escluso da git)
- Rigenerare se compromessa

### Come Gestire le API Key in Python

**Metodo 1: Variabile d'ambiente**
```python
import os

api_key = os.environ.get("ANTHROPIC_API_KEY")
```

**Metodo 2: File .env con python-dotenv**
```python
# .env
ANTHROPIC_API_KEY=sk-ant-...

# Python
from dotenv import load_dotenv
import os

load_dotenv()
api_key = os.getenv("ANTHROPIC_API_KEY")
```

**Metodo 3: Input interattivo (per test)**
```python
import getpass
api_key = getpass.getpass("Inserisci API key: ")
```

---

## 4. Rate Limits

### Cosa Sono
Limiti al numero di richieste che puoi fare in un certo periodo.

### Rate Limits Anthropic (approssimativi)

| Tier | Richieste/minuto | Token/minuto |
|------|------------------|--------------|
| Free | 5 | 10,000 |
| Tier 1 | 50 | 40,000 |
| Tier 2 | 100 | 80,000 |

### Come Gestire i Rate Limits

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

### Headers di Rate Limit nella Risposta

```
x-ratelimit-limit-requests: 50
x-ratelimit-remaining-requests: 45
x-ratelimit-reset-requests: 2024-01-15T10:30:00Z
```

---

## 5. Gestione Errori

### Codici di Stato HTTP

| Codice | Significato | Azione |
|--------|-------------|--------|
| 200 | OK | Tutto bene |
| 400 | Bad Request | Controlla il prompt |
| 401 | Unauthorized | API key errata |
| 403 | Forbidden | Non hai permessi |
| 429 | Too Many Requests | Rate limit, attendi |
| 500 | Server Error | Problema loro, riprova |

### Gestione Errori in Python

```python
import anthropic

try:
    response = client.messages.create(...)

except anthropic.AuthenticationError:
    print("API key non valida")

except anthropic.RateLimitError:
    print("Tropppe richieste, attendi")

except anthropic.APIError as e:
    print(f"Errore API: {e}")
```

---

## 6. Costi e Ottimizzazione

### Come Funzionano i Costi

Anthropic fattura per **token** (non per richiesta).

```
Costo = (input_tokens × prezzo_input) + (output_tokens × prezzo_output)
```

### Prezzi Claude (approssimativi - verificare su anthropic.com)

| Modello | Input (per 1M token) | Output (per 1M token) |
|---------|---------------------|----------------------|
| Claude 3 Haiku | $0.25 | $1.25 |
| Claude 3 Sonnet | $3.00 | $15.00 |
| Claude 3 Opus | $15.00 | $75.00 |

### Esempio di Calcolo Costi

```
Prompt: 500 token input, 200 token output con Haiku

Input:  500 × ($0.25 / 1,000,000) = $0.000125
Output: 200 × ($1.25 / 1,000,000) = $0.000250
Totale: $0.000375 ≈ 0.04 centesimi

Con 1000 richieste simili: ~$0.38
```

### Strategie di Ottimizzazione

1. **Scegli il modello giusto**
   - Task semplice → Haiku (più economico)
   - Task complesso → Sonnet/Opus

2. **Limita i token output**
   ```python
   response = client.messages.create(
       max_tokens=500,  # Limita la risposta
       ...
   )
   ```

3. **Prompt efficienti**
   - Sii conciso
   - Evita ripetizioni
   - Usa abbreviazioni nel prompt di sistema

4. **Cache dove possibile**
   ```python
   # Se fai la stessa domanda, salva la risposta
   cache = {}
   if prompt in cache:
       return cache[prompt]
   ```

### Free Tier Anthropic

- $5 di crediti gratuiti per nuovi account
- Sufficiente per ~100,000 chiamate Haiku o ~10,000 Sonnet

---

## 7. Contare i Token

### Perché Contare?
- Rispettare i limiti
- Stimare i costi
- Evitare errori per context troppo lungo

### Metodo con la Libreria Anthropic

```python
from anthropic import Anthropic

client = Anthropic()

# Conta token approssimativi (regola del pollice: ~4 char = 1 token)
def estimate_tokens(text):
    return len(text) // 4

# Il conteggio esatto è nella risposta
response = client.messages.create(...)
print(f"Input tokens: {response.usage.input_tokens}")
print(f"Output tokens: {response.usage.output_tokens}")
```

### Limiti di Contesto

| Modello | Context Window |
|---------|---------------|
| Claude 3 Haiku | 200K token |
| Claude 3 Sonnet | 200K token |
| Claude 3 Opus | 200K token |

200K token ≈ 150,000 parole ≈ 300+ pagine

---

## Riassunto

```
┌─────────────────────────────────────────────────────────────────┐
│                    CHECKLIST API                                 │
│                                                                  │
│  ✓ API = interfaccia programmatica                              │
│  ✓ Autenticazione via API key (tenere segreta!)                │
│  ✓ Richieste: metodo + endpoint + headers + body                │
│  ✓ Risposte: status code + headers + body                       │
│  ✓ Gestire rate limits con retry/exponential backoff           │
│  ✓ Gestire errori con try/except                                │
│  ✓ Costi basati su token (input + output)                      │
│  ✓ Ottimizzare: modello giusto + max_tokens + cache            │
│                                                                  │
└─────────────────────────────────────────────────────────────────┘
```

---

## Domande di Riflessione

1. Perché è importante non condividere mai l'API key?

2. Quale modello useresti per un chatbot ad alto volume? Perché?

3. Come gestiresti un'applicazione che deve fare 1000 richieste?

---

## Risorse

- [Anthropic API Documentation](https://docs.anthropic.com/claude/reference/getting-started-with-the-api)
- [Anthropic Pricing](https://www.anthropic.com/pricing)
- [Python requests library](https://docs.python-requests.org/)
