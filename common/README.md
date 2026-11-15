# Shared Kotlin core

`kotlin/` contains HTTP, source metadata, images, filtering, RU/EN translation,
real pagination, playback and upstream-provider adapters. Each package includes only
classes reachable from its own entry point; CloudStream and Kotlin libraries are supplied
by the host application.

`tests-kotlin/` verifies shared contracts. `probes/` reads saved real HTTP pages and
reports metadata counts without displaying media. `tools/` pins compilers and SDK with SHA-256.

The former Smali/Java implementation is preserved in Git history through `ed12096`.
All 48 providers now compile from Kotlin; no legacy bytecode sources are bundled.
