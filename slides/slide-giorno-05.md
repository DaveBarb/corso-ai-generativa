# Giorno 5: Multimodalita

**Corso**: AI Generativa
**Durata**: ~6 ore

---

## Slide 1: Titolo della Giornata

### Multimodalita - Immagini e Oltre
- Generare, analizzare e combinare contenuti visivi e testuali
- Corso AI Generativa - ITS Steve Jobs

> **Note relatore**: Oggi esploriamo la dimensione visiva dell'AI generativa. Dalla generazione di immagini con i diffusion models all'analisi con Claude Vision, copriremo l'intero spettro della multimodalita.

---

## Slide 2: Obiettivi della Giornata

### Cosa imparerete oggi
- Comprendere il funzionamento dei diffusion models
- Scrivere prompt efficaci per la generazione di immagini
- Usare Claude Vision per analizzare immagini via API
- Combinare testo e immagini in workflow pratici

> **Note relatore**: La multimodalita e il futuro dell'AI: i modelli che lavorano solo con testo stanno lasciando spazio a modelli che integrano testo, immagini, audio e video. Oggi ci concentriamo sull'asse testo-immagini.

---

## Slide 3: Diffusion Models - L'Intuizione

### Dal Rumore all'Immagine
- Analogia: scolpire il marmo, rimuovere materia per creare
- Training: il modello impara ad aggiungere rumore alle immagini
- Generazione: parte da rumore casuale e lo rimuove gradualmente
- Il prompt "guida" la rimozione del rumore verso l'immagine voluta
- Il modello impara la distribuzione delle immagini reali

> **Note relatore**: L'analogia della scultura nel marmo funziona bene: durante il training il modello vede milioni di immagini "sepolte" nel rumore. Durante la generazione, "scava" via il rumore per rivelare l'immagine nascosta, guidato dal prompt.

---

## Slide 4: Il Processo di Diffusion

### Forward e Reverse Process
- Forward (training): immagine originale + rumore graduale = solo rumore
- Il modello impara a prevedere il rumore aggiunto a ogni step
- Reverse (generazione): solo rumore - rumore graduale = immagine finale
- Centinaia di step di denoising per ogni immagine
- Il prompt condiziona il processo verso un tipo specifico di immagine

> **Note relatore**: E fondamentale capire che il modello non "disegna" nel senso umano. Parte da rumore casuale e lo trasforma in immagine passo dopo passo. Piu step = piu qualita ma piu tempo di generazione.

---

## Slide 5: Confronto Modelli per Immagini

### I Quattro Principali
- DALL-E 3 (OpenAI): comprensione prompt, testo nelle immagini
- Stable Diffusion (Stability AI): open source, personalizzabile
- Midjourney: qualita artistica eccezionale, solo via Discord
- Imagen (Google): alta fedelta, integrato nell'ecosistema Google

> **Note relatore**: Ogni modello ha il suo punto di forza. DALL-E per uso generale e testo. Stable Diffusion per chi vuole controllo e personalizzazione. Midjourney per massima qualita estetica. La scelta dipende dal caso d'uso.

---

## Slide 6: Quando Usare Quale Modello

### Guida alla Scelta
- DALL-E 3: uso generale, prompt in linguaggio naturale, testo
- Stable Diffusion: controllo fine, sperimentazione, budget limitato
- Midjourney: arte, concept art, massima qualita estetica
- Imagen: produzione enterprise, workflow Google
- Per iniziare: DALL-E e il piu accessibile e versatile

> **Note relatore**: In fase di apprendimento, DALL-E e la scelta migliore per la sua comprensione del linguaggio naturale. Stable Diffusion richiede piu prompt engineering ma offre piu controllo. Midjourney e per risultati artistici.

---

## Slide 7: Prompt Engineering per Immagini

### Anatomia del Prompt Visivo
- Formula: SOGGETTO + STILE + DETTAGLI + TECNICA + QUALITA
- Soggetto: descrivere con specificity crescente
- Stile artistico: oil painting, watercolor, photorealistic
- Illuminazione: golden hour, dramatic, soft diffused light
- Qualita: high quality, 4k, highly detailed

> **Note relatore**: Il prompt per immagini e diverso da quello per testo. Non servono istruzioni esplicite, ma descrizioni ricche. "A cat" produce risultati generici, "a fluffy orange tabby cat sitting on a windowsill at sunset" produce risultati specifici.

---

## Slide 8: Evoluzione di un Prompt per Immagini

