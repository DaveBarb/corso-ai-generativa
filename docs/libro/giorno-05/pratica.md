# Giorno 5: Pratica - Multimodalità

## Esercizi Pratici

### Esercizio 1: Prompt per Immagini

Scrivi prompt per generare le seguenti immagini usando la struttura [SOGGETTO] + [STILE] + [DETTAGLI] + [QUALITÀ]:

1. Un logo per una startup di AI
2. Un paesaggio fantastico per un videogioco
3. Un ritratto professionale stilizzato
4. Una infografica sul cambiamento climatico

Per ogni prompt, scrivi anche un **negative prompt** appropriato.

---

### Esercizio 2: Claude Vision - Analisi Immagini

Usa Claude Vision per analizzare diverse tipologie di immagini:

#### 2.1 OCR - Estrazione Testo

```python
import anthropic
import base64

client = anthropic.Anthropic()

def analyze_image(image_path, prompt):
    with open(image_path, "rb") as f:
        image_data = base64.standard_b64encode(f.read()).decode("utf-8")

    response = client.messages.create(
        model="claude-3-haiku-20240307",
        max_tokens=1024,
        messages=[{
            "role": "user",
            "content": [
                {"type": "image", "source": {"type": "base64", "media_type": "image/jpeg", "data": image_data}},
                {"type": "text", "text": prompt}
            ]
        }]
    )
    return response.content[0].text

# Test con un'immagine che contiene testo
result = analyze_image(
    "documento.jpg",
    "Estrai tutto il testo da questa immagine in formato markdown."
)
print(result)
```

#### 2.2 Descrizione per Accessibilità

Scrivi una funzione che genera alt text per immagini:

```python
def generate_alt_text(image_path):
    prompt = """
    Genera un alt text per questa immagine seguendo le linee guida W3C:
    - 125 caratteri massimo
    - Descrivi il contenuto, non "immagine di..."
    - Includi informazioni cruciali
    - Evita ridondanze
    """
    return analyze_image(image_path, prompt)
```

#### 2.3 Analisi Grafici

```python
def analyze_chart(image_path):
    prompt = """
    Analizza questo grafico e fornisci:
    1. Tipo di grafico
    2. Variabili rappresentate
    3. Trend principali
    4. Insight chiave
    5. Potenziali problemi nella visualizzazione

    Formato: JSON
    """
    return analyze_image(image_path, prompt)
```

---

### Esercizio 3: Confronto Immagini

Crea una funzione che confronta due immagini:

```python
def compare_images(image1_path, image2_path, comparison_type="general"):
    with open(image1_path, "rb") as f1, open(image2_path, "rb") as f2:
        img1_data = base64.standard_b64encode(f1.read()).decode("utf-8")
        img2_data = base64.standard_b64encode(f2.read()).decode("utf-8")

    prompts = {
        "general": "Confronta queste due immagini. Elenca somiglianze e differenze.",
        "design": "Confronta il design di questi due elementi. Quale è più efficace e perché?",
        "before_after": "Questa è una comparazione prima/dopo. Descrivi i cambiamenti.",
    }

    response = client.messages.create(
        model="claude-3-haiku-20240307",
        max_tokens=1024,
        messages=[{
            "role": "user",
            "content": [
                {"type": "image", "source": {"type": "base64", "media_type": "image/jpeg", "data": img1_data}},
                {"type": "image", "source": {"type": "base64", "media_type": "image/jpeg", "data": img2_data}},
                {"type": "text", "text": prompts.get(comparison_type, prompts["general"])}
            ]
        }]
    )
    return response.content[0].text
```

---

### Esercizio 4: Document Analyzer

Crea un sistema completo per analizzare documenti:

```python
import json
from pathlib import Path

class DocumentAnalyzer:
    def __init__(self):
        self.client = anthropic.Anthropic()

    def _encode_image(self, path):
        with open(path, "rb") as f:
            return base64.standard_b64encode(f.read()).decode("utf-8")

    def analyze_receipt(self, image_path):
        """Analizza uno scontrino ed estrae i dati."""
        prompt = """
        Analizza questo scontrino ed estrai:
        - Negozio/Esercizio
        - Data e ora
        - Lista prodotti con prezzi
        - Totale
        - Metodo di pagamento (se visibile)

        Formato output: JSON
        """
        # Implementa...

    def analyze_business_card(self, image_path):
        """Estrae informazioni da un biglietto da visita."""
        prompt = """
        Estrai le seguenti informazioni dal biglietto da visita:
        - Nome completo
        - Titolo/Ruolo
        - Azienda
        - Email
        - Telefono
        - Indirizzo
        - Website
        - Social media

        Formato output: JSON (usa null per campi non trovati)
        """
        # Implementa...

    def batch_analyze(self, folder_path, doc_type="receipt"):
        """Analizza tutti i documenti in una cartella."""
        results = []
        folder = Path(folder_path)

        for file in folder.glob("*.jpg"):
            print(f"Analizzando {file.name}...")

            if doc_type == "receipt":
                data = self.analyze_receipt(file)
            elif doc_type == "business_card":
                data = self.analyze_business_card(file)

            results.append({
                "file": file.name,
                "data": json.loads(data)
            })

        return results

    def export_results(self, results, output_path):
        """Esporta i risultati in JSON."""
        with open(output_path, 'w', encoding='utf-8') as f:
            json.dump(results, f, indent=2, ensure_ascii=False)
```

