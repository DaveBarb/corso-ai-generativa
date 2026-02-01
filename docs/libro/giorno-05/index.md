# Giorno 5: Multimodalità

## Obiettivi della Giornata

- Comprendere il funzionamento dei diffusion models
- Scrivere prompt efficaci per la generazione di immagini
- Usare Claude Vision per analizzare immagini
- Combinare testo e immagini nei workflow

---

## Blocco 1: Come Funzionano i Modelli per Immagini

### Diffusion Models: Dal Rumore all'Immagine

#### L'Intuizione

Immagina di avere una scultura di marmo. Un diffusion model funziona al contrario:

```
TRAINING (imparare a distruggere):
Scultura → Aggiungi rumore gradualmente → Blocco di marmo grezzo

GENERAZIONE (creare):
Rumore casuale → Rimuovi rumore gradualmente → Nuova scultura
```

#### Il Processo Dettagliato

```
┌─────────────────────────────────────────────────────────────────┐
│                      FORWARD PROCESS                             │
│                   (durante il training)                          │
│                                                                  │
│   Immagine    →    +rumore    →    +rumore    →    Solo rumore  │
│   originale        step 1          step 2         (step N)       │
│                                                                  │
│   Il modello impara a prevedere il rumore aggiunto              │
└─────────────────────────────────────────────────────────────────┘

┌─────────────────────────────────────────────────────────────────┐
│                      REVERSE PROCESS                             │
│                   (durante la generazione)                       │
│                                                                  │
│   Solo rumore  →   -rumore    →   -rumore    →    Immagine      │
│   casuale          step 1         step 2         finale          │
│                                                                  │
│   Il modello rimuove il rumore "guidato" dal prompt             │
└─────────────────────────────────────────────────────────────────┘
```

#### Perché Funziona?

- Il modello impara la **distribuzione** delle immagini reali
- Dato rumore casuale, trova il percorso verso un'immagine plausibile
- Il prompt **condiziona** il processo verso un tipo specifico di immagine

---

### Confronto Modelli per Immagini

| Modello | Sviluppatore | Punti di Forza | Accesso |
|---------|--------------|----------------|---------|
| **DALL-E 3** | OpenAI | Comprensione prompt, testo nelle immagini | ChatGPT Plus, API |
| **Stable Diffusion** | Stability AI | Open source, personalizzabile | Gratuito (self-hosted) |
| **Midjourney** | Midjourney | Qualità artistica eccezionale | Solo Discord |
| **Imagen** | Google | Alta fedeltà | Google Cloud |

### Quando Usare Cosa

```
DALL-E 3
└─ Uso generale, prompt naturali, testo in immagini

Stable Diffusion
└─ Controllo fine, sperimentazione, budget limitato

Midjourney
└─ Arte, concept art, massima qualità estetica

Imagen
└─ Produzione enterprise, workflow Google
```

---

### Prompt Engineering per Immagini

#### Anatomia di un Prompt per Immagini

```
[SOGGETTO] + [STILE] + [DETTAGLI] + [TECNICA] + [QUALITÀ]
```

#### Componenti Chiave

=== "Soggetto"
    ```
    "a cat"                    ← Troppo vago
    "a fluffy orange cat"      ← Meglio
    "a fluffy orange tabby cat sitting on a windowsill" ← Specifico
    ```

=== "Stile Artistico"
    ```
    - "oil painting style"
    - "watercolor"
    - "digital art"
    - "photorealistic"
    - "anime style"
    - "in the style of Van Gogh"
    ```

=== "Illuminazione"
    ```
    - "golden hour lighting"
    - "dramatic lighting"
    - "soft diffused light"
    - "neon lights"
    - "moonlight"
    ```

=== "Qualità"
    ```
    - "high quality"
    - "4k"
    - "highly detailed"
    - "professional photography"
    ```

#### Esempio Progressivo

**Livello 1 - Base:**
```
A mountain landscape
```

**Livello 4 - Completo:**
```
A majestic snow-capped mountain landscape with a crystal-clear
lake reflection, surrounded by autumn forest in golden and red
colors, oil painting style in the manner of Albert Bierstadt,
dramatic sunset lighting, highly detailed, 4k resolution
```

#### Negative Prompts

Cosa NON vuoi nell'immagine (supportato da Stable Diffusion):

```
Negative prompt: blurry, low quality, distorted, ugly,
deformed hands, extra limbs, watermark, text, logo
```

---

### Limiti e Artefatti Comuni

| Problema | Descrizione | Tip |
|----------|-------------|-----|
| **Mani** | Dita extra, proporzioni sbagliate | Evita mani in primo piano |
| **Testo** | Lettere mancanti o sbagliate | DALL-E 3 è il migliore, o aggiungi in post |
| **Consistenza** | Difficile mantenere stesso personaggio | Usa seed fisso in SD |
| **Fisica** | Riflessi e ombre sbagliati | Verifica manualmente |

---

## Blocco 2: Multimodalità con Claude

### Cos'è un Modello Multimodale?

Un modello **multimodale** può elaborare e/o generare contenuti in più "modalità":

```
┌─────────────────────────────────────────────────────────────────┐
│                   TIPI DI MODELLI                                │
│                                                                  │
│  TEXT-ONLY                                                       │
│  ├─ Input: Testo                                                │
│  └─ Output: Testo                                               │
│                                                                  │
│  VISION (Image-to-Text)                                          │
│  ├─ Input: Testo + Immagini                                     │
│  └─ Output: Testo                                               │
│  └─ Es: Claude Vision, GPT-4V                                   │
│                                                                  │
│  IMAGE GENERATION (Text-to-Image)                                │
│  ├─ Input: Testo                                                │
│  └─ Output: Immagini                                            │
│  └─ Es: DALL-E, Stable Diffusion                               │
│                                                                  │
│  FULLY MULTIMODAL                                                │
│  ├─ Input: Testo + Immagini + Audio + Video                    │
│  └─ Output: Testo + Immagini + Audio                            │
│  └─ Es: Gemini, GPT-4o                                         │
│                                                                  │
└─────────────────────────────────────────────────────────────────┘
```

