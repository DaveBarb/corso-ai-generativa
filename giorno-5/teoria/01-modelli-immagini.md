# Blocco 1: Come Funzionano i Modelli per Immagini (1h)

## Obiettivi di Apprendimento

Al termine di questo blocco, gli studenti saranno in grado di:
- Comprendere il funzionamento dei diffusion models
- Confrontare i principali modelli per immagini
- Scrivere prompt efficaci per la generazione di immagini
- Riconoscere limiti e artefatti comuni

---

## 1. Diffusion Models: Dal Rumore all'Immagine

### L'Intuizione

Immagina di avere una scultura di marmo. Un diffusion model funziona al contrario:

```
TRAINING (imparare a distruggere):
Scultura → Aggiungi rumore gradualmente → Blocco di marmo grezzo

GENERAZIONE (creare):
Rumore casuale → Rimuovi rumore gradualmente → Nuova scultura
```

### Il Processo Dettagliato

```
┌─────────────────────────────────────────────────────────────────┐
│                      FORWARD PROCESS                             │
│                   (durante il training)                          │
│                                                                  │
│   Immagine    →    +rumore    →    +rumore    →    Solo rumore  │
│   originale        step 1          step 2         (step N)       │
│      🖼️       →      📷       →      📸       →       ⬜         │
│                                                                  │
│   Il modello impara a prevedere il rumore aggiunto              │
└─────────────────────────────────────────────────────────────────┘

┌─────────────────────────────────────────────────────────────────┐
│                      REVERSE PROCESS                             │
│                   (durante la generazione)                       │
│                                                                  │
│   Solo rumore  →   -rumore    →   -rumore    →    Immagine      │
│   casuale          step 1         step 2         finale          │
│      ⬜        →      📸      →      📷       →       🖼️         │
│                                                                  │
│   Il modello rimuove il rumore "guidato" dal prompt             │
└─────────────────────────────────────────────────────────────────┘
```

### Analogia: La Scultura nel Marmo

1. **Training:** Il modello vede milioni di immagini che vengono "sepolte" nel rumore
2. **Generazione:** Dato rumore casuale, il modello "scava" via il rumore per rivelare l'immagine nascosta
3. **Prompt:** È la "guida" che dice al modello cosa sta cercando di rivelare

### Perché Funziona?

- Il modello impara la **distribuzione** delle immagini reali
- Dato rumore casuale, trova il percorso verso un'immagine plausibile
- Il prompt **condiziona** il processo verso un tipo specifico di immagine

---

## 2. Confronto Modelli per Immagini

### DALL-E (OpenAI)

| Aspetto | Dettaglio |
|---------|-----------|
| **Versione attuale** | DALL-E 3 |
| **Accesso** | Integrato in ChatGPT Plus, API |
| **Punti di forza** | Comprensione prompt, testo nelle immagini |
| **Limiti** | Closed source, meno controllo |
| **Costo** | $0.04-0.12 per immagine |

### Stable Diffusion (Stability AI)

| Aspetto | Dettaglio |
|---------|-----------|
| **Versione attuale** | SDXL, SD 3 |
| **Accesso** | Open source, self-hosted o API |
| **Punti di forza** | Personalizzabile, fine-tuning, gratuito |
| **Limiti** | Richiede più prompt engineering |
| **Costo** | Gratis (self-hosted) o pay-per-use |

### Midjourney

| Aspetto | Dettaglio |
|---------|-----------|
| **Versione attuale** | v6 |
| **Accesso** | Solo via Discord |
| **Punti di forza** | Qualità artistica, estetica |
| **Limiti** | No API, interfaccia Discord |
| **Costo** | $10-60/mese abbonamento |

### Imagen (Google)

| Aspetto | Dettaglio |
|---------|-----------|
| **Versione attuale** | Imagen 3 |
| **Accesso** | Google Cloud, Gemini |
| **Punti di forza** | Alta fedeltà, integrazione Google |
| **Limiti** | Meno accessibile |
| **Costo** | Enterprise pricing |

### Confronto Visivo

```
┌─────────────────────────────────────────────────────────────────┐
│                    QUANDO USARE COSA                             │
│                                                                  │
│  DALL-E 3                                                        │
│  └─ Uso generale, prompt naturali, testo in immagini            │
│                                                                  │
│  Stable Diffusion                                                │
│  └─ Controllo fine, sperimentazione, budget limitato            │
│                                                                  │
│  Midjourney                                                      │
│  └─ Arte, concept art, massima qualità estetica                 │
│                                                                  │
│  Imagen                                                          │
│  └─ Produzione enterprise, workflow Google                      │
│                                                                  │
└─────────────────────────────────────────────────────────────────┘
```

---

## 3. Prompt Engineering per Immagini

