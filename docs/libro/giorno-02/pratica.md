# Giorno 2: Pratica - Prompt Engineering

## Esercizi Pratici

### Esercizio 1: Da Vago a Specifico

Riscrivi questi prompt vaghi in prompt efficaci:

**Prompt 1 originale:**
```
Aiutami con una email.
```

_Considera: A chi? Per cosa? Che tono? Quanto lunga?_

**Prompt 2 originale:**
```
Spiega Python.
```

_Considera: A chi? Quale aspetto? In che formato?_

---

### Esercizio 2: Applicare lo Schema ICIF

Per ciascun task, scrivi un prompt completo usando tutti e 4 i componenti:

1. **Analisi di un feedback cliente**
2. **Generazione di una descrizione prodotto**
3. **Riassunto di un articolo tecnico**

---

### Esercizio 3: Few-Shot vs Zero-Shot

Prova lo stesso task con entrambe le tecniche e confronta i risultati:

**Task:** Classificare email di supporto in categorie (Tecnico, Fatturazione, Informazioni, Reclamo)

**Test con:**

- Solo istruzione (zero-shot)
- 2 esempi per categoria (few-shot)

Documenta le differenze nei risultati.

---

### Esercizio 4: Chain-of-Thought

Risolvi questi problemi usando la tecnica CoT:

1. **Problema matematico:**
   > Un negozio applica uno sconto del 20% su un articolo da €80.
   > Il cliente ha anche un coupon del 10% aggiuntivo.
   > Quanto paga il cliente?

2. **Problema logico:**
   > Se tutti i gatti sono animali, e alcuni animali sono grigi,
   > possiamo concludere che alcuni gatti sono grigi?

---

### Esercizio 5: Role Prompting

Per ciascun scenario, crea un ruolo appropriato:

1. Spiegare i rischi di un investimento a un pensionato
2. Scrivere documentazione tecnica per una API
3. Creare copy pubblicitario per un prodotto tech
4. Fornire supporto emotivo a uno studente stressato

---

### Esercizio 6: Iterazione di Prompt

Parti da questo prompt base e iteralo 3 volte, migliorandolo ad ogni step:

**Prompt iniziale:**
```
Scrivi una storia.
```

Documenta ogni iterazione e il motivo del cambiamento.

---

## Template Utili

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

## Checklist di Valutazione Prompt

Usa questa checklist per valutare i tuoi prompt:

- [ ] L'istruzione è chiara e specifica?
- [ ] Il contesto è sufficiente?
- [ ] Il formato output è definito?
- [ ] I vincoli sono espliciti?
- [ ] Il pubblico target è specificato?
- [ ] Ci sono ambiguità da risolvere?
