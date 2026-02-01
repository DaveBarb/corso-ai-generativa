# Giorno 4 - Pratica: Claude Code Challenge

## Obiettivi
- Installare e configurare Claude Code
- Completare 6 esercizi pratici di coding assistito
- Imparare a valutare criticamente il codice generato

**Durata:** 3h 30min

---

## Setup Iniziale (30 min)

### Installazione

```bash
# Verifica Node.js (richiesto 18+)
node --version

# Installa Claude Code
npm install -g @anthropic-ai/claude-code

# Verifica installazione
claude --version
```

### Configurazione

```bash
# Imposta API key
export ANTHROPIC_API_KEY="sk-ant-..."

# Oppure login interattivo
claude login
```

### Crea Cartella di Lavoro

```bash
mkdir claude-code-exercises
cd claude-code-exercises
```

### Test Iniziale

```bash
# Avvia Claude Code
claude

# Prova un comando semplice
> Ciao! Funziona?

# Esci
> /quit
```

---

## Esercizio 1: Generare una Funzione da Specifica (25 min)

### Obiettivo
Generare una funzione Python completa partendo da una specifica.

### Specifica
```
Funzione: `analyze_text(text: str) -> dict`

Scopo: Analizzare un testo e restituire statistiche

Output richiesto:
{
    "char_count": int,        # Caratteri totali
    "word_count": int,        # Parole totali
    "sentence_count": int,    # Frasi (terminano con .!?)
    "avg_word_length": float, # Media lunghezza parole
    "longest_word": str,      # Parola più lunga
    "most_common_word": str   # Parola più frequente
}

Requisiti:
- Type hints completi
- Docstring Google style
- Gestione testo vuoto
- Case insensitive per word count
```

### Istruzioni

1. Avvia Claude Code nella cartella exercises
2. Chiedi di generare la funzione con la specifica completa
3. Salva il codice in `text_analyzer.py`
4. Testa con il codice seguente

### Codice di Test

Crea `test_analyzer.py`:

```python
from text_analyzer import analyze_text

# Test 1: Testo normale
text1 = "Hello world. This is a test! How are you?"
result1 = analyze_text(text1)
print("Test 1:", result1)
assert result1["word_count"] == 9
assert result1["sentence_count"] == 3

# Test 2: Testo vuoto
text2 = ""
result2 = analyze_text(text2)
print("Test 2:", result2)
assert result2["word_count"] == 0

# Test 3: Una sola parola
text3 = "Supercalifragilistichespiralidoso"
result3 = analyze_text(text3)
print("Test 3:", result3)
assert result3["longest_word"] == "supercalifragilistichespiralidoso"

print("Tutti i test passati!")
```

### Valutazione

| Criterio | ✓/✗ | Note |
|----------|-----|------|
| Funzione generata correttamente | | |
| Type hints presenti | | |
| Docstring completa | | |
| Test passano | | |
| Codice leggibile | | |

---

## Esercizio 2: Refactoring di Codice Legacy (30 min)

### Obiettivo
Migliorare codice esistente mantenendo la funzionalità.

### Codice Legacy

Crea `legacy_code.py`:

```python
def process(d):
    r = []
    for i in range(len(d)):
        x = d[i]
        if x['active'] == True:
            if x['age'] >= 18:
                if x['score'] > 50:
                    n = x['name'].upper()
                    s = x['score'] * 1.1
                    r.append({'name': n, 'score': s, 'status': 'APPROVED'})
                else:
                    n = x['name'].upper()
                    r.append({'name': n, 'score': x['score'], 'status': 'PENDING'})
    return r

# Test
data = [
    {'name': 'Alice', 'age': 25, 'score': 75, 'active': True},
    {'name': 'Bob', 'age': 17, 'score': 80, 'active': True},
    {'name': 'Charlie', 'age': 30, 'score': 40, 'active': True},
    {'name': 'Diana', 'age': 22, 'score': 60, 'active': False},
]
print(process(data))
```

### Task per Claude Code

```
Refactoring di @legacy_code.py:

Migliora:
1. Nomi variabili descrittivi
2. Type hints
3. Riduci nesting (early return o guard clauses)
4. Separa logica in funzioni
5. Docstring
6. Usa list comprehension dove appropriato

Mantieni: stesso output per gli stessi input
```

### Valutazione

| Criterio | ✓/✗ | Note |
|----------|-----|------|
| Output identico | | |
| Nomi descrittivi | | |
| Nesting ridotto | | |
| Type hints | | |
| Più leggibile | | |

---

## Esercizio 3: Aggiungere Feature a Codice Esistente (30 min)

### Obiettivo
Estendere codice esistente senza romperlo.

### Codice Base

Crea `todo_manager.py`:

