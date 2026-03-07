# Giorno 7: Ripasso e Preparazione all'Esame

**Corso**: AI Generativa
**Durata**: ~6 ore

---

## Slide 1: Titolo della Giornata

### Ripasso Generale e Preparazione all'Esame
- Consolidare i concetti chiave dei 7 giorni di corso
- Corso AI Generativa - ITS Steve Jobs

> **Note relatore**: Oggi ripercorriamo tutti i concetti fondamentali del corso. L'obiettivo e consolidare la preparazione per l'esame, chiarire i dubbi rimasti e fornire consigli pratici per continuare ad apprendere.

---

## Slide 2: Obiettivi della Giornata

### Cosa faremo oggi
- Ripasso strutturato di tutti i concetti chiave del corso
- Domande e risposte sui dubbi accumulati
- Consigli pratici per l'esame e per il futuro
- Roadmap per continuare ad apprendere dopo il corso

> **Note relatore**: La giornata e interattiva. Ogni sezione del ripasso e un'opportunita per fare domande. Non esitate a fermarmi per chiarimenti. Meglio chiarire un dubbio ora che portarlo all'esame.

---

## Slide 3: Ripasso Giorno 1 - AI Discriminativa vs Generativa

### Le Due Facce dell'AI
- Discriminativa: classifica dati esistenti (spam detection, sentiment)
- Generativa: crea nuovi contenuti (testo, immagini, audio, video)
- Discriminativa impara i confini tra categorie
- Generativa impara la distribuzione dei dati per generarne di nuovi
- Domanda tipo: "Qual e la differenza fondamentale?"

> **Note relatore**: Chiedere agli studenti di spiegare la differenza con parole proprie. L'analogia e: discriminativa = critico d'arte che riconosce stili; generativa = artista che crea opere nuove dopo aver studiato.

---

## Slide 4: Ripasso Giorno 1 - Timeline dell'AI Generativa

### Le Tappe Fondamentali
- 2014: GAN di Goodfellow (due reti in competizione)
- 2017: Transformer e "Attention Is All You Need"
- 2018-2020: GPT-1, GPT-2, GPT-3 (crescita esponenziale parametri)
- 2022: ChatGPT e Stable Diffusion (svolta mainstream)
- 2023-2024: Claude, GPT-4, modelli multimodali avanzati

> **Note relatore**: Domanda tipo: "Perche il 2022 e considerato l'anno della svolta?" Risposta: ChatGPT ha reso l'AI accessibile al pubblico, Stable Diffusion ha democratizzato la generazione di immagini.

---

## Slide 5: Ripasso Giorno 1 - Come Funzionano i LLM

### I Quattro Concetti Chiave
- Tokenizzazione: testo spezzato in unita base (token)
- Embedding: token convertiti in vettori nello spazio semantico
- Attention: ogni parola "guarda" le altre per capire il contesto
- Next-token prediction: generazione un token alla volta

> **Note relatore**: Domanda tipo: "Cos'e un token?" Risposta: unita base di elaborazione, puo essere parola, parte di parola o carattere. "Perche l'italiano costa di piu?" Perche usa piu token per le stesse informazioni.

---

## Slide 6: Ripasso Giorno 1 - Addestramento

### Le Tre Fasi
- Pre-training: impara il linguaggio su miliardi di testi
- Fine-tuning: specializzazione per compiti specifici
- RLHF: allineamento ai valori umani tramite feedback
- Constitutional AI (Anthropic): principi espliciti per Claude
- Il knowledge cutoff e una conseguenza del pre-training

> **Note relatore**: Domanda tipo: "Cosa significa RLHF?" Reinforcement Learning from Human Feedback. Processo in cui umani valutano le risposte e il modello impara le preferenze. Senza RLHF, il modello non sarebbe "utile" come assistente.

---

## Slide 7: Ripasso Giorno 2 - Schema ICIF

