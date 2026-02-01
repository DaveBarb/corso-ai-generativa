# Blocco 2: Come Funzionano i LLM (1h)

## Obiettivi di Apprendimento

Al termine di questo blocco, gli studenti saranno in grado di:
- Comprendere il processo di tokenizzazione
- Visualizzare il concetto di embedding
- Capire il meccanismo di attention a livello intuitivo
- Spiegare come un LLM genera testo token per token
- Distinguere tra pre-training, fine-tuning e RLHF

---

## 1. Tokenizzazione: Spezzettare il Testo

### Cos'è un Token?
Un token è l'unità base che il modello legge e produce. Non sempre corrisponde a una parola!

```
"Ciao, come stai?"
→ Tokens: ["Ciao", ",", " come", " stai", "?"]

"Tokenizzazione"
→ Tokens: ["Token", "izz", "azione"]  (parola rara, spezzata)

"the"
→ Token: ["the"]  (parola comune, un solo token)
```

### Perché Tokenizzare?
- Il modello lavora con numeri, non lettere
- I token sono un compromesso tra caratteri (troppo piccoli) e parole (troppo grandi)
- Parole comuni = 1 token, parole rare = più token

### Vocabolario
- Ogni modello ha un vocabolario fisso (es. 100,000 token)
- BPE (Byte Pair Encoding): algoritmo per costruire il vocabolario
- Token speciali: `<start>`, `<end>`, `<pad>`

### Demo: Tokenizer
```python
# Esempio concettuale (la demo vera si fa in pratica)
from anthropic import Anthropic

# Claude usa un tokenizer simile a quelli di altri LLM
# "Intelligenza artificiale" → ~3-4 token
# "AI" → 1 token
```

**Perché è importante:**
- I costi API si basano sui token
- La "context window" è in token (es. 200K token per Claude)
- Lingue diverse hanno efficienze diverse

---

## 2. Embedding: Parole come Coordinate

### L'Intuizione
Immagina ogni parola come un punto in uno spazio multidimensionale, dove la posizione riflette il significato.

```
                    ↑ Royalty
                    |
            Re ●    |    ● Regina
                    |
    ────────────────┼────────────────→ Gender
                    |
         Uomo ●     |    ● Donna
                    |
```

### Proprietà degli Embedding
- Parole simili = punti vicini
- Relazioni semantiche = direzioni nello spazio
- Famoso esempio: Re - Uomo + Donna ≈ Regina

### Come Funziona
1. Ogni token diventa un vettore (lista di numeri)
2. Dimensionalità tipica: 768 - 4096 dimensioni
3. I valori vengono appresi durante il training

```
"gatto" → [0.23, -0.45, 0.12, ..., 0.78]  (768 numeri)
"cane"  → [0.25, -0.42, 0.15, ..., 0.80]  (simile!)
"tavolo" → [-0.12, 0.67, -0.33, ..., 0.21]  (diverso)
```

### Visualizzazione 2D (riduzione dimensionale)

```
                    ● computer
           ● laptop     ● tastiera
                    ● mouse

        ● pizza
    ● pasta    ● ristorante
        ● cibo
```

---

## 3. Attention: L'Evidenziatore Intelligente

### Il Problema
Quando leggiamo "Il gatto, che era nero, dormiva sul divano", come facciamo a capire che "dormiva" si riferisce a "gatto" e non a "divano"?

### La Soluzione: Attention
Il meccanismo di attention permette a ogni parola di "guardare" tutte le altre e decidere a quali prestare attenzione.

### Analogia: L'Evidenziatore
Immagina di evidenziare un testo. Per ogni parola che leggi, evidenzi le altre parole che sono rilevanti per capirla.

```
"Il [gatto], che era nero, [dormiva] sul divano"
     ^^^^^^                  ^^^^^^^^
     Chi dormiva? → Attenzione forte tra "gatto" e "dormiva"
```

### Self-Attention Visuale

```
Query: "dormiva"  (cosa sto cercando?)

           Il   gatto   che   era   nero   dormiva   sul   divano
Score:    0.1   0.7    0.05  0.05   0.1    1.0      0.02   0.03
          ───   ═══    ───   ───    ───    ═════    ───    ───

Il modello "presta attenzione" soprattutto a "gatto" e a se stesso.
```

### Multi-Head Attention
- Non una sola "testa" che guarda, ma molte in parallelo
- Ogni testa può catturare relazioni diverse
- Testa 1: relazioni grammaticali
- Testa 2: relazioni semantiche
- Testa 3: relazioni posizionali
- ecc.

### Transformer = Attention + Feed Forward
```
┌─────────────────────────────────────┐
│          Layer N                     │
│  ┌─────────────────────────────┐    │
│  │      Multi-Head Attention    │    │
│  └─────────────────────────────┘    │
│              ↓                       │
│  ┌─────────────────────────────┐    │
│  │      Feed Forward Network    │    │
│  └─────────────────────────────┘    │
└─────────────────────────────────────┘
              ↓
        (ripetuto N volte)
              ↓
┌─────────────────────────────────────┐
│          Layer 1                     │
└─────────────────────────────────────┘
              ↓
        Token Embeddings
              ↓
         Input Tokens
```

---

## 4. Predizione Next-Token

