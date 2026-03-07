# AI Generativa - Risposte Test B

**Corso**: AI Generativa
**Griglia di valutazione**:
- Domande chiuse: 3 punti (risposta corretta) / 0 punti (risposta errata o non data)
- Domande aperte: 0-5 punti secondo i criteri indicati

---

## Parte 1: Risposte Domande Chiuse

### Domanda 1
**Risposta corretta: C**

Classificare un'email come spam o legittima e un esempio classico di AI discriminativa, che distingue tra categorie predefinite. Generare immagini (A) e scrivere poesie (B) sono esempi di AI generativa. La traduzione (D) e una forma di generazione, poiche il modello produce un nuovo testo nella lingua di destinazione.

### Domanda 2
**Risposta corretta: B**

Il paper "Attention Is All You Need" e stato pubblicato da Google nel 2017 e ha introdotto l'architettura Transformer con il meccanismo di self-attention, che e diventata la base di tutti i modelli linguistici moderni. Le altre combinazioni di organizzazione e anno non corrispondono alla storia di questa pubblicazione fondamentale.

### Domanda 3
**Risposta corretta: B**

I tokenizer dei principali LLM sono costruiti usando algoritmi come BPE (Byte Pair Encoding) su corpora prevalentemente in inglese. Le parole inglesi, essendo piu frequenti nel training del tokenizer, tendono ad essere codificate come singoli token, mentre le parole italiane, meno frequenti, vengono spezzate in piu sotto-parti. A e errata (stesso alfabeto latino); C e una generalizzazione falsa; D e errata (i modelli supportano l'italiano).

### Domanda 4
**Risposta corretta: C**

Il meccanismo di attention permette a ogni parola di "guardare" tutte le altre parole nella frase e assegnare un peso di attenzione a ciascuna. Cosi "dormiva" puo ricevere un alto score di attention verso "gatto", capendo la relazione soggetto-verbo nonostante le parole intermedie. La tokenizzazione (A) spezza il testo in unita; l'embedding (B) codifica i significati; il fine-tuning (D) specializza il modello.

### Domanda 5
**Risposta corretta: B**

"Garbage in, garbage out" significa che se l'input (il prompt) e vago, impreciso o mal formulato, anche l'output sara di scarsa qualita. E un principio fondamentale del prompt engineering che sottolinea l'importanza di formulare richieste chiare e specifiche. Le altre risposte interpretano erroneamente il significato del principio.

### Domanda 6
**Risposta corretta: C**

Il role prompting, assegnando un ruolo specifico al modello (es. "Sei un professore universitario"), ne influenza lo stile comunicativo, il tono e le competenze che simula nella risposta. Non aumenta la velocita (A), non riduce i token (B) e non fornisce conoscenze che il modello non possiede gia (D) -- modifica solo il modo in cui le esprime.

### Domanda 7
**Risposta corretta: D**

Per task che richiedono precisione e determinismo, come la generazione di codice o calcoli matematici, si usa temperature = 0, che fa scegliere sempre il token piu probabile. Valori piu alti (A, B, C) introducono progressivamente piu casualita, il che e utile per task creativi ma controproducente per task che richiedono accuratezza.

### Domanda 8
**Risposta corretta: B**

Claude non mantiene memoria tra una chiamata API e l'altra. Ogni richiesta e indipendente, quindi per avere una conversazione coerente bisogna includere nella lista `messages` tutta la cronologia dei messaggi precedenti (user e assistant). Il rate limiting (A) e un concetto diverso; il system prompt (C) non cambia necessariamente; ridurre i token (D) non e lo scopo.

### Domanda 9
**Risposta corretta: B**

In Claude Code si usa il prefisso `@` seguito dal nome del file (es. `@app.py`) per fare riferimento a un file specifico del progetto e includerlo nel contesto. I comandi `/file` (A), `#include` (C) e `/read` (D) non sono comandi reali di Claude Code per questo scopo.

### Domanda 10
**Risposta corretta: B**

L'approccio corretto e: Capire il problema prima, Generare il codice con l'AI, Capire il codice generato, Testare che funzioni correttamente, Adattare per il caso specifico. Questo ciclo garantisce che lo sviluppatore mantenga sempre la comprensione del codice. Le altre sequenze (A, C, D) non riflettono le best practices del corso per lo sviluppo assistito dall'AI.

### Domanda 11
**Risposta corretta: B**

La struttura consigliata per un prompt di generazione immagini e: Soggetto (cosa) + Stile (artistico) + Dettagli (ambiente, colori) + Tecnica (illuminazione, composizione) + Qualita (risoluzione, dettaglio). Le altre combinazioni (A, C, D) non riflettono la struttura completa insegnata nel corso.

### Domanda 12
**Risposta corretta: C**

Stable Diffusion (di Stability AI) e l'unico modello open source tra quelli elencati, e puo essere eseguito localmente senza costi di utilizzo (self-hosted). DALL-E 3 (A) e closed source di OpenAI; Midjourney (B) e accessibile solo via Discord in abbonamento; Imagen (D) e un prodotto enterprise di Google.

### Domanda 13
**Risposta corretta: B**

Le allucinazioni sono output che appaiono plausibili e ben formulati ma contengono informazioni false o inventate. Il modello genera testo convincente basandosi sui pattern appresi, senza "sapere" se cio che produce e vero. Non sono errori hardware (A), non riguardano la creativita eccessiva (C) e non dipendono dalla connessione (D).

### Domanda 14
**Risposta corretta: C**

Il RAG (Retrieval Augmented Generation) permette di fornire al modello informazioni specifiche e verificate recuperandole da documenti reali, riducendo cosi la probabilita di allucinazioni. Aumentare la temperature (A) peggiorerebbe il problema; usare il modello piu costoso (B) non risolve le allucinazioni di per se; rimuovere il system prompt (D) non e una strategia di mitigazione.

### Domanda 15
**Risposta corretta: B**

L'AI Act europeo impone l'obbligo di trasparenza: i contenuti generati dall'AI devono essere dichiarati come tali. Questo include la documentazione del modello e la disclosure quando il contenuto e AI-generated. Le altre opzioni (gratuita per i cittadini, offline, approvazione parlamentare) non corrispondono agli obblighi reali previsti dalla normativa.

---

## Parte 2: Risposte Domande Aperte

### Domanda 16
**Risposta modello:**

Un sistema **RAG** (Retrieval Augmented Generation) risolve i limiti intrinseci degli LLM -- knowledge cutoff, mancanza di dati specifici e allucinazioni -- fornendo al modello informazioni recuperate da documenti reali come contesto. I suoi componenti principali sono: (1) il **Document Loader**, che carica documenti di vari formati (PDF, Word, HTML); (2) il **Text Splitter**, che divide i documenti in "chunk" di dimensioni gestibili; (3) l'**Embedding Model**, che converte ogni chunk in un vettore numerico che ne rappresenta il significato; (4) il **Vector Database** (come Pinecone, Chroma o FAISS), che memorizza questi vettori e permette la ricerca per similarita; (5) il **LLM**, che genera la risposta finale usando il contesto recuperato. Il flusso di una query e: l'utente pone una domanda, questa viene convertita in un embedding, il vector database trova i chunk piu simili, questi vengono inseriti nel prompt insieme alla domanda, e il LLM genera una risposta basata sui documenti reali anziche sulla sola conoscenza di training. RAG e preferibile al semplice LLM per dati aziendali perche garantisce risposte basate su documenti verificati, aggiornati e specifici, senza necessita di riaddestramento del modello.

**Criteri di valutazione:**
- 5 punti: risposta completa e ben strutturata che copre tutti i 5 componenti, il flusso di query e la motivazione del vantaggio rispetto al semplice LLM
- 3-4 punti: risposta parziale che copre i concetti principali ma omette alcuni componenti o non spiega adeguatamente il flusso
- 1-2 punti: risposta incompleta o con errori significativi, definizione vaga senza dettagli sui componenti
- 0 punti: risposta assente o completamente errata

### Domanda 17
**Risposta modello:**

I tre strumenti offrono modi diversi di interagire con Claude, ciascuno ottimizzato per scenari specifici. L'**interfaccia web** (claude.ai) e una chat interattiva con interfaccia grafica, ideale per uso generale, domande casuali, analisi di documenti caricati e conversazioni esplorative; il suo vantaggio principale e la semplicita d'uso senza necessita di programmazione. L'**API Python** offre accesso programmatico completo a Claude, permettendo automazione, integrazione in applicazioni, elaborazione batch e personalizzazione totale dei parametri (model, temperature, max_tokens, system prompt); e ideale per costruire chatbot, pipeline di elaborazione dati o applicazioni che necessitano di chiamate automatizzate. **Claude Code** e un tool CLI pensato specificamente per lo sviluppo software: si integra nel terminale, puo leggere e modificare file del progetto (con la sintassi @file.py), eseguire comandi shell e mantenere il contesto del progetto durante la sessione; e ideale per pair programming, refactoring, debugging e generazione di codice all'interno di un progetto esistente. La scelta dipende dallo scenario: web per uso quotidiano e domande, API per applicazioni e automazione, Claude Code per sviluppo software integrato.

**Criteri di valutazione:**
- 5 punti: risposta completa e ben strutturata che copre tutti e tre gli strumenti con caratteristiche, vantaggi e scenari d'uso concreti
- 3-4 punti: risposta parziale che copre i tre strumenti ma manca di dettagli su vantaggi o scenari specifici
- 1-2 punti: risposta incompleta, descrizione vaga di uno o due strumenti senza confronto
- 0 punti: risposta assente o completamente errata

### Domanda 18
**Risposta modello:**

I **bias** nell'AI generativa sono pregiudizi sistematici nei risultati del modello, che originano principalmente da tre fonti: i **dati di training** (internet contiene pregiudizi storici e culturali, con sovrarappresentazione di alcune demografie e sottorappresentazione di minoranze), il **processo di selezione dei dati** (chi decide quali fonti includere nel dataset) e il **design del modello** (ottimizzazione per metriche specifiche). Esempi concreti includono il **bias di genere**, per cui il modello tende ad associare "infermiere" a immagini femminili e "CEO" a immagini maschili, riflettendo stereotipi presenti nei dati; il **bias culturale**, con un default verso la cultura occidentale che sottorappresenta altre culture nelle risposte; e il **bias linguistico**, per cui i modelli hanno performance migliori in inglese rispetto ad altre lingue. Per mitigare questi problemi, un utente puo: mantenere **consapevolezza** del problema e non dare per scontata la neutralita degli output; effettuare una **verifica critica** dei risultati, soprattutto per decisioni che impattano persone; utilizzare **prompt espliciti** che richiedano diversita e inclusivita nelle risposte; e **segnalare** i problemi riscontrati agli sviluppatori del modello.

**Criteri di valutazione:**
- 5 punti: risposta completa e ben strutturata che copre origini dei bias, almeno due esempi concreti e strategie di mitigazione lato utente
- 3-4 punti: risposta parziale che copre i concetti principali ma manca di esempi specifici o di strategie di mitigazione
- 1-2 punti: risposta incompleta, definizione generica senza esempi o senza strategie
- 0 punti: risposta assente o completamente errata
