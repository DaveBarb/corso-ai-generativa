# Giorno 4: Claude Code

**Corso**: AI Generativa
**Durata**: ~6 ore

---

## Slide 1: Titolo della Giornata

### Claude Code - Sviluppo Assistito dall'AI
- Il coding agent nel terminale: dall'idea all'implementazione
- Corso AI Generativa - ITS Steve Jobs

> **Note relatore**: Oggi entriamo nel cuore dello sviluppo software assistito dall'AI. Claude Code e un tool CLI che integra Claude direttamente nel workflow di sviluppo, molto diverso dall'interfaccia web o dalle API pure.

---

## Slide 2: Obiettivi della Giornata

### Cosa imparerete oggi
- Cos'e Claude Code e le differenze con web e API
- Installare, configurare e usare i comandi principali
- Formulare richieste efficaci per la generazione di codice
- Applicare best practices per la revisione del codice generato

> **Note relatore**: Claude Code e lo strumento che userete di piu come sviluppatori. Imparerete non solo a usarlo, ma anche a capire quando fidarvi del codice generato e quando no. La revisione critica e fondamentale.

---

## Slide 3: Cos'e Claude Code

### Tool CLI per lo Sviluppo Software
- CLI (Command Line Interface) che integra Claude nel terminale
- Tre modalita di accesso a Claude: Web, API, Claude Code
- Web: chat interattiva per uso generale
- API: integrazione programmatica nelle applicazioni
- Claude Code: sviluppo software direttamente nel terminale

> **Note relatore**: Claude Code e pensato specificamente per sviluppatori. A differenza dell'interfaccia web, puo leggere i file del progetto, capirne la struttura, eseguire comandi e modificare il codice direttamente.

---

## Slide 4: Vantaggi di Claude Code

### Perche Usarlo per lo Sviluppo
- Integrazione terminale: lavora dove gia sviluppi
- Contesto del progetto: legge file e capisce la struttura
- Operazioni su file: crea, modifica, cerca nel codice
- Esecuzione comandi: puo eseguire shell, test, build, git
- Persistenza sessione: mantiene il contesto durante la sessione

> **Note relatore**: Il vantaggio chiave e il contesto automatico. Claude Code sa quali file esistono, che framework usi, quali dipendenze hai. Non devi spiegare tutto dal nulla come nell'interfaccia web.

---

## Slide 5: Cosa Puo Fare Claude Code

### Le Sei Capacita Principali
- Generare codice: da specifica a implementazione completa
- Modificare file esistenti: refactoring, bug fix, miglioramenti
- Navigare il codebase: cercare, leggere, capire il codice
- Eseguire comandi: test, build, git, deploy
- Spiegare codice: documentare e analizzare codice esistente
- Debug: trovare e correggere errori nel progetto

> **Note relatore**: Claude Code e un vero "pair programmer" AI. Non e solo un generatore di codice: puo leggere il tuo progetto, capire il problema e proporre soluzioni nel contesto reale dei tuoi file.

---

## Slide 6: Installazione e Configurazione

### Setup in Tre Passi
- Prerequisito: Node.js 18+ e account Anthropic con API key
- Installazione: npm install -g @anthropic-ai/claude-code
- Configurazione API key: variabile d'ambiente o claude login
- Verifica: claude --version per confermare installazione
- Prima esecuzione: claude per modalita interattiva

> **Note relatore**: L'installazione e semplice ma richiede Node.js. Per la configurazione della API key, il metodo piu sicuro e la variabile d'ambiente ANTHROPIC_API_KEY. Il login interattivo e piu comodo per uso personale.

---

## Slide 7: Comandi Slash Principali

### Navigare Claude Code
- /help: mostra tutti i comandi disponibili
- /clear: pulisce la conversazione corrente
- /history: mostra la cronologia delle interazioni
- /compact: riassume la conversazione per risparmiare contesto
- /cost: mostra i costi della sessione corrente

> **Note relatore**: /compact e particolarmente utile in sessioni lunghe: riassume la conversazione mantenendo il contesto essenziale. /cost aiuta a monitorare la spesa, importante dato che ogni interazione usa token API.

---

## Slide 8: Riferimenti a File e Cartelle

### Dare Contesto a Claude Code
- @file.py: riferisce a un file specifico del progetto
- @folder/: riferisce a un'intera cartella
- Combinare piu riferimenti: @models.py @schemas.py
- Claude Code legge automaticamente la struttura del progetto
- Piu file rilevanti fornisci, migliore sara il risultato

