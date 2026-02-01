# Blocco 2: Multimodalità (1h)

## Obiettivi di Apprendimento

Al termine di questo blocco, gli studenti saranno in grado di:
- Capire cos'è un modello multimodale
- Usare Claude Vision per analizzare immagini
- Identificare use case pratici
- Combinare testo e immagini nei workflow

---

## 1. Cos'è un Modello Multimodale?

### Definizione

Un modello **multimodale** può elaborare e/o generare contenuti in più "modalità":
- Testo
- Immagini
- Audio
- Video

### Tipi di Multimodalità

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

### Perché la Multimodalità è Importante?

1. **Comprensione più ricca** - Il mondo reale è multimodale
2. **Task più naturali** - "Cosa c'è in questa foto?"
3. **Applicazioni nuove** - Accessibilità, analisi documenti, automazione

---

## 2. Claude Vision

### Capacità

Claude può:
- ✅ Analizzare immagini (foto, screenshot, grafici)
- ✅ Descrivere contenuti visivi
- ✅ Estrarre testo (OCR)
- ✅ Rispondere a domande su immagini
- ✅ Analizzare più immagini insieme
- ❌ Generare immagini (solo analisi)

### Formati Supportati

- JPEG
- PNG
- GIF
- WebP
- PDF (con estrazione immagini)

### Limiti

- Dimensione max: ~20MB per immagine
- Risoluzioni molto alte vengono ridimensionate
- Alcune immagini (CAPTCHA, contenuti proibiti) rifiutate

---

## 3. Usare Claude Vision con API

### Esempio Base

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

### Con URL (immagine online)

```python
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
                        "type": "url",
                        "url": "https://example.com/image.jpg",
                    },
                },
                {
                    "type": "text",
                    "text": "Cosa rappresenta questa immagine?"
                }
            ],
        }
    ],
)
```

### Multiple Immagini

```python
response = client.messages.create(
    model="claude-3-haiku-20240307",
    max_tokens=1024,
    messages=[
        {
            "role": "user",
            "content": [
                {
                    "type": "image",
                    "source": {"type": "base64", "media_type": "image/jpeg", "data": image1_data},
                },
                {
                    "type": "image",
                    "source": {"type": "base64", "media_type": "image/jpeg", "data": image2_data},
                },
                {
                    "type": "text",
                    "text": "Confronta queste due immagini. Quali sono le differenze principali?"
                }
            ],
        }
    ],
)
```

---

## 4. Use Cases Pratici

### 4.1 OCR (Optical Character Recognition)

Estrarre testo da immagini:

```python
prompt = """
Estrai tutto il testo visibile in questa immagine.
Mantieni la formattazione originale dove possibile.
Se ci sono tabelle, convertile in formato markdown.
"""
```

**Applicazioni:**
- Digitalizzazione documenti
- Lettura scontrini/fatture
- Estrazione dati da screenshot

### 4.2 Descrizione per Accessibilità

Alt text automatico per immagini:

```python
prompt = """
Genera una descrizione dettagliata di questa immagine
adatta come alt text per utenti non vedenti.

Includi:
- Soggetto principale
- Ambientazione
- Colori dominanti
- Azioni in corso
- Emozioni percepite

Lunghezza: 2-3 frasi.
"""
```

### 4.3 Analisi Grafici e Tabelle

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

### 4.4 Analisi Documenti

```python
prompt = """
Questo è uno screenshot di un contratto.
Identifica ed estrai:
- Parti coinvolte
- Data del contratto
- Importo (se presente)
- Clausole principali
- Scadenze importanti
"""
```

### 4.5 Product Recognition

```python
prompt = """
Identifica il prodotto in questa immagine.
Fornisci:
- Categoria prodotto
- Marca (se riconoscibile)
- Modello (se riconoscibile)
- Caratteristiche visibili
- Condizione apparente
"""
```

### 4.6 Code from Screenshot

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

## 5. Best Practices per Vision

### DO: Cose da Fare

1. **Sii specifico nella domanda**
   ```
   ✅ "Quante persone ci sono nella foto? Descrivi cosa stanno facendo."
   ❌ "Dimmi dell'immagine"
   ```