```python
class TodoManager:
    def __init__(self):
        self.todos = []
        self.next_id = 1

    def add(self, title: str) -> int:
        """Aggiunge un todo e restituisce l'ID."""
        todo = {
            'id': self.next_id,
            'title': title,
            'completed': False
        }
        self.todos.append(todo)
        self.next_id += 1
        return todo['id']

    def complete(self, todo_id: int) -> bool:
        """Segna un todo come completato."""
        for todo in self.todos:
            if todo['id'] == todo_id:
                todo['completed'] = True
                return True
        return False

    def list_all(self) -> list:
        """Restituisce tutti i todos."""
        return self.todos.copy()
```

### Feature da Aggiungere

Chiedi a Claude Code di aggiungere:

```
@todo_manager.py aggiungi queste feature:

1. `delete(todo_id: int) -> bool`
   - Elimina un todo per ID
   - Restituisce True se trovato e eliminato

2. `edit(todo_id: int, new_title: str) -> bool`
   - Modifica il titolo di un todo
   - Restituisce True se trovato e modificato

3. `list_pending() -> list`
   - Restituisce solo i todos non completati

4. `list_completed() -> list`
   - Restituisce solo i todos completati

5. `clear_completed() -> int`
   - Elimina tutti i todos completati
   - Restituisce il numero di todos eliminati

Mantieni retrocompatibilità con i metodi esistenti.
```

### Test

Crea `test_todo.py`:

```python
from todo_manager import TodoManager

tm = TodoManager()

# Test funzionalità esistenti
id1 = tm.add("Fare la spesa")
id2 = tm.add("Studiare Python")
id3 = tm.add("Chiamare Mario")

tm.complete(id1)

# Test nuove funzionalità
assert tm.delete(id3) == True
assert tm.delete(999) == False

assert tm.edit(id2, "Studiare Claude Code") == True
assert tm.edit(999, "Nope") == False

pending = tm.list_pending()
assert len(pending) == 1
assert pending[0]['title'] == "Studiare Claude Code"

completed = tm.list_completed()
assert len(completed) == 1

tm.add("Task da completare")
tm.complete(tm.todos[-1]['id'])

cleared = tm.clear_completed()
assert cleared == 2

print("Tutti i test passati!")
```

### Valutazione

| Criterio | ✓/✗ | Note |
|----------|-----|------|
| Tutte le feature implementate | | |
| Test passano | | |
| Retrocompatibilità mantenuta | | |
| Stile coerente con l'originale | | |

---

## Esercizio 4: Debugging con Claude Code (30 min)

### Obiettivo
Trovare e correggere bug con l'aiuto di Claude Code.

### Codice con Bug

Crea `buggy_code.py`:

```python
def calculate_average(numbers):
    """Calcola la media di una lista di numeri."""
    total = 0
    for num in numbers:
        total = + num
    average = total / len(numbers)
    return average

def find_duplicates(items):
    """Trova elementi duplicati in una lista."""
    seen = []
    duplicates = []
    for item in items:
        if item in seen:
            duplicates.add(item)
        seen.append(item)
    return duplicates

def merge_dicts(dict1, dict2):
    """Unisce due dizionari, dict2 ha priorità."""
    result = dict1
    for key, value in dict2.items():
        result[key] = value
    return result

def safe_divide(a, b):
    """Divisione sicura che gestisce divisione per zero."""
    try:
        result = a / b
    except:
        result = 0
    return result

def count_words(text):
    """Conta le parole in un testo."""
    words = text.split(" ")
    count = 0
    for word in words:
        if word != "":
            count =+ 1
    return count
```

### Task

```
@buggy_code.py contiene 5 funzioni con bug.
Per ogni funzione:
1. Identifica il bug
2. Spiega perché è un problema
3. Correggi il codice

Bugs da trovare:
- calculate_average: bug matematico
- find_duplicates: bug di tipo
- merge_dicts: bug di side effect
- safe_divide: bad practice
- count_words: bug matematico
```

### Test per Verificare le Correzioni

```python
from buggy_code import *

# Test calculate_average
assert calculate_average([1, 2, 3, 4, 5]) == 3.0

# Test find_duplicates
assert set(find_duplicates([1, 2, 2, 3, 3, 3])) == {2, 3}

# Test merge_dicts (non deve modificare l'originale!)
d1 = {'a': 1}
d2 = {'b': 2}
d1_backup = d1.copy()
result = merge_dicts(d1, d2)
assert d1 == d1_backup, "dict1 è stato modificato!"

# Test safe_divide
assert safe_divide(10, 2) == 5.0
assert safe_divide(10, 0) == 0  # o meglio, dovrebbe gestire esplicitamente

# Test count_words
assert count_words("hello world") == 2
assert count_words("  spazi   extra  ") == 2

print("Tutti i bug corretti!")
```

### Documentazione Bug

| Funzione | Bug Trovato | Correzione |
|----------|-------------|------------|
| calculate_average | | |
| find_duplicates | | |
| merge_dicts | | |
| safe_divide | | |
| count_words | | |

---

## Esercizio 5: Generare Test Automatici (25 min)

### Obiettivo
Usare Claude Code per generare suite di test complete.

### Codice da Testare

Crea `shopping_cart.py`:

