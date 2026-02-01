# Giorno 7: Ripasso Interattivo (1h)

## Struttura

1. Quiz sui concetti chiave (30 min)
2. Q&A su dubbi accumulati (20 min)
3. Tips & tricks finali (10 min)

---

## Quiz Interattivo

### Sezione 1: Fondamenti (10 domande)

**Q1.** Qual è la differenza principale tra AI discriminativa e generativa?
<details>
<summary>Risposta</summary>

- **Discriminativa**: classifica, distingue tra categorie (es: spam/non spam)
- **Generativa**: crea nuovi contenuti (es: scrive testo, genera immagini)
</details>

**Q2.** Cos'è un token nel contesto dei LLM?
<details>
<summary>Risposta</summary>

L'unità base che il modello elabora. Può essere una parola, parte di parola, o carattere. I costi API sono calcolati in token.
</details>

**Q3.** Cos'è l'attention mechanism?
<details>
<summary>Risposta</summary>

Meccanismo che permette a ogni parola di "guardare" tutte le altre parole del testo e determinare quali sono più rilevanti per il contesto attuale. È il cuore dell'architettura Transformer.
</details>

**Q4.** Cosa significa RLHF?
<details>
<summary>Risposta</summary>

Reinforcement Learning from Human Feedback. Processo in cui umani valutano le risposte del modello e queste valutazioni vengono usate per migliorare il modello, allineandolo ai valori umani.
</details>

**Q5.** Perché i modelli hanno un "knowledge cutoff"?
<details>
<summary>Risposta</summary>

Perché la loro conoscenza deriva dai dati di training, che hanno una data di fine. Non possono sapere cosa è successo dopo quella data a meno che non vengano aggiornati.
</details>

---

### Sezione 2: Prompt Engineering (10 domande)

**Q6.** Quali sono i 4 componenti principali di un prompt efficace (schema ICIF)?
<details>
<summary>Risposta</summary>

1. **I**struzione - cosa fare
2. **C**ontesto - informazioni di background
3. **I**nput - dati su cui lavorare
4. **F**ormato - come strutturare l'output
</details>

**Q7.** Differenza tra zero-shot e few-shot prompting?
<details>
<summary>Risposta</summary>

- **Zero-shot**: nessun esempio, solo istruzione
- **Few-shot**: fornisci esempi di input/output desiderato prima della richiesta vera
</details>

**Q8.** Quando usare Chain-of-Thought?
<details>
<summary>Risposta</summary>

Per problemi che richiedono ragionamento multi-step: matematica, logica, analisi complesse. Trigger: "Pensiamo passo per passo..."
</details>

**Q9.** Cos'è il role prompting?
<details>
<summary>Risposta</summary>

Assegnare un ruolo/persona al modello per influenzare stile e competenze della risposta. Es: "Sei un professore di matematica..."
</details>

**Q10.** Qual è l'errore più comune nel prompt engineering?
<details>
<summary>Risposta</summary>

Essere troppo vaghi. Non specificare contesto, formato, vincoli, pubblico target.
</details>

---

### Sezione 3: API e Sviluppo (10 domande)

**Q11.** Perché usare l'API invece dell'interfaccia web?
<details>
<summary>Risposta</summary>

- Automazione
- Integrazione in applicazioni
- Elaborazione batch
- Controllo totale sui parametri
- Programmatic access
</details>

**Q12.** Cosa fa il parametro `temperature`?
<details>
<summary>Risposta</summary>

Controlla la "creatività" della risposta:
- 0 = deterministico, sempre la risposta più probabile
- 1 = bilanciato (default)
- >1 = più creativo/casuale
</details>

**Q13.** Differenza tra system prompt e user message?
<details>
<summary>Risposta</summary>

- **System**: istruzioni generali sul comportamento, invisibili all'utente, persistenti
- **User**: i messaggi dell'utente, le richieste specifiche
</details>

**Q14.** Come gestire le conversazioni multi-turn?
<details>
<summary>Risposta</summary>

Passare tutta la cronologia dei messaggi (user + assistant) ad ogni chiamata API. Il modello non ha memoria tra chiamate.
</details>

**Q15.** Cosa indica `stop_reason: "max_tokens"`?
<details>
<summary>Risposta</summary>

La risposta è stata troncata perché ha raggiunto il limite di token specificato in `max_tokens`. La risposta potrebbe essere incompleta.
</details>

---

### Sezione 4: Vision e Multimodalità (5 domande)

**Q16.** Claude può generare immagini?
<details>
<summary>Risposta</summary>

No. Claude può solo analizzare/descrivere immagini (vision), non generarle. Per generazione serve DALL-E, Stable Diffusion, etc.
</details>

**Q17.** Cosa sono i diffusion models?
<details>
<summary>Risposta</summary>

Modelli che generano immagini partendo da rumore casuale e rimuovendolo gradualmente, "scolpendo" l'immagine finale. Guidati dal prompt testuale.
</details>

**Q18.** Quali formati immagine supporta Claude Vision?
<details>
<summary>Risposta</summary>

JPEG, PNG, GIF, WebP. Supporta anche PDF con estrazione immagini.
</details>

**Q19.** Problemi comuni nella generazione immagini?
<details>
<summary>Risposta</summary>

- Mani/dita deformate
- Testo illeggibile o sbagliato
- Inconsistenza tra immagini
- Fisica sbagliata (riflessi, ombre)
</details>