### Da Base a Completo
- Base: "A mountain landscape" (risultato generico)
- Con stile: aggiungere "oil painting style"
- Con dettagli: "snow-capped, lake reflection, autumn colors"
- Completo: tutti gli elementi piu illuminazione e risoluzione
- Ogni elemento aggiunge controllo sul risultato finale

> **Note relatore**: Mostrare la progressione con esempi visivi se possibile. Il prompt completo produce risultati molto piu specifici e controllati. L'ordine delle parole conta: mettere il soggetto all'inizio.

---

## Slide 9: Negative Prompts

### Specificare Cosa NON Vuoi
- Supportato principalmente da Stable Diffusion
- Indica artefatti da evitare: blurry, low quality, distorted
- Problemi anatomici: deformed hands, extra limbs
- Elementi indesiderati: watermark, text, logo
- Combinare prompt positivo e negativo per risultati migliori

> **Note relatore**: Il negative prompt e potente per eliminare artefatti comuni. E come dire al modello: "Genera questo, MA evita quest'altro." Non tutti i modelli lo supportano, ma dove disponibile migliora significativamente i risultati.

---

## Slide 10: Limiti e Artefatti Comuni

### Problemi Ricorrenti nella Generazione
- Mani e dita: deformate, extra o mancanti
- Testo nelle immagini: spesso illeggibile o errato
- Consistenza: difficile mantenere lo stesso personaggio
- Fisica: riflessi, ombre e gravita sbagliati
- Tip: evitare mani in primo piano, aggiungere testo in post

> **Note relatore**: Questi limiti sono intrinseci alla tecnologia attuale. Le mani sono difficili perche nel training ci sono poche immagini di mani in posizioni specifiche. Il testo e difficile perche il modello non "capisce" i caratteri.

---

## Slide 11: Cos'e un Modello Multimodale

### Oltre il Solo Testo
- Text-only: input testo, output testo (LLM classici)
- Vision (Image-to-Text): input testo + immagini, output testo
- Image Generation (Text-to-Image): input testo, output immagini
- Fully Multimodal: input/output testo, immagini, audio, video
- Claude e un modello Vision: analizza ma non genera immagini

> **Note relatore**: Distinzione fondamentale: Claude Vision PUO analizzare immagini ma NON PUO generarle. Per generare immagini servono DALL-E, Stable Diffusion, etc. I modelli fully multimodal come Gemini e GPT-4o fanno entrambe le cose.

---

## Slide 12: Claude Vision - Capacita

### Cosa Puo Fare con le Immagini
- Analizzare foto, screenshot, grafici, documenti
- Descrivere contenuti visivi in dettaglio
- Estrarre testo dalle immagini (OCR)
- Rispondere a domande specifiche su immagini
- Confrontare e analizzare piu immagini insieme

> **Note relatore**: Claude Vision e molto capace nell'analisi. Formati supportati: JPEG, PNG, GIF, WebP, PDF. Dimensione massima circa 20MB per immagine. Non puo identificare persone specifiche o leggere CAPTCHA.

---

## Slide 13: Claude Vision - Limiti

### Cosa NON Puo Fare
- Non puo generare o modificare immagini
- Non puo identificare persone specifiche (per privacy)
- Non puo leggere CAPTCHA per motivi di sicurezza
- Non puo analizzare video frame per frame
- Precisione non al 100%: verificare sempre dati critici

> **Note relatore**: I limiti di Vision sono sia tecnici che etici. Il non-riconoscimento delle persone e una scelta di design per proteggere la privacy. La precisione OCR e buona ma non perfetta: verificare sempre dati importanti.

---

## Slide 14: Usare Claude Vision con l'API

### Invio di Immagini via Codice
- Codificare l'immagine in base64 per l'invio
- Struttura messaggio: blocco image + blocco text nella stessa richiesta
- Specificare media_type: image/jpeg, image/png, etc.
- Possibile inviare anche immagini da URL
- Supporto per multiple immagini nella stessa richiesta

> **Note relatore**: Mostrare il codice Python per inviare un'immagine. La struttura e diversa dal messaggio di solo testo: il content diventa una lista con blocchi di tipo diverso (image e text). E un pattern da memorizzare.

---

## Slide 15: Use Case - OCR e Digitalizzazione

### Estrarre Testo dalle Immagini
- Digitalizzazione documenti cartacei e scontrini
- Lettura fatture ed estrazione dati strutturati
- Estrazione informazioni da screenshot
- Prompt: "Estrai tutto il testo, mantieni formattazione"
- Se tabelle presenti, chiedere conversione in markdown

