# Giorno 1: Introduzione all'AI Generativa

**Corso**: AI Generativa
**Durata**: ~6 ore

---

## Slide 1: Titolo della Giornata

### Introduzione all'AI Generativa
- Dalle origini ai modelli di ultima generazione
- Corso AI Generativa - ITS Steve Jobs

> **Note relatore**: Presentare gli obiettivi della giornata. Spiegare che oggi si parte dalle basi per costruire una comprensione solida dell'AI generativa, dalla teoria alla pratica.

---

## Slide 2: Obiettivi della Giornata

### Cosa imparerete oggi
- Distinguere tra AI discriminativa e AI generativa
- Conoscere la timeline dei principali sviluppi dal 2014 a oggi
- Comprendere il funzionamento interno dei LLM
- Capire tokenizzazione, embedding e meccanismo di attention

> **Note relatore**: Questi quattro obiettivi rappresentano le fondamenta teoriche del corso. Ogni concetto sara ripreso e approfondito nei giorni successivi.

---

## Slide 3: AI Discriminativa - Definizione

### AI Discriminativa: Classificare
- Impara a distinguere tra categorie esistenti
- Riconoscimento immagini: "Questo e un gatto o un cane?"
- Spam detection: "Questa email e spam o legittima?"
- Sentiment analysis: "Recensione positiva o negativa?"
- Analogia: un critico d'arte che riconosce gli stili

> **Note relatore**: L'AI discriminativa e quella con cui la maggior parte delle persone ha familiarita. E la base del machine learning classico. I modelli imparano i confini tra le categorie.

---

## Slide 4: AI Generativa - Definizione

### AI Generativa: Creare
- Impara a creare nuovi contenuti originali
- Genera testo: articoli, codice, poesie
- Genera immagini: arte, foto realistiche
- Genera audio e video: musica, voce, animazioni
- Analogia: un artista che crea dopo aver studiato migliaia di opere

> **Note relatore**: La differenza fondamentale e che l'AI discriminativa classifica dati esistenti, mentre la generativa ne produce di nuovi. L'AI generativa impara la distribuzione dei dati per generarne di nuovi.

---

## Slide 5: Confronto tra i Due Approcci

### Discriminativa vs Generativa
- Discriminativa: Input immagine, Output "Gatto (95%)"
- Generativa: Input "Un gatto", Output nuova immagine
- Discriminativa impara i confini tra le categorie
- Generativa impara la distribuzione dei dati
- Entrambe fondamentali, applicazioni diverse

> **Note relatore**: Mostrare il diagramma visivo del confronto. Input e output sono invertiti: la discriminativa riceve dati e produce etichette, la generativa riceve istruzioni e produce contenuti.

---

## Slide 6: Timeline - Le Origini (2014-2017)

### GAN e Transformer
- 2014: GAN di Ian Goodfellow, due reti in competizione
- Una rete genera, l'altra giudica la qualita
- 2017: Paper "Attention Is All You Need" di Google
- Architettura Transformer, base di tutti i modelli moderni
- Il meccanismo di attention rivoluziona il NLP

> **Note relatore**: Le GAN sono state la prima tecnica efficace per generare immagini realistiche. Il Transformer del 2017 e la vera rivoluzione: senza questo paper non avremmo ChatGPT, Claude o GPT-4.

---

## Slide 7: Timeline - L'Evoluzione (2018-2021)

### Da GPT-1 a DALL-E
- 2018-2020: GPT-1 (117M), GPT-2 (1.5B), GPT-3 (175B parametri)
- GPT-3 mostra capacita "emergenti" sorprendenti
- 2021: DALL-E genera immagini da descrizioni testuali
- Democratizzazione della creazione visiva
- Crescita esponenziale delle capacita dei modelli

> **Note relatore**: Sottolineare la crescita esponenziale dei parametri. GPT-3 e stato il primo modello a dimostrare che con abbastanza dati e parametri emergono capacita inaspettate.

---

## Slide 8: Timeline - La Svolta (2022-2024)

### L'AI Generativa Diventa Mainstream
- 2022: ChatGPT e Stable Diffusion, AI accessibile a tutti
- 2023: Claude di Anthropic e GPT-4 multimodale
- 2024: Claude 3 Opus con reasoning avanzato
- Modelli multimodali: testo, immagini, audio, video
- Il 2022 e l'anno della svolta per adozione di massa

