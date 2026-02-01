# Quiz Finale - Corso AI Generativa

## Istruzioni
- Tempo: 30 minuti
- Domande: 20
- Risposte: scelta multipla + brevi risposte aperte
- Punteggio minimo: 60%

---

## Parte 1: Scelta Multipla (12 domande - 1 punto ciascuna)

### 1. Qual è la differenza principale tra GPT e BERT?

a) GPT è più grande di BERT
b) GPT è generativo (predice la prossima parola), BERT è bidirezionale (capisce il contesto)
c) GPT è open source, BERT no
d) Non c'è differenza significativa

---

### 2. Il parametro `temperature` in un LLM controlla:

a) La velocità di generazione
b) La lunghezza della risposta
c) La casualità/creatività della risposta
d) Il costo della chiamata API

---

### 3. Cosa significa "allucinazione" nel contesto dei LLM?

a) Il modello si blocca
b) Il modello genera contenuti falsi ma plausibili
c) Il modello non capisce la domanda
d) Il modello ripete le stesse parole

---

### 4. RAG sta per:

a) Random Access Generation
b) Retrieval Augmented Generation
c) Rapid AI Growth
d) Response Accuracy Guarantee

---

### 5. Quale tecnica è più adatta per problemi di ragionamento multi-step?

a) Zero-shot prompting
b) Role prompting
c) Chain-of-Thought prompting
d) Few-shot prompting

---

### 6. In una chiamata API Anthropic, il `system` prompt serve a:

a) Autenticare la richiesta
b) Definire il comportamento generale del modello
c) Limitare i token di output
d) Specificare il modello da usare

---

### 7. I diffusion models generano immagini:

a) Copiando immagini esistenti dal training set
b) Partendo da rumore e rimuovendolo gradualmente
c) Componendo pezzi di immagini diverse
d) Usando regole geometriche predefinite

---

### 8. Claude Vision può:

a) Generare nuove immagini
b) Modificare immagini esistenti
c) Analizzare e descrivere immagini
d) Convertire immagini in altri formati

---

### 9. Secondo l'AI Act europeo, quale categoria è VIETATA?

a) Chatbot per customer service
b) Social scoring governativo
c) Sistemi di raccomandazione
d) Traduzione automatica

---

### 10. Quale affermazione sui bias nei LLM è VERA?

a) I modelli moderni non hanno più bias
b) I bias derivano solo dai dati di training
c) I bias possono essere mitigati ma non eliminati completamente
d) Solo i modelli open source hanno bias

---

### 11. Per gestire conversazioni multi-turn con l'API, devi:

a) Usare un modello speciale per chat
b) Passare tutta la cronologia dei messaggi ad ogni chiamata
c) Salvare lo stato sul server di Anthropic
d) Usare session cookies

---

### 12. Qual è il vantaggio principale di usare few-shot prompting?

a) Costa meno
b) È più veloce
c) Mostra al modello esattamente il formato desiderato
d) Funziona con tutti i modelli

---

## Parte 2: Risposte Brevi (4 domande - 2 punti ciascuna)

### 13. Descrivi in 2-3 frasi cos'è il function calling e fornisci un esempio pratico.

_Spazio per risposta:_

---

### 14. Quali sono 3 best practices per la sicurezza quando si usa l'API di un LLM?

1.
2.
3.

---

### 15. Spiega la differenza tra fine-tuning e RAG. Quando useresti l'uno o l'altro?

_Spazio per risposta:_

---

### 16. Quali sono 2 limitazioni etiche nell'uso dell'AI generativa e come le gestiresti?

_Spazio per risposta:_

---

## Parte 3: Pratica (4 domande - 2 punti ciascuna)

### 17. Riscrivi questo prompt vago in modo efficace:

**Prompt originale:** "Parlami di Python"

**Prompt migliorato:**

---

### 18. Questo codice ha un problema. Identificalo e correggilo:

