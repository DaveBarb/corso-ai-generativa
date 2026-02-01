# Blocco 2: Best Practices per lo Sviluppo Assistito (1h)

## Obiettivi di Apprendimento

Al termine di questo blocco, gli studenti saranno in grado di:
- Formulare richieste efficaci per la generazione di codice
- Fornire contesto appropriato
- Revisionare criticamente il codice generato
- Usare l'AI per debugging e refactoring
- Riconoscere quando NON usare l'AI

---

## 1. Formulare Richieste Efficaci per il Coding

### La Regola d'Oro
> **Più contesto dai, migliore sarà il codice generato.**

### Anatomia di una Richiesta Efficace

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

### Esempio: Da Vago a Efficace

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

### Template per Richieste di Codice

```
Crea [tipo: funzione/classe/modulo] chiamato [nome]

Scopo: [descrizione breve]

Input:
- [param1]: [tipo] - [descrizione]
- [param2]: [tipo] - [descrizione]

Output:
- [tipo] - [descrizione]

Comportamento:
- [caso 1]
- [caso 2]
- [edge case]

Vincoli:
- [vincolo 1]
- [vincolo 2]

Dipendenze permesse: [lista]
```

---

## 2. Fornire Contesto

### Tipi di Contesto

#### 1. Contesto Tecnico
```
Stack: Python 3.11, FastAPI, SQLAlchemy, PostgreSQL
Pattern: Repository pattern
Test: pytest con fixtures
```

#### 2. Contesto di Progetto
```
Questo è un e-commerce B2B.
Gli utenti sono aziende, non consumatori finali.
I prezzi sono negoziabili per volume.
```

#### 3. Contesto di File
```
@models.py contiene i modelli SQLAlchemy
@schemas.py contiene i Pydantic models
@services.py contiene la business logic
```

#### 4. Contesto di Stile
```
Segui le convenzioni del progetto:
- snake_case per variabili/funzioni
- PascalCase per classi
- Docstring Google style
- Max 80 caratteri per riga
```

### Come Passare Contesto in Claude Code

```bash
# Riferisci file specifici
> @config.py @models.py crea un nuovo endpoint

# Riferisci cartelle
> @src/services/ aggiungi logging a tutti i servizi

# Spiega il contesto
> Il progetto usa FastAPI. @main.py è l'entry point.
> Aggiungi middleware per CORS.
```

---

## 3. Revisione Critica del Codice Generato

### Checklist di Revisione

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

### Esempio di Revisione

**Codice Generato:**
```python
def get_user(user_id):
    query = f"SELECT * FROM users WHERE id = {user_id}"
    result = db.execute(query)
    return result[0]
```

**Problemi Identificati:**
1. ❌ SQL Injection (stringa formattata)
2. ❌ Nessuna gestione errori
3. ❌ Nessun type hint
4. ❌ Ritorna None se non trovato? Errore?

**Versione Corretta:**
```python
def get_user(user_id: int) -> User | None:
    """Recupera un utente per ID.

    Args:
        user_id: L'ID dell'utente

    Returns:
        L'oggetto User se trovato, None altrimenti
    """
    return db.query(User).filter(User.id == user_id).first()
```

---

## 4. Debugging Assistito

### Come Chiedere Aiuto per Debug

**Template Efficace:**
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

### Esempio

```
Ho questo errore:
AttributeError: 'NoneType' object has no attribute 'name'
  File "app.py", line 45, in get_user_name
    return user.name

File coinvolti:
@app.py
@models.py

Stavo cercando di recuperare il nome di un utente esistente.

Ho già verificato che l'utente esiste nel database.
```

### Strategie di Debug con AI

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

## 5. Refactoring con AI

### Tipi di Refactoring

#### 1. Rinominare
```
Rinomina la variabile 'x' in 'user_count' in @analytics.py
```

#### 2. Estrarre Funzione
```
@utils.py righe 45-67 contengono logica ripetuta.
Estrala in una funzione riutilizzabile.
```

#### 3. Semplificare
```
@complex.py questa funzione è troppo lunga (100+ righe).
Scomponila in funzioni più piccole.
```

#### 4. Modernizzare
```
@legacy.py converte da Python 2 a Python 3.11
Usa f-strings, type hints, e pattern matching dove appropriato.
```

#### 5. Ottimizzare
```
@slow.py questa funzione è O(n²).
Riscrivila per essere più efficiente.
```

### Esempio di Refactoring

