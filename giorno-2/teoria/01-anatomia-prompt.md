# Blocco 1: Anatomia di un Prompt Efficace (1h)

## Obiettivi di Apprendimento

Al termine di questo blocco, gli studenti saranno in grado di:
- Identificare i componenti di un prompt efficace
- Scrivere prompt chiari e specifici
- Evitare gli errori più comuni
- Strutturare prompt per diversi tipi di task

---

## 1. Cos'è un Prompt?

### Definizione
Un **prompt** è l'input testuale che forniamo a un modello di linguaggio per ottenere una risposta.

```
┌────────────────────────────────────────────────┐
│                    PROMPT                       │
│                                                 │
│  "Scrivi un riassunto di questo articolo"      │
│                                                 │
└────────────────────────────────────────────────┘
                      ↓
               [LLM Processing]
                      ↓
┌────────────────────────────────────────────────┐
│                   RISPOSTA                      │
│                                                 │
│  "L'articolo tratta di..."                     │
│                                                 │
└────────────────────────────────────────────────┘
```

### Perché il Prompt è Importante?
- È l'**unica** interfaccia tra te e il modello
- Un buon prompt può fare la differenza tra risposta inutile e risposta eccellente
- "Garbage in, garbage out" - input vago = output vago

---

## 2. I Quattro Componenti di un Prompt

### Schema ICIF

```
┌─────────────────────────────────────────────────────────────┐
│  I - ISTRUZIONE    │  Cosa vuoi che faccia il modello       │
├────────────────────┼────────────────────────────────────────┤
│  C - CONTESTO      │  Informazioni di background            │
├────────────────────┼────────────────────────────────────────┤
│  I - INPUT         │  I dati su cui lavorare                │
├────────────────────┼────────────────────────────────────────┤
│  F - FORMATO       │  Come vuoi la risposta                 │
└────────────────────┴────────────────────────────────────────┘
```

### Esempio Completo

```
[ISTRUZIONE]
Analizza il sentiment di queste recensioni di prodotto.

[CONTESTO]
Sei un analista di marketing che deve capire come i clienti
percepiscono il nostro nuovo smartphone.

[INPUT]
Recensione 1: "Batteria fantastica, dura tutto il giorno!"
Recensione 2: "Troppo costoso per quello che offre."
Recensione 3: "La fotocamera è buona ma non eccezionale."

[FORMATO]
Per ogni recensione indica:
- Sentiment: Positivo/Negativo/Neutro
- Aspetto menzionato
- Breve motivazione
```

### Non Tutti i Componenti sono Sempre Necessari

| Task | Componenti Necessari |
|------|---------------------|
| Domanda semplice | Solo Istruzione |
| Analisi documento | Istruzione + Input |
| Task specializzato | Tutti e quattro |

---

## 3. Chiarezza e Specificità

### Il Principio d'Oro
> **Più sei specifico nella richiesta, più otterrai ciò che vuoi.**

### Esempio: Evoluzione di un Prompt

**Livello 1 - Vago (da evitare):**
```
Scrivi qualcosa sull'Italia.
```

**Livello 2 - Meglio:**
```
Scrivi un paragrafo sull'Italia.
```

**Livello 3 - Buono:**
```
Scrivi un paragrafo di 100 parole sulla cucina italiana.
```

**Livello 4 - Ottimo:**
```
Scrivi un paragrafo di 100 parole sulla cucina italiana,
destinato a turisti americani, con focus sui piatti regionali
meno conosciuti fuori dall'Italia.
```

### Checklist della Specificità

- [ ] **CHI** - A chi è destinato l'output?
- [ ] **COSA** - Esattamente cosa vuoi?
- [ ] **COME** - In che formato/stile?
- [ ] **QUANTO** - Lunghezza/quantità?
- [ ] **PERCHÉ** - (opzionale) Scopo finale?

---

## 4. Il Ruolo del Contesto

### Perché il Contesto è Importante

Il modello non sa nulla oltre a quello che gli dici nel prompt. Il contesto riempie le lacune.

**Senza contesto:**
```
Riscrivi questo testo in modo più semplice:
"L'ipotesi nulla è stata rigettata con p<0.05"
```
Risultato: Potrebbe semplificare troppo o troppo poco

**Con contesto:**
```
Sei un professore che spiega statistica a studenti di economia
al primo anno che non hanno mai fatto statistica prima.

Riscrivi questo testo in modo più semplice:
"L'ipotesi nulla è stata rigettata con p<0.05"
```
Risultato: Adatterà il linguaggio al pubblico

### Tipi di Contesto