### I Componenti di un Prompt Efficace
- I - Istruzione: cosa vuoi che faccia il modello
- C - Contesto: informazioni di background
- I - Input: dati specifici su cui lavorare
- F - Formato: struttura desiderata della risposta
- Non tutti sono sempre necessari, dipende dal task

> **Note relatore**: Domanda tipo: "Quali sono i 4 componenti dello schema ICIF?" Questo e un concetto da sapere a memoria. Chiedere agli studenti di costruire un prompt completo usando tutti e quattro i componenti.

---

## Slide 8: Ripasso Giorno 2 - Tecniche di Prompting

### Le Quattro Tecniche Fondamentali
- Zero-shot: nessun esempio, solo istruzione (task semplici)
- Few-shot: esempi prima della domanda (formato specifico)
- Chain-of-Thought: "Pensa passo per passo" (ragionamento)
- Role prompting: assegnare ruolo per influenzare stile e tono

> **Note relatore**: Domanda tipo: "Differenza tra zero-shot e few-shot?" Zero = nessun esempio, few = con esempi. "Quando usare CoT?" Per problemi multi-step: matematica, logica, analisi complesse. Trigger: "Pensiamo passo per passo."

---

## Slide 9: Ripasso Giorno 2 - Schema Decisionale

### Quale Tecnica Scegliere
- Task semplice e comune? Zero-shot
- Serve formato output specifico? Few-shot con esempi
- Serve ragionamento multi-step? Chain-of-Thought
- Serve tono o stile particolare? Role + Contesto
- Regola base: partire semplice, aggiungere complessita se necessario

> **Note relatore**: Domanda tipo: "Come decidi se un task e semplice per zero-shot?" Se il modello ha gia visto task simili nel training (traduzione, riassunto, Q&A), zero-shot funziona. Per task custom, meglio few-shot.

---

## Slide 10: Ripasso Giorno 3 - API Fondamentali

### Concetti Base delle API
- API: interfaccia programmatica tra due software
- Vantaggi: automazione, integrazione, batch processing
- API key: chiave segreta, mai nel codice, mai su GitHub
- Metodi sicuri: variabili d'ambiente, file .env con .gitignore
- Rate limits: gestire con retry e exponential backoff

> **Note relatore**: Domanda tipo: "Perche e importante non condividere la API key?" Chi la ottiene puo usarla a tuo nome, generare costi e accedere ai dati. "Quale modello per chatbot alto volume?" Haiku: economico e veloce.

---

## Slide 11: Ripasso Giorno 3 - Parametri API Claude

### I Parametri Chiave
- model: quale modello usare (haiku, sonnet, opus)
- max_tokens: limite token risposta (obbligatorio)
- system: istruzioni generali di comportamento
- messages: la conversazione (lista user/assistant)
- temperature: 0 = deterministico, 1 = default, >1 = creativo

> **Note relatore**: Domanda tipo: "Cosa fa temperature?" Controlla la creativita. 0 per codice e matematica, 1 per uso generale, >1 per scrittura creativa. "Cosa significa stop_reason max_tokens?" Risposta troncata.

---

## Slide 12: Ripasso Giorno 3 - Multi-turn e Costi

### Conversazioni e Ottimizzazione
- Claude non ha memoria tra chiamate: passare tutta la cronologia
- System prompt vs User vs Assistant: tre ruoli distinti
- Streaming: ricevere token in tempo reale per migliore UX
- Costi: per token (input + output), non per richiesta
- Ottimizzazione: modello giusto, max_tokens, cache

> **Note relatore**: Domanda tipo: "Perche passare tutta la cronologia?" Perche ogni chiamata API e indipendente. "Differenza system e user?" System: istruzioni meta, invisibili; User: messaggi diretti dell'utente.

---

## Slide 13: Ripasso Giorno 4 - Claude Code

### Lo Strumento per Sviluppatori
- CLI che integra Claude nel terminale di sviluppo
- Comandi slash: /help, /clear, /compact, /cost
- Riferimenti file: @file.py, @folder/ per dare contesto
- Workflow: nuovo progetto, feature, debugging, refactoring
- Quando usare: sviluppo software, pair programming

