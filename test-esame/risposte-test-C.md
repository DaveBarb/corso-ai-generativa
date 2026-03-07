# AI Generativa - Risposte Test C

**Corso**: AI Generativa
**Griglia di valutazione**:
- Domande chiuse: 3 punti (risposta corretta) / 0 punti (risposta errata o non data)
- Domande aperte: 0-5 punti secondo i criteri indicati

---

## Parte 1: Risposte Domande Chiuse

### Domanda 1
**Risposta corretta: B**

Il corso usa l'analogia del critico d'arte che riconosce lo stile di diversi pittori (AI discriminativa) e dell'artista che, dopo aver studiato migliaia di opere, crea qualcosa di nuovo (AI generativa). Le altre analogie (A, C, D) non corrispondono a quelle presentate nel materiale didattico.

### Domanda 2
**Risposta corretta: C**

Il 2022 e considerato l'anno della svolta perche ChatGPT (LLM ottimizzato per conversazioni di OpenAI) e Stable Diffusion (modello open source per immagini) hanno reso l'AI generativa accessibile al grande pubblico. GPT-3 (A) e del 2020; il paper sui Transformer (B) e del 2017; la fondazione di Anthropic (D) non corrisponde all'evento che ha reso l'AI mainstream.

### Domanda 3
**Risposta corretta: C**

Un LLM genera testo predicendo e producendo un token alla volta in sequenza: dato l'input, predice il token piu probabile successivo, lo aggiunge al contesto, e ripete il processo fino a completare la risposta. Non scrive tutto in un passaggio (A), non seleziona frasi predefinite (B) e non traduce in codice macchina (D).

### Domanda 4
**Risposta corretta: B**

La Multi-Head Attention utilizza piu "teste" in parallelo perche ciascuna puo specializzarsi nel catturare un tipo diverso di relazione: una testa puo cogliere le relazioni grammaticali, un'altra quelle semantiche, un'altra ancora quelle posizionali. Non serve principalmente per la velocita (A), per ridurre la memoria (C) o per la generazione multilingue simultanea (D).

### Domanda 5
**Risposta corretta: B**

Le istruzioni contraddittorie sono un errore comune che si verifica quando si danno indicazioni incompatibili nel prompt, come chiedere una risposta "breve e dettagliata" senza fornire criteri chiari per bilanciare le due richieste (meglio: "massimo 100 parole, includendo i 3 punti chiave"). Le altre opzioni descrivono errori diversi o non sono errori specifici.

### Domanda 6
**Risposta corretta: C**

Le best practices per il few-shot prevedono che gli esempi siano rappresentativi (coprano i casi principali), diversificati (mostrino varieta), corretti (esempi errati producono output errati) e concisi (non troppo lunghi). Esempi lunghi e complessi (A) sono controproducenti; 20 esempi (B) sono eccessivi e raramente necessari; usare solo esempi positivi (D) non copre adeguatamente la varieta.

### Domanda 7
**Risposta corretta: B**

Il system prompt definisce il comportamento generale del modello (ruolo, regole, formato), persiste durante la conversazione e non e visibile come parte della conversazione utente. Il messaggio user contiene le richieste specifiche dell'utente. Non sono intercambiabili (A); il system prompt e opzionale, non obbligatorio (C); puo contenere testo in qualsiasi lingua (D).

### Domanda 8
**Risposta corretta: C**

Per le API dei LLM si utilizza quasi sempre il metodo HTTP POST, perche si inviano dati (il prompt, i parametri) al server per ottenere una risposta. GET (A) e usato per leggere dati; PUT (B) per aggiornare risorse; DELETE (D) per cancellare risorse. Nessuno di questi e adatto per inviare prompt a un modello linguistico.

### Domanda 9
**Risposta corretta: B**

Inserire un'API key direttamente nel codice sorgente e pericoloso perche il codice potrebbe essere committato su repository Git pubblici o condiviso, esponendo la chiave a terzi non autorizzati che potrebbero usarla per effettuare chiamate API a spese del proprietario. Non rallenta l'esecuzione (A); le API key non scadono automaticamente ad ogni avvio (C); il codice compila comunque (D).