> **Note relatore**: L'OCR con Claude Vision e piu intelligente dell'OCR tradizionale: non solo legge il testo ma ne comprende il significato. Puo estrarre dati strutturati da fatture senza template predefiniti.

---

## Slide 16: Use Case - Accessibilita

### Alt Text Automatico per Immagini
- Generare descrizioni per utenti non vedenti
- Includere: soggetto, ambientazione, colori, azioni
- Lunghezza adeguata: 2-3 frasi per il contesto essenziale
- Fondamentale per conformita WCAG e accessibilita web
- Claude produce alt text di qualita con prompt specifici

> **Note relatore**: L'accessibilita e sia un obbligo legale che morale. Claude Vision puo automatizzare la generazione di alt text per siti web con migliaia di immagini, rendendo il contenuto accessibile a tutti.

---

## Slide 17: Use Case - Analisi Grafici e Documenti

### Estrarre Insight dai Dati Visivi
- Analisi grafici: tipo, variabili, trend, anomalie, conclusioni
- Analisi documenti: parti coinvolte, date, importi, clausole
- Riconoscimento prodotti: categoria, marca, caratteristiche
- Trascrizione codice da screenshot con spiegazione
- Strutturare sempre la richiesta con domande specifiche

> **Note relatore**: Claude Vision e particolarmente efficace nell'analisi di grafici e tabelle. Non solo legge i dati ma li interpreta. Per risultati migliori, formulare domande specifiche piuttosto che generiche.

---

## Slide 18: Best Practices per Vision

### Come Ottenere Risultati Migliori
- Essere specifici nella domanda, non generici
- Guidare l'attenzione: "Concentrati sul testo in alto a destra"
- Richiedere formato strutturato: JSON per dati, lista per oggetti
- Usare multiple immagini per confronti
- Non inviare immagini troppo piccole: dettagli illeggibili

> **Note relatore**: Il prompt per Vision segue le stesse regole del prompt per testo: specificita, formato, contesto. Ma aggiunge la dimensione spaziale: indicare dove guardare nell'immagine aiuta molto.

---

## Slide 19: Workflow Combinato - Generazione e Analisi

### Unire Piu Modelli in un Flusso
- Generare immagine con DALL-E o Stable Diffusion
- Analizzare il risultato con Claude Vision
- Iterare il prompt in base all'analisi
- Content moderation: verificare appropriatezza delle immagini
- Batch processing: analizzare cartelle di documenti

> **Note relatore**: Il workflow combinato e potente: generi con un modello, analizzi con un altro, e iteri. Per content moderation, Claude Vision puo valutare se un'immagine e appropriata e restituire un JSON strutturato.

---

## Slide 20: Considerazioni Etiche sulla Multimodalita

### Responsabilita nell'Uso
- Privacy: non analizzare foto di persone senza consenso
- Bias: i modelli possono avere pregiudizi nel riconoscimento
- Deepfakes: i modelli vision NON rilevano deepfake in modo affidabile
- Copyright: attenzione all'uso di "nello stile di [artista vivente]"
- Sempre rispettare GDPR e normative sulla privacy

> **Note relatore**: Le implicazioni etiche della multimodalita sono significative. La generazione di immagini false e la privacy delle persone nelle foto sono temi critici. Approfondiremo l'etica nel Giorno 6.

---

## Slide 21: Risorse Gratuite per Sperimentare

### Dove Provare la Generazione di Immagini
- Hugging Face Spaces: Stable Diffusion XL gratuito
- Bing Image Creator: DALL-E con limiti gratuiti
- Leonardo.AI: free tier generoso per sperimentare
- Claude.ai: analisi immagini nella chat gratuita
- Google Colab: notebook con GPU gratuita per Stable Diffusion

> **Note relatore**: Incoraggiare la sperimentazione con strumenti gratuiti. L'esperienza pratica e fondamentale per capire i limiti e le capacita di questi modelli. Ogni strumento ha il suo punto di forza.

---

## Slide 22: Riepilogo

### Concetti Chiave di Oggi
- I diffusion models generano immagini rimuovendo rumore guidati dal prompt
- Prompt per immagini: soggetto, stile, dettagli, tecnica, qualita
- Claude Vision analizza immagini ma non le genera
- Use case pratici: OCR, accessibilita, analisi grafici, code from screenshot
- Combinare generazione e analisi per workflow completi

> **Note relatore**: Domande di riflessione: perche i diffusion models hanno difficolta con le mani? Quale modello per concept art di un videogioco? Quali problemi di accessibilita risolve Claude Vision?
