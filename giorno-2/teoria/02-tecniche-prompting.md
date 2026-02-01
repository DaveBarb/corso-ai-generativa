# Blocco 2: Tecniche di Prompting (1h)

## Obiettivi di Apprendimento

Al termine di questo blocco, gli studenti saranno in grado di:
- Applicare zero-shot e few-shot prompting
- Usare chain-of-thought per problemi complessi
- Assegnare ruoli efficaci al modello
- Iterare e raffinare i prompt

---

## 1. Zero-Shot Prompting

### Definizione
**Zero-shot** = chiedere al modello di fare qualcosa senza fornire esempi.

```
┌──────────────────────────────────────────────────────────┐
│  ZERO-SHOT: Nessun esempio, solo istruzione             │
│                                                          │
│  "Classifica questa recensione come positiva o negativa: │
│   'Il prodotto è arrivato rotto e il servizio clienti    │
│   non ha risposto.'"                                     │
│                                                          │
│  → Output: "Negativa"                                    │
└──────────────────────────────────────────────────────────┘
```

### Quando Funziona Bene
- Task semplici e comuni (traduzione, riassunto, Q&A)
- Quando il modello ha già "visto" task simili nel training
- Quando il formato output è ovvio

### Quando Non Basta
- Task molto specifici o insoliti
- Quando serve un formato output particolare
- Task che richiedono ragionamento complesso

---

## 2. Few-Shot Prompting

### Definizione
**Few-shot** = fornire alcuni esempi prima della domanda vera.

```
┌──────────────────────────────────────────────────────────┐
│  FEW-SHOT: Prima gli esempi, poi la domanda             │
│                                                          │
│  Classifica il sentiment delle recensioni.               │
│                                                          │
│  Esempio 1:                                              │
│  Recensione: "Fantastico, lo consiglio!"                │
│  Sentiment: Positivo                                     │
│                                                          │
│  Esempio 2:                                              │
│  Recensione: "Pessimo, soldi buttati."                  │
│  Sentiment: Negativo                                     │
│                                                          │
│  Esempio 3:                                              │
│  Recensione: "Fa il suo lavoro, niente di speciale."   │
│  Sentiment: Neutro                                       │
│                                                          │
│  Ora classifica:                                         │
│  Recensione: "Prodotto decente ma troppo caro."         │
│  Sentiment:                                              │
└──────────────────────────────────────────────────────────┘
```

### Vantaggi del Few-Shot
- Il modello capisce esattamente il formato voluto
- Riduce ambiguità
- Permette task molto specifici/custom

### Best Practices per gli Esempi
1. **Rappresentativi**: copri i casi principali
2. **Diversificati**: mostra varietà
3. **Corretti**: esempi sbagliati = output sbagliati
4. **Concisi**: non troppo lunghi

### Quanti Esempi?

```
┌─────────┬────────────────────────────────────────────┐
│ Esempi  │ Quando usarlo                              │
├─────────┼────────────────────────────────────────────┤
│  1-2    │ Task semplice, solo per chiarire formato  │
│  3-5    │ Task moderato, standard                   │
│  5-10   │ Task complesso o molto specifico          │
│  10+    │ Raramente necessario, valuta fine-tuning  │
└─────────┴────────────────────────────────────────────┘
```

---

## 3. Chain-of-Thought (CoT)

### Il Problema
I modelli spesso sbagliano problemi che richiedono ragionamento multi-step.

```
Domanda: "In una classe ci sono 23 studenti. 15 sono femmine.
Ogni femmina ha 3 penne e ogni maschio ha 5 penne.
Quante penne ci sono in totale?"

Risposta diretta: [spesso sbagliata]
```

### La Soluzione: Pensare Passo Passo