```python
from typing import Optional
from dataclasses import dataclass

@dataclass
class Product:
    id: str
    name: str
    price: float
    stock: int

class ShoppingCart:
    def __init__(self):
        self.items: dict[str, int] = {}  # product_id -> quantity
        self.products: dict[str, Product] = {}

    def add_product(self, product: Product) -> None:
        """Aggiunge un prodotto al catalogo."""
        self.products[product.id] = product

    def add_to_cart(self, product_id: str, quantity: int = 1) -> bool:
        """Aggiunge un prodotto al carrello."""
        if product_id not in self.products:
            return False
        if self.products[product_id].stock < quantity:
            return False
        self.items[product_id] = self.items.get(product_id, 0) + quantity
        return True

    def remove_from_cart(self, product_id: str, quantity: int = 1) -> bool:
        """Rimuove un prodotto dal carrello."""
        if product_id not in self.items:
            return False
        current = self.items[product_id]
        if quantity >= current:
            del self.items[product_id]
        else:
            self.items[product_id] = current - quantity
        return True

    def get_total(self) -> float:
        """Calcola il totale del carrello."""
        total = 0.0
        for product_id, quantity in self.items.items():
            total += self.products[product_id].price * quantity
        return round(total, 2)

    def clear(self) -> None:
        """Svuota il carrello."""
        self.items.clear()

    def get_item_count(self) -> int:
        """Restituisce il numero totale di item nel carrello."""
        return sum(self.items.values())
```

### Task

```
Genera una suite di test pytest per @shopping_cart.py

Requisiti:
- Usa fixtures per setup comune
- Testa ogni metodo pubblico
- Includi: happy path, edge cases, errori
- Usa @pytest.mark.parametrize dove utile
- Organizza in classi per raggruppamento logico

Test da includere:
- Aggiunta prodotti al catalogo
- Aggiunta/rimozione dal carrello
- Gestione stock insufficiente
- Calcolo totale
- Carrello vuoto
- Prodotto non esistente
```

### Valutazione

| Criterio | ✓/✗ | Note |
|----------|-----|------|
| Fixtures utilizzate | | |
| Tutti i metodi testati | | |
| Edge cases coperti | | |
| Test organizzati | | |
| Test passano tutti | | |

---

## Esercizio 6: Documentare Codice Non Commentato (20 min)

### Obiettivo
Generare documentazione per codice non documentato.

### Codice Non Documentato

Crea `mystery_code.py`:

```python
import re
from collections import Counter

def f(s):
    p = r'\b[a-zA-Z]+\b'
    w = re.findall(p, s.lower())
    return w

def g(w, n=10):
    c = Counter(w)
    return c.most_common(n)

def h(s, sw=None):
    if sw is None:
        sw = {'the', 'a', 'an', 'is', 'it', 'to', 'and', 'of', 'in', 'that'}
    w = f(s)
    fw = [x for x in w if x not in sw]
    return fw

def analyze(text, top_n=10, remove_stopwords=True):
    if remove_stopwords:
        words = h(text)
    else:
        words = f(text)
    freq = g(words, top_n)
    total = len(words)
    result = {
        'total_words': total,
        'unique_words': len(set(words)),
        'top_words': freq,
        'lexical_diversity': len(set(words)) / total if total > 0 else 0
    }
    return result
```

### Task

```
@mystery_code.py contiene codice senza documentazione.

1. Rinomina le funzioni con nomi descrittivi
2. Rinomina le variabili con nomi chiari
3. Aggiungi docstring complete (Google style)
4. Aggiungi type hints
5. Aggiungi commenti dove la logica non è ovvia

Mantieni la funzionalità identica.
```

### Valutazione

| Criterio | ✓/✗ | Note |
|----------|-----|------|
| Nomi funzioni chiari | | |
| Nomi variabili chiari | | |
| Docstring complete | | |
| Type hints | | |
| Funzionalità preservata | | |

---

## Riflessione Finale

### Cosa hai imparato?

Per ogni esercizio, rispondi:

1. **Generazione da specifica**
   - Quanto era preciso il codice generato?
   - Cosa avresti dovuto specificare meglio?

2. **Refactoring**
   - Il codice è diventato più leggibile?
   - Hai perso funzionalità?

3. **Aggiunta feature**
   - L'integrazione è stata fluida?
   - Lo stile è coerente?

4. **Debugging**
   - Hai trovato tutti i bug?
   - Avresti trovato i bug da solo?

5. **Test generation**
   - I test sono completi?
   - Coprono edge cases?

6. **Documentazione**
   - La documentazione è accurata?
   - Avresti documentato diversamente?

### Lezioni Apprese

1.
2.
3.

### Quando useresti/non useresti Claude Code?

**Lo userei per:**


**Non lo userei per:**

---

## Bonus Challenge (opzionale)

Se hai tempo extra, prova a:

1. Creare un progetto completo da zero (es: API REST per todo list)
2. Convertire il progetto Python in TypeScript
3. Aggiungere CI/CD con GitHub Actions
4. Creare un Dockerfile per il progetto
