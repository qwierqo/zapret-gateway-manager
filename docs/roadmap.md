# Roadmap

## Project direction

`zapret-gateway-manager` is being developed as a dedicated Linux gateway management layer for whole-network anti-DPI routing.

The roadmap is intentionally split into operational stages:

1. establish a stable shell-based gateway core;
2. add health checks and state handling;
3. automate profile selection and rollback;
4. separate backend logic from control logic;
5. expose local API primitives;
6. build a lightweight web control surface.

## v0.1.0 — foundation

Goal: establish the repository and the first operational shell scaffold.

Planned scope:

- repository structure;
- README / NOTICE / LICENSE;
- initial shell entrypoint;
- baseline profile files;
- architecture and topology documents.

Expected result:

- a clear repository layout;
- a documented project direction;
- a stable base for further implementation.

## v0.2.0 — manual control flow

Goal: implement the first real control logic for Linux gateway mode.

Planned scope:

- manual profile listing;
- manual profile loading;
- selected-profile persistence;
- state directory handling;
- basic operational logging.

Expected result:

- operator can choose a profile;
- current selection is stored;
- shell core becomes a real management entrypoint instead of a placeholder.

## v0.3.0 — health checks

Goal: add verification logic for target services.

Planned scope:

- basic checks for selected services;
- first target set:
  - YouTube
  - Discord
  - Telegram
  - Roblox
- check result logging;
- simple success/failure reporting.

Expected result:

- the system can compare operational results between profiles;
- future automation gets measurable input.

## v0.4.0 — profile evaluation

Goal: compare candidate profiles and score their results.

Planned scope:

- repeated checks after profile selection;
- profile scoring model;
- storing last known good profile;
- minimal rollback logic.

Expected result:

- profile quality is no longer subjective;
- system starts to build a usable decision layer.

## v0.5.0 — automated selection

Goal: introduce the first automated profile workflow.

Planned scope:

- iterate through candidate profiles;
- run service checks for each one;
- select best result;
- preserve best-profile state;
- rollback on failure.

Expected result:

- the project becomes capable of basic semi-automatic tuning.

## v0.6.0 — backend separation

Goal: formalize backend abstraction.

Planned scope:

- isolate backend-specific logic from generic control flow;
- prepare `zapret` backend module;
- keep architecture open for future `zapret2` integration;
- document backend responsibilities and boundaries.

Expected result:

- clearer code organization;
- lower coupling between control logic and backend implementation.

## v0.7.0 — installation and bootstrap

Goal: improve first-run experience on a dedicated Linux gateway.

Planned scope:

- installation helper script;
- first-run environment validation;
- directory bootstrap;
- dependency checks;
- improved operational documentation.

Expected result:

- simpler deployment on a fresh Linux gateway;
- easier reproducibility.

## v0.8.0 — local API foundation

Goal: expose internal state and control operations through a local interface.

Planned scope:

- status endpoint;
- profile listing endpoint;
- active-profile endpoint;
- health-check trigger endpoint;
- future-safe API layout.

Expected result:

- web UI and automation tooling get a stable communication layer.

## v0.9.0 — web monitoring

Goal: provide a lightweight browser-based monitoring surface.

Planned scope:

- gateway status page;
- active profile display;
- last check results;
- recent log view;
- basic control actions.

Expected result:

- easier observability and management without SSH-only workflows.

## v1.0.0 — usable dedicated gateway manager

Goal: reach a coherent first stable release for dedicated Linux gateway usage.

Planned scope:

- stable shell control flow;
- backend integration;
- health checks;
- state persistence;
- rollback logic;
- installation documentation;
- initial web monitoring layer.

Expected result:

- a functional dedicated Linux gateway manager for home and lab use.