**Q20.** Cos'è un negative prompt?
<details>
<summary>Risposta</summary>

Specifica cosa NON vuoi nell'immagine. Es: "blurry, low quality, deformed". Supportato da Stable Diffusion.
</details>

---

### Sezione 5: Avanzato ed Etica (10 domande)

**Q21.** Cosa significa RAG?
<details>
<summary>Risposta</summary>

Retrieval Augmented Generation. Tecnica per dare al modello accesso a documenti specifici, cercando informazioni rilevanti e passandole come contesto.
</details>

**Q22.** Cos'è un AI agent?
<details>
<summary>Risposta</summary>

Sistema che può ragionare su un obiettivo, decidere quali azioni compiere, usare strumenti esterni, e iterare fino al completamento del task.
</details>

**Q23.** Cosa sono le "allucinazioni" nei LLM?
<details>
<summary>Risposta</summary>

Output che sembrano plausibili ma sono falsi. Il modello genera testo convincente senza "sapere" se è vero.
</details>

**Q24.** Come mitigare le allucinazioni?
<details>
<summary>Risposta</summary>

- Chiedere di dire "non so" se incerto
- Verificare sempre i fatti importanti
- Usare RAG per informazioni specifiche
- Chiedere le fonti
</details>

**Q25.** Cosa prevede l'AI Act europeo?
<details>
<summary>Risposta</summary>

Regolamentazione basata sul rischio:
- Applicazioni vietate (social scoring)
- Alto rischio (sanità, giustizia) = regolate
- Trasparenza obbligatoria
- Sanzioni fino al 7% del fatturato
</details>

---

## Q&A - Domande Frequenti

### Tecniche

**"Quale modello scegliere per il mio progetto?"**
- Haiku: task semplici, alto volume, budget limitato
- Sonnet: bilanciato, la maggior parte dei casi
- Opus: task complessi, qualità massima

**"Come gestisco costi elevati?"**
- Usa modello più piccolo quando possibile
- Limita max_tokens
- Cache risposte ripetitive
- Ottimizza prompt (meno token)

**"Il modello non segue le istruzioni"**
- Sii più specifico
- Usa system prompt
- Aggiungi esempi (few-shot)
- Struttura il prompt in sezioni chiare

### Pratiche

**"Posso usare AI per il lavoro?"**
- Sì, ma verifica sempre l'output
- Attenzione a dati sensibili
- Rispetta policy aziendali
- Dichiara uso se richiesto

**"Come continuo a imparare?"**
- Pratica quotidiana
- Segui i blog ufficiali (Anthropic, OpenAI)
- Comunità online
- Corsi DeepLearning.AI

---

## Tips & Tricks Finali

### Prompt Engineering Avanzato

```
1. Usa delimitatori chiari
   """
   [Testo da analizzare qui]
   """

2. Numera le istruzioni
   1. Prima fai X
   2. Poi fai Y
   3. Infine Z

3. Specifica cosa NON fare
   "Non includere preamboli o conclusioni generiche"

4. Chiedi di strutturare il pensiero
   "Prima analizza, poi rispondi"
```

### Debug Rapido

```python
# Stampa l'intero response per debug
import json
print(json.dumps(response.model_dump(), indent=2))

# Controlla sempre lo stop_reason
if response.stop_reason == "max_tokens":
    print("ATTENZIONE: risposta troncata!")
```

### Pattern Utili

```python
# Retry con backoff
import time
for attempt in range(3):
    try:
        response = client.messages.create(...)
        break
    except anthropic.RateLimitError:
        time.sleep(2 ** attempt)

# Template riutilizzabile
ANALYSIS_TEMPLATE = """
Analizza il seguente {tipo}:

{contenuto}

Fornisci:
1. Riassunto (max 50 parole)
2. Punti chiave (3-5 bullet)
3. Sentiment: positivo/negativo/neutro
"""
```

---

## Roadmap per Continuare

### Prossima Settimana
- [ ] Completa un progetto personale
- [ ] Esplora la documentazione Anthropic

### Prossimo Mese
- [ ] Corso DeepLearning.AI su LangChain
- [ ] Sperimenta con RAG

### Prossimi 6 Mesi
- [ ] Costruisci un portfolio di progetti AI
- [ ] Contribuisci a progetti open source
- [ ] Segui sviluppi in AI safety

---

## Risorse Definitive

### Letture Essenziali
1. [Anthropic Docs](https://docs.anthropic.com)
2. [Prompt Engineering Guide](https://www.promptingguide.ai)
3. [The Illustrated Transformer](https://jalammar.github.io/illustrated-transformer/)

### Corsi Gratuiti
1. [ChatGPT Prompt Engineering - DeepLearning.AI](https://www.deeplearning.ai/short-courses/)
2. [Google AI Courses](https://ai.google/education/)

### Community
1. [r/LocalLLaMA](https://reddit.com/r/LocalLLaMA)
2. [Hugging Face Discord](https://huggingface.co/join/discord)
3. [AI Twitter/X community](https://twitter.com/AnthropicAI)

### Tools
1. [Claude.ai](https://claude.ai) - Chat gratuita
2. [Hugging Face](https://huggingface.co) - Modelli e spaces
3. [Google Colab](https://colab.google) - Notebook con GPU gratis
