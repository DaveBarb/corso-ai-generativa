# Blocco 2: Etica, Limiti e Futuro (1h)

## Obiettivi di Apprendimento

Al termine di questo blocco, gli studenti saranno in grado di:
- Riconoscere bias nei modelli AI
- Gestire le allucinazioni in modo appropriato
- Comprendere le implicazioni di copyright
- Conoscere la regolamentazione (AI Act)
- Riflettere sull'impatto sul lavoro
- Identificare i trend futuri

---

## 1. Bias nei Modelli AI

### Cosa Sono i Bias

I **bias** sono pregiudizi sistematici che si manifestano nei risultati del modello.

```
┌─────────────────────────────────────────────────────────────────┐
│                    ORIGINE DEI BIAS                              │
│                                                                  │
│   DATI DI TRAINING                                               │
│   └─ Internet contiene pregiudizi storici e culturali          │
│   └─ Sovrarappresentazione di alcune demografie                 │
│   └─ Sottorappresentazione di minoranze                         │
│                                                                  │
│   PROCESSO DI SELEZIONE                                          │
│   └─ Chi decide cosa è nel dataset?                             │
│   └─ Quali fonti sono incluse/escluse?                          │
│                                                                  │
│   DESIGN DEL MODELLO                                             │
│   └─ Ottimizzazione per metriche specifiche                     │
│   └─ Scelte architetturali                                       │
│                                                                  │
└─────────────────────────────────────────────────────────────────┘
```

### Esempi di Bias

1. **Bias di genere**
   - "Infermiere" → immagine femminile
   - "CEO" → immagine maschile

2. **Bias culturale**
   - Default verso cultura occidentale
   - Sottorappresentazione di altre culture

3. **Bias linguistico**
   - Migliori performance in inglese
   - Errori più frequenti in lingue minoritarie

4. **Bias socioeconomico**
   - Associazioni stereotipate
   - Rappresentazioni non equilibrate

### Mitigazione

**A livello di sviluppatore:**
- Dataset più diversificati
- Testing per bias specifici
- Fine-tuning correttivo
- RLHF con focus su equità

**A livello di utente:**
- Consapevolezza del problema
- Verifica critica degli output
- Prompt espliciti per diversità
- Segnalazione di problemi

---

## 2. Allucinazioni

### Cosa Sono

Le **allucinazioni** sono output che sembrano plausibili ma sono falsi.

```
┌─────────────────────────────────────────────────────────────────┐
│                     TIPI DI ALLUCINAZIONI                        │
│                                                                  │
│   FATTUALI                                                       │
│   └─ "Einstein vinse il Nobel per la relatività"               │
│   └─ (Falso: lo vinse per l'effetto fotoelettrico)             │
│                                                                  │
│   INVENTIVE                                                      │
│   └─ Citare paper/libri che non esistono                       │
│   └─ Inventare statistiche                                      │
│                                                                  │
│   LOGICHE                                                        │
│   └─ Ragionamenti che sembrano corretti ma sono fallaci        │
│                                                                  │
│   REFERENZIALI                                                   │
│   └─ "Come ho detto prima..." (quando non l'ha detto)          │
│                                                                  │
└─────────────────────────────────────────────────────────────────┘
```

### Perché Accadono

1. **Pattern matching, non comprensione**
   - Il modello genera testo plausibile
   - Non "sa" se è vero

2. **Training su dati imperfetti**
   - Internet contiene errori
   - Dati contraddittori

3. **Ottimizzazione per fluidità**
   - Risposte fluide premiate
   - "Non so" meno naturale

### Come Gestirle

**Prevenzione:**
```
Prompt: "Rispondi solo se sei sicuro. Se non sai, dì 'non ho informazioni'."
```

**Verifica:**
```
- Controlla sempre fatti importanti
- Cross-reference con fonti autorevoli
- Usa RAG per informazioni specifiche
```

**Detection:**
```
- Chiedi le fonti
- Verifica consistenza interna
- Poni la stessa domanda in modi diversi
```

---

## 3. Copyright e Proprietà Intellettuale

### Le Questioni Aperte