**Prima:**
```python
def process(data):
    result = []
    for item in data:
        if item['type'] == 'A':
            x = item['value'] * 2
            if x > 100:
                x = 100
            result.append({'type': 'A', 'processed': x})
        elif item['type'] == 'B':
            x = item['value'] / 2
            if x < 0:
                x = 0
            result.append({'type': 'B', 'processed': x})
    return result
```

**Richiesta:**
```
Refactoring di @process.py:
- Estrai la logica per tipo in funzioni separate
- Usa dict comprehension se possibile
- Aggiungi type hints
```

**Dopo:**
```python
from typing import TypedDict

class Item(TypedDict):
    type: str
    value: float

class ProcessedItem(TypedDict):
    type: str
    processed: float

def _process_type_a(value: float) -> float:
    return min(value * 2, 100)

def _process_type_b(value: float) -> float:
    return max(value / 2, 0)

PROCESSORS = {
    'A': _process_type_a,
    'B': _process_type_b,
}

def process(data: list[Item]) -> list[ProcessedItem]:
    return [
        {'type': item['type'], 'processed': PROCESSORS[item['type']](item['value'])}
        for item in data
        if item['type'] in PROCESSORS
    ]
```

---

## 6. Quando NON Usare l'AI per il Codice

### Situazioni da Evitare

#### 1. Codice Critico per la Sicurezza
```
❌ Generare logica di autenticazione senza revisione esperta
❌ Crittografia personalizzata
❌ Validazione di input critici (pagamenti, dati medici)
```

#### 2. Senza Comprensione
```
❌ Usare codice che non capisci
❌ Copiare senza sapere perché funziona
❌ Ignorare warning perché "funziona"
```

#### 3. Contesto Mancante
```
❌ Generare codice per sistemi che non conosci
❌ Integrare senza capire le dipendenze
❌ Modificare codice legacy senza capirlo prima
```

#### 4. Quando Impari
```
❌ Usare AI per esercizi di apprendimento
❌ Saltare la comprensione dei fondamentali
❌ Non debuggare mai manualmente
```

### Approccio Consigliato

```
1. CAPIRE    → Studia il problema prima
2. GENERARE  → Chiedi aiuto all'AI
3. CAPIRE    → Assicurati di capire il codice
4. TESTARE   → Verifica che funzioni
5. ADATTARE  → Modifica per il tuo caso
```

---

## 7. Generare Test Automatici

### Richiesta Efficace per Test

```
Crea test pytest per @user_service.py

Testa:
- Casi normali (happy path)
- Edge cases (valori nulli, liste vuote)
- Errori attesi (user non trovato, duplicati)

Usa:
- Fixtures per setup
- Mocking per dipendenze esterne
- Parametrize per casi multipli
```

### Esempio

**Funzione:**
```python
def divide(a: float, b: float) -> float:
    if b == 0:
        raise ValueError("Cannot divide by zero")
    return a / b
```

**Test Generati:**
```python
import pytest
from calculator import divide

class TestDivide:
    def test_divide_positive_numbers(self):
        assert divide(10, 2) == 5

    def test_divide_negative_numbers(self):
        assert divide(-10, 2) == -5

    def test_divide_by_zero_raises_error(self):
        with pytest.raises(ValueError, match="Cannot divide by zero"):
            divide(10, 0)

    @pytest.mark.parametrize("a,b,expected", [
        (10, 2, 5),
        (0, 5, 0),
        (-10, -2, 5),
        (7, 2, 3.5),
    ])
    def test_divide_various_inputs(self, a, b, expected):
        assert divide(a, b) == expected
```

---

## Riassunto

```
┌─────────────────────────────────────────────────────────────────┐
│             SVILUPPO ASSISTITO - BEST PRACTICES                  │
│                                                                  │
│  ✓ Richieste specifiche con contesto completo                  │
│  ✓ Fornire file rilevanti (@file.py)                           │
│  ✓ Sempre revisionare il codice generato                       │
│  ✓ Checklist: funzionalità, sicurezza, qualità                 │
│  ✓ Debug strutturato con errore + contesto + tentativi         │
│  ✓ Refactoring incrementale e verificato                       │
│  ✓ NON usare per codice critico senza revisione               │
│  ✓ Capire prima, generare dopo                                 │
│                                                                  │
└─────────────────────────────────────────────────────────────────┘
```

---

## Domande di Riflessione

1. Perché è importante capire il codice anche se funziona?

2. Come bilanceresti velocità di sviluppo e qualità del codice?

3. In quale situazione rifiuteresti di usare codice generato da AI?

---

## Risorse

- [Google Python Style Guide](https://google.github.io/styleguide/pyguide.html)
- [OWASP Top 10](https://owasp.org/www-project-top-ten/)
- [Refactoring Guru](https://refactoring.guru/)
