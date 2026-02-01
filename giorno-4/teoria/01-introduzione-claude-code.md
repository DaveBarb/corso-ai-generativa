# Blocco 1: Introduzione a Claude Code (1h)

## Obiettivi di Apprendimento

Al termine di questo blocco, gli studenti saranno in grado di:
- Capire cos'è Claude Code e le sue differenze con altre interfacce
- Installare e configurare Claude Code
- Conoscere i comandi principali
- Scegliere lo strumento giusto per ogni situazione

---

## 1. Cos'è Claude Code?

### Definizione
**Claude Code** è un tool da riga di comando (CLI) che integra Claude direttamente nel tuo workflow di sviluppo.

```
┌─────────────────────────────────────────────────────────────────┐
│                                                                  │
│   Interfaccia Web    →  Chat interattiva, uso generale          │
│   (claude.ai)                                                    │
│                                                                  │
│   API                →  Integrazione in applicazioni            │
│   (console.anthropic.com)                                        │
│                                                                  │
│   Claude Code        →  Sviluppo software nel terminale         │
│   (CLI)                                                          │
│                                                                  │
└─────────────────────────────────────────────────────────────────┘
```

### Vantaggi di Claude Code

| Caratteristica | Descrizione |
|----------------|-------------|
| **Integrazione terminale** | Lavora dove già sviluppi |
| **Contesto progetto** | Può leggere file e capire la struttura |
| **Operazioni su file** | Crea, modifica, cerca nel codice |
| **Esecuzione comandi** | Può eseguire comandi shell |
| **Persistenza sessione** | Mantiene il contesto durante la sessione |

### Cosa Può Fare Claude Code

1. **Generare codice** - Da specifica a implementazione
2. **Modificare file esistenti** - Refactoring, bug fix
3. **Navigare il codebase** - Cercare, leggere, capire
4. **Eseguire comandi** - Test, build, git
5. **Spiegare codice** - Documentare, analizzare
6. **Debug** - Trovare e correggere errori

---

## 2. Installazione e Configurazione

### Prerequisiti
- Node.js 18+ installato
- Account Anthropic con API key
- Terminale (bash, zsh, PowerShell)

### Installazione

```bash
# Installa globalmente via npm
npm install -g @anthropic-ai/claude-code

# Verifica installazione
claude --version
```

### Configurazione API Key

```bash
# Metodo 1: Variabile d'ambiente
export ANTHROPIC_API_KEY="sk-ant-..."

# Metodo 2: File di configurazione
claude config set api_key sk-ant-...

# Metodo 3: Login interattivo
claude login
```

### Prima Esecuzione

```bash
# Avvia Claude Code in modalità interattiva
claude

# Oppure con un prompt diretto
claude "Cosa puoi fare?"
```

---

## 3. Comandi Principali

### Modalità Interattiva

```bash
$ claude
╭───────────────────────────────────────────────────────────╮
│  Claude Code                                               │
│  Scrivi la tua richiesta o usa i comandi                  │
╰───────────────────────────────────────────────────────────╯

> Crea una funzione Python per calcolare il fattoriale

[Claude genera il codice...]
```

### Comandi Slash

```
/help       - Mostra tutti i comandi disponibili
/clear      - Pulisce la conversazione
/history    - Mostra la cronologia
/compact    - Riassume la conversazione
/cost       - Mostra i costi della sessione
```

### Comandi per File

```
@file.py    - Riferisce a un file specifico
@folder/    - Riferisce a una cartella
```

### Esempi Pratici

```bash
# Genera codice
> Crea un server FastAPI con un endpoint /hello

# Modifica file esistente
> @app.py aggiungi validazione degli input

# Spiega codice
> @utils.py spiega cosa fa questa funzione

# Debug
> @main.py ho questo errore: [errore]. Come lo risolvo?

# Refactoring
> @old_code.py refactoring per usare async/await
```

---

## 4. Workflow Tipici

### Workflow 1: Nuovo Progetto

```bash
$ cd my_project
$ claude

> Inizializza un progetto Python con:
> - requirements.txt
> - main.py con struttura base
> - README.md
> - .gitignore

[Claude crea i file necessari]
```

### Workflow 2: Feature Esistente

```bash
> @models.py aggiungi un modello User con campi:
> - id (auto)
> - username (string, unique)
> - email (string, unique)
> - created_at (timestamp)
```

### Workflow 3: Debugging

```bash
> Ho questo errore quando eseguo main.py:
> TypeError: 'NoneType' object is not subscriptable
>
> File coinvolti: @main.py @utils.py
```

