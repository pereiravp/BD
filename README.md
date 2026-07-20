# CORE — Event Management Database

Relational database for an event management platform, modelled and implemented in **MySQL**. The schema covers events, sessions, spaces and rooms, participants and users, registrations, tickets, evaluations, organizers, staff and sponsors, together with the views, stored routines and triggers that enforce the core business rules. Bases de Dados course project at the University of Minho.

## Authors

Group 23 — BSc in Computer Science, University of Minho:

- Gonçalo Pereira - @pereiravp 
- David Mimoso - @davidmimoso 
- João Paulo - @jotapaulo9
- João Pontes - @juanjuan 

## Overview

The database models the operation of an events platform. Around the central **EVENTO** and **SESSÃO** entities, the schema captures where events take place (**ESPAÇO**, **SALA**), who takes part (**UTILIZADOR**, **PARTICIPANTE**, **ORGANIZADOR**, **STAFF**, **FIGURA**), how attendance is handled (**INSCRIÇÃO**, **BILHETE**, **CATEGORIA**), and the surrounding context (**AVALIAÇÃO**, **PATROCINADOR**). Many-to-many relationships are resolved through association tables (**FIGURA_has_SESSÃO**, **PATROCINADOR_has_EVENTO**).

### Tables

| Group | Tables |
| ----- | ------ |
| Events and sessions | `EVENTO`, `SESSÃO`, `CATEGORIA` |
| Venues | `ESPAÇO`, `SALA` |
| People | `UTILIZADOR`, `PARTICIPANTE`, `ORGANIZADOR`, `STAFF`, `FIGURA` |
| Attendance | `INSCRIÇÃO`, `BILHETE` |
| Context | `AVALIAÇÃO`, `PATROCINADOR` |
| Associations | `FIGURA_has_SESSÃO`, `PATROCINADOR_has_EVENTO` |

### Programmable objects

- **View `vw_agenda_eventos`** — a ready-to-query agenda joining each event with its sessions and rooms (event, session, date, start time, room).
- **Function `fn_vagas_disponiveis(evento_id)`** — returns the number of remaining seats for an event, computed as the venue capacity minus the paid registrations.
- **Procedure `sp_confirmar_inscricao(id_inscricao)`** — confirms a registration by setting its state to *Pago* (paid).
- **Trigger `trg_valida_pagamento`** — runs before a new row is inserted into `INSCRIÇÃO` to validate the payment state.

## Running It

Requires a running **MySQL 8** server. From the repository root:

```bash
mysql -u <user> -p < sql/core_schema.sql
```

The script creates the schema, all tables, the view and the routines. It contains the database structure and programmable objects (no sample data), so the tables start empty and ready to be populated.

## Model

The `model/core_model.mwb` file is the **MySQL Workbench** model. Open it in MySQL Workbench to browse the entity-relationship diagram and the physical model used to generate the schema.

## Repository Structure

```
BD/
├── sql/
│   └── core_schema.sql     Schema, view, function, procedure and trigger
├── model/
│   └── core_model.mwb      MySQL Workbench model (ER diagram)
├── docs/
│   └── relatorio.pdf       Project report
└── README.md
```

## Report

The full project report, including the requirements analysis, the entity-relationship model and the design decisions, is available in [docs/relatorio.pdf](docs/relatorio.pdf).

## Academic Context

Developed for the **Bases de Dados** course, second year of the BSc in Computer Science (LCC), University of Minho.
