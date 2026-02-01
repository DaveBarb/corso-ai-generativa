# Giorno 2: Prompt Engineering

## Obiettivi della Giornata

- Identificare i componenti di un prompt efficace
- Applicare zero-shot, few-shot e chain-of-thought prompting
- Usare role prompting
- Iterare e raffinare i prompt

---

## Blocco 1: Anatomia di un Prompt Efficace

### Cos'è un Prompt?

Un **prompt** è l'input testuale che forniamo a un modello di linguaggio per ottenere una risposta.

```
┌────────────────────────────────────────────────┐
│                    PROMPT                       │
│                                                 │
│  "Scrivi un riassunto di questo articolo"      │
│                                                 │
└────────────────────────────────────────────────┘
                      ↓
               [LLM Processing]
                      ↓
┌────────────────────────────────────────────────┐
│                   RISPOSTA                      │
│                                                 │
│  "L'articolo tratta di..."                     │
│                                                 │
└────────────────────────────────────────────────┘
```

### Perché il Prompt è Importante?
- È l'**unica** interfaccia tra te e il modello
- Un buon prompt può fare la differenza tra risposta inutile e risposta eccellente
- "Garbage in, garbage out" - input vago = output vago

---

### I Quattro Componenti di un Prompt (Schema ICIF)

| Componente | Descrizione |
|------------|-------------|
| **I** - ISTRUZIONE | Cosa vuoi che faccia il modello |
| **C** - CONTESTO | Informazioni di background |
| **I** - INPUT | I dati su cui lavorare |
| **F** - FORMATO | Come vuoi la risposta |

### Esempio Completo

```
[ISTRUZIONE]
Analizza il sentiment di queste recensioni di prodotto.

[CONTESTO]
Sei un analista di marketing che deve capire come i clienti
percepiscono il nostro nuovo smartphone.

[INPUT]
Recensione 1: "Batteria fantastica, dura tutto il giorno!"
Recensione 2: "Troppo costoso per quello che offre."
Recensione 3: "La fotocamera è buona ma non eccezionale."

[FORMATO]
Per ogni recensione indica:
- Sentiment: Positivo/Negativo/Neutro
- Aspetto menzionato
- Breve motivazione
```

---

### Chiarezza e Specificità

!!! tip "Il Principio d'Oro"
    **Più sei specifico nella richiesta, più otterrai ciò che vuoi.**

#### Esempio: Evoluzione di un Prompt

**Livello 1 - Vago (da evitare):**
```
Scrivi qualcosa sull'Italia.
```

**Livello 2 - Meglio:**
```
Scrivi un paragrafo sull'Italia.
```

**Livello 3 - Buono:**
```
Scrivi un paragrafo di 100 parole sulla cucina italiana.
```

**Livello 4 - Ottimo:**
```
Scrivi un paragrafo di 100 parole sulla cucina italiana,
destinato a turisti americani, con focus sui piatti regionali
meno conosciuti fuori dall'Italia.
```

### Checklist della Specificità

- [ ] **CHI** - A chi è destinato l'output?
- [ ] **COSA** - Esattamente cosa vuoi?
- [ ] **COME** - In che formato/stile?
- [ ] **QUANTO** - Lunghezza/quantità?
- [ ] **PERCHÉ** - (opzionale) Scopo finale?

---

### Specificare il Formato di Output

Se non specifichi il formato, il modello sceglie lui - e potrebbe non essere quello che ti serve.

**Formati Comuni:**

=== "Lista"
    ```
    Elenca 5 benefici dell'esercizio fisico in formato bullet point.
    ```

=== "Tabella"
    ```
    Confronta Python e JavaScript in una tabella con colonne:
    Aspetto, Python, JavaScript
    ```

=== "JSON"
    ```
    Estrai nome, email e telefono in formato JSON:
    "Contattare Mario Rossi: mario@email.com, 02-1234567"
    ```

=== "Markdown"
    ```
    Scrivi una guida con titoli, sottotitoli e code blocks.
    ```

---

### Errori Comuni da Evitare

| Errore | Esempio Sbagliato | Esempio Corretto |
|--------|------------------|------------------|
| Troppo vago | "Dimmi qualcosa sull'AI" | "Spiega in 3 frasi come funziona il machine learning supervisionato" |
| Contraddittorio | "Scrivi una risposta breve e dettagliata" | "Scrivi una risposta di massimo 100 parole, includendo i 3 punti chiave" |
| Assumi contesto | "Continua il progetto di ieri" | "Sto lavorando su un'app React per to-do list. Aggiungi..." |
| No pubblico | "Spiega la blockchain" | "Spiega la blockchain a un imprenditore non tecnico in 2 paragrafi" |

---

