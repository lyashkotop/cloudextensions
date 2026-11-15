# Shared source

The repository build entry point is `../scripts/build_repository.py`.
Provider-specific smali is stored in the language folders. This directory alone
is not a complete plugin source tree; the builder combines it with every module.

Maintained Java classes in `java/` are compiled automatically. Other historical
Java files moved to `../reference/java/`; they are documentation, not build inputs.
The editable implementation of those historical classes is in the matching smali file.

The original v64 findings and limitations remain in CHANGES-RU.md and VALIDATION.json.
Current repository requirements are in ../REQUIREMENTS.md. A successful build is not
an Android playback test or a guarantee of external site availability.
