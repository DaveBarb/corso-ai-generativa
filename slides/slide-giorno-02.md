# Giorno 2: Prompt Engineering

**Corso**: AI Generativa
**Durata**: ~6 ore

---

## Slide 1: Titolo della Giornata

### Prompt Engineering
- L'arte di comunicare efficacemente con i modelli AI
- Corso AI Generativa - ITS Steve Jobs

> **Note relatore**: Oggi passiamo dalla teoria alla pratica. Il prompt engineering e la competenza piu importante per chiunque lavori con l'AI generativa. Un buon prompt fa la differenza tra una risposta inutile e una eccellente.

---

## Slide 2: Obiettivi della Giornata

### Cosa imparerete oggi
- Identificare i componenti di un prompt efficace (schema ICIF)
- Applicare zero-shot, few-shot e chain-of-thought prompting
- Usare il role prompting per ottenere risposte specializzate
- Iterare e raffinare i prompt in modo sistematico

> **Note relatore**: Alla fine della giornata saprete costruire prompt strutturati e scegliere la tecnica giusta per ogni tipo di task. Queste competenze sono trasversali a tutti i modelli AI.

---

## Slide 3: Cos'e un Prompt

### Definizione e Importanza
- Il prompt e l'input testuale che forniamo al modello
- E l'unica interfaccia tra l'utente e il modello
- Un buon prompt produce risposte eccellenti
- "Garbage in, garbage out": input vago genera output vago
- Il prompt engineering e una competenza, non un talento

> **Note relatore**: Il prompt non e solo una domanda. E un insieme di istruzioni, contesto e vincoli che guidano il modello verso la risposta desiderata. Piu siamo precisi, migliore sara il risultato.

---

## Slide 4: Lo Schema ICIF

### I Quattro Componenti di un Prompt Efficace
- I - ISTRUZIONE: cosa vuoi che faccia il modello
- C - CONTESTO: informazioni di background rilevanti
- I - INPUT: i dati specifici su cui lavorare
- F - FORMATO: come vuoi che sia strutturata la risposta

> **Note relatore**: Non tutti i componenti sono sempre necessari. Una domanda semplice richiede solo l'Istruzione. Un task specializzato li richiede tutti e quattro. La chiave e capire cosa serve caso per caso.

---

## Slide 5: Esempio Completo dello Schema ICIF

### Applicazione Pratica
- Istruzione: "Analizza il sentiment di queste recensioni"
- Contesto: "Sei un analista marketing per uno smartphone"
- Input: tre recensioni specifiche da analizzare
- Formato: "Per ogni recensione indica sentiment, aspetto, motivazione"

> **Note relatore**: Mostrare l'esempio completo dal materiale. Sottolineare come ogni componente aggiunge precisione alla richiesta. Senza contesto, il modello non saprebbe il settore; senza formato, sceglierebbe lui come rispondere.

---

## Slide 6: Il Principio d'Oro della Specificita

### Piu Sei Specifico, Migliore Sara il Risultato
- Livello 1: "Scrivi qualcosa sull'Italia" (troppo vago)
- Livello 2: "Scrivi un paragrafo sull'Italia" (meglio)
- Livello 3: "100 parole sulla cucina italiana" (buono)
- Livello 4: "100 parole, cucina regionale, per turisti americani" (ottimo)

> **Note relatore**: Far notare come ogni livello aggiunge dettaglio. La Checklist della Specificita aiuta: CHI e il destinatario? COSA vuoi esattamente? COME deve essere il formato? QUANTO lungo? PERCHE lo fai?

---

## Slide 7: Il Ruolo del Contesto

### Perche il Contesto e Fondamentale
- Il modello non sa nulla oltre a cio che scrivi nel prompt
- Il contesto riempie le lacune di informazione
- Definisce chi e il modello (ruolo), chi e il pubblico
- Include situazione, vincoli e obiettivo finale
- Senza contesto: risultato generico e poco utile

> **Note relatore**: Esempio: "Riscrivi in modo semplice: l'ipotesi nulla e stata rigettata con p<0.05". Senza contesto, il modello non sa a chi semplificare. Con contesto ("sei un professore, studenti del primo anno"), il risultato e adeguato.

---

## Slide 8: Specificare il Formato di Output

### Controllare la Struttura della Risposta
- Lista: "Elenca in formato bullet point"
- Tabella: "Confronta in tabella con colonne specifiche"
- JSON: "Estrai i dati in formato JSON"
- Markdown: "Scrivi con titoli, sottotitoli e code blocks"
- Se non specifichi il formato, il modello sceglie da solo