> **Note relatore**: I riferimenti con @ sono il modo piu efficace per dare contesto. Esempio: "@models.py @schemas.py crea endpoint CRUD per User" e molto piu efficace di "crea endpoint CRUD" senza contesto.

---

## Slide 9: Workflow - Nuovo Progetto

### Inizializzare da Zero
- Aprire il terminale nella cartella del progetto
- Avviare claude e descrivere cosa serve
- Claude crea file, struttura, configurazioni
- Esempio: "Inizializza progetto Python con requirements, main, .gitignore"
- Sempre verificare i file generati prima di procedere

> **Note relatore**: Claude Code e eccellente per scaffolding iniziale. Puo creare strutture di progetto complete, ma va sempre verificato che le dipendenze siano corrette e che la struttura segua le convenzioni del team.

---

## Slide 10: Workflow - Feature Esistente

### Aggiungere Funzionalita
- Riferire i file rilevanti con @
- Descrivere la feature con requisiti specifici
- Claude modifica i file esistenti rispettando il contesto
- Esempio: "@models.py aggiungi modello User con id, username, email"
- Sempre testare le modifiche dopo l'applicazione

> **Note relatore**: La chiave e fornire contesto sufficiente. Claude Code legge i file riferiti e genera codice coerente con lo stile e le convenzioni esistenti. Ma non e infallibile: testare sempre.

---

## Slide 11: Workflow - Debugging

### Risolvere Errori con l'AI
- Copiare l'errore completo nel prompt
- Riferire i file coinvolti con @
- Descrivere cosa stavi cercando di fare
- Elencare cosa hai gia provato
- Claude analizza il contesto e propone soluzioni

> **Note relatore**: Template efficace per debug: "Ho questo errore: [errore completo]. File coinvolti: @file1.py @file2.py. Stavo cercando di: [descrizione]. Ho gia provato: [tentativi]." Piu contesto dai, migliore sara la diagnosi.

---

## Slide 12: Quando Usare Cosa

### Matrice Decisionale degli Strumenti
- Chat generale e Q&A: Claude.ai Web
- Sviluppo software e pair programming: Claude Code
- Applicazioni e bot custom: API Python
- Analisi documenti con upload: Claude.ai Web
- Batch processing e automazione: API Python

> **Note relatore**: Non esiste uno strumento universale. Claude Code eccelle nello sviluppo software perche ha accesso al filesystem. Le API eccellono nell'automazione. Il web eccelle nell'interazione casuale e nell'upload di file.

---

## Slide 13: Formulare Richieste Efficaci per il Codice

### La Regola d'Oro
- Piu contesto dai, migliore sara il codice generato
- COSA vuoi: la funzionalita da implementare
- DOVE si inserisce: file, classe, modulo specifico
- COME deve funzionare: input, output, comportamento atteso
- VINCOLI: stile, dipendenze, performance, compatibilita

> **Note relatore**: Confrontare la richiesta vaga "Crea funzione per validare password" con quella efficace che specifica firma, requisiti, return type e stile. La differenza nel risultato e enorme.

---

## Slide 14: Da Richiesta Vaga a Efficace

### Esempio Pratico
- Vago: "Crea una funzione per validare password"
- Efficace: specifica nome funzione, tipo di ritorno
- Include requisiti: minimo 8 caratteri, maiuscola, numero, speciale
- Definisce return: (True, []) se valida, (False, [errori]) se no
- Stile: type hints, docstring Google style

> **Note relatore**: Mostrare entrambe le versioni e il codice risultante. La richiesta vaga produce codice generico. Quella efficace produce codice specifico, testabile e conforme agli standard del progetto.

---

## Slide 15: Checklist di Revisione del Codice Generato

### Non Fidarsi Ciecamente
- FUNZIONALITA: fa quello che hai chiesto? Gestisce edge cases?
- SICUREZZA: input validati? SQL injection? Secrets esposti?
- QUALITA: codice leggibile? Naming appropriato? DRY?
- PERFORMANCE: complessita accettabile? Risorse chiuse?
- COMPATIBILITA: versione Python corretta? Stile del progetto?

> **Note relatore**: Questa checklist e da applicare SEMPRE al codice generato. L'AI puo produrre codice funzionante ma con vulnerabilita di sicurezza, problemi di performance o incompatibilita. La revisione umana resta essenziale.

