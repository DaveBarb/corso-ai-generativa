# Giorno 3: API Claude

**Corso**: AI Generativa
**Durata**: ~6 ore

---

## Slide 1: Titolo della Giornata

### API Claude - Programmare con l'AI
- Dall'interfaccia web al codice: integrare Claude nelle applicazioni
- Corso AI Generativa - ITS Steve Jobs

> **Note relatore**: Oggi facciamo il salto dall'uso manuale all'uso programmatico. Le API permettono di integrare l'AI in applicazioni, automatizzare processi e avere controllo totale sui parametri.

---

## Slide 2: Obiettivi della Giornata

### Cosa imparerete oggi
- Capire cos'e un'API e perche usarla al posto dell'interfaccia web
- Gestire l'autenticazione sicura con API key
- Strutturare richieste all'API di Claude con Python
- Implementare conversazioni multi-turn e streaming

> **Note relatore**: Alla fine della giornata sarete in grado di scrivere un programma Python che comunica con Claude, gestisce conversazioni e monitora i costi. Competenza fondamentale per qualsiasi sviluppatore.

---

## Slide 3: Cos'e un'API

### Application Programming Interface
- Un "contratto" che definisce come due software comunicano
- Analogia del ristorante: tu (client), cameriere (API), cucina (server)
- Il tuo programma Python e il cliente
- L'API e l'interfaccia di comunicazione
- I server Anthropic con Claude sono la cucina

> **Note relatore**: L'analogia del ristorante funziona bene: tu (il programma) ordini al cameriere (API) che porta l'ordine in cucina (server Claude). Non entri in cucina direttamente, comunichi tramite l'interfaccia.

---

## Slide 4: Perche Usare l'API

### Vantaggi rispetto all'Interfaccia Web
- Automazione: elaborazione programmabile e ripetibile
- Integrazione: inserire AI in applicazioni esistenti
- Batch processing: elaborare centinaia di richieste
- Personalizzazione totale dei parametri del modello
- Pay per use: paghi solo per quello che consumi

> **Note relatore**: L'interfaccia web e ideale per uso interattivo, ma non scala. Se devi analizzare 1000 email o costruire un chatbot, servono le API. La scelta dipende dal caso d'uso.

---

## Slide 5: Anatomia di una Richiesta HTTP

### Struttura della Comunicazione
- METODO: POST per inviare dati al server
- ENDPOINT: URL specifico dell'API (api.anthropic.com/v1/messages)
- HEADERS: autenticazione e tipo di contenuto
- BODY: dati della richiesta in formato JSON
- La risposta contiene status code, headers e body

> **Note relatore**: Per le API di LLM usiamo quasi sempre il metodo POST. Lo status code nella risposta ci dice se tutto e andato bene (200), se c'e un errore nel prompt (400), se la key non e valida (401), o se abbiamo superato i limiti (429).

---

## Slide 6: Status Code HTTP Importanti

### Capire la Risposta del Server
- 200 OK: richiesta elaborata con successo
- 400 Bad Request: errore nel prompt o nei parametri
- 401 Unauthorized: API key errata o mancante
- 429 Too Many Requests: superato il rate limit
- 500 Server Error: problema lato server, riprovare

> **Note relatore**: Conoscere i codici di stato e fondamentale per il debugging. Il 429 e il piu comune in fase di sviluppo: significa che stai facendo troppe richieste. La soluzione e l'exponential backoff.

---

## Slide 7: API Key - Autenticazione

### La Chiave di Accesso all'API
- API key: chiave segreta che identifica e autorizza l'utente
- Formato: sk-ant-api03-xxxxxxxxxxxxx
- MAI committare la key su GitHub o condividerla
- MAI metterla direttamente nel codice sorgente
- Usare sempre variabili d'ambiente o file .env

> **Note relatore**: La sicurezza delle API key e critica. Se qualcuno ottiene la tua key, puo usarla a tuo nome e generare costi. Se compromessa, rigenerare immediatamente dalla console Anthropic.

---

## Slide 8: Gestire le API Key in Python

### Tre Metodi Sicuri
- Metodo 1: os.environ.get("ANTHROPIC_API_KEY")
- Metodo 2: python-dotenv con file .env escluso da git
- Metodo 3: getpass.getpass() per input interattivo (solo test)
- Il file .env deve essere sempre nel .gitignore
- Mai esporre la key in log, screenshot o documentazione