> **Note relatore**: Il formato e spesso sottovalutato ma cambia radicalmente l'utilita della risposta. Per applicazioni programmatiche (API, automazione) specificare JSON o formati strutturati e essenziale.

---

## Slide 9: Errori Comuni da Evitare

### I Cinque Errori Piu Frequenti
- Prompt troppo vago: manca specificita e vincoli
- Istruzioni contraddittorie: "breve e dettagliata" non funziona
- Assumere contesto implicito: il modello non sa cosa hai fatto ieri
- Non specificare il pubblico: destinatario cambia il registro
- Dimenticare i vincoli: lunghezza, tono, limiti

> **Note relatore**: Per ogni errore, mostrare la versione sbagliata e quella corretta. Esempio: "Dimmi qualcosa sull'AI" vs "Spiega in 3 frasi come funziona il machine learning supervisionato".

---

## Slide 10: Zero-Shot Prompting

### Chiedere Senza Fornire Esempi
- Zero-shot: istruzione diretta, nessun esempio
- "Classifica questa recensione come positiva o negativa"
- Funziona bene per task semplici e comuni
- Ideale quando il formato output e ovvio
- Limite: non adatto a task molto specifici o insoliti

> **Note relatore**: Il zero-shot funziona perche il modello ha gia visto task simili durante il training. Per traduzione, riassunto, Q&A semplice e quasi sempre sufficiente. E il punto di partenza per qualsiasi prompt.

---

## Slide 11: Few-Shot Prompting

### Insegnare con gli Esempi
- Few-shot: fornire alcuni esempi prima della domanda vera
- Il modello capisce esattamente il formato voluto
- Riduce ambiguita e permette task molto specifici
- 1-2 esempi per task semplici, 3-5 per task complessi
- Gli esempi devono essere rappresentativi, diversificati e corretti

> **Note relatore**: Mostrare l'esempio di classificazione sentiment con 3 esempi (positivo, negativo, neutro). Sottolineare che esempi sbagliati producono output sbagliati. La qualita degli esempi e cruciale.

---

## Slide 12: Best Practices per il Few-Shot

### Come Scegliere gli Esempi Giusti
- Rappresentativi: coprire i casi principali del task
- Diversificati: mostrare varieta nelle risposte
- Corretti: esempi sbagliati generano output sbagliati
- Concisi: non rendere gli esempi troppo lunghi
- Attenzione: troppi esempi consumano token del contesto

> **Note relatore**: Regola pratica - iniziare con 2-3 esempi e aggiungerne solo se il risultato non e soddisfacente. Oltre 5-10 esempi, valutare se il fine-tuning non sia piu appropriato.

---

## Slide 13: Chain-of-Thought (CoT)

### Pensare Passo per Passo
- I modelli sbagliano spesso problemi multi-step
- CoT: chiedere di ragionare esplicitamente passo per passo
- Trigger: "Pensiamo passo per passo..." o "Ragioniamo insieme..."
- Migliora drasticamente problemi matematici e logici
- Funziona perche il modello "mostra il lavoro" intermedio

> **Note relatore**: Esempio: problema con 23 studenti, penne per maschi e femmine. Senza CoT il modello spesso sbaglia. Con CoT, scompone il problema: calcola maschi, poi penne femmine, poi penne maschi, poi totale.

---

## Slide 14: Zero-Shot CoT vs Few-Shot CoT

### Due Varianti del Chain-of-Thought
- Zero-Shot CoT: aggiungi "Pensa passo per passo" alla domanda
- Few-Shot CoT: fornisci esempi che includono il ragionamento
- Zero-Shot CoT: piu semplice, funziona spesso
- Few-Shot CoT: piu affidabile per problemi complessi
- Quando usare CoT: matematica, logica, decisioni multi-fattore

> **Note relatore**: Il Zero-Shot CoT e sorprendentemente efficace: basta aggiungere una frase per migliorare notevolmente le performance. Il Few-Shot CoT e piu controllabile perche mostri esattamente come ragionare.

---

## Slide 15: Role Prompting

### Assegnare un Ruolo al Modello
- Definire un ruolo influenza stile, tono e competenze
- Senza ruolo: "Spiega il ML" produce risposta generica
- Con ruolo: "Sei un professore..." produce risposta didattica
- Combinare ruolo e pubblico e la tecnica piu potente
- Il ruolo non aggiunge conoscenze che il modello non ha