### Domanda 10
**Risposta corretta: B**

Il comando `/compact` in Claude Code riassume la conversazione corrente, condensando i messaggi precedenti per risparmiare spazio nel contesto e permettere sessioni piu lunghe senza superare il limite di token. Non comprime file (A), non elimina file temporanei (C) e non modifica immagini (D).

### Domanda 11
**Risposta corretta: C**

I diffusion models sono generalmente molto capaci nella generazione di paesaggi naturalistici, che e uno dei loro punti di forza. I problemi reali includono: mani e dita deformate (A), testo illeggibile o con errori (B) e inconsistenza nel mantenere lo stesso personaggio tra immagini diverse (D).

### Domanda 12
**Risposta corretta: B**

Claude Vision supporta i formati JPEG, PNG, GIF e WebP, oltre ai PDF con estrazione immagini. Non supporta solo JPEG e PNG (A e troppo restrittiva); i formati vettoriali SVG (C) non sono nell'elenco dei formati supportati; BMP, TIFF e RAW (D) non sono tra i formati elencati nel corso.

### Domanda 13
**Risposta corretta: B**

Quando Claude decide di usare uno strumento esterno, la risposta API ha `stop_reason` uguale a `"tool_use"` e contiene i dettagli della funzione da chiamare e i parametri. Il sistema dell'applicazione deve quindi eseguire la funzione reale e restituire il risultato a Claude per la risposta finale. Il modello non esegue direttamente le funzioni (A), non invia email (C) e le funzioni non vengono eseguite nel browser (D).

### Domanda 14
**Risposta corretta: C**

Le applicazioni AI in ambito sanitario e giudiziario sono classificate come "alto rischio" dall'AI Act e sono soggette a regolamentazione specifica con obblighi di conformita, valutazione dei rischi e supervisione umana. Non sono a rischio minimo (A) ne a rischio limitato (B); non sono vietate (D) ma richiedono il rispetto di requisiti stringenti.

### Domanda 15
**Risposta corretta: D**

Il pattern Human-in-the-Loop prevede che l'output dell'AI venga revisionato e approvato da un essere umano prima di procedere, con possibilita di iterare se il risultato non e soddisfacente. Sequential Pipeline (A) e una catena di passaggi automatici; Parallel Processing (B) esegue task in parallelo; Conditional Branching (C) instrada verso percorsi diversi in base a condizioni.

---

## Parte 2: Risposte Domande Aperte

### Domanda 16
**Risposta modello:**

I **diffusion models** generano immagini attraverso un processo in due fasi. Nel **forward process** (durante il training), il modello prende immagini reali e vi aggiunge rumore gradualmente attraverso molti step, fino a trasformarle in puro rumore casuale; il modello impara a prevedere il rumore aggiunto in ogni step. Nel **reverse process** (durante la generazione), il modello parte da rumore casuale e lo rimuove gradualmente step dopo step, "scolpendo" un'immagine coerente; il prompt testuale condiziona questo processo, guidando il modello verso uno specifico tipo di immagine. Tra i principali modelli: **DALL-E 3** (OpenAI) eccelle nella comprensione dei prompt in linguaggio naturale e nella generazione di testo nelle immagini, ideale per uso generale e per chi necessita di prompt semplici e intuitivi. **Stable Diffusion** (Stability AI) e open source e personalizzabile, supporta negative prompt e seed fissi, ideale per chi ha budget limitato o necessita di controllo fine e sperimentazione locale. **Midjourney** produce immagini di qualita artistica eccezionale, ideale per concept art, illustrazioni e quando la resa estetica e la priorita assoluta. La scelta dipende quindi dal bilanciamento tra facilita d'uso, controllo, qualita estetica e budget.