> **Note relatore**: Il metodo raccomandato per produzione e la variabile d'ambiente. Il file .env con python-dotenv e comodo per lo sviluppo locale. Il getpass e utile solo per test rapidi in notebook.

---

## Slide 9: Rate Limits

### Limiti alle Richieste
- I rate limit proteggono il servizio da sovraccarichi
- Free tier: 5 richieste/minuto, 10.000 token/minuto
- Tier 1: 50 richieste/minuto, 40.000 token/minuto
- Tier 2: 100 richieste/minuto, 80.000 token/minuto
- Gestire con retry e exponential backoff

> **Note relatore**: L'exponential backoff significa aspettare 1s, poi 2s, poi 4s tra i tentativi. Questo evita di sovraccaricare il server. Le API restituiscono header con informazioni sui limiti rimanenti.

---

## Slide 10: Costi e Pricing

### Come Funziona la Fatturazione
- Si paga per token, non per richiesta
- Costo = (input_tokens x prezzo_input) + (output_tokens x prezzo_output)
- Haiku: $0.25/$1.25 per milione di token (input/output)
- Sonnet: $3.00/$15.00 per milione di token
- Opus: $15.00/$75.00 per milione di token

> **Note relatore**: Esempio pratico: 500 token input + 200 output con Haiku costa circa $0.0004. Con 1000 richieste simili si spendono circa $0.38. I costi sono molto contenuti per Haiku, crescono significativamente per Opus.

---

## Slide 11: Strategie di Ottimizzazione Costi

### Risparmiare senza Perdere Qualita
- Scegliere il modello giusto: Haiku per task semplici
- Limitare max_tokens per risposte piu brevi
- Scrivere prompt concisi ed efficienti
- Implementare cache per domande ripetitive
- Free tier: $5 di crediti per nuovi account

> **Note relatore**: Regola pratica: iniziare sempre con Haiku. Passare a Sonnet solo se la qualita non e sufficiente. Opus va riservato a task che richiedono ragionamento complesso. La cache puo ridurre i costi fino all'80%.

---

## Slide 12: Struttura della Richiesta Claude

### I Parametri Fondamentali
- model: quale modello usare (haiku, sonnet, opus)
- max_tokens: limite massimo dei token in risposta (obbligatorio)
- system: istruzioni generali per il comportamento (opzionale)
- messages: la conversazione, lista di messaggi (obbligatorio)
- temperature: creativita della risposta (opzionale, default 1.0)

> **Note relatore**: Mostrare il codice Python base: client.messages.create() con i parametri. Sottolineare che model e max_tokens sono obbligatori, gli altri sono opzionali ma importanti per controllare il comportamento.

---

## Slide 13: System Prompt, User e Assistant

### I Tre Ruoli nella Conversazione
- SYSTEM: definisce comportamento generale, invisibile all'utente
- USER: i messaggi e le richieste dell'utente
- ASSISTANT: le risposte di Claude, puo essere pre-compilato
- Il system prompt persiste per tutta la conversazione
- L'assistant pre-fill puo guidare il formato della risposta

> **Note relatore**: Il system prompt e ideale per definire ruolo, regole di risposta, formato output e contesto persistente. L'assistant pre-fill e un trucco potente: iniziare la risposta di Claude con "Ecco la lista:\n1." forza un formato specifico.

---

## Slide 14: System Prompt Efficace

### Come Scriverlo Bene
- Definire chiaramente il ruolo del modello
- Elencare le regole di comportamento numerate
- Specificare la lingua e il formato di risposta
- Indicare cosa fare in caso di incertezza
- Mantenere conciso ma completo

> **Note relatore**: Esempio efficace: "Sei un assistente per sviluppatori Python. REGOLE: 1. Rispondi in italiano. 2. Includi codice quando rilevante. 3. Spiega errori chiaramente. 4. Se non sei sicuro, dillo."

---

## Slide 15: Parametro Temperature in Dettaglio

### Controllare la Creativita
- Temperature 0.0: deterministico, ripetibile, sempre uguale
- Temperature 0.5: bilanciato, leggera variabilita
- Temperature 1.0: default, buon mix creativita e coerenza
- Temperature > 1.0: molto creativo, meno prevedibile
- Per codice e matematica: 0. Per storie: 0.7-1.0