1. **Chi sei tu** (il ruolo del modello)
2. **Chi è il pubblico** (destinatari dell'output)
3. **Situazione** (contesto del problema)
4. **Vincoli** (limitazioni da rispettare)
5. **Obiettivo** (scopo finale)

---

## 5. Fornire Esempi

### Il Potere degli Esempi

Gli esempi mostrano al modello esattamente cosa vuoi, meglio di mille parole di spiegazione.

**Senza esempio:**
```
Estrai le entità da questo testo:
"Mario Rossi lavora a Milano presso Acme Corp."
```

**Con esempio:**
```
Estrai le entità da questo testo nel formato mostrato.

Esempio:
Input: "Anna Bianchi vive a Roma e lavora per TechCo."
Output:
- Persona: Anna Bianchi
- Città: Roma
- Azienda: TechCo

Ora analizza:
Input: "Mario Rossi lavora a Milano presso Acme Corp."
```

### Quanti Esempi?

| Situazione | Esempi Consigliati |
|------------|-------------------|
| Task semplice e comune | 0-1 |
| Task con formato specifico | 1-2 |
| Task complesso o insolito | 2-3 |
| Task molto specifico | 3-5 |

---

## 6. Specificare il Formato di Output

### Perché è Importante

Se non specifichi il formato, il modello sceglie lui - e potrebbe non essere quello che ti serve.

### Formati Comuni

**Lista:**
```
Elenca 5 benefici dell'esercizio fisico in formato bullet point.
```

**Tabella:**
```
Confronta Python e JavaScript in una tabella con colonne:
Aspetto, Python, JavaScript
```

**JSON:**
```
Estrai nome, email e telefono in formato JSON:
"Contattare Mario Rossi: mario@email.com, 02-1234567"
```

**Markdown:**
```
Scrivi una guida con titoli, sottotitoli e code blocks.
```

### Esempio: Stesso Task, Formati Diversi

**Prompt:**
```
Spiega i 3 stati dell'acqua.
```

**Output senza formato specificato:**
"L'acqua può esistere in tre stati: solido (ghiaccio), liquido (acqua) e gassoso (vapore)..."

**Prompt con formato:**
```
Spiega i 3 stati dell'acqua in formato tabella con colonne:
Stato, Nome comune, Temperatura, Caratteristiche principali
```

---

## 7. Errori Comuni da Evitare

### Errore 1: Prompt Troppo Vago
```
❌ "Dimmi qualcosa sull'AI"
✅ "Spiega in 3 frasi come funziona il machine learning supervisionato"
```

### Errore 2: Istruzioni Contraddittorie
```
❌ "Scrivi una risposta breve e dettagliata"
✅ "Scrivi una risposta di massimo 100 parole, includendo i 3 punti chiave"
```

### Errore 3: Assumere Conoscenza del Contesto
```
❌ "Continua il progetto di ieri"
✅ "Sto lavorando su un'app React per to-do list. Aggiungi una funzione di filtro..."
```

### Errore 4: Non Specificare il Pubblico
```
❌ "Spiega la blockchain"
✅ "Spiega la blockchain a un imprenditore non tecnico in 2 paragrafi"
```

### Errore 5: Dimenticare i Vincoli
```
❌ "Scrivi una storia"
✅ "Scrivi una storia di 200 parole per bambini di 8 anni, senza elementi spaventosi"
```

---

## 8. Template Pronti all'Uso

### Template Generico
```
[RUOLO - opzionale]
Sei un [ruolo] con esperienza in [area].

[TASK]
[Cosa deve fare esattamente]

[CONTESTO - opzionale]
[Informazioni di background rilevanti]

[INPUT]
[Dati su cui lavorare]

[FORMATO OUTPUT]
Rispondi in formato [formato] con [requisiti specifici].

[VINCOLI - opzionale]
- [vincolo 1]
- [vincolo 2]
```

### Template per Analisi
```
Analizza il seguente [tipo di contenuto]:

"""
[contenuto]
"""

Nella tua analisi includi:
1. [aspetto 1]
2. [aspetto 2]
3. [aspetto 3]

Formato: [formato desiderato]
```

### Template per Generazione
```
Genera [tipo di contenuto] con le seguenti caratteristiche:
- Argomento: [argomento]
- Pubblico: [pubblico target]
- Tono: [tono desiderato]
- Lunghezza: [lunghezza]

Requisiti aggiuntivi:
- [requisito 1]
- [requisito 2]
```

---

## Esercizio Pratico

Riscrivi questo prompt vago in un prompt efficace:

**Prompt originale:**
```
Aiutami con una email.
```

**Spazio per la tua versione:**

_Considera: A chi? Per cosa? Che tono? Quanto lunga?_

---

## Domande di Riflessione

1. Qual è il componente più importante di un prompt? Dipende dal task?

2. Quando è meglio dare molti esempi vs nessuno?

3. Come decidi quanti vincoli aggiungere senza rendere il prompt troppo lungo?

---

## Risorse

- [Anthropic Prompt Engineering Guide](https://docs.anthropic.com/claude/docs/prompt-engineering)
- [OpenAI Prompt Engineering Guide](https://platform.openai.com/docs/guides/prompt-engineering)
- [Prompt Engineering Guide](https://www.promptingguide.ai/)
