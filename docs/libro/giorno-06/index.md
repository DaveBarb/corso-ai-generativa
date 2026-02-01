# Giorno 6: Applicazioni Avanzate ed Etica

## Obiettivi della Giornata

- Comprendere RAG e come dare "memoria" ai modelli
- Capire cosa sono gli agenti AI e il function calling
- Riconoscere bias e gestire le allucinazioni
- Conoscere la regolamentazione (AI Act)
- Riflettere sull'impatto sul lavoro

---

## Blocco 1: Applicazioni Avanzate

### RAG: Retrieval Augmented Generation

#### Il Problema

I LLM hanno limiti intrinseci:

- Knowledge cutoff (non sanno cosa è successo dopo il training)
- Non conoscono i TUOI dati (documenti aziendali, email, codice)
- Possono "allucinare" su informazioni specifiche

#### La Soluzione: RAG

**RAG** = Recupera informazioni rilevanti e le fornisce al modello come contesto.

```
┌─────────────────────────────────────────────────────────────────┐
│                         RAG PIPELINE                             │
│                                                                  │
│   1. DOMANDA UTENTE                                              │
│      "Qual è la policy aziendale sulle ferie?"                  │
│                          ↓                                       │
│   2. RICERCA                                                     │
│      Cerca nei documenti aziendali                              │
│                          ↓                                       │
│   3. CONTESTO RECUPERATO                                         │
│      [Frammenti rilevanti dalla policy HR]                      │
│                          ↓                                       │
│   4. PROMPT AL LLM                                               │
│      Contesto: {documenti} + Domanda: {domanda utente}          │
│                          ↓                                       │
│   5. RISPOSTA                                                    │
│      Basata sui documenti reali, non su conoscenza generica     │
│                                                                  │
└─────────────────────────────────────────────────────────────────┘
```

#### Componenti di un Sistema RAG

1. **Document Loader** - Carica PDF, Word, HTML, etc.
2. **Text Splitter** - Divide in chunk gestibili
3. **Embedding Model** - Converte testo in vettori
4. **Vector Database** - Memorizza e cerca vettori
5. **LLM** - Genera risposte basate sul contesto

#### Tools e Librerie

| Tool | Descrizione |
|------|-------------|
| LangChain | Framework completo per RAG |
| LlamaIndex | Specializzato in retrieval |
| Pinecone | Vector database cloud |
| Chroma | Vector database locale |
| FAISS | Libreria Facebook per similarity search |

---

### Agenti AI

#### Cosa Sono gli Agenti

Un **agente AI** è un sistema che può:

- Ragionare su un obiettivo
- Decidere quali azioni compiere
- Usare strumenti esterni
- Iterare fino al completamento del task

```
┌─────────────────────────────────────────────────────────────────┐
│                          AGENTE AI                               │
│                                                                  │
│   ┌───────────────┐                                              │
│   │    OBIETTIVO   │                                              │
│   │  "Trova voli   │                                              │
│   │   economici"   │                                              │
│   └───────┬───────┘                                              │
│           ↓                                                      │
│   ┌───────────────┐     ┌───────────────┐                       │
│   │   RAGIONA     │ ←→  │   STRUMENTI   │                       │
│   │  Cosa devo    │     │ • Cerca web   │                       │
│   │  fare ora?    │     │ • API voli    │                       │
│   └───────┬───────┘     │ • Calendario  │                       │
│           ↓             └───────────────┘                       │
│   ┌───────────────┐                                              │
│   │    AZIONE     │                                              │
│   │ Uso strumento │                                              │
│   └───────┬───────┘                                              │
│           ↓                                                      │
│   ┌───────────────┐                                              │
│   │  OSSERVAZIONE │  → Loop finché obiettivo raggiunto          │
│   └───────────────┘                                              │
│                                                                  │
└─────────────────────────────────────────────────────────────────┘
```

#### Il Loop ReAct (Reason + Act)

```
Thought: Devo trovare voli per Roma il 15 marzo
Action: search_flights(destination="Rome", date="2024-03-15")
Observation: [lista voli con prezzi]
Thought: Il volo più economico è €89 con Ryanair
Action: check_availability(flight_id="RY123")
Observation: Disponibile, 5 posti rimasti
Final Answer: Il volo più economico è Ryanair RY123 a €89
```