---

## Slide 16: Esempio di Revisione Critica

### Identificare Problemi nel Codice Generato
- Codice generato con f-string in query SQL: SQL injection
- Nessuna gestione errori: crash su dati mancanti
- Nessun type hint: codice meno manutenibile
- Return ambiguo: None o errore se non trovato?
- Versione corretta: ORM, type hints, docstring, gestione errori

> **Note relatore**: Mostrare il confronto tra il codice generato con problemi e la versione corretta. Questo esempio dimostra perche la revisione e fondamentale: codice apparentemente funzionante puo avere vulnerabilita critiche.

---

## Slide 17: Strategie di Debug con AI

### Quattro Approcci al Debugging Assistito
- Isolare il problema: eseguire solo la funzione con input specifici
- Aggiungere logging: tracciare il flusso di esecuzione
- Creare test case: riprodurre il bug in modo automatizzato
- Spiegazione riga per riga: capire cosa fa il codice nel dettaglio

> **Note relatore**: Il debug assistito non significa delegare tutto all'AI. Significa usare l'AI come strumento per velocizzare l'analisi. Lo sviluppatore deve sempre capire la causa e verificare la soluzione.

---

## Slide 18: Refactoring con AI

### Cinque Tipi di Refactoring
- Rinominare: variabili e funzioni con nomi piu descrittivi
- Estrarre funzione: logica ripetuta in funzione riutilizzabile
- Semplificare: funzioni troppo lunghe in sotto-funzioni
- Modernizzare: aggiornare a versioni recenti del linguaggio
- Ottimizzare: migliorare complessita computazionale

> **Note relatore**: Claude Code e eccellente per il refactoring perche vede il contesto completo. Ma ogni refactoring va verificato con i test esistenti. Se non ci sono test, e il momento di crearli prima del refactoring.

---

## Slide 19: Quando NON Usare l'AI per il Codice

### Situazioni da Evitare
- Codice critico per la sicurezza senza revisione esperta
- Usare codice che non capisci: capire sempre prima
- Esercizi di apprendimento: non saltare la comprensione
- Crittografia personalizzata: usare librerie standard
- Contesto mancante: non generare per sistemi che non conosci

> **Note relatore**: L'AI e un amplificatore, non un sostituto. Se non capisci il codice che genera, non puoi mantenerlo, debuggarlo o estenderlo. L'approccio giusto: CAPIRE, GENERARE, CAPIRE, TESTARE, ADATTARE.

---

## Slide 20: L'Approccio CAPIRE-GENERARE-TESTARE

### Il Ciclo Virtuoso dello Sviluppo Assistito
- Passo 1 - CAPIRE: studia il problema prima di chiedere
- Passo 2 - GENERARE: chiedi aiuto all'AI con contesto
- Passo 3 - CAPIRE: assicurati di capire il codice generato
- Passo 4 - TESTARE: verifica che funzioni correttamente
- Passo 5 - ADATTARE: modifica per il tuo caso specifico

> **Note relatore**: Questo ciclo garantisce che lo sviluppatore mantenga il controllo. L'AI accelera il lavoro ma la responsabilita del codice resta dello sviluppatore. Mai mettere in produzione codice che non si capisce.

---

## Slide 21: Generare Test Automatici

### L'AI per Migliorare la Qualita
- Chiedere test per funzioni specifiche con contesto
- Specificare: happy path, edge cases, errori attesi
- Richiedere: fixtures per setup, mocking, parametrize
- I test generati vanno eseguiti e verificati
- Ottimo punto di partenza, ma adattare al progetto

> **Note relatore**: Claude Code puo generare test completi con pytest, inclusi casi limite e mock. Ma i test generati vanno sempre eseguiti per verificare che passino e che testino realmente il comportamento desiderato.

---

## Slide 22: Riepilogo

### Concetti Chiave di Oggi
- Claude Code e un CLI per sviluppo software nel terminale
- Comandi slash (/help, /clear) e riferimenti file (@file.py)
- Richieste efficaci: cosa, dove, come, vincoli, esempi
- Sempre revisionare il codice: sicurezza, qualita, performance
- Capire prima, generare poi: l'AI amplifica, non sostituisce

> **Note relatore**: Domande di riflessione: quando useresti Claude Code invece del web? Perche e importante verificare sempre il codice generato? Come gestiresti file sensibili nel progetto? Come bilanceresti velocita e qualita?
