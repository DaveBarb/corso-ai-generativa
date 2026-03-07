# AI Generativa - Test d'Esame C

**Corso**: AI Generativa
**Durata**: 60 minuti
**Punteggio**: Domande chiuse: 3 punti ciascuna (max 45) | Domande aperte: 5 punti ciascuna (max 15) | **Totale: 60 punti**
**Sufficienza**: 36/60 punti

---

## Parte 1: Domande a Risposta Chiusa

**Istruzioni**: Selezionare UNA sola risposta corretta per ogni domanda.

### Domanda 1
Quale analogia viene usata nel corso per descrivere la differenza tra AI discriminativa e AI generativa?

- A) Un giudice e un avvocato
- B) Un critico d'arte che riconosce stili vs un artista che crea opere nuove
- C) Un insegnante e uno studente
- D) Un traduttore e uno scrittore

### Domanda 2
Quale evento del 2022 ha reso l'AI generativa "mainstream", cioe accessibile al grande pubblico?

- A) Il rilascio di GPT-3 da parte di OpenAI
- B) La pubblicazione del paper sui Transformer
- C) Il lancio di ChatGPT e di Stable Diffusion
- D) La fondazione di Anthropic

### Domanda 3
Come genera testo un LLM?

- A) Scrive l'intera risposta in un unico passaggio dopo aver analizzato tutto il prompt
- B) Seleziona frasi predefinite da un database di risposte
- C) Predice e genera un token alla volta, in sequenza
- D) Traduce il prompt in codice macchina e poi lo riconverte in testo

### Domanda 4
In un'architettura Transformer, la Multi-Head Attention utilizza piu "teste" in parallelo. Qual e lo scopo di questo design?

- A) Rendere il modello piu veloce nell'elaborazione
- B) Ogni testa puo catturare relazioni diverse (grammaticali, semantiche, posizionali)
- C) Ridurre il consumo di memoria del modello
- D) Permettere al modello di generare risposte in lingue diverse contemporaneamente

### Domanda 5
Qual e l'errore di prompt engineering descritto come "istruzioni contraddittorie"?

- A) Fornire troppi esempi nel few-shot
- B) Chiedere una risposta contemporaneamente "breve e dettagliata" senza specificare vincoli chiari
- C) Non specificare il formato di output
- D) Usare un role prompting inappropriato

### Domanda 6
Nella tecnica few-shot prompting, quale di queste e una best practice per la scelta degli esempi?

- A) Usare sempre esempi molto lunghi e complessi
- B) Inserire almeno 20 esempi per ogni task
- C) Fornire esempi rappresentativi, diversificati, corretti e concisi
- D) Usare solo esempi positivi, mai casi negativi

### Domanda 7
Nell'API di Claude, qual e la differenza principale tra il parametro `system` e un messaggio con `role: "user"`?

- A) Non c'e alcuna differenza, sono intercambiabili
- B) Il system prompt definisce il comportamento generale ed e invisibile all'utente, mentre il messaggio user contiene le richieste specifiche
- C) Il system prompt e obbligatorio, il messaggio user e opzionale
- D) Il system prompt puo contenere solo testo in inglese

### Domanda 8
Quale metodo HTTP viene prevalentemente utilizzato per inviare richieste alle API dei Large Language Models?

- A) GET
- B) PUT
- C) POST
- D) DELETE

### Domanda 9
Perche e fondamentale non inserire mai un'API key direttamente nel codice sorgente?

- A) Perche rallenta l'esecuzione del programma
- B) Perche potrebbe essere committata su repository pubblici ed esposta a terzi non autorizzati
- C) Perche le API key hanno una scadenza e vanno rigenerate ad ogni avvio
- D) Perche il codice con API key incorporate non compila correttamente

### Domanda 10
In Claude Code, cosa fa il comando `/compact`?

- A) Comprime i file del progetto
- B) Riassume la conversazione corrente per risparmiare contesto
- C) Elimina i file temporanei
- D) Riduce la risoluzione delle immagini nel progetto

### Domanda 11
Quale tra questi NON e un problema comune nella generazione di immagini con diffusion models?

- A) Mani e dita deformate
- B) Testo illeggibile o con errori nelle immagini
- C) Impossibilita di generare paesaggi naturalistici
- D) Inconsistenza nel mantenere lo stesso personaggio tra immagini diverse

### Domanda 12
Quali formati di immagine supporta Claude Vision per l'analisi?

- A) Solo JPEG e PNG
- B) JPEG, PNG, GIF, WebP
- C) Solo formati vettoriali come SVG
- D) BMP, TIFF e RAW

### Domanda 13
Nel function calling (tool use) con l'API di Claude, cosa accade quando il modello decide di usare uno strumento esterno?

- A) Il modello esegue direttamente la funzione sul server di Anthropic
- B) Il modello restituisce la risposta con `stop_reason` uguale a `"tool_use"` e il sistema deve eseguire la funzione e restituire il risultato
- C) Il modello invia una email all'utente con i parametri della funzione
- D) La funzione viene eseguita automaticamente nel browser dell'utente

### Domanda 14
Secondo la classificazione dell'AI Act europeo, in quale categoria di rischio rientrano le applicazioni AI usate in ambito sanitario e giudiziario?

- A) Rischio minimo
- B) Rischio limitato
- C) Alto rischio
- D) Vietato

### Domanda 15
Quale pattern di automazione prevede che l'output dell'AI venga revisionato da un essere umano prima di procedere?

- A) Sequential Pipeline
- B) Parallel Processing
- C) Conditional Branching
- D) Human-in-the-Loop

---

## Parte 2: Domande a Risposta Aperta

**Istruzioni**: Rispondere in modo completo e strutturato (5-10 righe per domanda).

### Domanda 16
Descrivi il processo di funzionamento dei diffusion models per la generazione di immagini, spiegando le fasi di forward process e reverse process. Confronta poi brevemente i principali modelli disponibili (DALL-E, Stable Diffusion, Midjourney) indicando per ciascuno un punto di forza e uno scenario d'uso ideale.

### Domanda 17
Un tuo collega ha scritto il seguente prompt: "Aiutami con il codice". Spiega perche questo prompt e inefficace, quali elementi mancano secondo lo schema ICIF e la checklist della specificita, e riscrivi il prompt in una versione efficace per una richiesta concreta a tua scelta (ad esempio: creazione di una funzione, debugging, refactoring).

### Domanda 18
Discuti l'impatto dell'AI generativa sul mondo del lavoro. Descrivi quali categorie di lavori sono piu a rischio di automazione e quali sono piu resistenti, spiegandone le ragioni. Indica infine almeno tre consigli pratici per un professionista che vuole prepararsi al meglio per un futuro lavorativo sempre piu influenzato dall'AI.