> **Note relatore**: Spiegare perche il 2022 e considerato l'anno della svolta: ChatGPT ha reso l'AI accessibile al grande pubblico, Stable Diffusion ha democratizzato la generazione di immagini.

---

## Slide 9: Panoramica dei LLM Attuali

### I Principali Modelli di Linguaggio
- Claude 3 (Anthropic): sicuro, preciso, context lungo
- GPT-4 (OpenAI): multimodale, molto capace
- Gemini (Google): integrato nell'ecosistema Google
- Llama 3 (Meta): open source, personalizzabile
- Mistral (Mistral AI): efficiente, europeo

> **Note relatore**: Ogni modello ha punti di forza diversi. Claude si distingue per sicurezza e precisione, GPT-4 per multimodalita, Llama per essere open source. Non esiste un modello "migliore" in assoluto.

---

## Slide 10: Panoramica dei Modelli per Immagini

### Diffusion Models Principali
- DALL-E 3 (OpenAI): integrato con ChatGPT
- Midjourney: alta qualita artistica ed estetica
- Stable Diffusion (Stability AI): open source e personalizzabile
- Imagen (Google): alta fedelta al prompt
- Ogni modello ha casi d'uso ideali diversi

> **Note relatore**: Approfondiremo i modelli per immagini nel Giorno 5. Per ora e importante sapere che esistono e che funzionano con principi diversi dai LLM.

---

## Slide 11: Tokenizzazione - Concetto Base

### Cos'e un Token?
- Unita base che il modello legge e produce
- Non sempre corrisponde a una parola intera
- "Ciao, come stai?" diventa 5 token separati
- Parole comuni = 1 token, parole rare = piu token
- Il modello lavora con numeri, non con lettere

> **Note relatore**: Esempio pratico: "the" e un token, "Tokenizzazione" viene spezzata in 3 token. Questo spiega perche le lingue non inglesi costano di piu in termini di token.

---

## Slide 12: Tokenizzazione - Perche e Importante

### Impatto Pratico della Tokenizzazione
- I costi delle API si basano sul numero di token
- La context window e misurata in token (es. 200K per Claude)
- Lingue diverse hanno efficienze diverse di tokenizzazione
- L'italiano usa circa il 30% di token in piu dell'inglese
- BPE (Byte Pair Encoding): algoritmo per il vocabolario

> **Note relatore**: Regola del pollice: circa 4 caratteri equivalgono a 1 token in inglese. Per l'italiano il rapporto e meno favorevole. Questo ha implicazioni sui costi e sulla quantita di testo elaborabile.

---

## Slide 13: Embedding - Parole come Coordinate

### Rappresentazione Vettoriale del Significato
- Ogni parola diventa un punto in spazio multidimensionale
- La posizione riflette il significato semantico
- Parole simili occupano posizioni vicine nello spazio
- Relazioni semantiche corrispondono a direzioni
- Esempio celebre: Re - Uomo + Donna = Regina

> **Note relatore**: Usare l'analogia visiva con il grafico 2D (Royalty vs Gender). In realta gli embedding hanno 768-4096 dimensioni, ma il principio e lo stesso. "Gatto" e "cane" avranno vettori simili.

---

## Slide 14: Attention - L'Evidenziatore Intelligente

### Il Meccanismo di Attention
- Permette a ogni parola di "guardare" tutte le altre
- Risolve ambiguita nel linguaggio naturale
- "Il gatto che era nero dormiva": attention collega "dormiva" a "gatto"
- Multi-Head Attention: piu teste catturano relazioni diverse
- Cuore dell'architettura Transformer

> **Note relatore**: L'analogia dell'evidenziatore funziona bene: per ogni parola che leggi, evidenzi le altre parole rilevanti per capirla. Ogni "testa" di attention cattura un tipo diverso di relazione.

---

## Slide 15: Predizione Next-Token

### Come un LLM Genera il Testo
- Il modello genera un token alla volta, non tutto insieme
- "La capitale dell'Italia e ___" predice "Roma" (78%)
- Poi prende "Roma" e predice il token successivo
- Loop di generazione fino al token di fine o limite
- Non e "comprensione", e predizione probabilistica

> **Note relatore**: Punto fondamentale: il modello non "capisce" nel senso umano. Calcola distribuzioni di probabilita e sceglie il token piu probabile (o uno meno probabile se la temperature e alta).

