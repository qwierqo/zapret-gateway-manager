# zapret-gateway-manager

Lightweight Linux gateway manager for whole-network anti-DPI routing using zapret-family backends.

## Overview

`zapret-gateway-manager` is a management layer for a dedicated Linux gateway placed between the Internet uplink and a local network.

The project is designed to work on top of an anti-DPI backend from the `zapret` ecosystem and provide the operational layer around it:

- profile storage and switching;
- service health checks;
- state persistence;
- logging;
- gradual automation of configuration;
- future monitoring and control through a web interface.

The project does **not** replace `zapret` itself.  
Instead, it focuses on deployment, management, observability, and safer day-to-day operation of a dedicated anti-DPI gateway.

## Project goals

The long-term goal is to build a small Linux gateway appliance that can:

- run as a separate network node between WAN and LAN;
- use `zapret` as the first supported backend;
- support future backend abstraction for `zapret2`;
- store and switch traffic processing profiles;
- run target service checks;
- preserve and restore the last known working state;
- expose local monitoring and control primitives;
- later provide a lightweight web panel for management and visibility.

## Scope

This repository currently focuses on:

- Linux gateway mode;
- shell-based control logic;
- profile management;
- service checking foundation;
- project structure and documentation.

This repository does **not** currently aim to provide:

- a consumer one-click solution for arbitrary stock routers;
- a universal anti-DPI backend of its own;
- a replacement for upstream `zapret` or `zapret2`.

## Intended use case

The intended topology is:

`Internet -> Linux gateway with zapret-gateway-manager -> router/access point -> client devices`

In this setup, the Linux machine acts as a dedicated network appliance responsible for traffic handling and backend orchestration.

## Why this project exists

This project serves three practical purposes:

1. **Home infrastructure utility**  
   A dedicated gateway can centralize traffic handling for the entire network instead of configuring individual client devices.

2. **Learning and experimentation**  
   The repository is also a hands-on engineering project focused on Linux, networking, shell scripting, service orchestration, and system design.

3. **Portfolio value**  
   The project is intentionally structured as a public technical repository with architecture notes, roadmap, operational logic, and future monitoring plans.

## Current status

The project is currently in the **early foundation stage**.

Implemented so far:

- repository structure;
- baseline project documentation;
- initial profile files;
- shell entrypoint scaffold;
- roadmap and architectural direction.

Planned next:

- manual profile loading and selection;
- state storage;
- basic logging;
- service health checks;
- profile application workflow;
- future backend abstraction and web monitoring.

## Architecture

Current repository layout:

- `scripts/` — shell control logic and backend orchestration
- `profiles/` — profile definitions and future backend-specific parameters
- `lists/` — test targets and exclusion lists
- `state/` — runtime state, cache, and operational data
- `docs/` — architecture, topology, and roadmap documentation
- `api/` — future local API layer
- `web/` — future web UI layer

See also:

- `docs/architecture.md`
- `docs/network-topology.md`
- `docs/roadmap.md`

## Backend direction

The first supported backend is expected to be the current `zapret` project.

However, repository architecture is intentionally being shaped in a way that can later support backend abstraction and future work with `zapret2`, where appropriate.

This means the project is best understood as a **gateway management layer for zapret-family backends**, not as a wrapper around a single hardcoded command line.

## Dependencies

Planned runtime environment:

- Linux gateway host;
- installed anti-DPI backend from the `zapret` ecosystem;
- shell environment for orchestration scripts;
- later: lightweight local API and optional web UI.

At the current scaffold stage, the repository mostly contains project structure and early shell logic.

## Quick start

At the current stage, only the repository scaffold and early shell entrypoint are available.

```bash
chmod +x scripts/zgm.sh
./scripts/zgm.sh
```

## Development priorities

Near-term priorities:

- build a working shell core for Linux gateway mode;
- implement profile loading and state persistence;
- add service health checks;
- prepare clean separation between control logic and backend-specific logic;
- lay the groundwork for monitoring and future web management.

## Roadmap

See `docs/roadmap.md`.

## Credits

This project is inspired by and intended to operate on top of upstream work from the `zapret` ecosystem.

Primary upstream reference:

- `bol-van/zapret`
- `https://github.com/bol-van/zapret`

Future compatibility direction may also consider:

- `bol-van/zapret2`
- `https://github.com/bol-van/zapret2`

## License

The original code in this repository is distributed under the MIT License.

See:

- `LICENSE`
- `NOTICE.md`

When upstream code or substantial adapted fragments are incorporated, corresponding notices and license requirements must be preserved.