**Criteri di valutazione:**
- 5 punti: risposta completa e ben strutturata che copre forward/reverse process con spiegazione chiara, e confronto dei tre modelli con punti di forza e scenari d'uso
- 3-4 punti: risposta parziale che spiega il funzionamento dei diffusion models ma confronta i modelli in modo superficiale, o viceversa
- 1-2 punti: risposta incompleta, descrizione vaga del processo o dei modelli senza adeguati dettagli
- 0 punti: risposta assente o completamente errata

### Domanda 17
**Risposta modello:**

Il prompt "Aiutami con il codice" e inefficace perche viola il principio fondamentale della specificita nel prompt engineering. Secondo lo **schema ICIF**, mancano tutti e quattro i componenti: non c'e un'**Istruzione** chiara (cosa deve fare esattamente il modello?), non c'e **Contesto** (quale linguaggio, framework, progetto?), non c'e **Input** (quale codice, quale errore, quale file?), e non c'e indicazione di **Formato** (come deve essere strutturata la risposta?). Secondo la **checklist della specificita**, mancano: il CHI (a chi serve il codice?), il COSA (quale funzionalita specifica?), il COME (quali vincoli, stile, dipendenze?), il QUANTO (quante righe, quale complessita?) e il PERCHE (quale problema risolve?). Una versione efficace potrebbe essere: "Crea una funzione Python chiamata `validate_email(email: str) -> bool` che verifichi se un indirizzo email e in formato valido usando una regex. La funzione deve gestire i casi edge (stringa vuota, None). Usa type hints e aggiungi una docstring in stile Google. Includi 3 test con pytest che coprano i casi: email valida, email non valida e input vuoto." Questa versione specifica cosa fare, in quale linguaggio, con quali vincoli e quale formato di output.

**Criteri di valutazione:**
- 5 punti: risposta completa che identifica i problemi del prompt originale, li collega allo schema ICIF e alla checklist, e propone una riscrittura efficace e dettagliata
- 3-4 punti: risposta parziale che identifica i problemi principali e propone una riscrittura migliorata ma senza collegamento esplicito allo schema ICIF
- 1-2 punti: risposta incompleta, identifica solo un problema o propone una riscrittura ancora vaga
- 0 punti: risposta assente o completamente errata

### Domanda 18
**Risposta modello:**

L'AI generativa avra un impatto significativo sul mondo del lavoro, che si manifesta in tre modalita: **automazione** di task specifici (non necessariamente interi lavori), **augmentation** delle capacita umane (AI come strumento di potenziamento) e creazione di **nuovi ruoli** (prompt engineer, AI trainer, AI ethics specialist). I lavori **piu a rischio** sono quelli caratterizzati da task ripetitivi e standardizzabili: data entry ed elaborazione dati ripetitiva, scrittura di report standard e traduzioni base, customer service di primo livello e coding di boilerplate. Queste attivita sono a rischio perche l'AI puo svolgerle con maggiore velocita e a costi inferiori. I lavori **piu resistenti** richiedono capacita tipicamente umane: creativita originale e pensiero strategico, empatia e gestione delle relazioni interpersonali, giudizio etico in situazioni complesse e ambigue, e leadership organizzativa. Tre consigli pratici per prepararsi: (1) **imparare a usare l'AI** come strumento quotidiano per aumentare la propria produttivita, diventando competenti nell'integrarla nei propri flussi di lavoro; (2) **sviluppare competenze complementari all'AI**, come pensiero critico, creativita, comunicazione e intelligenza emotiva, che il modello non puo replicare; (3) **adottare un approccio di apprendimento continuo** (continuous learning), rimanendo aggiornati sulle evoluzioni tecnologiche e pronti ad adattare le proprie competenze alle nuove esigenze del mercato.

**Criteri di valutazione:**
- 5 punti: risposta completa e ben strutturata che copre lavori a rischio e resistenti con motivazioni, e fornisce almeno tre consigli pratici concreti
- 3-4 punti: risposta parziale che copre i concetti principali ma manca di motivazioni dettagliate o fornisce consigli generici
- 1-2 punti: risposta incompleta, elenca solo lavori a rischio o solo consigli senza analisi dell'impatto
- 0 punti: risposta assente o completamente errata
