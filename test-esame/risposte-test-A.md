# AI Generativa - Risposte Test A

**Corso**: AI Generativa
**Griglia di valutazione**:
- Domande chiuse: 3 punti (risposta corretta) / 0 punti (risposta errata o non data)
- Domande aperte: 0-5 punti secondo i criteri indicati

---

## Parte 1: Risposte Domande Chiuse

### Domanda 1
**Risposta corretta: B**

L'AI discriminativa impara a classificare o distinguere tra categorie esistenti (es. spam/non spam, gatto/cane), mentre l'AI generativa impara a creare nuovi contenuti (testo, immagini, audio, video). La risposta A e errata perche entrambe usano reti neurali; C e errata perche l'AI discriminativa puo lavorare con diversi tipi di dati; D e errata perche le GAN (generative) risalgono al 2014.

### Domanda 2
**Risposta corretta: B**

Ian Goodfellow ha inventato le GAN nel 2014. Questa innovazione ha introdotto l'idea di due reti che competono: una genera contenuti e l'altra li giudica. Le altre risposte associano inventori e date errate: Hinton e noto per il deep learning ma non per le GAN, LeCun per le CNN, Hassabis per DeepMind.

### Domanda 3
**Risposta corretta: C**

Un token e l'unita base di elaborazione di un LLM e non corrisponde necessariamente a una parola intera. Le parole comuni possono essere un singolo token, mentre parole rare vengono "spezzate" in piu token. La risposta A e errata perche le parole rare vengono divise; B e errata perche i token sono piu grandi dei singoli caratteri; D e completamente fuori contesto.

### Domanda 4
**Risposta corretta: B**

L'operazione vettoriale "Re - Uomo + Donna" produce un vettore prossimo a "Regina" nello spazio degli embedding. Questo dimostra che gli embedding catturano relazioni semantiche sotto forma di direzioni nello spazio multidimensionale. Le altre risposte sono plausibili ma non corrispondono al risultato noto di questa operazione aritmetica sugli embedding.

### Domanda 5
**Risposta corretta: C**

Nello schema ICIF (Istruzione, Contesto, Input, Formato), la F sta per Formato e indica come si desidera che sia strutturata la risposta (lista, tabella, JSON, ecc.). Le altre opzioni sono plausibili ma non corrispondono all'acronimo: Funzionalita, Feedback e Finalita non fanno parte dello schema.

### Domanda 6
**Risposta corretta: B**

Il few-shot prompting consiste nel fornire alcuni esempi di input/output prima della richiesta vera, in modo che il modello comprenda il formato e il tipo di risposta desiderata. Lo zero-shot (A) non usa esempi; il chain-of-thought (C) riguarda il ragionamento passo per passo; il role prompting (D) assegna un ruolo al modello.

### Domanda 7
**Risposta corretta: B**

"Pensiamo passo per passo" (o "Let's think step by step") e la frase trigger classica del chain-of-thought prompting, che spinge il modello a esplicitare il ragionamento intermedio. Le altre frasi non attivano il ragionamento multi-step: A chiede concisione, C assegna un ruolo, D specifica un formato di output.

### Domanda 8
**Risposta corretta: C**

Il parametro `temperature` controlla la casualita/creativita della risposta: 0 rende la risposta deterministica, valori piu alti la rendono piu creativa. `max_tokens` (A) limita la lunghezza della risposta; `top_k` (B) e un parametro di campionamento diverso; `stop_sequences` (D) definisce quando fermare la generazione.

### Domanda 9
**Risposta corretta: B**

Quando `stop_reason` e `"max_tokens"`, significa che la risposta e stata interrotta perche ha raggiunto il limite di token specificato nel parametro `max_tokens`, e quindi potrebbe essere incompleta. `"end_turn"` (A) indicherebbe una risposta completa; C e D descrivono situazioni diverse non rappresentate da questo valore.

### Domanda 10
**Risposta corretta: B**

Claude Code richiede Node.js 18 o superiore come prerequisito per l'installazione, dato che si installa tramite npm (`npm install -g @anthropic-ai/claude-code`). Non richiede Python (A), Docker (C) o Java (D) per il proprio funzionamento.

### Domanda 11
**Risposta corretta: C**

Il comando `/cost` in Claude Code mostra i costi della sessione corrente in termini di token utilizzati. `/help` (A) mostra i comandi disponibili, `/clear` (B) pulisce la conversazione, `/history` (D) mostra la cronologia delle interazioni.

### Domanda 12
**Risposta corretta: B**

I diffusion models generano immagini partendo da rumore casuale (noise) e rimuovendolo gradualmente attraverso una serie di passi (reverse process), guidati dal prompt testuale dell'utente. Non combinano frammenti (A), non lavorano pixel per pixel in ordine (C) e, sebbene le GAN (D) esistano, i diffusion models usano un meccanismo diverso.

### Domanda 13
**Risposta corretta: C**

Claude Vision puo analizzare, descrivere e confrontare immagini, ed estrarre testo (OCR), ma non puo generare nuove immagini. Per la generazione di immagini servono modelli dedicati come DALL-E, Stable Diffusion o Midjourney. Le opzioni A, B e D descrivono tutte capacita che Claude Vision possiede.

### Domanda 14
**Risposta corretta: D**

