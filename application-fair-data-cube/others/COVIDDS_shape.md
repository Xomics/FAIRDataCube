```
@prefix : <http://fairdatapoint.org/> . 
@prefix dash: <http://datashapes.org/dash#> . 
@prefix dcat: <http://www.w3.org/ns/dcat#> . 
@prefix dct: <http://purl.org/dc/terms/> . 
@prefix foaf: <http://xmlns.com/foaf/0.1/> . 
@prefix sh: <http://www.w3.org/ns/shacl#> . 
@prefix dcat-ext: <http://purl.org/biosemantics-lumc/ontologies/dcat-extension/> . 
@prefix ex: <http://www.example.com/resources/> . 
@prefix xsd: <http://www.w3.org/2001/XMLSchema#> . 
@prefix con: <http://www.w3.org/2000/10/swap/pim/contact#> . 
@prefix vcard: <http://www.w3.org/2006/vcard/ns> . 
@prefix gnd: <http://d-nb.info/standards/elementset/gnd> . 
@prefix frapo: <http://purl.org/cerif/frapo/> . 
@prefix obo: <http://purl.obolibrary.org/obo/> . 
@prefix sio: <http://semanticscience.org/resource/> . 
@prefix eda: <http://edamontology.org/> .

:CovidDatasetShape a sh:NodeShape ; 
sh:targetClass dcat-ext:CovidDataset ; 
sh:property[ 
sh:name "Study Subject" ; 
sh:path obo:NCIT_C41189 ; 
sh:nodeKind sh:Literal ; 
sh:maxCount 2 ; 
dash:editor dash:TextFieldEditor ; 
], [ 
sh:name "Patient" ; 
sh:path obo:NCIT_C16960 ; 
sh:nodeKind sh:Literal ; 
sh:maxCount 2 ; 
dash:editor dash:TextFieldEditor ; 
], [
sh:name "Symptoms Consistent with COVID-19" ; 
sh:path obo:NCIT_C173069 ; 
sh:nodeKind sh:Literal ; 
sh:maxCount 2 ; 
dash:editor dash:TextFieldEditor ; 
], [ 
sh:name "COVID-19" ; 
sh:path obo:MONDO_0100096 ; 
sh:nodeKind sh:Literal ; 
sh:maxCount 2 ; 
dash:editor dash:TextFieldEditor ; 
] , [ 
sh:name "Sex" ; 
sh:path obo:NCIT_C28421 ; 
sh:nodeKind sh:Literal ; 
sh:maxCount 2 ; 
dash:editor dash:TextFieldEditor ; 
] , [ 
sh:name "Age-Years" ; 
sh:path obo:NCIT_C37908 ; 
sh:nodeKind sh:Literal ; 
sh:maxCount 2 ; 
dash:editor dash:TextFieldEditor ;
], [ 
sh:name "Patient Status" ; 
sh:path ex:InvestigationContact; 
sh:nodeKind sh:Literal ; 
sh:maxCount 2 ; 
dash:editor dash:TextFieldEditor ; 
], [ 
sh:name "ICU" ; 
sh:path obo:NCIT_C53511; 
sh:nodeKind sh:Literal ; 
sh:maxCount 2 ; 
dash:editor dash:TextFieldEditor ; 
], [ 
sh:name "Study DOI" ; 
sh:path eda:data_1188; 
sh:nodeKind sh:IRI ; 
dash:editor dash:URIEditor ; 
], [ 
sh:name "Ethnicity" ; 
sh:path obo:GECKO_0000061 ; 
sh:nodeKind sh:Literal ; 
sh:maxCount 2 ; 
dash:editor dash:TextFieldEditor ; 
], [ 
sh:name "BMI" ; 
sh:path obo:ExO_0000105 ; 
sh:nodeKind sh:Literal ; 
sh:maxCount 2 ; 
dash:editor dash:TextFieldEditor ; 
], [ 
sh:name "Smoking" ; 
sh:path obo:NCIT_C154329 ; 
sh:nodeKind sh:Literal ; 
sh:maxCount 2 ; 
dash:editor dash:TextFieldEditor ; 
], [ 
sh:name "COVID-19 Disease Severity (WHO Ordinal) Scale" ; 
sh:path obo:NCIT_C178899 ; 
sh:nodeKind sh:Literal ; 
sh:maxCount 2 ; 
dash:editor dash:TextFieldEditor ; 
], [ 
sh:name "Charlson Comorbidity Index" ; 
sh:path obo:NCIT_C176422 ; 
sh:nodeKind sh:Literal ; 
sh:maxCount 2 ; 
dash:editor dash:TextFieldEditor ; 
], [ 
sh:name "APACHE II Score" ; 
sh:path obo:NCIT_C121113 ; 
sh:nodeKind sh:Literal ; 
sh:maxCount 2 ; 
dash:editor dash:TextFieldEditor ; 
], [ 
sh:name "Mechanical Ventilation" ; 
sh:path obo:NCIT_C70909 ; 
sh:nodeKind sh:Literal ; 
sh:maxCount 2 ; 
dash:editor dash:TextFieldEditor ; 
], [ 
sh:name "Asthma" ; 
sh:path obo:NCIT_C28397 ; 
sh:nodeKind sh:Literal ; 
sh:maxCount 2 ; 
dash:editor dash:TextFieldEditor ; 
], [ 
sh:name "COPD" ; 
sh:path obo:HP_0006510 ; 
sh:nodeKind sh:Literal ; 
sh:maxCount 2 ; 
dash:editor dash:TextFieldEditor ; 
], [ 
sh:name "DM" ; 
sh:path obo:NCIT_C2985 ; 
sh:nodeKind sh:Literal ; 
sh:maxCount 2 ; 
dash:editor dash:TextFieldEditor ; 
], [ 
sh:name "CRP (mg/L)" ; 
sh:path obo:NCIT_C64548 ; 
sh:nodeKind sh:Literal ; 
sh:maxCount 2 ; 
dash:editor dash:TextFieldEditor ; 
], [ 
sh:name "Ferritin (ng/mL)" ; 
sh:path obo:NCIT_C74737 ; 
sh:nodeKind sh:Literal ; 
sh:maxCount 2 ; 
dash:editor dash:TextFieldEditor ; 
], [ 
sh:name "IL6" ; 
sh:path obo:NCIT_C74834 ; 
sh:nodeKind sh:Literal ; 
sh:maxCount 2 ; 
dash:editor dash:TextFieldEditor ; 
] .
```