```
Risolvi questo problema passo per passo:

In una classe ci sono 23 studenti. 15 sono femmine.
Ogni femmina ha 3 penne e ogni maschio ha 5 penne.
Quante penne ci sono in totale?

Ragionamento:
1. Numero di maschi: 23 - 15 = 8 maschi
2. Penne delle femmine: 15 × 3 = 45 penne
3. Penne dei maschi: 8 × 5 = 40 penne
4. Totale: 45 + 40 = 85 penne

Risposta: 85 penne
```

### Trigger Phrases per CoT

```
"Pensiamo passo per passo..."
"Let's think step by step..."
"Ragioniamo insieme..."
"Prima di rispondere, analizziamo il problema..."
"Scomponiamo il problema in parti..."
```

### Zero-Shot CoT vs Few-Shot CoT

**Zero-Shot CoT:**
```
[problema]
Pensa passo per passo prima di rispondere.
```

**Few-Shot CoT:**
```
Esempio:
[problema simile]
Ragionamento:
[passaggi]
Risposta: [risposta]

Ora risolvi:
[nuovo problema]
```

### Quando Usare CoT
- Problemi matematici
- Ragionamento logico
- Decisioni multi-fattore
- Debugging di codice
- Analisi complesse

---

## 4. Role Prompting

### L'Idea
Assegnare un ruolo/persona al modello per influenzare stile, tono e competenze.

```
┌──────────────────────────────────────────────────────────┐
│  SENZA RUOLO                                             │
│  "Spiega il machine learning"                           │
│  → Risposta generica                                     │
├──────────────────────────────────────────────────────────┤
│  CON RUOLO                                               │
│  "Sei un professore universitario di informatica.       │
│   Spiega il machine learning a studenti del primo anno."│
│  → Risposta didattica, con analogie, progressiva        │
└──────────────────────────────────────────────────────────┘
```

### Ruoli Efficaci

**Per spiegazioni tecniche:**
```
Sei un senior developer con 15 anni di esperienza in Python.
```

**Per scrittura creativa:**
```
Sei uno scrittore di romanzi gialli premiato.
```

**Per analisi business:**
```
Sei un consulente strategico di McKinsey.
```

**Per comunicazione semplice:**
```
Sei un divulgatore scientifico che spiega concetti
complessi a un pubblico generale.
```

### Role + Audience

La combinazione più potente: definire sia il ruolo che il pubblico.

```
Ruolo: Sei un pediatra esperto
Pubblico: Stai parlando con genitori preoccupati
Task: Spiega perché la febbre nei bambini non è sempre pericolosa
```

### Attenzione ai Limiti
- Il ruolo non dà conoscenze che il modello non ha
- Non usare ruoli per aggirare le policy di sicurezza
- Ruoli troppo specifici possono limitare la creatività

---

## 5. Prompt Iterativi

### Il Processo Iterativo

```
┌────────────────────────────────────────────────────────┐
│                  CICLO ITERATIVO                        │
│                                                         │
│   Prompt v1 → Output → Valuta → Prompt v2 → Output →   │
│       ↑                                           │     │
│       └───────────── Raffina ─────────────────────┘     │
└────────────────────────────────────────────────────────┘
```

### Esempio di Iterazione

**v1 - Primo tentativo:**
```
Scrivi una descrizione prodotto per delle cuffie wireless.
```
*Output troppo generico*

**v2 - Aggiungi specificità:**
```
Scrivi una descrizione prodotto per delle cuffie wireless
di fascia alta, 150 parole, per il sito e-commerce.
```
*Output migliore ma tono sbagliato*

**v3 - Aggiungi tono:**
```
Scrivi una descrizione prodotto per delle cuffie wireless
di fascia alta. 150 parole. Per sito e-commerce.
Tono: professionale ma accessibile, evidenzia qualità audio
e comfort. Evita tecnicismi eccessivi.
```
*Output buono*

### Strategie di Raffinamento

1. **Aggiungi specificità** se output troppo vago
2. **Aggiungi vincoli** se output fuori target
3. **Aggiungi esempi** se formato sbagliato
4. **Semplifica** se output troppo complesso
5. **Cambia ruolo** se tono sbagliato

