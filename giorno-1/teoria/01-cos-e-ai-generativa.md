# Blocco 1: Cos'è l'AI Generativa (1h)

## Obiettivi di Apprendimento

Al termine di questo blocco, gli studenti saranno in grado di:
- Distinguere tra AI discriminativa e generativa
- Conoscere la timeline dei principali sviluppi
- Identificare i diversi tipi di modelli generativi
- Comprendere le capacità attuali dell'AI generativa

---

## 1. AI Discriminativa vs AI Generativa

### AI Discriminativa (Classificare)
L'AI discriminativa impara a **classificare** o **distinguere** tra categorie esistenti.

**Esempi:**
- Riconoscimento immagini: "Questo è un gatto o un cane?"
- Spam detection: "Questa email è spam o legittima?"
- Sentiment analysis: "Questa recensione è positiva o negativa?"

**Analogia:** Un critico d'arte che sa riconoscere lo stile di diversi pittori.

### AI Generativa (Creare)
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

## 2. Timeline dell'AI Generativa

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

## 3. Panoramica dei Modelli Attuali

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

### Modelli Multimodali
- **GPT-4V:** Comprende e genera testo, analizza immagini
- **Claude 3:** Analizza immagini, genera testo
- **Gemini:** Nativo multimodale (testo, immagini, audio, video)

---

## 4. Cosa Può Fare l'AI Generativa Oggi

### Capacità Testuali
- Scrittura creativa (storie, poesie, sceneggiature)
- Scrittura tecnica (documentazione, report)
- Traduzione con comprensione del contesto
- Riassunti e analisi di documenti
- Generazione e debug di codice
- Tutoring e spiegazioni personalizzate

### Capacità Visive
- Generazione di immagini da testo
- Modifica e editing di immagini
- Creazione di variazioni stilistiche
- Generazione di arte e design

### Capacità Multimodali
- Analisi e descrizione di immagini
- OCR avanzato con comprensione
- Analisi di grafici e tabelle
- Generazione di contenuti cross-mediali

### Demo Live (da fare in classe)

1. **Scrittura creativa:** Chiedere a Claude di scrivere una storia breve
2. **Coding:** Generare una funzione Python con spiegazione
3. **Analisi:** Caricare un grafico e farlo spiegare
4. **Reasoning:** Problema logico risolto passo-passo

---

## 5. Limiti Attuali

### Limiti dei LLM
- **Allucinazioni:** Inventano informazioni plausibili ma false
- **Knowledge cutoff:** Conoscenza limitata alla data di training
- **Ragionamento matematico:** Errori in calcoli complessi
- **Contesto limitato:** Non "ricordano" oltre la finestra di contesto

### Limiti dei Modelli Immagine
- **Testo nelle immagini:** Spesso illeggibile o errato
- **Anatomia:** Problemi con mani, dita, proporzioni
- **Consistenza:** Difficile mantenere lo stesso soggetto
- **Fisica:** Non comprendono davvero la fisica del mondo

### Considerazioni Etiche (approfondite Giorno 6)
- Bias nei dati di training
- Potenziale per disinformazione
- Copyright e proprietà intellettuale
- Impatto sul lavoro

---

## Domande di Riflessione

1. Qual è la differenza fondamentale tra un modello che classifica immagini e uno che le genera?

2. Perché il 2022 è considerato l'anno della "svolta" per l'AI generativa?

3. Quali capacità dell'AI generativa ti sembrano più rilevanti per il tuo futuro professionale?

4. Quali rischi vedi nell'uso diffuso di queste tecnologie?

---

## Risorse per Approfondire

- [The Illustrated Transformer](https://jalammar.github.io/illustrated-transformer/)
- [A Survey of Large Language Models](https://arxiv.org/abs/2303.18223)
- [State of AI Report](https://www.stateof.ai/)