---

### Esercizio 5: Content Moderation

Implementa un sistema di moderazione immagini:

```python
def moderate_image(image_path):
    """Verifica se un'immagine è appropriata per pubblicazione."""
    prompt = """
    Analizza questa immagine per content moderation.

    Verifica:
    1. Contenuti inappropriati per minori
    2. Violenza o contenuti disturbanti
    3. Informazioni personali visibili (documenti, targhe, etc.)
    4. Copyright/watermark evidenti
    5. Qualità tecnica (blur, esposizione)

    Rispondi in JSON:
    {
        "safe": true/false,
        "concerns": ["lista", "di", "problemi"],
        "confidence": 0-100,
        "recommendations": ["suggerimenti", "per", "migliorare"]
    }
    """

    result = analyze_image(image_path, prompt)
    return json.loads(result)
```

---

### Esercizio 6: Generazione + Analisi Workflow

Crea un workflow che:

1. Genera un prompt per DALL-E/Stable Diffusion
2. (Opzionale) Genera l'immagine
3. Analizza l'immagine generata con Claude Vision
4. Itera per migliorare

```python
class ImageIterationWorkflow:
    def __init__(self):
        self.client = anthropic.Anthropic()
        self.iteration_history = []

    def generate_image_prompt(self, concept, style="photorealistic"):
        """Genera un prompt ottimizzato per generazione immagini."""
        prompt = f"""
        Crea un prompt dettagliato per un modello di generazione immagini.

        Concetto: {concept}
        Stile: {style}

        Il prompt deve includere:
        - Soggetto dettagliato
        - Stile artistico
        - Illuminazione
        - Composizione
        - Parole chiave per qualità

        Fornisci anche un negative prompt.

        Formato:
        PROMPT: [prompt positivo]
        NEGATIVE: [prompt negativo]
        """

        response = self.client.messages.create(
            model="claude-3-haiku-20240307",
            max_tokens=500,
            messages=[{"role": "user", "content": prompt}]
        )
        return response.content[0].text

    def analyze_generated_image(self, image_path, original_concept):
        """Valuta quanto l'immagine corrisponde al concept."""
        prompt = f"""
        Concetto originale: {original_concept}

        Valuta questa immagine generata:
        1. Aderenza al concept (1-10)
        2. Qualità tecnica (1-10)
        3. Coerenza stilistica (1-10)
        4. Punti di forza
        5. Aree di miglioramento
        6. Suggerimenti per il prossimo prompt

        Formato: JSON
        """
        return analyze_image(image_path, prompt)

    def iterate_prompt(self, previous_prompt, feedback):
        """Migliora il prompt basandosi sul feedback."""
        prompt = f"""
        Prompt precedente: {previous_prompt}

        Feedback sull'immagine generata: {feedback}

        Genera un nuovo prompt migliorato che:
        - Mantiene i punti di forza
        - Risolve le criticità
        - Incorpora i suggerimenti

        Formato:
        PROMPT: [nuovo prompt]
        NEGATIVE: [nuovo negative prompt]
        CHANGES: [lista modifiche fatte]
        """

        response = self.client.messages.create(
            model="claude-3-haiku-20240307",
            max_tokens=500,
            messages=[{"role": "user", "content": prompt}]
        )
        return response.content[0].text
```

---

## Risorse Gratuite per Sperimentare

### Generazione Immagini

- [Hugging Face Spaces - Stable Diffusion](https://huggingface.co/spaces/stabilityai/stable-diffusion)
- [Leonardo.AI](https://leonardo.ai/) - Free tier generoso
- [Bing Image Creator](https://www.bing.com/images/create) - DALL-E gratuito (limitato)

### Immagini di Test

Per gli esercizi di analisi, puoi usare:

- Tue foto (scontrini, documenti)
- Immagini da [Unsplash](https://unsplash.com/) (gratuite)
- Screenshot

---

## Checklist di Completamento

- [ ] Scritto prompt per 4 tipi di immagini
- [ ] Implementato OCR con Claude Vision
- [ ] Creato generatore di alt text
- [ ] Implementato analisi grafici
- [ ] Creato comparatore di immagini
- [ ] Implementato Document Analyzer
- [ ] Testato content moderation
- [ ] (Bonus) Workflow di iterazione