```
┌─────────────────────────────────────────────────────────────────┐
│                    QUESTIONI COPYRIGHT                           │
│                                                                  │
│   1. TRAINING                                                    │
│   └─ I modelli sono stati addestrati su contenuti protetti     │
│   └─ È fair use? È violazione?                                  │
│                                                                  │
│   2. OUTPUT                                                      │
│   └─ Chi possiede il contenuto generato?                       │
│   └─ Se riproduce parti di training data?                       │
│                                                                  │
│   3. STILE                                                       │
│   └─ "In stile di [artista vivente]" è legale?                 │
│   └─ Differenza tra ispirazione e copia                         │
│                                                                  │
└─────────────────────────────────────────────────────────────────┘
```

### Casi Legali in Corso

- **Getty vs Stability AI** - Uso non autorizzato di immagini
- **NYT vs OpenAI** - Training su articoli protetti
- **Artisti vs Midjourney** - Replicazione di stili

### Best Practices

1. **Per uso commerciale:**
   - Verifica ToS del servizio
   - Considera modelli con licenze chiare
   - Documenta il processo creativo

2. **Per contenuti sensibili:**
   - Non imitare artisti viventi senza permesso
   - Evita riproduzione esatta di opere

3. **Trasparenza:**
   - Dichiara l'uso di AI quando rilevante
   - Mantieni documentazione

---

## 4. Deepfake e Disinformazione

### Il Problema

L'AI generativa può creare contenuti falsi molto convincenti:
- Video di persone che non hanno detto quelle cose
- Immagini di eventi mai accaduti
- Audio con voci clonate

### Rischi

1. **Disinformazione politica**
2. **Frodi e truffe**
3. **Revenge porn / abusi**
4. **Manipolazione mercati**

### Contromisure

**Tecnologiche:**
- Watermarking (C2PA standard)
- Detection tools
- Blockchain per provenance

**Normative:**
- Obbligo di disclosure
- Criminalizzazione usi malevoli

**Educative:**
- Media literacy
- Critical thinking

---

## 5. Impatto sul Lavoro

### Prospettive

```
┌─────────────────────────────────────────────────────────────────┐
│                  IMPATTO SUL LAVORO                              │
│                                                                  │
│   AUTOMAZIONE                                                    │
│   └─ Alcuni task saranno automatizzati                          │
│   └─ Non necessariamente interi lavori                          │
│                                                                  │
│   AUGMENTATION                                                   │
│   └─ AI come strumento che amplifica le capacità               │
│   └─ Focus su competenze complementari all'AI                   │
│                                                                  │
│   NUOVI RUOLI                                                    │
│   └─ Prompt engineer                                             │
│   └─ AI trainer                                                  │
│   └─ AI ethics specialist                                        │
│   └─ Human-AI interaction designer                              │
│                                                                  │
│   REDISTRIBUZIONE                                                │
│   └─ Alcuni settori crescono, altri declinano                   │
│   └─ Necessità di reskilling                                    │
│                                                                  │
└─────────────────────────────────────────────────────────────────┘
```

### Lavori Più a Rischio

- Data entry e elaborazione dati ripetitiva
- Scrittura base (report standard, traduzioni)
- Customer service di primo livello
- Coding boilerplate

### Lavori Più Resistenti

- Creatività originale e strategia
- Empatia e relazioni umane
- Giudizio in situazioni complesse
- Lavoro fisico non routinario
- Leadership e gestione

### Consigli per il Futuro

1. **Impara a usare l'AI** - diventa più produttivo
2. **Sviluppa competenze umane** - empatia, creatività, leadership
3. **Rimani adattabile** - continuous learning
4. **Coltiva il pensiero critico** - valuta e guida l'AI

---

## 6. Regolamentazione: AI Act Europeo

### Cos'è l'AI Act

Prima regolamentazione completa sull'AI al mondo (EU, 2024).

### Approccio Basato sul Rischio