2. **Guida l'attenzione**
   ```
   ✅ "Concentrati sul testo nel cartello in alto a destra"
   ❌ "Leggi il testo"
   ```

3. **Richiedi formato strutturato**
   ```
   ✅ "Elenca gli oggetti in formato JSON"
   ❌ "Elenca gli oggetti"
   ```

4. **Usa multiple immagini quando utile**
   ```
   ✅ "Confronta queste due versioni del design"
   ```

### DON'T: Cose da Evitare

1. **Non assumere capacità che non ha**
   - Non può identificare persone specifiche
   - Non può leggere CAPTCHA
   - Non può analizzare video frame by frame

2. **Non inviare immagini troppo piccole**
   - Testo illeggibile = risultati scarsi

3. **Non aspettarti precisione al 100%**
   - Sempre verificare informazioni critiche

---

## 6. Combinare Testo e Immagini in Workflow

### Workflow 1: Analisi Documenti Batch

```python
def analyze_documents(folder_path):
    """Analizza tutti i documenti in una cartella."""
    results = []

    for file in os.listdir(folder_path):
        if file.endswith(('.jpg', '.png', '.pdf')):
            image_data = encode_image(os.path.join(folder_path, file))

            response = client.messages.create(
                model="claude-3-haiku-20240307",
                max_tokens=1024,
                messages=[{
                    "role": "user",
                    "content": [
                        {"type": "image", "source": {"type": "base64", "media_type": "image/jpeg", "data": image_data}},
                        {"type": "text", "text": "Estrai: data, importo, fornitore, descrizione. Formato JSON."}
                    ]
                }]
            )

            results.append({
                "file": file,
                "data": response.content[0].text
            })

    return results
```

### Workflow 2: Generazione + Analisi

```
1. Genera immagine con DALL-E/Stable Diffusion
2. Analizza risultato con Claude Vision
3. Itera se non soddisfacente
```

```python
# Pseudocodice
image = generate_image("A logo for a coffee shop")
analysis = analyze_with_claude(image, "Valuta: leggibilità, colori, messaggio trasmesso")

while analysis["score"] < 8:
    improved_prompt = improve_prompt_based_on(analysis)
    image = generate_image(improved_prompt)
    analysis = analyze_with_claude(image)
```

### Workflow 3: Content Moderation

```python
def moderate_image(image_path):
    """Verifica se un'immagine è appropriata."""
    response = client.messages.create(
        model="claude-3-haiku-20240307",
        max_tokens=256,
        messages=[{
            "role": "user",
            "content": [
                {"type": "image", "source": {...}},
                {"type": "text", "text": """
                    Analizza questa immagine per content moderation.
                    Rispondi in JSON:
                    {
                        "safe": true/false,
                        "concerns": ["lista", "di", "problemi"],
                        "confidence": 0-100
                    }
                """}
            ]
        }]
    )
    return json.loads(response.content[0].text)
```

---

## 7. Considerazioni Etiche

### Privacy
- Non analizzare foto di persone senza consenso
- Attenzione a documenti con dati sensibili
- Rispettare GDPR e normative locali

### Bias
- I modelli possono avere bias nel riconoscimento
- Verificare sempre risultati critici
- Considerare diversità nel testing

### Deepfakes
- I modelli vision NON rilevano deepfakes in modo affidabile
- Non usare per verificare autenticità

---

## Riassunto

```
┌─────────────────────────────────────────────────────────────────┐
│                     MULTIMODALITÀ                                │
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
│  BEST PRACTICES:                                                 │
│  • Prompt specifici                                              │
│  • Formato output strutturato                                    │
│  • Verifica risultati critici                                    │
│                                                                  │
└─────────────────────────────────────────────────────────────────┘
```

---

## Domande di Riflessione

1. Quali problemi di accessibilità può risolvere Claude Vision?

2. Come gestiresti documenti con informazioni sensibili?

3. In quale workflow del tuo lavoro futuro potresti integrare l'analisi di immagini?

---

## Risorse

- [Claude Vision Documentation](https://docs.anthropic.com/claude/docs/vision)
- [Multimodal AI Overview](https://www.anthropic.com/news/claude-3-family)
- [Accessibility Guidelines](https://www.w3.org/WAI/tutorials/images/)
