package com.cloudextensions.russian

import okhttp3.HttpUrl.Companion.toHttpUrlOrNull

object TubeSafariPosters {
    private val videoId = Regex("""xv([0-9]+)""")
    private val thumbnails = Regex("""\bhtml5player\.setThumbUrl(169)?\(\s*(['"])([^'"]+)\2\s*\)""")

    fun embedPosterUrls(page: org.jsoup.nodes.Document): List<String> =
        page.select("script").flatMap { script ->
            thumbnails.findAll(script.data()).mapNotNull { match ->
                val image = Metadata.imageUrl(page.baseUri(), match.groupValues[3]) ?: return@mapNotNull null
                (match.groupValues[1].isNotEmpty()) to image
            }.toList()
        }.sortedByDescending { it.first }.map { it.second }.distinct()

    suspend fun resolve(url: String, poster: String?, headers: Map<String, String>): String? {
        val page = url.toHttpUrlOrNull() ?: return poster
        if (page.host.removePrefix("www.") != "tubesafari.com" || page.encodedPath != "/video") return poster
        val id = videoId.matchEntire(page.queryParameter("id").orEmpty())?.groupValues?.get(1) ?: return poster
        if (poster != null) {
            val image = poster.toHttpUrlOrNull() ?: return poster
            if (!image.host.endsWith(".xvideos-cdn.com") || !image.encodedPath.startsWith("/videos/thumbs")) return poster
        }

        // Older listing URLs can fail while the same video's embed still serves a current thumbnail.
        val embed = RequestLimits.optional(2700) {
            Network.page(PageRequest("https://www.xvideos.com/embedframe/$id"), url)
        } ?: return poster
        return embedPosterUrls(embed).firstOrNull { image ->
            PosterRequests.available(image, Network.replacementImageHeaders(image, url, headers), 2600)
        } ?: poster
    }
}
