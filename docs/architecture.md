# Architecture

## High-level idea

`zapret-gateway-manager` is designed as a management and monitoring layer for a dedicated Linux gateway that runs an anti-DPI backend from the `zapret` ecosystem.

The project is intentionally separated into logical layers:

1. **System layer**  
   Linux host, networking, routing, forwarding, firewall, service runtime.

2. **Backend layer**  
   Anti-DPI backend such as `zapret`, and later potentially `zapret2`.

3. **Manager layer**  
   Shell-based orchestration for profiles, state, checks, logging, and backend interaction.

4. **Interface layer**  
   Future local API and web UI for visibility and control.

## Design principles

### 1. Backend-aware, not backend-hardcoded

The project should not permanently bind itself to a single fixed command layout. The first supported backend can be `zapret`, but the control layer should remain conceptually separable.

### 2. State must be explicit

The system should always know:

- what profile is selected;
- what profile was last known good;
- when the last checks ran;
- what the latest result was.

### 3. Checks must drive decisions

Profile changes should not rely only on manual intuition. Service checks should gradually become the basis for scoring, rollback, and future autotuning.

### 4. Web UI is not the core

The web interface is a future control surface, not the business logic itself. Operational logic must remain usable without a web frontend.

## Repository components

### `scripts/`

Shell entrypoints, library files, and future backend adapters.

Expected responsibilities:

- load profiles;
- manage state;
- run checks;
- write logs;
- call backend-specific handlers.

### `profiles/`

Profile definitions and future backend-related tuning presets.

Expected responsibilities:

- name and describe profile;
- define profile-specific parameters;
- later: support backend-specific mappings.

### `lists/`

Target and exclusion lists.

Expected responsibilities:

- store health-check targets;
- store service-related test lists;
- store exclusion sets where needed.

### `state/`

Operational runtime data.

Expected responsibilities:

- active profile;
- last known good profile;
- last check result;
- temporary cache and logs.

### `api/`

Future local API layer.

Expected responsibilities:

- expose status;
- expose profile information;
- trigger checks;
- trigger control actions.

### `web/`

Future monitoring and control UI.

Expected responsibilities:

- display state;
- display recent checks;
- provide basic operator actions.

## Planned control flow

A simplified future flow:

1. load available profiles;
2. select or receive target profile;
3. apply backend-specific configuration;
4. run target service checks;
5. evaluate result;
6. persist working state or rollback;
7. expose state to future API/UI.

## Near-term implementation focus

The current implementation focus is intentionally narrow:

- shell core;
- profile loading;
- state persistence;
- service checks;
- basic logging.

Only after that foundation is stable should local API and web monitoring be added.