Il social scoring e esplicitamente vietato dall'AI Act europeo, in quanto considerato una delle applicazioni piu pericolose e incompatibili con i valori fondamentali dell'UE. Le categorie inferiori (rischio minimo, limitato, alto) prevedono gradi crescenti di regolamentazione ma non il divieto assoluto.

### Domanda 15
**Risposta corretta: B**

In un sistema RAG, il vector database ha il compito di memorizzare gli embedding vettoriali dei documenti e di permettere la ricerca per similarita (similarity search) quando arriva una query. Non genera risposte (A, compito del LLM), non addestra il modello (C) e non traduce query (D).

---

## Parte 2: Risposte Domande Aperte

### Domanda 16
**Risposta modello:**

L'addestramento di un LLM avviene in tre fasi principali. La prima e il **pre-training**, il cui obiettivo e insegnare al modello il linguaggio: il modello viene addestrato su enormi quantita di testo (internet, libri, codice) con il compito di predire la prossima parola, producendo un modello "base" che comprende il linguaggio ma non e ancora specializzato. La seconda fase e il **fine-tuning**, che mira a specializzare il modello per compiti specifici utilizzando dataset piu piccoli e mirati (es. dialoghi per chat, codice per coding). La terza fase e il **RLHF** (Reinforcement Learning from Human Feedback), che allinea il modello ai valori umani: valutatori umani giudicano diverse risposte, viene addestrato un reward model sulle loro preferenze, e il modello originale viene ottimizzato per massimizzare questo reward. Questo processo e fondamentale per rendere il modello utile e sicuro. Anthropic aggiunge l'approccio **Constitutional AI**, in cui il modello segue principi espliciti ("la costituzione"), si autocritica e si auto-migliora, garantendo maggiore trasparenza nei valori che guidano le risposte.

**Criteri di valutazione:**
- 5 punti: risposta completa e ben strutturata che copre tutti i punti chiave (le tre fasi con obiettivi, dati e risultati, piu Constitutional AI)
- 3-4 punti: risposta parziale che copre i concetti principali ma omette dettagli su una o due fasi o su Constitutional AI
- 1-2 punti: risposta incompleta o con errori significativi nelle descrizioni delle fasi
- 0 punti: risposta assente o completamente errata

### Domanda 17
**Risposta modello:**

Le tre tecniche di prompting si distinguono per il livello di guida fornita al modello. Lo **zero-shot prompting** consiste nel chiedere al modello di eseguire un compito senza fornire alcun esempio: e appropriato per task semplici e comuni come traduzione, riassunto o classificazione di base. Ad esempio, si puo chiedere "Classifica questa recensione come positiva o negativa: 'Il prodotto e fantastico'" senza bisogno di esempi. Il **few-shot prompting** prevede di fornire alcuni esempi di input/output prima della richiesta reale: e ideale quando si necessita un formato specifico o un task personalizzato. Ad esempio, per classificare il sentiment in categorie custom (positivo/negativo/neutro) si fornirebbero 2-3 recensioni gia classificate come modello. Il **chain-of-thought prompting** spinge il modello a esplicitare il ragionamento intermedio passo per passo: e la tecnica migliore per problemi che richiedono ragionamento multi-step come calcoli matematici, analisi logiche o debugging. Ad esempio, per un problema aritmetico si aggiunge "Pensiamo passo per passo" per far mostrare al modello tutti i passaggi intermedi prima della risposta finale.

**Criteri di valutazione:**
- 5 punti: risposta completa e ben strutturata che copre tutte e tre le tecniche con definizione, quando usarle e un esempio concreto ciascuna
- 3-4 punti: risposta parziale che copre le tre tecniche ma manca di esempi o di indicazioni su quando usarle
- 1-2 punti: risposta incompleta, confonde le tecniche o ne copre solo una o due senza adeguata spiegazione
- 0 punti: risposta assente o completamente errata

### Domanda 18
**Risposta modello:**

Un **agente AI** e un sistema autonomo capace di ragionare su un obiettivo, pianificare le azioni necessarie, utilizzare strumenti esterni e iterare fino al completamento del compito. A differenza di un semplice chatbot, che si limita a rispondere a domande in modo reattivo, un agente puo prendere decisioni, eseguire azioni nel mondo reale (tramite API, database, ricerche web) e adattare il proprio comportamento in base ai risultati ottenuti. Il **loop ReAct** (Reason + Act) descrive il ciclo operativo dell'agente: prima il modello formula un pensiero (Thought) ragionando su cosa fare, poi esegue un'azione (Action) usando uno strumento disponibile, osserva il risultato (Observation) e decide se ha raggiunto l'obiettivo o se deve continuare con un nuovo ciclo. Un esempio pratico: un agente incaricato di organizzare un viaggio potrebbe prima cercare voli disponibili tramite un'API, poi verificare la disponibilita di hotel, controllare il calendario dell'utente per confermare le date e infine inviare una email di conferma. Claude Code stesso e un esempio di coding agent: legge il codice, propone modifiche, esegue test e itera fino alla soluzione.

**Criteri di valutazione:**
- 5 punti: risposta completa e ben strutturata che copre definizione di agente, loop ReAct con le sue fasi, differenza con chatbot e un esempio pratico con strumenti
- 3-4 punti: risposta parziale che descrive gli agenti e il loop ma manca di esempio concreto o di confronto con chatbot
- 1-2 punti: risposta incompleta, definizione vaga senza spiegazione del loop ReAct
- 0 punti: risposta assente o completamente errata
