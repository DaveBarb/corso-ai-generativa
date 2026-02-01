# Giorno 7: Pratica - Quiz e Presentazioni

## Quiz Finale

### Istruzioni
- Tempo: 30 minuti
- Domande: 20
- Risposte: scelta multipla + brevi risposte aperte
- Punteggio minimo: 60%

---

## Parte 1: Scelta Multipla (12 domande - 1 punto ciascuna)

### 1. Qual è la differenza principale tra GPT e BERT?
- a) GPT è più grande di BERT
- b) GPT è generativo (predice la prossima parola), BERT è bidirezionale (capisce il contesto)
- c) GPT è open source, BERT no
- d) Non c'è differenza significativa

### 2. Il parametro `temperature` in un LLM controlla:
- a) La velocità di generazione
- b) La lunghezza della risposta
- c) La casualità/creatività della risposta
- d) Il costo della chiamata API

### 3. Cosa significa "allucinazione" nel contesto dei LLM?
- a) Il modello si blocca
- b) Il modello genera contenuti falsi ma plausibili
- c) Il modello non capisce la domanda
- d) Il modello ripete le stesse parole

### 4. RAG sta per:
- a) Random Access Generation
- b) Retrieval Augmented Generation
- c) Rapid AI Growth
- d) Response Accuracy Guarantee

### 5. Quale tecnica è più adatta per problemi di ragionamento multi-step?
- a) Zero-shot prompting
- b) Role prompting
- c) Chain-of-Thought prompting
- d) Few-shot prompting

### 6. In una chiamata API Anthropic, il `system` prompt serve a:
- a) Autenticare la richiesta
- b) Definire il comportamento generale del modello
- c) Limitare i token di output
- d) Specificare il modello da usare

### 7. I diffusion models generano immagini:
- a) Copiando immagini esistenti dal training set
- b) Partendo da rumore e rimuovendolo gradualmente
- c) Componendo pezzi di immagini diverse
- d) Usando regole geometriche predefinite

### 8. Claude Vision può:
- a) Generare nuove immagini
- b) Modificare immagini esistenti
- c) Analizzare e descrivere immagini
- d) Convertire immagini in altri formati

### 9. Secondo l'AI Act europeo, quale categoria è VIETATA?
- a) Chatbot per customer service
- b) Social scoring governativo
- c) Sistemi di raccomandazione
- d) Traduzione automatica

### 10. Quale affermazione sui bias nei LLM è VERA?
- a) I modelli moderni non hanno più bias
- b) I bias derivano solo dai dati di training
- c) I bias possono essere mitigati ma non eliminati completamente
- d) Solo i modelli open source hanno bias

### 11. Per gestire conversazioni multi-turn con l'API, devi:
- a) Usare un modello speciale per chat
- b) Passare tutta la cronologia dei messaggi ad ogni chiamata
- c) Salvare lo stato sul server di Anthropic
- d) Usare session cookies

### 12. Qual è il vantaggio principale di usare few-shot prompting?
- a) Costa meno
- b) È più veloce
- c) Mostra al modello esattamente il formato desiderato
- d) Funziona con tutti i modelli

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

---

# Linee Guida Presentazioni Progetti

## Formato (5-7 minuti)

### 1. Introduzione (1 minuto)
- Nome del progetto e team
- Problema che risolve / use case
- Perché avete scelto questo progetto

### 2. Demo Live (3-4 minuti)
- Il progetto in azione
- 2-3 casi d'uso principali
- Come gestisce situazioni particolari

### 3. Aspetti Tecnici (1 minuto)
- Architettura generale
- Scelta tecniche interessanti
- Sfida principale e come l'avete risolta

### 4. Conclusione e Q&A (1-2 minuti)
- Riassunto in una frase
- Possibili sviluppi futuri
- Domande

---

## Checklist Pre-Presentazione

### Tecnica
- [ ] Laptop carico o collegato
- [ ] Connessione internet funzionante
- [ ] API key configurata e funzionante
- [ ] Test del progetto fatto poco prima
- [ ] Plan B pronto (screenshot, video backup)

### Contenuto
- [ ] Sappiamo tutti chi dice cosa
- [ ] Abbiamo provato la demo almeno 2 volte
- [ ] Input di esempio preparati
- [ ] Tempi rispettati (cronometrati)

---

## Errori Comuni da Evitare

**Non leggere da foglio/schermo** - Parla con il pubblico

**Non scusarti per "cose non fatte"** - Concentrati su quello che funziona

**Non entrare in troppi dettagli tecnici** - Mostra il risultato, spiega brevemente come

**Non affrettarti** - Respira, lascia il tempo di vedere l'output

**Non digitare codice live** - Usa input già preparati

**Non mostrare file con API key** - Usa variabili d'ambiente

---

## Criteri di Valutazione

| Criterio | Peso | Descrizione |
|----------|------|-------------|
| **Funzionalità** | 30% | Il progetto fa quello che dovrebbe fare |
| **Demo** | 25% | Presentazione chiara e fluida |
| **Tecnica** | 20% | Scelte tecniche appropriate |
| **Qualità codice** | 15% | Codice pulito e documentato |
| **Teamwork** | 10% | Partecipazione equilibrata |