> **Note relatore**: Ruoli efficaci per contesti diversi: senior developer per spiegazioni tecniche, divulgatore scientifico per comunicazione semplice, consulente strategico per analisi business. Il ruolo guida lo stile, non la competenza.

---

## Slide 16: Ruoli Efficaci per Contesti Diversi

### Esempi di Role Prompting
- Spiegazioni tecniche: "Senior developer con 15 anni di esperienza"
- Scrittura creativa: "Scrittore premiato nel genere specifico"
- Analisi business: "Consulente strategico di alto livello"
- Comunicazione semplice: "Divulgatore scientifico per pubblico generale"
- Attenzione: ruoli troppo specifici possono limitare la creativita

> **Note relatore**: La combinazione ruolo + audience e la piu potente. Esempio: ruolo "pediatra esperto", pubblico "genitori preoccupati", task "spiega perche la febbre non e sempre pericolosa". Questo produce risposte calibrate.

---

## Slide 17: Schema Decisionale - Quale Tecnica Usare

### Scegliere la Tecnica Giusta
- Task semplice e comune? Usa Zero-Shot
- Serve un formato output specifico? Usa Few-Shot
- Serve ragionamento multi-step? Usa Chain-of-Thought
- Serve un tono o stile specifico? Usa Role + Contesto
- In caso di dubbio: parti semplice e aggiungi complessita

> **Note relatore**: Mostrare lo schema ad albero decisionale dal materiale. La regola chiave: partire sempre dalla tecnica piu semplice (zero-shot) e aggiungere complessita solo se il risultato non e soddisfacente.

---

## Slide 18: Prompt Iterativi

### Il Ciclo di Raffinamento
- Primo tentativo raramente produce il risultato perfetto
- Ciclo: Prompt v1, valuta output, raffina, Prompt v2
- Aggiungi specificita se output troppo vago
- Aggiungi vincoli se output fuori target
- Aggiungi esempi se formato sbagliato

> **Note relatore**: Il prompt engineering e un processo iterativo, non un colpo solo. Mostrare l'esempio di evoluzione: descrizione cuffie wireless da prompt generico a prompt con tono, lunghezza e target specifici.

---

## Slide 19: Tecniche Avanzate - Panoramica

### Oltre le Basi
- Self-Consistency: genera piu risposte, scegli la piu comune
- Least-to-Most: scomponi problema complesso in sotto-problemi
- Generated Knowledge: genera fatti rilevanti prima di rispondere
- Maieutic Prompting: guida con domande prima della risposta
- Combinare piu tecniche per task complessi

> **Note relatore**: Queste tecniche avanzate sono utili per problemi particolarmente complessi. Self-consistency e utile per la matematica, least-to-most per problemi scomponibili. Non serve memorizzarle tutte, basta sapere che esistono.

---

## Slide 20: Combinare le Tecniche

### Esempio di Prompt Complesso
- Ruolo: "Sei un data scientist senior"
- Task: "Analizza questi dati e fornisci insight"
- CoT: "Ragiona passo per passo: pattern, anomalie, azioni"
- Few-Shot: esempio di output desiderato con formato
- Formato: "Usa bullet points, max 200 parole"

> **Note relatore**: Mostrare come le tecniche si combinano naturalmente. In un prompt reale non si pensa "sto usando role prompting", si costruisce il prompt nel modo piu naturale ed efficace per il task.

---

## Slide 21: Template Pronti all'Uso

### Strutture Riutilizzabili
- Template generico: Ruolo, Task, Contesto, Input, Formato, Vincoli
- Template per analisi: tipo di contenuto, aspetti, formato
- Template per generazione: argomento, pubblico, tono, lunghezza
- I template accelerano la creazione di prompt efficaci
- Adattare il template al caso specifico, non usarlo rigidamente

> **Note relatore**: I template sono punti di partenza, non formule rigide. Distribuire i template dal materiale come riferimento. Incoraggiare gli studenti a creare i propri template per i task che usano piu spesso.

---

## Slide 22: Riepilogo

### Concetti Chiave di Oggi
- Lo schema ICIF struttura ogni prompt: Istruzione, Contesto, Input, Formato
- Zero-shot per task semplici, few-shot per formato specifico
- Chain-of-thought per problemi che richiedono ragionamento
- Role prompting per controllare stile e tono della risposta
- Il prompt engineering e un processo iterativo di raffinamento

> **Note relatore**: Domande di riflessione: qual e il componente piu importante di un prompt? Quando e meglio dare molti esempi vs nessuno? Perche il chain-of-thought migliora le performance su problemi matematici?