```python
response = client.messages.create(
    model="claude-3-haiku-20240307",
    max_tokens=100,
    messages=[
        {"role": "user", "content": "Ciao!"}
    ]
)
print(response.text)  # <-- Errore qui
```

**Problema:**

**Correzione:**

---

### 19. Scrivi un system prompt efficace per un assistente virtuale che aiuta studenti con i compiti di matematica.

_Spazio per risposta:_

---

### 20. Dato questo scenario, quale approccio useresti e perché?

**Scenario:** Devi creare un sistema che risponde a domande sui prodotti di un e-commerce, usando il catalogo aziendale che viene aggiornato settimanalmente.

**Approccio scelto:**

**Motivazione:**

---

## Risposte (per il docente)

<details>
<summary>Clicca per vedere le risposte</summary>

### Parte 1
1. b
2. c
3. b
4. b
5. c
6. b
7. b
8. c
9. b
10. c
11. b
12. c

### Parte 2

**13.** Function calling permette al LLM di "chiamare" funzioni esterne quando necessario. Il modello decide quale funzione usare e con quali parametri, il sistema esegue la funzione, e il risultato viene passato al modello. Esempio: utente chiede il meteo, il modello chiama get_weather("Milano"), riceve i dati, e formula la risposta.

**14.**
- Non mettere API key nel codice (usare variabili d'ambiente)
- Non inviare dati sensibili (password, PII) nei prompt
- Validare e sanitizzare input degli utenti

**15.** Fine-tuning modifica i pesi del modello con dati specifici, creando una versione specializzata. RAG recupera informazioni rilevanti al momento della query e le passa come contesto. Usare fine-tuning per cambiare lo stile/comportamento del modello, RAG per dare accesso a conoscenza specifica che cambia nel tempo.

**16.**
- Bias: i modelli riflettono pregiudizi dei dati. Gestione: testing per bias, prompt espliciti per diversità, verifica output.
- Allucinazioni: output falsi. Gestione: verificare fatti importanti, usare RAG, chiedere fonti.

### Parte 3

**17.** Esempio:
```
Spiega i concetti fondamentali di Python a uno studente che conosce già le basi della programmazione.
Includi: variabili, tipi di dati, strutture di controllo.
Formato: lista puntata con brevi spiegazioni ed esempi di codice.
Lunghezza: circa 300 parole.
```

**18.**
- Problema: `response.text` non esiste. Il testo è in `response.content[0].text`
- Correzione: `print(response.content[0].text)`

**19.** Esempio:
```
Sei un tutor di matematica paziente e incoraggiante.

COMPORTAMENTO:
- Guida lo studente verso la soluzione invece di darla direttamente
- Usa esempi concreti e visualizzazioni
- Celebra i progressi, incoraggia dopo gli errori
- Adatta il livello di spiegazione alle difficoltà mostrate

FORMATO:
- Scomponi problemi complessi in passaggi
- Usa notazione matematica chiara
- Verifica la comprensione con domande

LIMITI:
- Non fare i compiti al posto dello studente
- Se non sei sicuro di qualcosa, dillo
```

**20.**
- Approccio: RAG (Retrieval Augmented Generation)
- Motivazione: Il catalogo viene aggiornato settimanalmente, quindi serve un sistema che possa accedere ai dati più recenti senza dover ri-addestrare il modello. RAG permette di cercare nel catalogo e passare i prodotti rilevanti come contesto, garantendo risposte accurate e aggiornate.

</details>

---

## Tabella Punteggi

| Sezione | Punti Possibili |
|---------|-----------------|
| Parte 1 (12 domande × 1pt) | 12 |
| Parte 2 (4 domande × 2pt) | 8 |
| Parte 3 (4 domande × 2pt) | 8 |
| **Totale** | **28** |

| Voto | Punteggio |
|------|-----------|
| Eccellente | 25-28 |
| Buono | 20-24 |
| Sufficiente | 17-19 |
| Insufficiente | <17 |
