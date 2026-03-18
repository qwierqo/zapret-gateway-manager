# Network topology

## Intended topology

The intended deployment model is a dedicated Linux gateway placed between the Internet uplink and the local network.

Reference layout:

`Internet -> Linux gateway -> router / access point -> client devices`

Alternative layout:

`Internet uplink -> Linux gateway -> switch / AP -> clients`

In both cases, the Linux machine is expected to be the network node responsible for traffic handling and backend orchestration.

## Why a dedicated gateway

A dedicated gateway provides a central point for:

- traffic processing;
- backend control;
- profile switching;
- service verification;
- state persistence;
- future monitoring.

This avoids repeated client-by-client setup and allows the whole network to be managed from a single operational point.

## Practical implications

A gateway deployment typically requires:

- a Linux machine running continuously;
- network interfaces suitable for gateway operation;
- proper routing / forwarding configuration;
- backend installation and management;
- persistent local state.

The exact network configuration is outside the scope of the current scaffold stage, but this topology defines the intended operating model for the project.

## Non-goals

At this stage, the project does not aim to provide:

- universal support for arbitrary stock routers;
- one-click firmware replacement for unsupported devices;
- backend-independent traffic processing without a dedicated gateway role.

The project is intentionally focused on the dedicated Linux gateway scenario.