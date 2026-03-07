# AI Generativa - Test d'Esame B

**Corso**: AI Generativa
**Durata**: 60 minuti
**Punteggio**: Domande chiuse: 3 punti ciascuna (max 45) | Domande aperte: 5 punti ciascuna (max 15) | **Totale: 60 punti**
**Sufficienza**: 36/60 punti

---

## Parte 1: Domande a Risposta Chiusa

**Istruzioni**: Selezionare UNA sola risposta corretta per ogni domanda.

### Domanda 1
Quale tra i seguenti e un esempio di AI discriminativa?

- A) Generare un'immagine a partire da una descrizione testuale
- B) Scrivere una poesia in stile dantesco
- C) Classificare un'email come spam o legittima
- D) Tradurre un testo dall'italiano all'inglese

### Domanda 2
Il paper "Attention Is All You Need", che ha introdotto l'architettura Transformer, e stato pubblicato da quale organizzazione e in quale anno?

- A) OpenAI nel 2018
- B) Google nel 2017
- C) Facebook nel 2019
- D) Anthropic nel 2020

### Domanda 3
Perche un LLM potrebbe utilizzare piu token per una parola in italiano rispetto alla stessa parola in inglese?

- A) Perche l'italiano ha un alfabeto piu grande
- B) Perche il vocabolario del tokenizer e costruito prevalentemente su testi in inglese, rendendo le parole italiane meno frequenti e quindi "spezzate" in piu parti
- C) Perche le parole italiane sono sempre piu lunghe di quelle inglesi
- D) Perche il modello non supporta la lingua italiana

### Domanda 4
Quale meccanismo permette a un LLM di capire che nella frase "Il gatto, che era nero, dormiva sul divano" il verbo "dormiva" si riferisce a "gatto" e non a "divano"?

- A) La tokenizzazione
- B) L'embedding
- C) Il meccanismo di attention
- D) Il fine-tuning

### Domanda 5
Nel prompt engineering, cosa significa il principio "Garbage in, garbage out"?

- A) I modelli producono sempre output di bassa qualita
- B) Un input vago o impreciso produrra un output altrettanto vago o impreciso
- C) I dati di training contengono errori
- D) Il modello scarta automaticamente gli input di bassa qualita

### Domanda 6
Nel role prompting, qual e l'effetto di assegnare un ruolo specifico al modello?

- A) Aumenta la velocita di generazione della risposta
- B) Riduce il numero di token utilizzati
- C) Influenza lo stile, il tono e le competenze simulate nella risposta
- D) Fornisce al modello conoscenze che non possiede

### Domanda 7
Nell'API di Anthropic, quale valore di temperature utilizzeresti per un task che richiede risposte precise e deterministiche, come la generazione di codice?

- A) temperature = 2.0
- B) temperature = 1.0
- C) temperature = 0.8
- D) temperature = 0

### Domanda 8
Perche nelle conversazioni multi-turn con l'API di Claude e necessario passare l'intera cronologia dei messaggi ad ogni chiamata?

- A) Per rispettare i limiti di rate limiting
- B) Perche Claude non ha memoria tra una chiamata API e l'altra
- C) Perche il system prompt cambia ad ogni richiesta
- D) Per ridurre il numero di token nella risposta

### Domanda 9
Quale strumento si utilizza in Claude Code per fare riferimento a un file specifico del progetto?

- A) Il comando /file
- B) Il prefisso @ seguito dal nome del file
- C) Il comando #include
- D) Il comando /read

### Domanda 10
Secondo le best practices del corso, quale approccio in 5 fasi si dovrebbe seguire quando si usa l'AI per lo sviluppo di codice?

- A) Generare, Copiare, Incollare, Eseguire, Pubblicare
- B) Capire, Generare, Capire, Testare, Adattare
- C) Scrivere, Compilare, Debuggare, Testare, Rilasciare
- D) Chiedere, Ricevere, Accettare, Committare, Pushare

### Domanda 11
Nella formula di un prompt per la generazione di immagini, qual e la struttura consigliata?

- A) Titolo + Descrizione + Hashtag
- B) Soggetto + Stile + Dettagli + Tecnica + Qualita
- C) Colore + Forma + Dimensione
- D) Prompt + Negativo + Seed

### Domanda 12
Quale modello per la generazione di immagini e open source e puo essere eseguito localmente?

- A) DALL-E 3
- B) Midjourney
- C) Stable Diffusion
- D) Imagen

### Domanda 13
Cosa sono le "allucinazioni" nel contesto dei Large Language Models?

- A) Errori hardware che causano output corrotti
- B) Output che sembrano plausibili ma contengono informazioni false
- C) Risposte troppo creative che non rispettano il prompt
- D) Problemi di connessione durante la generazione della risposta

### Domanda 14
Quale tra le seguenti e una strategia efficace per mitigare le allucinazioni di un LLM?

- A) Aumentare la temperature a 2.0
- B) Usare esclusivamente il modello piu costoso
- C) Utilizzare RAG per fornire al modello informazioni specifiche e verificate
- D) Rimuovere il system prompt dalla richiesta

### Domanda 15
Secondo l'AI Act europeo, quale obbligo hanno i sistemi di AI generativa riguardo ai contenuti prodotti?

- A) Devono essere gratuiti per i cittadini europei
- B) Devono dichiarare che il contenuto e stato generato dall'AI (trasparenza)
- C) Devono funzionare esclusivamente offline
- D) Devono essere approvati dal Parlamento Europeo prima della pubblicazione

---

## Parte 2: Domande a Risposta Aperta

**Istruzioni**: Rispondere in modo completo e strutturato (5-10 righe per domanda).

### Domanda 16
Spiega come funziona un sistema RAG (Retrieval Augmented Generation): descrivi i suoi componenti principali (document loader, text splitter, embedding model, vector database, LLM), il flusso di una query e perche questo approccio e preferibile al semplice utilizzo di un LLM quando si lavora con dati aziendali o documenti specifici.

### Domanda 17
Confronta i tre principali strumenti per interagire con Claude (interfaccia web claude.ai, API Python, Claude Code). Per ciascuno, indica le caratteristiche principali, i vantaggi e almeno uno scenario d'uso ideale. Spiega quando e piu appropriato scegliere l'uno piuttosto che l'altro.

### Domanda 18
Analizza il tema dei bias nell'AI generativa: spiega da dove originano i bias nei modelli, fornisci almeno due esempi concreti di bias (di genere, culturale o linguistico) e descrivi le strategie che un utente puo adottare per mitigare questi problemi quando utilizza modelli generativi.
