# Giorno 6: Applicazioni Avanzate ed Etica

**Corso**: AI Generativa
**Durata**: ~6 ore

---

## Slide 1: Titolo della Giornata

### Applicazioni Avanzate ed Etica dell'AI
- RAG, agenti, function calling e le sfide etiche dell'AI generativa
- Corso AI Generativa - ITS Steve Jobs

> **Note relatore**: Oggi affrontiamo due temi complementari: le applicazioni avanzate che estendono le capacita dei modelli, e le questioni etiche e sociali che ogni professionista dell'AI deve conoscere.

---

## Slide 2: Obiettivi della Giornata

### Cosa imparerete oggi
- Comprendere RAG e come dare "memoria" ai modelli
- Capire cosa sono gli agenti AI e il function calling
- Riconoscere bias, allucinazioni e questioni di copyright
- Conoscere l'AI Act europeo e l'impatto sul lavoro

> **Note relatore**: La giornata e divisa in due blocchi: il primo tecnico (RAG, agenti, tools), il secondo etico-sociale. Entrambi sono fondamentali per chi lavora con l'AI in contesto professionale.

---

## Slide 3: Il Problema dei LLM

### Limiti Intrinseci dei Modelli
- Knowledge cutoff: non sanno cosa e successo dopo il training
- Non conoscono i dati aziendali, le email, il codice privato
- Possono "allucinare" informazioni specifiche e fattuali
- La context window e ampia ma non infinita
- Servono tecniche per estendere le capacita

> **Note relatore**: Questi limiti motivano le tecniche avanzate che vedremo oggi. RAG risolve il knowledge cutoff e le allucinazioni su dati specifici. Gli agenti estendono le capacita con strumenti esterni.

---

## Slide 4: RAG - Retrieval Augmented Generation

### Dare Memoria ai Modelli
- RAG: recupera informazioni rilevanti e le passa come contesto
- Non modifica il modello, arricchisce il prompt con dati reali
- Pipeline: domanda, ricerca documenti, contesto al LLM, risposta
- La risposta si basa su documenti reali, non su conoscenza generica
- Riduce allucinazioni per informazioni specifiche

> **Note relatore**: RAG e la tecnica piu importante per applicazioni enterprise. Permette al modello di rispondere su dati aziendali senza fine-tuning. La chiave e la qualita della ricerca: documenti irrilevanti producono risposte scadenti.

---

## Slide 5: Componenti di un Sistema RAG

### I Cinque Elementi Fondamentali
- Document Loader: carica PDF, Word, HTML, database
- Text Splitter: divide i documenti in chunk gestibili
- Embedding Model: converte il testo in vettori numerici
- Vector Database: memorizza e cerca vettori per similarita
- LLM: genera risposte basate sul contesto recuperato

> **Note relatore**: Ogni componente e critico. Il text splitter deve creare chunk significativi (non troppo piccoli, non troppo grandi). L'embedding model determina la qualita della ricerca. Il vector database deve essere veloce e preciso.

---

## Slide 6: Come Funziona la Ricerca RAG

### Embedding e Similarity Search
- Il testo viene convertito in vettori numerici (embedding)
- La domanda dell'utente viene convertita nello stesso spazio
- Il sistema cerca i documenti piu "vicini" alla domanda
- I documenti trovati vengono inseriti nel prompt come contesto
- Il modello genera la risposta basandosi sui documenti

> **Note relatore**: La ricerca per similarita funziona perche documenti semanticamente simili hanno vettori vicini nello spazio. Il prompt include: "Basandoti SOLO sui documenti seguenti, rispondi. Se la risposta non c'e, dillo."

---

## Slide 7: Tools e Librerie per RAG

### L'Ecosistema Disponibile
- LangChain: framework completo per pipeline RAG
- LlamaIndex: specializzato in retrieval e indicizzazione
- Pinecone: vector database cloud, scalabile
- Chroma: vector database locale, facile da usare
- FAISS (Meta): libreria per similarity search ad alte prestazioni

> **Note relatore**: Per iniziare, Chroma + LangChain sono la combinazione piu semplice. Per produzione, Pinecone o FAISS offrono migliori prestazioni. LlamaIndex e ottimo se il focus e solo la ricerca documenti.

---

## Slide 8: Agenti AI - Definizione

### Sistemi Autonomi con Strumenti
- Un agente AI puo ragionare su un obiettivo
- Decide autonomamente quali azioni compiere
- Usa strumenti esterni: API, database, web
- Itera fino al completamento del task
- Esempio principale: Claude Code e un agente di coding

> **Note relatore**: Gli agenti sono il passo successivo rispetto ai semplici chatbot. Non si limitano a rispondere: pianificano, agiscono, osservano i risultati e iterano. Sono la frontiera piu avanzata dell'AI generativa applicata.

---

## Slide 9: Il Loop ReAct