```
┌─────────────────────────────────────────────────────────────────┐
│                    PIRAMIDE DEL RISCHIO                          │
│                                                                  │
│                     ┌───────────┐                                │
│                     │   VIETATO  │ ← Social scoring, manipolaz. │
│                     └─────┬─────┘                                │
│                   ┌───────┴───────┐                              │
│                   │  ALTO RISCHIO  │ ← Sanità, giustizia, HR    │
│                   │  (regolato)    │                              │
│                   └───────┬───────┘                              │
│             ┌─────────────┴─────────────┐                        │
│             │     RISCHIO LIMITATO       │ ← Chatbot, deepfake   │
│             │     (trasparenza)          │                        │
│             └─────────────┬─────────────┘                        │
│       ┌───────────────────┴───────────────────┐                  │
│       │           RISCHIO MINIMO               │ ← Spam filter,   │
│       │           (nessun obbligo)             │   raccomandazioni│
│       └───────────────────────────────────────┘                  │
│                                                                  │
└─────────────────────────────────────────────────────────────────┘
```

### Obblighi per AI Generativa

1. **Trasparenza**
   - Dichiarare che il contenuto è AI-generated
   - Documentazione del modello

2. **Copyright**
   - Rispettare le leggi esistenti
   - Disclosure dei dati di training

3. **Sicurezza**
   - Valutazione dei rischi
   - Misure di mitigazione

### Sanzioni

- Fino al 7% del fatturato globale
- Fino a €35 milioni per violazioni gravi

---

## 7. Trend Futuri

### Modelli Più Piccoli ed Efficienti

```
Trend: Stesse capacità, meno risorse
- Quantizzazione
- Distillation
- Architetture efficienti
→ AI su smartphone, edge devices
```

### On-Device AI

```
Pro:
- Privacy (dati non lasciano il device)
- Latenza minima
- Funziona offline

Con:
- Capacità limitate
- Aggiornamenti più difficili
```

### Multimodalità Avanzata

```
Oggi: Testo + Immagini
Domani: + Audio + Video + 3D + Sensori
→ Esperienze più naturali e immersive
```

### AI Agents Autonomi

```
Oggi: Assistenti che eseguono comandi
Domani: Agenti che perseguono obiettivi complessi
→ Sfide di alignment e sicurezza
```

### AGI (Artificial General Intelligence)

```
Definizione: AI con capacità cognitive generali umane
Stato: Non raggiunta, timeline controversa
Dibattito: 5 anni? 20 anni? Mai?
Implicazioni: Profondissime se raggiunta
```

---

## Riassunto

```
┌─────────────────────────────────────────────────────────────────┐
│                 ETICA E FUTURO DELL'AI                           │
│                                                                  │
│   SFIDE ATTUALI                                                  │
│   ├─ Bias: pregiudizi nei dati e modelli                        │
│   ├─ Allucinazioni: output falsi ma plausibili                  │
│   ├─ Copyright: questioni legali aperte                         │
│   └─ Deepfake: rischi di disinformazione                        │
│                                                                  │
│   IMPATTO SOCIALE                                                │
│   ├─ Lavoro: automazione + augmentation                         │
│   └─ Regolamentazione: AI Act EU come riferimento              │
│                                                                  │
│   FUTURO                                                         │
│   ├─ Modelli più efficienti                                      │
│   ├─ AI on-device                                                │
│   ├─ Multimodalità avanzata                                      │
│   └─ Agenti autonomi                                             │
│                                                                  │
│   NOSTRO RUOLO                                                   │
│   ├─ Usare l'AI in modo responsabile                            │
│   ├─ Verificare criticamente gli output                         │
│   ├─ Sviluppare competenze complementari                        │
│   └─ Partecipare al dibattito pubblico                          │
│                                                                  │
└─────────────────────────────────────────────────────────────────┘
```

---

## Domande di Riflessione

1. Come verificheresti se un output AI contiene bias?

2. Quale pensi sia la responsabilità di chi sviluppa AI vs chi la usa?

3. Come cambierà il tuo futuro lavoro con l'AI?

4. Cosa dovrebbe essere vietato nell'uso dell'AI?

---

## Risorse

- [EU AI Act Full Text](https://artificialintelligenceact.eu/)
- [Anthropic Core Views on AI Safety](https://www.anthropic.com/index/core-views-on-ai-safety)
- [AI Incident Database](https://incidentdatabase.ai/)
- [Future of Jobs Report - WEF](https://www.weforum.org/reports/the-future-of-jobs-report-2023)
