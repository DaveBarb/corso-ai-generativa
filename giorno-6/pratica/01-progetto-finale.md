# Giorno 6 - Pratica: Progetto Finale

## Informazioni Generali

**Durata:** 3h 30min (oggi) + presentazione domani
**Modalità:** Gruppi di 2-3 persone
**Consegna:** Codice + breve documentazione
**Presentazione:** 5-7 minuti a gruppo (Giorno 7)

---

## Opzioni Progetto

Scegli UNA delle seguenti opzioni:

---

## Opzione 1: Assistente Specializzato

### Descrizione
Crea un chatbot tematico che sia esperto in un dominio specifico.

### Requisiti Minimi
1. **System prompt personalizzato** ben strutturato
2. **Gestione conversazione multi-turn** con cronologia
3. **Almeno 3 funzionalità specifiche** del dominio
4. **Interfaccia CLI** funzionante

### Idee di Dominio
- Tutor di programmazione (Python, JavaScript, etc.)
- Consulente nutrizionale
- Assistente per ricette di cucina
- Coach di fitness
- Consulente finanziario (base)
- Assistente per viaggi
- Supporto tecnico per un prodotto

### Bonus (opzionali)
- Interfaccia Streamlit
- Salvataggio conversazioni
- Comandi speciali (/help, /clear, etc.)
- Personalizzazione del comportamento

### Template Base

```python
from anthropic import Anthropic

class SpecializedAssistant:
    def __init__(self):
        self.client = Anthropic()
        self.messages = []
        self.system = """
        [IL TUO SYSTEM PROMPT PERSONALIZZATO]

        Sei un [RUOLO] esperto in [DOMINIO].

        COMPETENZE:
        - [competenza 1]
        - [competenza 2]
        - [competenza 3]

        STILE:
        - [come comunica]
        - [tono]
        - [formato risposte]

        LIMITI:
        - [cosa non fare]
        - [quando suggerire di consultare un professionista]
        """

    def chat(self, user_input):
        # Implementazione
        pass

    def run(self):
        # Loop principale
        pass
```

### Criteri di Valutazione

| Criterio | Peso | Descrizione |
|----------|------|-------------|
| System prompt | 25% | Efficacia, completezza, appropriatezza |
| Funzionalità | 25% | Implementazione delle 3+ feature |
| Qualità codice | 20% | Pulizia, organizzazione, commenti |
| UX | 15% | Usabilità, messaggi chiari |
| Presentazione | 15% | Chiarezza, demo, risposte a domande |

---

## Opzione 2: Analizzatore di Documenti

### Descrizione
Crea un sistema che analizza immagini/screenshot e ne estrae informazioni strutturate.

### Requisiti Minimi
1. **Upload e analisi** di almeno 3 tipi di documenti
2. **Estrazione strutturata** in formato JSON o tabella
3. **Generazione riassunti** automatica
4. **Export risultati** in file

### Tipi di Documenti Suggeriti
- Scontrini/fatture → estrazione totale, data, items
- Screenshot di dati → estrazione tabelle
- Grafici → interpretazione e descrizione
- Documenti testuali → riassunto e key points
- Biglietti da visita → estrazione contatti
- Menu ristorante → estrazione piatti e prezzi

### Bonus (opzionali)
- Batch processing di più file
- Confronto tra documenti
- Template personalizzabili per l'estrazione
- Validazione dei dati estratti

### Template Base

```python
from anthropic import Anthropic
import base64
import json
import os

class DocumentAnalyzer:
    def __init__(self):
        self.client = Anthropic()

    def encode_image(self, path):
        with open(path, "rb") as f:
            return base64.standard_b64encode(f.read()).decode()

    def analyze_receipt(self, image_path):
        """Analizza uno scontrino ed estrae i dati."""
        # Implementazione
        pass

    def analyze_chart(self, image_path):
        """Analizza un grafico e ne fornisce interpretazione."""
        # Implementazione
        pass

    def summarize_document(self, image_path):
        """Genera un riassunto di un documento testuale."""
        # Implementazione
        pass

    def export_results(self, results, output_path):
        """Esporta i risultati in JSON."""
        with open(output_path, 'w') as f:
            json.dump(results, f, indent=2, ensure_ascii=False)
```

### Criteri di Valutazione

| Criterio | Peso | Descrizione |
|----------|------|-------------|
| Accuratezza estrazione | 30% | Precisione dei dati estratti |
| Varietà documenti | 20% | Supporto per diversi tipi |
| Struttura output | 20% | Chiarezza e usabilità dei risultati |
| Gestione errori | 15% | Cosa succede con input non validi |
| Presentazione | 15% | Demo, casi d'uso, chiarezza |

---

## Opzione 3: Generatore di Contenuti

### Descrizione
Crea una pipeline che genera contenuti in modo automatizzato e personalizzabile.

### Requisiti Minimi
1. **Template system** - almeno 3 template diversi
2. **Personalizzazione** - parametri configurabili
3. **Batch processing** - genera più contenuti in sequenza
4. **Output formattato** - file salvati correttamente

