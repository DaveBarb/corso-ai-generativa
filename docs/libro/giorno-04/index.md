# Giorno 4: Claude Code

## Obiettivi della Giornata

- Capire cos'è Claude Code e le sue differenze con altre interfacce
- Installare e configurare Claude Code
- Conoscere i comandi principali
- Applicare best practices per lo sviluppo assistito

---

## Blocco 1: Introduzione a Claude Code

### Cos'è Claude Code?

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

### Installazione e Configurazione

#### Prerequisiti
- Node.js 18+ installato
- Account Anthropic con API key
- Terminale (bash, zsh, PowerShell)

#### Installazione

```bash
# Installa globalmente via npm
npm install -g @anthropic-ai/claude-code

# Verifica installazione
claude --version
```

#### Configurazione API Key

```bash
# Metodo 1: Variabile d'ambiente
export ANTHROPIC_API_KEY="sk-ant-..."

# Metodo 2: File di configurazione
claude config set api_key sk-ant-...

# Metodo 3: Login interattivo
claude login
```

#### Prima Esecuzione

```bash
# Avvia Claude Code in modalità interattiva
claude

# Oppure con un prompt diretto
claude "Cosa puoi fare?"
```

---

### Comandi Principali

#### Modalità Interattiva

```bash
$ claude
╭───────────────────────────────────────────────────────────╮
│  Claude Code                                               │
│  Scrivi la tua richiesta o usa i comandi                  │
╰───────────────────────────────────────────────────────────╯

> Crea una funzione Python per calcolare il fattoriale

[Claude genera il codice...]
```

#### Comandi Slash

| Comando | Descrizione |
|---------|-------------|
| `/help` | Mostra tutti i comandi disponibili |
| `/clear` | Pulisce la conversazione |
| `/history` | Mostra la cronologia |
| `/compact` | Riassume la conversazione |
| `/cost` | Mostra i costi della sessione |

#### Riferimenti a File

```
@file.py    - Riferisce a un file specifico
@folder/    - Riferisce a una cartella
```

#### Esempi Pratici

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

### Workflow Tipici

#### Workflow 1: Nuovo Progetto

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

#### Workflow 2: Feature Esistente

```bash
> @models.py aggiungi un modello User con campi:
> - id (auto)
> - username (string, unique)
> - email (string, unique)
> - created_at (timestamp)
```

#### Workflow 3: Debugging

```bash
> Ho questo errore quando eseguo main.py:
> TypeError: 'NoneType' object is not subscriptable
>
> File coinvolti: @main.py @utils.py
```

---

### Quando Usare Cosa?

| Scenario | Strumento | Perché |
|----------|-----------|--------|
| Chat generale, Q&A | Claude.ai Web | Interfaccia semplice |
| Sviluppo software | Claude Code | Integrazione terminale |
| App/bot custom | API Python | Controllo totale |
| Analisi documenti | Claude.ai Web | Upload file facile |
| Batch processing | API Python | Automazione |
| Pair programming | Claude Code | Contesto progetto |

---

## Blocco 2: Best Practices per lo Sviluppo Assistito

### Formulare Richieste Efficaci per il Coding

!!! tip "La Regola d'Oro"
    **Più contesto dai, migliore sarà il codice generato.**

#### Anatomia di una Richiesta Efficace

```
┌─────────────────────────────────────────────────────────────────┐
│                    RICHIESTA EFFICACE                            │
│                                                                  │
│  1. COSA vuoi                → La funzionalità                  │
│  2. DOVE si inserisce        → File, classe, modulo             │
│  3. COME deve funzionare     → Input, output, comportamento     │
│  4. VINCOLI                  → Stile, dipendenze, performance   │
│  5. ESEMPI                   → Casi d'uso, edge cases           │
│                                                                  │
└─────────────────────────────────────────────────────────────────┘
```

#### Esempio: Da Vago a Efficace

**Vago:**
```
Crea una funzione per validare password
```

**Efficace:**
```
Crea una funzione Python `validate_password(password: str) -> tuple[bool, list[str]]`

Requisiti:
- Minimo 8 caratteri
- Almeno una lettera maiuscola
- Almeno un numero
- Almeno un carattere speciale (!@#$%^&*)

Return:
- (True, []) se valida
- (False, ["lista", "di", "errori"]) se non valida

Stile: type hints, docstring Google style
```

---

### Checklist di Revisione del Codice Generato

```
□ FUNZIONALITÀ
  □ Fa quello che ho chiesto?
  □ Gestisce gli edge cases?
  □ Gli errori sono gestiti?

□ SICUREZZA
  □ Input validati?
  □ SQL injection possibile?
  □ XSS possibile?
  □ Secrets esposti?

□ QUALITÀ
  □ Codice leggibile?
  □ Naming appropriato?
  □ DRY (Don't Repeat Yourself)?
  □ Single Responsibility?

□ PERFORMANCE
  □ Complessità accettabile?
  □ Query ottimizzate?
  □ Risorse chiuse correttamente?

□ COMPATIBILITÀ
  □ Funziona con la versione Python del progetto?
  □ Dipendenze compatibili?
  □ Segue lo stile del progetto?
```

---

### Debugging Assistito

#### Template Efficace per Debug

```
Ho questo errore:
[copia l'errore completo]

File coinvolti:
@file1.py
@file2.py

Cosa stavo cercando di fare:
[descrizione]

Cosa ho già provato:
[lista tentativi]
```

#### Strategie di Debug con AI

1. **Isola il problema**
   ```
   Esegui solo questa funzione con questi input: [...]
   ```

2. **Aggiungi logging**
   ```
   Aggiungi print/log per tracciare il flusso in @file.py
   ```

3. **Crea test case**
   ```
   Crea un test che riproduce questo bug
   ```

4. **Spiega passo passo**
   ```
   Spiega cosa fa questo codice riga per riga
   ```

---

### Quando NON Usare l'AI per il Codice

!!! danger "Situazioni da Evitare"

    **1. Codice Critico per la Sicurezza**

    - Generare logica di autenticazione senza revisione esperta
    - Crittografia personalizzata
    - Validazione di input critici (pagamenti, dati medici)

    **2. Senza Comprensione**

    - Usare codice che non capisci
    - Copiare senza sapere perché funziona
    - Ignorare warning perché "funziona"

    **3. Quando Impari**

    - Usare AI per esercizi di apprendimento
    - Saltare la comprensione dei fondamentali

#### Approccio Consigliato

```
1. CAPIRE    → Studia il problema prima
2. GENERARE  → Chiedi aiuto all'AI
3. CAPIRE    → Assicurati di capire il codice
4. TESTARE   → Verifica che funzioni
5. ADATTARE  → Modifica per il tuo caso
```

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

4. Come bilanceresti velocità di sviluppo e qualità del codice?

---

## Risorse

- [Claude Code Documentation](https://docs.anthropic.com/claude-code)
- [GitHub Claude Code](https://github.com/anthropics/claude-code)
- [Google Python Style Guide](https://google.github.io/styleguide/pyguide.html)
- [OWASP Top 10](https://owasp.org/www-project-top-ten/)
