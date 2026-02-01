# Giorno 1: Introduzione all'AI Generativa

## Obiettivi della Giornata

- Distinguere tra AI discriminativa e generativa
- Conoscere la timeline dei principali sviluppi
- Comprendere il funzionamento dei LLM
- Capire tokenizzazione, embedding e attention

---

## Blocco 1: Cos'è l'AI Generativa

### AI Discriminativa vs AI Generativa

#### AI Discriminativa (Classificare)
L'AI discriminativa impara a **classificare** o **distinguere** tra categorie esistenti.

**Esempi:**

- Riconoscimento immagini: "Questo è un gatto o un cane?"
- Spam detection: "Questa email è spam o legittima?"
- Sentiment analysis: "Questa recensione è positiva o negativa?"

**Analogia:** Un critico d'arte che sa riconoscere lo stile di diversi pittori.

#### AI Generativa (Creare)
L'AI generativa impara a **creare** nuovi contenuti simili a quelli su cui è stata addestrata.

**Esempi:**

- Generare testo: articoli, codice, poesie
- Generare immagini: arte, foto realistiche
- Generare audio: musica, voce
- Generare video: clip, animazioni

**Analogia:** Un artista che, dopo aver studiato migliaia di opere, può creare qualcosa di nuovo.

### Confronto Visivo

```
┌─────────────────────────────────────────────────────────────┐
│                    AI DISCRIMINATIVA                         │
│                                                              │
│   Input: [Immagine] ──→ Modello ──→ Output: "Gatto" (95%)   │
│                                                              │
│   Impara i confini tra le categorie                          │
└─────────────────────────────────────────────────────────────┘

┌─────────────────────────────────────────────────────────────┐
│                     AI GENERATIVA                            │
│                                                              │
│   Input: "Un gatto" ──→ Modello ──→ Output: [Nuova Immagine]│
│                                                              │
│   Impara la distribuzione dei dati per generarne di nuovi   │
└─────────────────────────────────────────────────────────────┘
```

---

## Timeline dell'AI Generativa

### 2014 - GAN (Generative Adversarial Networks)
- **Inventore:** Ian Goodfellow
- **Idea:** Due reti che "competono" - una genera, l'altra giudica
- **Impatto:** Prima tecnica efficace per generare immagini realistiche

### 2017 - Transformer e Attention
- **Paper:** "Attention Is All You Need" (Google)
- **Idea:** Meccanismo che permette di "prestare attenzione" alle parti rilevanti
- **Impatto:** Rivoluzione nel NLP, base di tutti i modelli moderni

### 2018-2020 - GPT-1, GPT-2, GPT-3
- **Sviluppatore:** OpenAI
- **Evoluzione:** 117M → 1.5B → 175B parametri
- **GPT-3:** Primo modello a mostrare capacità "emergenti" sorprendenti

### 2021 - DALL-E
- **Sviluppatore:** OpenAI
- **Capacità:** Generare immagini da descrizioni testuali
- **Impatto:** Democratizzazione della creazione visiva

### 2022 - ChatGPT e Stable Diffusion
- **ChatGPT:** LLM ottimizzato per conversazioni
- **Stable Diffusion:** Modello open source per immagini
- **Impatto:** AI generativa diventa mainstream

### 2023 - Claude, GPT-4
- **Claude:** Anthropic lancia modello competitivo
- **GPT-4:** Primo grande modello multimodale
- **Impatto:** Capacità sempre più sofisticate

### 2024 - Claude 3, Gemini, modelli multimodali avanzati
- **Claude 3 Opus:** Raggiunge capacità di reasoning avanzate
- **Modelli multimodali:** Input/output di testo, immagini, audio, video

---

## Panoramica dei Modelli Attuali

### Large Language Models (LLM)

| Modello | Sviluppatore | Caratteristiche |
|---------|--------------|-----------------|
| Claude 3 | Anthropic | Sicuro, preciso, context lungo |
| GPT-4 | OpenAI | Multimodale, molto capace |
| Gemini | Google | Integrato nell'ecosistema Google |
| Llama 3 | Meta | Open source, personalizzabile |
| Mistral | Mistral AI | Efficiente, europeo |

### Modelli per Immagini (Diffusion Models)