> **Note relatore**: Consiglio pratico: usare temperature O top_p, non entrambi. Per applicazioni dove serve ripetibilita (test, validazione), usare temperature=0. Per brainstorming e scrittura creativa, temperature piu alta.

---

## Slide 16: Struttura della Risposta

### Leggere e Utilizzare il Risultato
- response.content[0].text: il testo della risposta
- response.stop_reason: perche il modello si e fermato
- "end_turn": risposta completata naturalmente
- "max_tokens": risposta troncata, potrebbe essere incompleta
- response.usage: token usati per monitorare i costi

> **Note relatore**: Controllare sempre lo stop_reason. Se e "max_tokens", la risposta potrebbe essere incompleta e serve aumentare il limite. L'usage e fondamentale per monitorare i costi in produzione.

---

## Slide 17: Conversazioni Multi-turn

### Gestire il Contesto tra Messaggi
- Claude non ha memoria tra chiamate API
- Bisogna passare tutta la cronologia ad ogni richiesta
- Messaggio user, risposta assistant, nuovo messaggio user...
- La cronologia puo crescere troppo: limitare o riassumere
- Classe ChatSession per gestire lo stato della conversazione

> **Note relatore**: Questo e un punto chiave: a differenza dell'interfaccia web, via API il modello non "ricorda" nulla. Ogni chiamata e indipendente. La gestione della memoria e responsabilita dello sviluppatore.

---

## Slide 18: Gestire la Lunghezza della Cronologia

### Strategie per Conversazioni Lunghe
- Limitare il numero di messaggi (es. ultimi 20)
- Riassumere periodicamente la conversazione
- Sliding window: mantenere solo i messaggi recenti
- Attenzione: piu cronologia = piu token = piu costi
- Context window di 200K token e ampia ma non infinita

> **Note relatore**: 200K token corrispondono a circa 150.000 parole o 300+ pagine. Sembra molto, ma in conversazioni lunghe con molto contesto si raggiunge prima di quanto si pensi. Pianificare la gestione della memoria.

---

## Slide 19: Streaming delle Risposte

### Ricevere Token in Tempo Reale
- Senza streaming: attendi tutta la risposta, poi la visualizzi
- Con streaming: ricevi e mostri token man mano
- Feedback immediato per l'utente, migliore UX
- Timeout meno probabili per risposte lunghe
- Usare client.messages.stream() invece di create()

> **Note relatore**: Lo streaming e essenziale per applicazioni user-facing. L'utente vede la risposta formarsi in tempo reale, come nell'interfaccia web di Claude. Senza streaming, risposte lunghe sembrano "bloccate".

---

## Slide 20: Gestione degli Errori

### Programmare in Modo Robusto
- AuthenticationError: API key non valida
- RateLimitError: troppe richieste, implementare retry
- APIError: errore generico, loggare e riprovare
- Usare sempre try/except attorno alle chiamate API
- Exponential backoff per gestire i rate limit

> **Note relatore**: In produzione, la gestione degli errori non e opzionale. Ogni chiamata API puo fallire per motivi diversi. Un pattern robusto include retry con backoff, logging degli errori e notifiche per errori critici.

---

## Slide 21: Contare i Token

### Stimare Costi e Rispettare Limiti
- Regola del pollice: circa 4 caratteri = 1 token (inglese)
- Il conteggio esatto e nella risposta: response.usage
- input_tokens + output_tokens = consumo totale
- Monitorare per rispettare budget e limiti
- 200K token di context window per tutti i modelli Claude 3

> **Note relatore**: Per stimare prima di inviare, dividere il numero di caratteri per 4. Per l'italiano il rapporto e circa 3.5 caratteri per token. Il conteggio esatto si ottiene solo dalla risposta dell'API.

---

## Slide 22: Riepilogo

### Concetti Chiave di Oggi
- Le API permettono automazione, integrazione e controllo totale
- API key vanno protette: variabili d'ambiente, mai nel codice
- Struttura richiesta: model, max_tokens, system, messages
- Claude non ha memoria tra chiamate: gestire la cronologia
- Monitorare costi con response.usage e scegliere il modello giusto

> **Note relatore**: Domande di riflessione: perche e importante non condividere la API key? Quale modello useresti per un chatbot ad alto volume? Come gestiresti un'applicazione con 1000 richieste? Quando usare temperature=0?
