# Third-party sources and compatibility

This APK is a SourceFactory extension for Aniyomi, not a modified Aniyomi application.

- Aniyomi extensions-lib API 14, commit f33cc241dee8f7561b97f0aa0921c58f0f8a3b8c: https://github.com/aniyomiorg/extensions-lib — Apache-2.0, compile-only; not packaged.
- SourceFactory/APK/filter architecture reviewed against https://github.com/aniyomiorg/aniyomi-extensions and https://github.com/TheFantasticLoki/adult-aniyomi-extensions — Apache-2.0.
- Current JAV adapter/filter architecture reviewed against https://github.com/yuzono/anime-extensions — Apache-2.0. No upstream disabled sources are re-enabled.
- Metadata, content policies, KVS URL transformations, public xplayer URL transformations and source selectors adapted from this repository's Kotlin providers. Original author/provenance records are preserved in ../imports, including ByAyzen, Kraptor123/Cs-GizliKeyif, phisher98/CXXX and the user's supplied NoodleMagazine sources.
- Taxonomy labels and controls in catalogs were read from the corresponding public source pages. They are not inferred from video titles. Catalog audit files report HTTP failures and collection limits.

The application supplies the Aniyomi API, Kotlin runtime, OkHttp, Okio, RxJava, Jsoup and coroutines. None of these host libraries are included in the extension DEX. The official extensions-lib is an ABI stub used for compilation only, not a replacement host implementation.