> **Note relatore**: Domanda tipo: "Quando Claude Code vs interfaccia web?" Claude Code per sviluppo software (accesso ai file). Web per domande generali e upload documenti. API per automazione e app custom.

---

## Slide 14: Ripasso Giorno 4 - Best Practices Sviluppo

### Regole d'Oro per il Codice AI
- Piu contesto dai, migliore sara il codice generato
- Checklist revisione: funzionalita, sicurezza, qualita, performance
- Mai usare codice che non capisci
- Ciclo: CAPIRE, GENERARE, CAPIRE, TESTARE, ADATTARE
- Non usare AI per codice critico senza revisione esperta

> **Note relatore**: Domanda tipo: "Perche e importante verificare il codice generato?" L'AI puo produrre codice funzionante con SQL injection, nessuna gestione errori, o incompatibilita. La revisione umana resta essenziale.

---

## Slide 15: Ripasso Giorno 5 - Diffusion Models

### Generazione di Immagini
- Dal rumore all'immagine: rimozione graduale guidata dal prompt
- DALL-E 3: uso generale, testo nelle immagini
- Stable Diffusion: open source, personalizzabile
- Midjourney: massima qualita artistica
- Prompt per immagini: soggetto + stile + dettagli + qualita

> **Note relatore**: Domanda tipo: "Cosa sono i diffusion models?" Modelli che generano immagini partendo da rumore casuale e rimuovendolo gradualmente. "Cos'e un negative prompt?" Specifica cosa NON vuoi (blurry, deformed).

---

## Slide 16: Ripasso Giorno 5 - Multimodalita

### Claude Vision e Analisi Immagini
- Claude puo analizzare immagini ma NON puo generarle
- Capacita: OCR, descrizioni, analisi grafici, confronto immagini
- Formati: JPEG, PNG, GIF, WebP, PDF
- Non puo: identificare persone, leggere CAPTCHA, generare immagini
- Best practice: prompt specifici, formato strutturato, verifica

> **Note relatore**: Domanda tipo: "Claude puo generare immagini?" No, solo analizzarle. "Formati supportati?" JPEG, PNG, GIF, WebP. "Problemi comuni nella generazione?" Mani, testo, consistenza, fisica.

---

## Slide 17: Ripasso Giorno 6 - RAG e Agenti

### Applicazioni Avanzate
- RAG: recupera documenti rilevanti e li passa come contesto
- Componenti RAG: loader, splitter, embedding, vector DB, LLM
- Agenti AI: ragionano, decidono, usano strumenti, iterano
- Loop ReAct: Thought, Action, Observation, ripeti
- Function calling: il LLM chiama funzioni esterne strutturate

> **Note relatore**: Domanda tipo: "Cosa significa RAG?" Retrieval Augmented Generation. "Cos'e un agente AI?" Sistema che ragiona su obiettivi, usa strumenti e itera. "Quando RAG vs fine-tuning?" RAG per dati che cambiano spesso.

---

## Slide 18: Ripasso Giorno 6 - Etica e Regolamentazione

### Le Sfide Sociali dell'AI
- Bias: pregiudizi nei dati riflessi nei risultati
- Allucinazioni: output falsi ma plausibili, gestire con verifica
- Copyright: questioni legali aperte su training e output
- AI Act EU: regolamentazione basata sul rischio
- Impatto lavoro: augmentation piu che sostituzione totale

> **Note relatore**: Domanda tipo: "Come mitigare le allucinazioni?" Chiedere di dire "non so", verificare i fatti, usare RAG, chiedere fonti. "Cosa prevede l'AI Act?" Piramide del rischio: vietato, alto, limitato, minimo.

---

## Slide 19: Domande Frequenti per l'Esame