---

### Claude Vision

#### Capacità

| Può Fare | Non Può Fare |
|----------|--------------|
| Analizzare immagini | Generare immagini |
| Descrivere contenuti | Modificare immagini |
| Estrarre testo (OCR) | Identificare persone specifiche |
| Rispondere a domande su immagini | Leggere CAPTCHA |
| Analizzare più immagini insieme | Analizzare video frame by frame |

#### Formati Supportati

- JPEG, PNG, GIF, WebP
- PDF (con estrazione immagini)
- Dimensione max: ~20MB per immagine

---

### Usare Claude Vision con API

#### Esempio Base

```python
import anthropic
import base64

def encode_image(image_path):
    """Converte un'immagine in base64."""
    with open(image_path, "rb") as image_file:
        return base64.standard_b64encode(image_file.read()).decode("utf-8")

client = anthropic.Anthropic()

# Carica e codifica l'immagine
image_data = encode_image("foto.jpg")

response = client.messages.create(
    model="claude-3-haiku-20240307",
    max_tokens=1024,
    messages=[
        {
            "role": "user",
            "content": [
                {
                    "type": "image",
                    "source": {
                        "type": "base64",
                        "media_type": "image/jpeg",
                        "data": image_data,
                    },
                },
                {
                    "type": "text",
                    "text": "Descrivi cosa vedi in questa immagine."
                }
            ],
        }
    ],
)

print(response.content[0].text)
```

#### Multiple Immagini

```python
content = [
    {"type": "image", "source": {"type": "base64", "media_type": "image/jpeg", "data": image1_data}},
    {"type": "image", "source": {"type": "base64", "media_type": "image/jpeg", "data": image2_data}},
    {"type": "text", "text": "Confronta queste due immagini. Quali sono le differenze principali?"}
]
```

---

### Use Cases Pratici

#### OCR (Optical Character Recognition)

```python
prompt = """
Estrai tutto il testo visibile in questa immagine.
Mantieni la formattazione originale dove possibile.
Se ci sono tabelle, convertile in formato markdown.
"""
```

#### Descrizione per Accessibilità

```python
prompt = """
Genera una descrizione dettagliata di questa immagine
adatta come alt text per utenti non vedenti.

Includi:
- Soggetto principale
- Ambientazione
- Colori dominanti
- Azioni in corso

Lunghezza: 2-3 frasi.
"""
```

#### Analisi Grafici

```python
prompt = """
Analizza questo grafico e rispondi:
1. Che tipo di grafico è?
2. Quali variabili sono rappresentate?
3. Qual è il trend principale?
4. Ci sono anomalie o punti notevoli?
5. Quali conclusioni si possono trarre?
"""
```

#### Code from Screenshot

```python
prompt = """
Questa immagine contiene codice.
1. Trascrivi il codice esattamente come appare
2. Identifica il linguaggio di programmazione
3. Spiega cosa fa il codice
4. Suggerisci eventuali miglioramenti
"""
```

---

### Best Practices per Vision

!!! success "DO: Cose da Fare"

    1. **Sii specifico nella domanda**
       ```
       "Quante persone ci sono nella foto? Descrivi cosa stanno facendo."
       ```

    2. **Guida l'attenzione**
       ```
       "Concentrati sul testo nel cartello in alto a destra"
       ```

    3. **Richiedi formato strutturato**
       ```
       "Elenca gli oggetti in formato JSON"
       ```

!!! warning "DON'T: Cose da Evitare"

    1. Non assumere capacità che non ha (identificare persone, CAPTCHA)
    2. Non inviare immagini troppo piccole
    3. Non aspettarti precisione al 100% - verifica sempre

---

### Considerazioni Etiche

- **Privacy:** Non analizzare foto di persone senza consenso
- **Bias:** I modelli possono avere bias nel riconoscimento
- **Deepfakes:** I modelli vision NON rilevano deepfakes in modo affidabile

---

## Riassunto

```
┌─────────────────────────────────────────────────────────────────┐
│                     MULTIMODALITÀ                                │
│                                                                  │
│  DIFFUSION MODELS                                                │
│  └─ Generano immagini rimuovendo rumore, guidati dal prompt     │
│                                                                  │
│  CLAUDE VISION può:                                              │
│  ✓ Analizzare immagini                                          │
│  ✓ Estrarre testo (OCR)                                         │
│  ✓ Descrivere contenuti                                         │
│  ✓ Analizzare grafici/documenti                                 │
│  ✓ Confrontare multiple immagini                                │
│                                                                  │
│  USE CASES:                                                      │
│  • Accessibilità (alt text)                                      │
│  • Digitalizzazione documenti                                    │
│  • Analisi dati visivi                                           │
│  • Automazione workflow                                          │
│                                                                  │
└─────────────────────────────────────────────────────────────────┘
```

---

## Domande di Riflessione

1. Perché i diffusion models hanno difficoltà con le mani?

2. Quale modello sceglieresti per generare concept art per un videogioco?

3. Quali problemi di accessibilità può risolvere Claude Vision?

4. Come gestiresti documenti con informazioni sensibili?

---

## Risorse

- [Stable Diffusion Prompt Guide](https://stable-diffusion-art.com/prompt-guide/)
- [Claude Vision Documentation](https://docs.anthropic.com/claude/docs/vision)
- [Accessibility Guidelines](https://www.w3.org/WAI/tutorials/images/)