### Tipi di Contenuti Suggeriti
- Post social media (LinkedIn, Twitter, Instagram)
- Email marketing
- Descrizioni prodotto
- Articoli blog
- FAQ
- Newsletter

### Bonus (opzionali)
- Integrazione con generazione immagini (prompt per SD/DALL-E)
- Variazioni A/B per testing
- Scheduling/pianificazione
- Analisi del tono generato

### Template Base

```python
from anthropic import Anthropic
from dataclasses import dataclass
from typing import Optional

@dataclass
class ContentTemplate:
    name: str
    prompt_template: str
    output_format: str
    max_length: int

class ContentGenerator:
    def __init__(self):
        self.client = Anthropic()
        self.templates = self._load_templates()

    def _load_templates(self):
        return {
            "linkedin_post": ContentTemplate(
                name="LinkedIn Post",
                prompt_template="""
                Crea un post LinkedIn su: {topic}
                Tono: {tone}
                Includi: {elements}
                """,
                output_format="markdown",
                max_length=1500
            ),
            # Altri template...
        }

    def generate(self, template_name, **kwargs):
        """Genera contenuto usando un template."""
        # Implementazione
        pass

    def batch_generate(self, template_name, items):
        """Genera contenuti in batch."""
        results = []
        for item in items:
            result = self.generate(template_name, **item)
            results.append(result)
        return results

    def export(self, results, format="json"):
        """Esporta i risultati generati."""
        # Implementazione
        pass
```

### Criteri di Valutazione

| Criterio | Peso | Descrizione |
|----------|------|-------------|
| Qualità contenuti | 30% | Output utili e ben scritti |
| Sistema template | 25% | Flessibilità e riusabilità |
| Batch processing | 20% | Efficienza e gestione |
| Personalizzazione | 15% | Opzioni disponibili |
| Presentazione | 15% | Demo, esempi, chiarezza |

---

## Linee Guida Generali

### Struttura Progetto Consigliata

```
progetto-nome/
├── README.md           # Documentazione
├── requirements.txt    # Dipendenze
├── main.py            # Entry point
├── src/
│   ├── __init__.py
│   ├── core.py        # Logica principale
│   └── utils.py       # Funzioni di utilità
├── templates/          # Template (se applicabile)
├── examples/           # Esempi di input/output
└── output/            # Output generati
```

### README.md Richiesto

```markdown
# Nome Progetto

## Descrizione
[Breve descrizione di cosa fa]

## Installazione
```bash
pip install -r requirements.txt
```

## Configurazione
[Come impostare API key, etc.]

## Utilizzo
[Come usare il progetto]

## Esempi
[Esempi di input/output]

## Team
- Nome 1
- Nome 2
- Nome 3

## Note
[Eventuali note aggiuntive]
```

### Cosa NON Fare

- ❌ Non lasciare API key nel codice
- ❌ Non copiare codice senza capirlo
- ❌ Non ignorare la gestione degli errori
- ❌ Non dimenticare la documentazione

### Consigli

- ✅ Inizia semplice, poi aggiungi feature
- ✅ Testa spesso durante lo sviluppo
- ✅ Commenta il codice
- ✅ Prepara la demo in anticipo
- ✅ Dividi i compiti nel team

---

## Timeline Suggerita

### Oggi (3h 30min)

| Tempo | Attività |
|-------|----------|
| 0:00 - 0:30 | Formazione gruppi, scelta progetto |
| 0:30 - 1:00 | Pianificazione e design |
| 1:00 - 2:30 | Sviluppo core |
| 2:30 - 3:00 | Test e debug |
| 3:00 - 3:30 | Documentazione e preparazione demo |

### Domani (durante la mattina, se necessario)

- Finalizzazione
- Prove presentazione

---

## Presentazione (Giorno 7)

### Formato (5-7 minuti)

1. **Intro (1 min)**
   - Nome progetto e team
   - Problema che risolve

2. **Demo (3-4 min)**
   - Mostra il progetto in azione
   - Casi d'uso principali
   - Gestione errori

3. **Tecnico (1 min)**
   - Scelte tecniche interessanti
   - Sfide superate

4. **Q&A (1-2 min)**
   - Domande dal pubblico

### Consigli per la Demo

- Prepara input che funzionano sicuramente
- Avere un backup se qualcosa non funziona
- Non leggere, parla con il pubblico
- Mostra entusiasmo per il progetto

---

## Supporto

Durante lo sviluppo:
- Chiedete aiuto ai docenti
- Collaborate tra gruppi
- Usate Claude Code per assistenza

---

## Checklist Pre-consegna

- [ ] Codice funzionante
- [ ] README.md completo
- [ ] requirements.txt aggiornato
- [ ] Nessuna API key nel codice
- [ ] Esempi di input/output
- [ ] Demo preparata
- [ ] Tutti i membri del team hanno capito il codice