### Reason + Act: Come Ragiona un Agente
- Thought: "Devo trovare voli per Roma il 15 marzo"
- Action: chiama la funzione search_flights con i parametri
- Observation: riceve la lista dei voli con prezzi
- Thought: "Il piu economico e 89 euro, verifico disponibilita"
- Ciclo continua fino all'obiettivo raggiunto o alla risposta finale

> **Note relatore**: Il pattern ReAct e il cuore degli agenti moderni. Il modello alterna fasi di ragionamento (pensare a cosa fare) e azione (usare strumenti). Claude Code segue esattamente questo pattern quando scrive codice.

---

## Slide 10: Function Calling (Tool Use)

### Il LLM Chiama Funzioni Esterne
- Il modello decide quando servono dati esterni
- Genera una chiamata a funzione con parametri strutturati
- Il sistema esegue la funzione e restituisce il risultato
- Il modello usa il risultato per formulare la risposta
- Esempio: "Che tempo fa a Milano?" chiama get_weather("Milano")

> **Note relatore**: Il function calling trasforma il LLM da semplice generatore di testo a orchestratore di servizi. Il modello non esegue le funzioni direttamente: genera una richiesta strutturata che il sistema poi esegue.

---

## Slide 11: Pattern di Automazione Workflow

### Quattro Architetture Comuni
- Sequential: Input, Step1, Step2, Step3, Output (pipeline lineare)
- Parallel: Input su piu task in parallelo, poi merge dei risultati
- Conditional: classificatore smista a branch diversi
- Human-in-the-Loop: AI genera, umano rivede e approva

> **Note relatore**: Ogni pattern ha il suo caso d'uso. Sequential per pipeline di elaborazione (riassunto, traduzione, formattazione). Parallel per analisi batch. Conditional per routing (es. ticket di supporto). Human-in-loop per contenuti critici.

---

## Slide 12: MCP e Framework Agentici

### L'Ecosistema Moderno
- MCP (Model Context Protocol): standard per connettere LLM a tools
- LangChain: framework general purpose per catene e RAG
- CrewAI: collaborazione tra piu agenti AI
- LlamaIndex: focus su retrieval e indicizzazione dati
- L'ecosistema evolve rapidamente: restare aggiornati

> **Note relatore**: MCP e uno standard emergente che semplifica la connessione tra modelli e strumenti esterni. L'ecosistema dei framework agentici e in rapida evoluzione: le competenze di base restano, gli strumenti cambiano.

---

## Slide 13: Bias nei Modelli AI

### Pregiudizi Sistematici nei Risultati
- Origine: dati di training contengono pregiudizi storici e culturali
- Bias di genere: "infermiere" associato a femminile, "CEO" a maschile
- Bias culturale: default verso cultura occidentale
- Bias linguistico: migliori performance in inglese
- Sovrarappresentazione e sottorappresentazione nei dati

> **Note relatore**: I bias non sono intenzionali ma sono il riflesso dei dati di training. Internet non e rappresentativo della diversita umana. Come utenti, dobbiamo esserne consapevoli e verificare criticamente gli output.

---

## Slide 14: Mitigazione dei Bias

### Cosa Possiamo Fare Come Utenti
- Consapevolezza: sapere che il problema esiste
- Verifica critica: controllare gli output per pregiudizi
- Prompt espliciti: richiedere diversita e rappresentativita
- Segnalazione: riportare problemi ai fornitori del modello
- Testing dedicato: verificare bias specifici per il proprio caso d'uso

> **Note relatore**: La mitigazione dei bias e responsabilita condivisa. Gli sviluppatori del modello lavorano su dataset e RLHF. Ma anche chi usa il modello deve verificare che i risultati non perpetuino stereotipi.

---

## Slide 15: Allucinazioni - Definizione e Tipi

### Output Plausibili ma Falsi
- Fattuali: fatti storici o scientifici sbagliati
- Inventive: citare paper, libri o statistiche inesistenti
- Logiche: ragionamenti fallaci ma apparentemente convincenti
- Referenziali: "Come ho detto prima..." quando non l'ha detto
- Causa: il modello genera testo plausibile, non "sa" se e vero

> **Note relatore**: Le allucinazioni sono il limite piu critico dei LLM. Accadono perche il modello e ottimizzato per generare testo fluido, non per essere accurato. "Non so" e meno naturale di una risposta inventata.

---

## Slide 16: Gestire le Allucinazioni

### Prevenzione, Verifica e Detection
- Prevenzione: "Rispondi solo se sei sicuro, altrimenti dillo"
- Verifica: controllare sempre i fatti importanti con fonti autorevoli
- RAG: usare documenti reali per informazioni specifiche
- Detection: chiedere le fonti, verificare consistenza interna
- Porre la stessa domanda in modi diversi per verificare