### Feedback Diretto

Puoi anche dire al modello cosa non va:

```
La risposta precedente era troppo lunga e tecnica.
Riscrivi in modo più conciso (max 50 parole)
e comprensibile a un non-esperto.
```

---

## 6. Tecniche Avanzate (Panoramica)

### Self-Consistency
Generare multiple risposte e scegliere la più comune:
```
Risolvi questo problema 3 volte con ragionamenti diversi,
poi scegli la risposta su cui convergi.
```

### Least-to-Most Prompting
Scomporre problemi complessi in sotto-problemi:
```
Prima identifica i sotto-problemi, poi risolvili uno alla volta.
```

### Generated Knowledge
Far generare conoscenza prima di rispondere:
```
Prima elenca 5 fatti rilevanti su [argomento],
poi usa quei fatti per rispondere alla domanda.
```

### Maieutic Prompting
Guidare attraverso domande:
```
Prima di rispondere, fatti 3 domande chiave sul problema
e rispondi a ciascuna.
```

---

## 7. Combinare le Tecniche

### Esempio Complesso

```
[RUOLO]
Sei un data scientist senior che deve spiegare
risultati a stakeholder non tecnici.

[TASK]
Analizza questi dati e fornisci insight.

[CoT]
Ragiona passo per passo:
1. Prima identifica i pattern principali
2. Poi evidenzia anomalie
3. Infine suggerisci azioni

[FEW-SHOT]
Esempio di output desiderato:
"Pattern: vendite crescono del 15% Q3
Anomalia: calo improvviso settimana 12
Azione consigliata: investigare cause calo"

[INPUT]
[dati]

[FORMATO]
Usa bullet points, max 200 parole.
```

---

## Schema Decisionale: Quale Tecnica Usare?

```
                    ┌─────────────────┐
                    │ Task semplice?  │
                    └────────┬────────┘
                             │
               ┌─────────────┴─────────────┐
               │                           │
              SÌ                          NO
               │                           │
               ↓                           ↓
        ┌─────────────┐           ┌─────────────────┐
        │ Zero-shot   │           │ Serve formato   │
        └─────────────┘           │ specifico?      │
                                  └────────┬────────┘
                                           │
                              ┌────────────┴────────────┐
                              │                         │
                             SÌ                        NO
                              │                         │
                              ↓                         ↓
                       ┌─────────────┐         ┌─────────────────┐
                       │ Few-shot    │         │ Serve ragion.   │
                       └─────────────┘         │ multi-step?     │
                                               └────────┬────────┘
                                                        │
                                           ┌────────────┴────────┐
                                           │                     │
                                          SÌ                    NO
                                           │                     │
                                           ↓                     ↓
                                    ┌─────────────┐      ┌─────────────┐
                                    │ Chain-of-   │      │ Role +      │
                                    │ Thought     │      │ Contesto    │
                                    └─────────────┘      └─────────────┘
```

---

## Esercizio Pratico

Per ciascun task, scegli la tecnica più appropriata e scrivi il prompt:

1. **Tradurre un menu da italiano a inglese**
   - Tecnica: _______
   - Prompt:

2. **Calcolare l'IRR di un investimento**
   - Tecnica: _______
   - Prompt:

3. **Classificare email di supporto in categorie custom**
   - Tecnica: _______
   - Prompt:

4. **Scrivere una email di scuse a un cliente**
   - Tecnica: _______
   - Prompt:

---

## Domande di Riflessione

1. Perché il chain-of-thought migliora le performance su problemi matematici?

2. Qual è il rischio di usare troppi esempi nel few-shot?

3. Come decidi se un task è "semplice" abbastanza per zero-shot?

---

## Risorse

- [Chain-of-Thought Paper](https://arxiv.org/abs/2201.11903)
- [Anthropic's Claude Prompting Guide](https://docs.anthropic.com/claude/docs/prompt-engineering)
- [Prompt Engineering Patterns](https://www.promptingguide.ai/techniques)