#### Esempi di Agenti

1. **Coding Agent** (Claude Code)
2. **Research Agent** - Cerca e sintetizza informazioni
3. **Customer Service Agent** - Risponde e accede a sistemi

---

### Function Calling (Tool Use)

Permettere al LLM di "chiamare" funzioni esterne quando necessario.

```python
import anthropic
import json

client = anthropic.Anthropic()

# Definizione dei tools disponibili
tools = [
    {
        "name": "get_weather",
        "description": "Ottiene il meteo attuale per una città",
        "input_schema": {
            "type": "object",
            "properties": {
                "city": {
                    "type": "string",
                    "description": "Nome della città"
                }
            },
            "required": ["city"]
        }
    }
]

# Funzione reale
def get_weather(city):
    return {"city": city, "temp": 15, "condition": "nuvoloso"}

# Chiamata con tools
response = client.messages.create(
    model="claude-3-haiku-20240307",
    max_tokens=1024,
    tools=tools,
    messages=[{"role": "user", "content": "Che tempo fa a Milano?"}]
)

# Gestione risposta
if response.stop_reason == "tool_use":
    tool_use = response.content[0]
    result = get_weather(**tool_use.input)
    # Passa il risultato a Claude per la risposta finale
```

---

### Automazione di Workflow

#### Pattern Comuni

| Pattern | Descrizione | Esempio |
|---------|-------------|---------|
| **Sequential** | Input → Step1 → Step2 → Output | Documento → Riassunto → Traduzione |
| **Parallel** | Input → [Task A, B, C] → Merge | Analisi sentiment in parallelo |
| **Conditional** | Input → Classifier → Branch | Routing ticket supporto |
| **Human-in-Loop** | AI → Human Review → Iterate | Contenuti con approvazione |

---

## Blocco 2: Etica, Limiti e Futuro

### Bias nei Modelli AI

#### Origine dei Bias

```
DATI DI TRAINING
└─ Internet contiene pregiudizi storici e culturali
└─ Sovrarappresentazione di alcune demografie
└─ Sottorappresentazione di minoranze

PROCESSO DI SELEZIONE
└─ Chi decide cosa è nel dataset?
└─ Quali fonti sono incluse/escluse?
```

#### Esempi di Bias

- **Bias di genere:** "Infermiere" → immagine femminile, "CEO" → immagine maschile
- **Bias culturale:** Default verso cultura occidentale
- **Bias linguistico:** Migliori performance in inglese

#### Mitigazione

**A livello di utente:**

- Consapevolezza del problema
- Verifica critica degli output
- Prompt espliciti per diversità
- Segnalazione di problemi

---

### Allucinazioni

Le **allucinazioni** sono output che sembrano plausibili ma sono falsi.

#### Tipi di Allucinazioni