> **Note relatore**: Nessuna di queste strategie elimina completamente il problema. La combinazione di tutte e la difesa migliore. Per applicazioni critiche (mediche, legali, finanziarie), la verifica umana e sempre obbligatoria.

---

## Slide 17: Copyright e Proprieta Intellettuale

### Questioni Legali Aperte
- Training: modelli addestrati su contenuti protetti, e fair use?
- Output: chi possiede il contenuto generato dall'AI?
- Stile: "nello stile di [artista vivente]" e legale?
- Casi in corso: Getty vs Stability AI, NYT vs OpenAI
- Best practice: verificare ToS, dichiarare uso di AI

> **Note relatore**: Il panorama legale e in evoluzione. Per uso commerciale: verificare i termini di servizio del modello. Non imitare artisti viventi senza permesso. Documentare il processo creativo. Dichiarare l'uso di AI quando rilevante.

---

## Slide 18: Deepfake e Disinformazione

### I Rischi dell'AI Generativa
- L'AI puo creare video, audio e immagini false convincenti
- Rischi: disinformazione politica, frodi, manipolazione
- Contromisure tecnologiche: watermarking (C2PA), detection tools
- Contromisure normative: obbligo di disclosure
- Contromisure educative: media literacy e pensiero critico

> **Note relatore**: I deepfake sono tra le applicazioni piu pericolose dell'AI generativa. Claude Vision NON rileva deepfake in modo affidabile. La difesa migliore e l'educazione al pensiero critico e la verifica delle fonti.

---

## Slide 19: Impatto sul Lavoro

### Automazione, Augmentation e Nuovi Ruoli
- Automazione: alcuni task ripetitivi saranno automatizzati
- Augmentation: l'AI amplifica le capacita umane, non le sostituisce
- Nuovi ruoli: prompt engineer, AI trainer, AI ethics specialist
- A rischio: data entry, scrittura base, customer service L1
- Resistenti: creativita originale, empatia, giudizio complesso

> **Note relatore**: Il messaggio chiave non e "l'AI rubera il lavoro" ma "l'AI cambiera il lavoro". Chi impara a usarla sara piu produttivo. Le competenze umane (empatia, creativita, leadership) diventano ancora piu importanti.

---

## Slide 20: AI Act Europeo

### La Prima Regolamentazione Completa
- Approccio basato sul rischio: vietato, alto, limitato, minimo
- Vietato: social scoring, manipolazione subliminale
- Alto rischio: sanita, giustizia, HR (regolamentato)
- Rischio limitato: chatbot, deepfake (obbligo di trasparenza)
- Sanzioni: fino al 7% del fatturato o 35 milioni di euro

> **Note relatore**: L'AI Act e un riferimento mondiale. Per l'AI generativa impone trasparenza (dichiarare contenuto AI-generated), rispetto del copyright e valutazione dei rischi. E importante conoscerlo per qualsiasi applicazione professionale.

---

## Slide 21: Trend Futuri dell'AI

### Dove Stiamo Andando
- Modelli piu efficienti: stesse capacita con meno risorse
- On-Device AI: privacy, latenza minima, funziona offline
- Multimodalita avanzata: testo, immagini, audio, video, 3D
- Agenti autonomi: sistemi che perseguono obiettivi complessi
- AGI: intelligenza artificiale generale, timeline controversa

> **Note relatore**: Il trend e chiaro: modelli piu piccoli e efficienti, piu modalita, piu autonomia. L'AGI resta un obiettivo dibattuto (5 anni? 20? Mai?). Ma anche senza AGI, l'impatto dell'AI attuale e gia enorme.

---

## Slide 22: Consigli per il Futuro

### Come Prepararsi al Cambiamento
- Imparare a usare l'AI: diventare piu produttivi oggi
- Sviluppare competenze umane: empatia, creativita, leadership
- Rimanere adattabili: continuous learning e flessibilita
- Coltivare pensiero critico: valutare e guidare l'AI
- Partecipare al dibattito pubblico sull'etica dell'AI

> **Note relatore**: Il messaggio finale: l'AI non e qualcosa che "succede" a voi, e uno strumento che voi potete imparare a usare e guidare. Le competenze che state acquisendo in questo corso vi danno un vantaggio competitivo reale.

---

## Slide 23: Riepilogo

### Concetti Chiave di Oggi
- RAG da "memoria" ai modelli con documenti reali, riducendo allucinazioni
- Gli agenti AI ragionano, usano strumenti e iterano autonomamente
- Bias e allucinazioni sono limiti critici da gestire consapevolmente
- L'AI Act europeo regola l'AI con approccio basato sul rischio
- L'AI cambia il lavoro: augmentation piu che sostituzione

> **Note relatore**: Domande di riflessione: quando useresti RAG invece di fine-tuning? Quali rischi vedi negli agenti autonomi? Come verificheresti se un output contiene bias? Come cambiera il vostro futuro lavoro con l'AI?