### Risposte Rapide ai Dubbi Comuni
- "Quale modello scegliere?" Haiku per volume, Sonnet bilanciato, Opus per qualita
- "Come gestire costi?" Modello piu piccolo, limitare token, cache
- "Il modello non segue le istruzioni?" Piu specifico, system prompt, few-shot
- "Posso usare AI per il lavoro?" Si, ma verificare, attenzione dati sensibili
- "Come continuare a imparare?" Pratica, blog ufficiali, comunita, corsi

> **Note relatore**: Queste sono le domande piu frequenti emerse durante il corso. Assicurarsi che tutti conoscano le risposte. Sono potenziali domande d'esame e competenze pratiche quotidiane.

---

## Slide 20: Tips per Prompt Engineering Avanzato

### Consigli Finali
- Usare delimitatori chiari per separare sezioni del prompt
- Numerare le istruzioni per chiarezza e ordine
- Specificare cosa NON fare ("Non includere preamboli generici")
- Chiedere di strutturare il pensiero ("Prima analizza, poi rispondi")
- Pattern retry con exponential backoff per gestire errori API

> **Note relatore**: Questi sono trucchi pratici che migliorano immediatamente la qualita dei risultati. Distribuire come "cheat sheet" per riferimento futuro. Applicabili a qualsiasi modello, non solo Claude.

---

## Slide 21: Roadmap per Continuare

### Prossimi Passi Dopo il Corso
- Prossima settimana: completare un progetto personale con AI
- Prossimo mese: esplorare LangChain e sperimentare con RAG
- Prossimi 6 mesi: costruire portfolio di progetti AI
- Risorse: Anthropic Docs, Prompt Engineering Guide, DeepLearning.AI
- Comunita: Hugging Face Discord, r/LocalLLaMA

> **Note relatore**: L'apprendimento non finisce oggi. L'AI evolve rapidamente e la pratica costante e fondamentale. Incoraggiare gli studenti a sperimentare, costruire progetti e contribuire alla comunita.

---

## Slide 22: Mappa Concettuale del Corso

### I 7 Giorni in Sintesi
- Giorno 1: Fondamenti (AI gen vs disc, LLM, token, attention)
- Giorno 2: Prompt Engineering (ICIF, zero/few-shot, CoT, role)
- Giorno 3: API Claude (HTTP, autenticazione, parametri, multi-turn)
- Giorno 4: Claude Code (CLI, workflow, best practices, revisione)
- Giorno 5: Multimodalita (diffusion, Vision, OCR, accessibilita)

> **Note relatore**: Questa mappa visiva mostra come i concetti si collegano. I fondamenti del Giorno 1 sono la base di tutto. Il prompt engineering del Giorno 2 si applica ovunque. Le API del Giorno 3 sono il ponte verso le applicazioni.

---

## Slide 23: Mappa Concettuale - Seconda Parte

### Completamento della Visione d'Insieme
- Giorno 6: Avanzato (RAG, agenti, function calling, etica, AI Act)
- Giorno 7: Ripasso e consolidamento di tutti i concetti
- Filo conduttore: dall'utente base allo sviluppatore consapevole
- Competenza trasversale: pensiero critico nell'uso dell'AI
- Obiettivo finale: usare l'AI in modo efficace e responsabile

> **Note relatore**: Il corso vi ha portato da "utenti" di AI a "sviluppatori consapevoli". Sapete come funzionano i modelli, come programmarli, come usarli responsabilmente. Queste competenze hanno valore immediato nel mercato del lavoro.

---

## Slide 24: Riepilogo Finale

### I Concetti Fondamentali da Portare con Se
- I LLM generano testo un token alla volta tramite predizione probabilistica
- Lo schema ICIF e la base di ogni prompt efficace
- Le API permettono automazione, le key vanno sempre protette
- Revisione critica del codice generato e sempre obbligatoria
- RAG, agenti e function calling estendono le capacita dei modelli
- Etica, bias e allucinazioni richiedono consapevolezza costante

> **Note relatore**: Questi sei punti sono il nucleo del corso. Se li avete compresi a fondo, avete le basi per lavorare con l'AI generativa in qualsiasi contesto professionale. In bocca al lupo per l'esame.