---

## Slide 16: Temperature - Controllare la Casualita

### Il Parametro Temperature
- Temperature = 0: sempre la risposta piu probabile (deterministica)
- Temperature = 1: buon bilanciamento (default)
- Temperature alta (>1): scelte piu creative e casuali
- Per codice e matematica: temperature bassa
- Per scrittura creativa: temperature piu alta

> **Note relatore**: La temperature non cambia la "conoscenza" del modello, solo quanto e disposto a scegliere token meno probabili. E come la differenza tra un compositore rigoroso e uno sperimentale.

---

## Slide 17: Pre-training

### Fase 1: Imparare il Linguaggio
- Obiettivo: apprendere la struttura del linguaggio
- Dati: enormi quantita di testo (internet, libri, codice)
- Compito: predire la prossima parola nel testo
- Risultato: modello "base" con conoscenza linguistica
- Richiede enormi risorse computazionali

> **Note relatore**: Il pre-training e la fase piu costosa. Il modello vede miliardi di token e impara pattern statistici del linguaggio. Il risultato e un modello che "sa" molto ma non e ancora utile come assistente.

---

## Slide 18: Fine-tuning e RLHF

### Fasi 2 e 3: Specializzazione e Allineamento
- Fine-tuning: specializzare il modello per un compito specifico
- Dataset piu piccolo e specifico (es. codice, dialoghi, medicina)
- RLHF: Reinforcement Learning from Human Feedback
- Umani valutano le risposte, modello impara le preferenze
- Trasforma modello base in assistente utile e sicuro

> **Note relatore**: RLHF e cruciale: senza questa fase il modello potrebbe fornire risposte pericolose o inutili. Anthropic usa anche Constitutional AI, con principi espliciti che guidano il comportamento di Claude.

---

## Slide 19: Constitutional AI di Anthropic

### L'Approccio di Claude
- Principi espliciti formano la "costituzione" del modello
- Il modello pratica auto-critica e auto-miglioramento
- Trasparenza nei valori e nelle decisioni
- Obiettivo: AI sicura, onesta e utile
- Differenza chiave rispetto ad altri approcci di allineamento

> **Note relatore**: Constitutional AI e l'innovazione principale di Anthropic. Invece di affidarsi solo al feedback umano, il modello ha principi interni che guidano il suo comportamento. Questo rende Claude particolarmente attento alla sicurezza.

---

## Slide 20: Pipeline Completa di un LLM

### Dal Testo alla Risposta
- Input testuale viene tokenizzato in unita base
- Ogni token viene convertito in embedding (vettore numerico)
- I layer Transformer applicano attention e feed-forward
- Il modello produce distribuzione di probabilita sul vocabolario
- Il token piu probabile viene selezionato e il ciclo riparte

> **Note relatore**: Riassumere la pipeline completa: Testo, Tokenizzazione, Embedding, Transformer (N layer), Predizione Next Token, Output. Ogni passaggio e essenziale e costruisce sul precedente.

---

## Slide 21: Limiti Attuali dei LLM

### Cosa Non Possono Fare (Bene)
- Allucinazioni: inventano informazioni plausibili ma false
- Knowledge cutoff: non sanno cosa e successo dopo il training
- Ragionamento matematico: errori in calcoli complessi
- Contesto limitato: non "ricordano" oltre la finestra di contesto
- Non comprendono veramente, predicono statisticamente

> **Note relatore**: Essere onesti sui limiti e fondamentale. Le allucinazioni sono il problema piu critico e verranno approfondite nel Giorno 6. Il knowledge cutoff viene mitigato da tecniche come RAG (Giorno 6).

---

## Slide 22: Riepilogo

### Concetti Chiave di Oggi
- AI discriminativa classifica, AI generativa crea contenuti nuovi
- I LLM funzionano con tokenizzazione, embedding e attention
- Generano testo un token alla volta tramite predizione probabilistica
- Pre-training, fine-tuning e RLHF sono le tre fasi di addestramento
- I modelli hanno limiti importanti: allucinazioni e knowledge cutoff

> **Note relatore**: Verificare che tutti abbiano compreso i concetti chiave. Domande di riflessione: perche il 2022 e considerato l'anno della svolta? Perche un LLM usa piu token per l'italiano che per l'inglese?
