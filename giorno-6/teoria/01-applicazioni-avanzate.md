# Blocco 1: Applicazioni Avanzate (1h)

## Obiettivi di Apprendimento

Al termine di questo blocco, gli studenti saranno in grado di:
- Comprendere RAG e come dare "memoria" ai modelli
- Capire cosa sono gli agenti AI
- Conoscere il function calling
- Progettare workflow di automazione con AI

---

## 1. RAG: Retrieval Augmented Generation

### Il Problema

I LLM hanno limiti intrinseci:
- Knowledge cutoff (non sanno cosa è successo dopo il training)
- Non conoscono i TUOI dati (documenti aziendali, email, codice)
- Possono "allucinare" su informazioni specifiche

### La Soluzione: RAG

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

### Come Funziona la Ricerca

#### Embedding e Similarity Search

```python
# Pseudocodice RAG semplificato

# 1. Indicizzazione (una tantum)
documents = load_documents("company_docs/")
for doc in documents:
    chunks = split_into_chunks(doc)
    for chunk in chunks:
        embedding = embed(chunk)  # Vettore numerico
        store_in_vector_db(chunk, embedding)

# 2. Query time
def answer_question(question):
    # Trova documenti simili
    question_embedding = embed(question)
    relevant_chunks = vector_db.search(question_embedding, top_k=5)

    # Crea prompt con contesto
    context = "\n".join(relevant_chunks)
    prompt = f"""
    Basandoti SOLO sui seguenti documenti, rispondi alla domanda.
    Se la risposta non è nei documenti, dì "Non ho informazioni".

    Documenti:
    {context}

    Domanda: {question}
    """

    return llm.generate(prompt)
```

### Componenti di un Sistema RAG

1. **Document Loader** - Carica PDF, Word, HTML, etc.
2. **Text Splitter** - Divide in chunk gestibili
3. **Embedding Model** - Converte testo in vettori
4. **Vector Database** - Memorizza e cerca vettori
5. **LLM** - Genera risposte basate sul contesto

### Tools e Librerie

| Tool | Descrizione |
|------|-------------|
| LangChain | Framework completo per RAG |
| LlamaIndex | Specializzato in retrieval |
| Pinecone | Vector database cloud |
| Chroma | Vector database locale |
| FAISS | Libreria Facebook per similarity search |

---

## 2. Agenti AI

### Cosa Sono gli Agenti

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
│           ↓             │ • Email       │                       │
│   ┌───────────────┐     └───────────────┘                       │
│   │    AZIONE     │                                              │
│   │ Uso strumento │                                              │
│   │ appropriato   │                                              │
│   └───────┬───────┘                                              │
│           ↓                                                      │
│   ┌───────────────┐                                              │
│   │  OSSERVAZIONE │                                              │
│   │  Risultato    │  → Loop finché obiettivo raggiunto          │
│   └───────────────┘                                              │
│                                                                  │
└─────────────────────────────────────────────────────────────────┘
```

### Il Loop ReAct (Reason + Act)

```
Thought: Devo trovare voli per Roma il 15 marzo
Action: search_flights(destination="Rome", date="2024-03-15")
Observation: [lista voli con prezzi]
Thought: Il volo più economico è €89 con Ryanair. Devo verificare disponibilità
Action: check_availability(flight_id="RY123")
Observation: Disponibile, 5 posti rimasti
Thought: Ho le informazioni necessarie. Posso rispondere.
Final Answer: Il volo più economico è Ryanair RY123 a €89, partenza 06:30.
```

### Esempi di Agenti

1. **Coding Agent** (Claude Code)
   - Legge codice
   - Scrive modifiche
   - Esegue test
   - Itera fino a soluzione

2. **Research Agent**
   - Cerca informazioni online
   - Legge documenti
   - Sintetizza findings
   - Produce report

3. **Customer Service Agent**
   - Capisce la richiesta
   - Cerca in knowledge base
   - Accede a sistemi CRM
   - Risolve o escala

---

## 3. Function Calling (Tool Use)

### Il Concetto

Permettere al LLM di "chiamare" funzioni esterne quando necessario.

```
┌─────────────────────────────────────────────────────────────────┐
│                     FUNCTION CALLING                             │
│                                                                  │
│   User: "Che tempo fa a Milano?"                                │
│                          ↓                                       │
│   LLM: "Devo usare la funzione get_weather"                    │
│         {                                                        │
│           "function": "get_weather",                            │
│           "arguments": {"city": "Milano"}                       │
│         }                                                        │
│                          ↓                                       │
│   Sistema: Esegue get_weather("Milano")                         │
│            Risultato: {"temp": 15, "condition": "nuvoloso"}     │
│                          ↓                                       │
│   LLM: "A Milano ci sono 15°C e il tempo è nuvoloso."          │
│                                                                  │
└─────────────────────────────────────────────────────────────────┘
```

### Esempio con Claude

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
    },
    {
        "name": "search_flights",
        "description": "Cerca voli disponibili",
        "input_schema": {
            "type": "object",
            "properties": {
                "origin": {"type": "string"},
                "destination": {"type": "string"},
                "date": {"type": "string", "format": "date"}
            },
            "required": ["origin", "destination", "date"]
        }
    }
]

# Funzioni reali che implementano i tools
def get_weather(city):
    # In produzione: chiamata a API meteo reale
    return {"city": city, "temp": 15, "condition": "nuvoloso"}

def search_flights(origin, destination, date):
    # In produzione: chiamata a API voli
    return [{"id": "AZ123", "price": 89, "time": "08:00"}]

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
    tool_name = tool_use.name
    tool_input = tool_use.input

    # Esegui la funzione
    if tool_name == "get_weather":
        result = get_weather(**tool_input)

    # Passa il risultato a Claude
    final_response = client.messages.create(
        model="claude-3-haiku-20240307",
        max_tokens=1024,
        messages=[
            {"role": "user", "content": "Che tempo fa a Milano?"},
            {"role": "assistant", "content": response.content},
            {"role": "user", "content": [
                {"type": "tool_result", "tool_use_id": tool_use.id, "content": json.dumps(result)}
            ]}
        ]
    )
    print(final_response.content[0].text)
```