### Workflow 4: Code Review

```bash
> @pull_request/ analizza questi cambiamenti e suggerisci miglioramenti
```

---

## 5. Quando Usare Cosa?

### Matrice Decisionale

| Scenario | Strumento | Perché |
|----------|-----------|--------|
| Chat generale, Q&A | Claude.ai Web | Interfaccia semplice |
| Sviluppo software | Claude Code | Integrazione terminale |
| App/bot custom | API Python | Controllo totale |
| Analisi documenti | Claude.ai Web | Upload file facile |
| Batch processing | API Python | Automazione |
| Pair programming | Claude Code | Contesto progetto |

### Quando Claude Code è Ideale

✅ **Usa Claude Code quando:**
- Stai sviluppando codice
- Hai bisogno di modificare file
- Vuoi eseguire comandi
- Lavori su un progetto esistente

❌ **Non usare Claude Code quando:**
- Hai solo domande generali
- Non hai bisogno di operazioni su file
- Preferisci interfaccia grafica
- Vuoi caricare immagini/documenti

---

## 6. Funzionalità Avanzate

### Modalità Plan

Chiedi a Claude di pianificare prima di agire:

```bash
> /plan Voglio aggiungere autenticazione JWT al mio progetto
```

Claude analizzerà il progetto e proporrà un piano prima di implementare.

### Esecuzione Comandi

Claude può eseguire comandi shell:

```bash
> Esegui i test e dimmi se passano tutti
[Claude esegue: pytest]
```

### Multi-file Edit

```bash
> Rinomina la variabile "data" in "user_data" in tutti i file Python del progetto
```

### Contesto di Progetto

Claude Code capisce automaticamente:
- Struttura del progetto
- Linguaggio/framework usato
- Dipendenze (package.json, requirements.txt)
- Configurazioni (.env, config files)

---

## 7. Best Practices

### DO: Cose da Fare

1. **Sii specifico**
   ```
   ✅ "Aggiungi validazione email in @forms.py usando regex"
   ❌ "Valida l'email"
   ```

2. **Fornisci contesto**
   ```
   ✅ "Questo progetto usa FastAPI e SQLAlchemy. Aggiungi..."
   ❌ "Aggiungi un database"
   ```

3. **Riferisci i file rilevanti**
   ```
   ✅ "@models.py @schemas.py crea endpoint CRUD"
   ❌ "Crea endpoint CRUD"
   ```

4. **Verifica le modifiche**
   ```
   Sempre controllare le modifiche prima di accettare
   ```

### DON'T: Cose da Evitare

1. **Non fidarti ciecamente**
   - Rivedi sempre il codice generato
   - Testa le modifiche

2. **Non condividere dati sensibili**
   - Password
   - Chiavi API
   - Dati utenti

3. **Non usare per codice critico senza review**
   - Sicurezza
   - Finanza
   - Sistemi critici

---

## 8. Limiti e Considerazioni

### Limiti Tecnici
- Dimensione massima file leggibili
- Complessità contesto (token limit)
- Potrebbe non capire framework molto specifici

### Limiti Concettuali
- Non sostituisce la comprensione del codice
- Può generare codice funzionante ma non ottimale
- Non conosce il dominio specifico del tuo business

### Costi
- Ogni interazione usa token API
- Progetti grandi = più contesto = più costi
- Monitorare con `/cost`

---

## Riassunto

```
┌─────────────────────────────────────────────────────────────────┐
│                      CLAUDE CODE                                 │
│                                                                  │
│  ✓ CLI per sviluppo software                                   │
│  ✓ Integrazione terminale                                       │
│  ✓ Lettura/scrittura file                                       │
│  ✓ Esecuzione comandi                                           │
│  ✓ Contesto progetto automatico                                 │
│                                                                  │
│  Comandi: /help, /clear, @file.py                               │
│                                                                  │
│  Ideale per: coding, refactoring, debug, documentazione         │
│                                                                  │
└─────────────────────────────────────────────────────────────────┘
```

---

## Domande di Riflessione

1. In quale situazione useresti Claude Code invece dell'interfaccia web?

2. Perché è importante verificare sempre il codice generato?

3. Come gestiresti un progetto con file sensibili?

---

## Risorse

- [Claude Code Documentation](https://docs.anthropic.com/claude-code)
- [GitHub Claude Code](https://github.com/anthropics/claude-code)
- [Best Practices Guide](https://docs.anthropic.com/claude/docs/claude-code-best-practices)