## Blocco 2: Tecniche di Prompting

### Zero-Shot Prompting

**Zero-shot** = chiedere al modello di fare qualcosa senza fornire esempi.

```
Classifica questa recensione come positiva o negativa:
'Il prodotto è arrivato rotto e il servizio clienti non ha risposto.'

→ Output: "Negativa"
```

**Quando funziona bene:**

- Task semplici e comuni (traduzione, riassunto, Q&A)
- Quando il modello ha già "visto" task simili nel training
- Quando il formato output è ovvio

---

### Few-Shot Prompting

**Few-shot** = fornire alcuni esempi prima della domanda vera.

```
Classifica il sentiment delle recensioni.

Esempio 1:
Recensione: "Fantastico, lo consiglio!"
Sentiment: Positivo

Esempio 2:
Recensione: "Pessimo, soldi buttati."
Sentiment: Negativo

Esempio 3:
Recensione: "Fa il suo lavoro, niente di speciale."
Sentiment: Neutro

Ora classifica:
Recensione: "Prodotto decente ma troppo caro."
Sentiment:
```

**Best Practices per gli Esempi:**

1. **Rappresentativi**: copri i casi principali
2. **Diversificati**: mostra varietà
3. **Corretti**: esempi sbagliati = output sbagliati
4. **Concisi**: non troppo lunghi

---

### Chain-of-Thought (CoT)

I modelli spesso sbagliano problemi che richiedono ragionamento multi-step. La soluzione: farli **pensare passo per passo**.

```
Risolvi questo problema passo per passo:

In una classe ci sono 23 studenti. 15 sono femmine.
Ogni femmina ha 3 penne e ogni maschio ha 5 penne.
Quante penne ci sono in totale?

Ragionamento:
1. Numero di maschi: 23 - 15 = 8 maschi
2. Penne delle femmine: 15 × 3 = 45 penne
3. Penne dei maschi: 8 × 5 = 40 penne
4. Totale: 45 + 40 = 85 penne

Risposta: 85 penne
```

**Trigger Phrases per CoT:**

- "Pensiamo passo per passo..."
- "Let's think step by step..."
- "Ragioniamo insieme..."
- "Prima di rispondere, analizziamo il problema..."

---

### Role Prompting

Assegnare un ruolo/persona al modello per influenzare stile, tono e competenze.

```
SENZA RUOLO
"Spiega il machine learning"
→ Risposta generica

CON RUOLO
"Sei un professore universitario di informatica.
 Spiega il machine learning a studenti del primo anno."
→ Risposta didattica, con analogie, progressiva
```

**Ruoli Efficaci:**

| Contesto | Ruolo Suggerito |
|----------|-----------------|
| Spiegazioni tecniche | Senior developer con 15 anni di esperienza |
| Scrittura creativa | Scrittore premiato nel genere specifico |
| Analisi business | Consulente strategico |
| Comunicazione semplice | Divulgatore scientifico |

---

### Schema Decisionale: Quale Tecnica Usare?

```
                    ┌─────────────────┐
                    │ Task semplice?  │
                    └────────┬────────┘
                             │
               ┌─────────────┴─────────────┐
               │                           │
              SÌ                          NO
               │                           │
               ↓                           ↓
        ┌─────────────┐           ┌─────────────────┐
        │ Zero-shot   │           │ Serve formato   │
        └─────────────┘           │ specifico?      │
                                  └────────┬────────┘
                                           │
                              ┌────────────┴────────────┐
                              │                         │
                             SÌ                        NO
                              │                         │
                              ↓                         ↓
                       ┌─────────────┐         ┌─────────────────┐
                       │ Few-shot    │         │ Serve ragion.   │
                       └─────────────┘         │ multi-step?     │
                                               └────────┬────────┘
                                                        │
                                           ┌────────────┴────────┐
                                           │                     │
                                          SÌ                    NO
                                           │                     │
                                           ↓                     ↓
                                    ┌─────────────┐      ┌─────────────┐
                                    │ Chain-of-   │      │ Role +      │
                                    │ Thought     │      │ Contesto    │
                                    └─────────────┘      └─────────────┘
```

---

## Domande di Riflessione

1. Qual è il componente più importante di un prompt? Dipende dal task?

2. Quando è meglio dare molti esempi vs nessuno?

3. Perché il chain-of-thought migliora le performance su problemi matematici?

4. Come decidi se un task è "semplice" abbastanza per zero-shot?

---

## Risorse

- [Anthropic Prompt Engineering Guide](https://docs.anthropic.com/claude/docs/prompt-engineering)
- [Chain-of-Thought Paper](https://arxiv.org/abs/2201.11903)
- [Prompt Engineering Guide](https://www.promptingguide.ai/)