---

## 4. Automazione di Workflow

### Pattern Comuni

#### 1. Sequential Pipeline

```
Input → Step1 → Step2 → Step3 → Output
```

Esempio: Documento → Riassunto → Traduzione → Formattazione

#### 2. Parallel Processing

```
         ┌→ Task A →┐
Input  →├→ Task B →├→ Merge → Output
         └→ Task C →┘
```

Esempio: Analisi sentiment in parallelo su multiple reviews

#### 3. Conditional Branching

```
Input → Classifier → if A → Process A
                   → if B → Process B
                   → else → Fallback
```

Esempio: Routing ticket supporto a team appropriato

#### 4. Human-in-the-Loop

```
Input → AI Processing → Human Review → if OK → Output
                                     → else → AI Refinement → ...
```

Esempio: Generazione contenuti con approvazione editoriale

### Esempio: Pipeline di Elaborazione Email

```python
def email_processing_pipeline(email_text):
    # Step 1: Classifica l'email
    classification = classify_email(email_text)

    # Step 2: Estrai informazioni chiave
    extracted_info = extract_entities(email_text)

    # Step 3: Branching basato su classificazione
    if classification == "complaint":
        response_draft = generate_apology_response(extracted_info)
        priority = "high"
    elif classification == "question":
        answer = search_knowledge_base(extracted_info["question"])
        response_draft = generate_answer(answer)
        priority = "medium"
    else:
        response_draft = generate_generic_response()
        priority = "low"

    # Step 4: Review e invio
    return {
        "classification": classification,
        "priority": priority,
        "draft_response": response_draft,
        "requires_human_review": classification == "complaint"
    }
```

---

## 5. Architetture Moderne

### MCP (Model Context Protocol)

Standard per connettere LLM a strumenti e dati esterni:

```
┌───────────┐     ┌───────────┐     ┌───────────┐
│  Claude   │ ←→  │    MCP    │ ←→  │  Tools    │
│           │     │  Server   │     │ (DB, API) │
└───────────┘     └───────────┘     └───────────┘
```

### Agentic Frameworks

| Framework | Focus |
|-----------|-------|
| LangChain | General purpose, RAG, chains |
| AutoGPT | Autonomous agents |
| CrewAI | Multi-agent collaboration |
| LlamaIndex | Data-focused RAG |

---

## Riassunto

```
┌─────────────────────────────────────────────────────────────────┐
│              APPLICAZIONI AVANZATE                               │
│                                                                  │
│  RAG (Retrieval Augmented Generation)                           │
│  └─ Dare "memoria" e conoscenza specifica ai modelli           │
│                                                                  │
│  AGENTI AI                                                       │
│  └─ Sistemi autonomi che ragionano e usano strumenti           │
│                                                                  │
│  FUNCTION CALLING                                                │
│  └─ Permettere al LLM di eseguire azioni nel mondo reale       │
│                                                                  │
│  WORKFLOW AUTOMATION                                             │
│  └─ Pipeline che combinano AI e processi tradizionali          │
│                                                                  │
└─────────────────────────────────────────────────────────────────┘
```

---

## Domande di Riflessione

1. Quando useresti RAG invece di fine-tuning?

2. Quali rischi vedi nell'usare agenti autonomi?

3. Come garantiresti che un agente non esegua azioni dannose?

---

## Risorse

- [LangChain Documentation](https://python.langchain.com/docs/)
- [Anthropic Tool Use Guide](https://docs.anthropic.com/claude/docs/tool-use)
- [RAG Paper](https://arxiv.org/abs/2005.11401)