| Tipo | Esempio |
|------|---------|
| **Fattuali** | "Einstein vinse il Nobel per la relatività" (falso) |
| **Inventive** | Citare paper/libri che non esistono |
| **Logiche** | Ragionamenti fallaci ma convincenti |
| **Referenziali** | "Come ho detto prima..." (quando non l'ha detto) |

#### Come Gestirle

!!! tip "Prevenzione"
    ```
    "Rispondi solo se sei sicuro. Se non sai, dì 'non ho informazioni'."
    ```

!!! tip "Verifica"
    - Controlla sempre fatti importanti
    - Cross-reference con fonti autorevoli
    - Usa RAG per informazioni specifiche

!!! tip "Detection"
    - Chiedi le fonti
    - Verifica consistenza interna
    - Poni la stessa domanda in modi diversi

---

### Copyright e Proprietà Intellettuale

#### Le Questioni Aperte

1. **Training:** I modelli sono stati addestrati su contenuti protetti
2. **Output:** Chi possiede il contenuto generato?
3. **Stile:** "In stile di [artista vivente]" è legale?

#### Best Practices

1. **Per uso commerciale:** Verifica ToS del servizio
2. **Per contenuti sensibili:** Non imitare artisti viventi senza permesso
3. **Trasparenza:** Dichiara l'uso di AI quando rilevante

---

### Impatto sul Lavoro

```
┌─────────────────────────────────────────────────────────────────┐
│                  IMPATTO SUL LAVORO                              │
│                                                                  │
│   AUTOMAZIONE                                                    │
│   └─ Alcuni task saranno automatizzati                          │
│   └─ Non necessariamente interi lavori                          │
│                                                                  │
│   AUGMENTATION                                                   │
│   └─ AI come strumento che amplifica le capacità               │
│   └─ Focus su competenze complementari all'AI                   │
│                                                                  │
│   NUOVI RUOLI                                                    │
│   └─ Prompt engineer, AI trainer, AI ethics specialist         │
│                                                                  │
└─────────────────────────────────────────────────────────────────┘
```

#### Lavori Più a Rischio

- Data entry e elaborazione dati ripetitiva
- Scrittura base (report standard, traduzioni)
- Customer service di primo livello

#### Lavori Più Resistenti

- Creatività originale e strategia
- Empatia e relazioni umane
- Giudizio in situazioni complesse
- Leadership e gestione

---

### Regolamentazione: AI Act Europeo

Prima regolamentazione completa sull'AI al mondo (EU, 2024).

#### Approccio Basato sul Rischio

```
                     ┌───────────┐
                     │   VIETATO  │ ← Social scoring, manipolazione
                     └─────┬─────┘
                   ┌───────┴───────┐
                   │  ALTO RISCHIO  │ ← Sanità, giustizia, HR
                   │  (regolato)    │
                   └───────┬───────┘
             ┌─────────────┴─────────────┐
             │     RISCHIO LIMITATO       │ ← Chatbot, deepfake
             │     (trasparenza)          │
             └─────────────┬─────────────┘
       ┌───────────────────┴───────────────────┐
       │           RISCHIO MINIMO               │ ← Spam filter
       │           (nessun obbligo)             │
       └───────────────────────────────────────┘
```

#### Obblighi per AI Generativa

1. **Trasparenza:** Dichiarare contenuto AI-generated
2. **Copyright:** Rispettare le leggi esistenti
3. **Sicurezza:** Valutazione dei rischi

---

### Trend Futuri

| Trend | Descrizione |
|-------|-------------|
| **Modelli più efficienti** | Stesse capacità, meno risorse |
| **On-Device AI** | Privacy, latenza minima, offline |
| **Multimodalità avanzata** | Testo + Immagini + Audio + Video + 3D |
| **AI Agents autonomi** | Sistemi che perseguono obiettivi complessi |

---

## Riassunto

```
┌─────────────────────────────────────────────────────────────────┐
│                 ETICA E FUTURO DELL'AI                           │
│                                                                  │
│   SFIDE ATTUALI                                                  │
│   ├─ Bias: pregiudizi nei dati e modelli                        │
│   ├─ Allucinazioni: output falsi ma plausibili                  │
│   ├─ Copyright: questioni legali aperte                         │
│   └─ Deepfake: rischi di disinformazione                        │
│                                                                  │
│   IMPATTO SOCIALE                                                │
│   ├─ Lavoro: automazione + augmentation                         │
│   └─ Regolamentazione: AI Act EU come riferimento              │
│                                                                  │
│   NOSTRO RUOLO                                                   │
│   ├─ Usare l'AI in modo responsabile                            │
│   ├─ Verificare criticamente gli output                         │
│   └─ Sviluppare competenze complementari                        │
│                                                                  │
└─────────────────────────────────────────────────────────────────┘
```

---

## Domande di Riflessione

1. Quando useresti RAG invece di fine-tuning?

2. Quali rischi vedi nell'usare agenti autonomi?

3. Come verificheresti se un output AI contiene bias?

4. Come cambierà il tuo futuro lavoro con l'AI?

---

## Risorse

- [LangChain Documentation](https://python.langchain.com/docs/)
- [Anthropic Tool Use Guide](https://docs.anthropic.com/claude/docs/tool-use)
- [EU AI Act Full Text](https://artificialintelligenceact.eu/)
- [AI Incident Database](https://incidentdatabase.ai/)