### Anatomia di un Prompt per Immagini

```
[SOGGETTO] + [STILE] + [DETTAGLI] + [TECNICA] + [QUALITÀ]
```

### Componenti Chiave

#### 1. Soggetto
```
"a cat"                    ← Troppo vago
"a fluffy orange cat"      ← Meglio
"a fluffy orange tabby cat sitting on a windowsill" ← Specifico
```

#### 2. Stile Artistico
```
- "oil painting style"
- "watercolor"
- "digital art"
- "photorealistic"
- "anime style"
- "pixel art"
- "in the style of Van Gogh"
```

#### 3. Illuminazione e Atmosfera
```
- "golden hour lighting"
- "dramatic lighting"
- "soft diffused light"
- "neon lights"
- "moonlight"
```

#### 4. Composizione
```
- "close-up portrait"
- "wide angle shot"
- "birds eye view"
- "symmetrical composition"
- "rule of thirds"
```

#### 5. Qualità
```
- "high quality"
- "4k"
- "highly detailed"
- "professional photography"
- "award winning"
```

### Esempi Progressivi

**Livello 1 - Base:**
```
A mountain landscape
```

**Livello 2 - Con stile:**
```
A mountain landscape, oil painting style
```

**Livello 3 - Con dettagli:**
```
A snow-capped mountain landscape with a lake reflection,
oil painting style, autumn colors
```

**Livello 4 - Completo:**
```
A majestic snow-capped mountain landscape with a crystal-clear
lake reflection, surrounded by autumn forest in golden and red
colors, oil painting style in the manner of Albert Bierstadt,
dramatic sunset lighting, highly detailed, 4k resolution
```

### Negative Prompts

Cosa NON vuoi nell'immagine (supportato da Stable Diffusion):

```
Negative prompt: blurry, low quality, distorted, ugly,
deformed hands, extra limbs, watermark, text, logo
```

---

## 4. Limiti e Artefatti Comuni

### Problemi con le Mani

Le mani sono notoriamente difficili:
- Dita extra o mancanti
- Proporzioni sbagliate
- Posizioni impossibili

```
💡 Tip: Evita mani in primo piano, o specifica
   "hands behind back" o "hands in pockets"
```

### Problemi con il Testo

Il testo nelle immagini spesso ha errori:
- Lettere mancanti
- Ordine sbagliato
- Caratteri inventati

```
💡 Tip: DALL-E 3 è il migliore per testo.
   Per altri modelli, aggiungi testo in post-produzione.
```

### Problemi di Consistenza

Difficile mantenere lo stesso personaggio:
- Cambiamenti di aspetto tra immagini
- Variazioni di stile

```
💡 Tip: Usa "seed" fisso in Stable Diffusion
   per maggiore consistenza.
```

### Comprensione Fisica

I modelli non capiscono davvero la fisica:
- Riflessi sbagliati
- Ombre inconsistenti
- Gravità ignorata

### Bias e Stereotipi

I modelli riflettono i bias dei dati di training:
- Rappresentazioni non diverse
- Stereotipi culturali
- Default verso certi stili

---

## 5. Workflow Tipico

### 1. Ideazione
```
Cosa voglio creare? Per quale scopo?
```

### 2. Prompt Iniziale
```
Scrivi una prima versione del prompt
```

### 3. Generazione
```
Genera 4 variazioni
```

### 4. Valutazione
```
Quale si avvicina di più all'obiettivo?
```

### 5. Raffinamento
```
Modifica il prompt basandoti sui risultati
```

### 6. Iterazione
```
Ripeti fino a soddisfazione
```

### 7. Post-produzione
```
Modifica finale con editor (opzionale)
```

---

## 6. Risorse Gratuite per Sperimentare

### Hugging Face Spaces
- [Stable Diffusion XL](https://huggingface.co/spaces/stabilityai/stable-diffusion)
- [Playground v2](https://huggingface.co/spaces/playgroundai/playground-v2.5)

### Altri Tools Gratuiti
- [Leonardo.AI](https://leonardo.ai/) - Free tier generoso
- [Bing Image Creator](https://www.bing.com/images/create) - DALL-E gratuito (limitato)
- [Craiyon](https://www.craiyon.com/) - Gratuito, qualità base

---

## Domande di Riflessione

1. Perché i diffusion models hanno difficoltà con le mani?

2. Quale modello sceglieresti per generare concept art per un videogioco?

3. Come potresti usare negative prompts per migliorare i risultati?

---

## Risorse

- [Stable Diffusion Prompt Guide](https://stable-diffusion-art.com/prompt-guide/)
- [DALL-E Prompt Book](https://pitch.com/v/DALL-E-prompt-book-v1-tmd33y)
- [Midjourney Documentation](https://docs.midjourney.com/)