### Come "Scrive" il Modello
Un LLM non genera tutto il testo insieme. Genera **una parola (token) alla volta**.

```
Input:  "La capitale dell'Italia è"
Output: " Roma"  ← predice il prossimo token più probabile

Nuovo input:  "La capitale dell'Italia è Roma"
Output: "."  ← continua a predire

E così via...
```

### Distribuzione di Probabilità

```
"La capitale dell'Italia è ___"

Roma:     78%  ████████████████████████████████
Milano:    8%  ████
una:       5%  ██
Firenze:   3%  █
...
```

### Temperature: Controllare la Casualità

```
Temperature = 0 (deterministica)
→ Sceglie sempre "Roma" (il più probabile)

Temperature = 1 (bilanciata)
→ Può scegliere "Roma" spesso, ma anche alternative

Temperature = 2 (creativa)
→ Più probabilità di scegliere token meno probabili
```

### Il Loop di Generazione

```python
# Pseudocodice semplificato
def genera_testo(prompt, max_tokens):
    output = prompt
    for _ in range(max_tokens):
        next_token = modello.predici_prossimo(output)
        output = output + next_token
        if next_token == "<end>":
            break
    return output
```

---

## 5. Pre-training, Fine-tuning, RLHF

### Fase 1: Pre-training
- **Obiettivo:** Imparare il linguaggio
- **Dati:** Enormi quantità di testo (internet, libri, codice)
- **Compito:** Predire la prossima parola
- **Risultato:** Modello "base" che capisce il linguaggio

```
Training: "Il sole splende nel ___" → "cielo"
          "def hello(): ___" → "print"
          "2 + 2 = ___" → "4"
```

### Fase 2: Fine-tuning
- **Obiettivo:** Specializzare per un compito
- **Dati:** Dataset più piccolo e specifico
- **Esempi:**
  - Fine-tuning su codice → modello per coding
  - Fine-tuning su dialoghi → modello per chat
  - Fine-tuning su documenti medici → modello per medicina

### Fase 3: RLHF (Reinforcement Learning from Human Feedback)
- **Obiettivo:** Allineare ai valori umani
- **Processo:**
  1. Il modello genera risposte
  2. Umani valutano quale risposta è migliore
  3. Un "reward model" impara le preferenze
  4. Il modello viene ottimizzato per massimizzare il reward

```
Prompt: "Come faccio a hackerare un sito?"

Pre-RLHF: [fornisce istruzioni dettagliate]
Post-RLHF: "Mi dispiace, non posso aiutarti con attività illegali..."
```

### Constitutional AI (Anthropic)
Claude usa un approccio aggiuntivo chiamato Constitutional AI:
- Principi espliciti ("la costituzione")
- Auto-critica e auto-miglioramento
- Trasparenza nei valori

---

## Riassunto Visuale del Pipeline

```
┌──────────────────────────────────────────────────────────────────┐
│                        INPUT                                      │
│                "Qual è la capitale dell'Italia?"                  │
└──────────────────────────────────────────────────────────────────┘
                              ↓
┌──────────────────────────────────────────────────────────────────┐
│                    TOKENIZZAZIONE                                 │
│     ["Qual", " è", " la", " capitale", " dell", "'", "Italia", "?"]│
└──────────────────────────────────────────────────────────────────┘
                              ↓
┌──────────────────────────────────────────────────────────────────┐
│                      EMBEDDING                                    │
│         Ogni token → vettore di 4096 dimensioni                   │
└──────────────────────────────────────────────────────────────────┘
                              ↓
┌──────────────────────────────────────────────────────────────────┐
│                    TRANSFORMER                                    │
│    N layer di Attention + Feed Forward                           │
│    Ogni token "guarda" tutti gli altri                           │
└──────────────────────────────────────────────────────────────────┘
                              ↓
┌──────────────────────────────────────────────────────────────────┐
│                 PREDIZIONE NEXT TOKEN                             │
│         Distribuzione probabilità su vocabolario                  │
│                     → "Roma" (85%)                                │
└──────────────────────────────────────────────────────────────────┘
                              ↓
┌──────────────────────────────────────────────────────────────────┐
│                        OUTPUT                                     │
│                    "La capitale è Roma."                         │
│              (generato token per token)                           │
└──────────────────────────────────────────────────────────────────┘
```

---

## Domande di Riflessione

1. Perché un LLM potrebbe usare più token per una parola italiana che per una inglese?

2. Come aiuta il meccanismo di attention a risolvere l'ambiguità in frasi come "Ho visto l'uomo con il telescopio"?

3. Perché la fase di RLHF è importante per modelli come Claude?

4. Se un LLM genera token uno alla volta, come fa a pianificare una risposta coerente?

---

## Risorse per Approfondire

- [The Illustrated GPT-2](https://jalammar.github.io/illustrated-gpt2/)
- [Attention Is All You Need (paper originale)](https://arxiv.org/abs/1706.03762)
- [What Is ChatGPT Doing...and Why Does It Work?](https://writings.stephenwolfram.com/2023/02/what-is-chatgpt-doing-and-why-does-it-work/)
- [Anthropic's Core Views on AI Safety](https://www.anthropic.com/index/core-views-on-ai-safety)