| Modello | Sviluppatore | Caratteristiche |
|---------|--------------|-----------------|
| DALL-E 3 | OpenAI | Integrato con ChatGPT |
| Midjourney | Midjourney | Alta qualità artistica |
| Stable Diffusion | Stability AI | Open source |
| Imagen | Google | Alta fedeltà al prompt |

---

## Blocco 2: Come Funzionano i LLM

### Tokenizzazione: Spezzettare il Testo

#### Cos'è un Token?
Un token è l'unità base che il modello legge e produce. Non sempre corrisponde a una parola!

```
"Ciao, come stai?"
→ Tokens: ["Ciao", ",", " come", " stai", "?"]

"Tokenizzazione"
→ Tokens: ["Token", "izz", "azione"]  (parola rara, spezzata)

"the"
→ Token: ["the"]  (parola comune, un solo token)
```

#### Perché Tokenizzare?
- Il modello lavora con numeri, non lettere
- I token sono un compromesso tra caratteri (troppo piccoli) e parole (troppo grandi)
- Parole comuni = 1 token, parole rare = più token

!!! note "Perché è importante"
    - I costi API si basano sui token
    - La "context window" è in token (es. 200K token per Claude)
    - Lingue diverse hanno efficienze diverse

---

### Embedding: Parole come Coordinate

#### L'Intuizione
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

#### Proprietà degli Embedding
- Parole simili = punti vicini
- Relazioni semantiche = direzioni nello spazio
- Famoso esempio: Re - Uomo + Donna ≈ Regina

---

### Attention: L'Evidenziatore Intelligente

#### Il Problema
Quando leggiamo "Il gatto, che era nero, dormiva sul divano", come facciamo a capire che "dormiva" si riferisce a "gatto" e non a "divano"?

#### La Soluzione: Attention
Il meccanismo di attention permette a ogni parola di "guardare" tutte le altre e decidere a quali prestare attenzione.

```
"Il [gatto], che era nero, [dormiva] sul divano"
     ^^^^^^                  ^^^^^^^^
     Chi dormiva? → Attenzione forte tra "gatto" e "dormiva"
```

---

### Predizione Next-Token

Un LLM non genera tutto il testo insieme. Genera **una parola (token) alla volta**.

```
Input:  "La capitale dell'Italia è"
Output: " Roma"  ← predice il prossimo token più probabile

Nuovo input:  "La capitale dell'Italia è Roma"
Output: "."  ← continua a predire

E così via...
```

#### Temperature: Controllare la Casualità

```
Temperature = 0 (deterministica)
→ Sceglie sempre "Roma" (il più probabile)

Temperature = 1 (bilanciata)
→ Può scegliere "Roma" spesso, ma anche alternative

Temperature = 2 (creativa)
→ Più probabilità di scegliere token meno probabili
```

---

### Pre-training, Fine-tuning, RLHF

#### Fase 1: Pre-training
- **Obiettivo:** Imparare il linguaggio
- **Dati:** Enormi quantità di testo (internet, libri, codice)
- **Compito:** Predire la prossima parola

#### Fase 2: Fine-tuning
- **Obiettivo:** Specializzare per un compito
- **Dati:** Dataset più piccolo e specifico

#### Fase 3: RLHF (Reinforcement Learning from Human Feedback)
- **Obiettivo:** Allineare ai valori umani
- **Processo:** Umani valutano risposte, modello impara preferenze

!!! info "Constitutional AI (Anthropic)"
    Claude usa un approccio aggiuntivo chiamato Constitutional AI:

    - Principi espliciti ("la costituzione")
    - Auto-critica e auto-miglioramento
    - Trasparenza nei valori

---

## Domande di Riflessione

1. Qual è la differenza fondamentale tra un modello che classifica immagini e uno che le genera?

2. Perché il 2022 è considerato l'anno della "svolta" per l'AI generativa?

3. Perché un LLM potrebbe usare più token per una parola italiana che per una inglese?

4. Come aiuta il meccanismo di attention a risolvere l'ambiguità?

---

## Risorse per Approfondire

- [The Illustrated Transformer](https://jalammar.github.io/illustrated-transformer/)
- [The Illustrated GPT-2](https://jalammar.github.io/illustrated-gpt2/)
- [A Survey of Large Language Models](https://arxiv.org/abs/2303.18223)
- [Anthropic's Core Views on AI Safety](https://www.anthropic.com/index/core-views-on-ai-safety)
