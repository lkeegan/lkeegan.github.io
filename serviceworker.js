const urlsToCache = ["/app", "css/layout.css", "imgs/header.jpg"];

self.addEventListener("install", (event) => {
  console.log("Service worker installed");
  // update cache of app page to serve offline
  event.waitUntil(
    caches.open("pwa-assets").then((cache) => {
      console.log("Caching assets");
      return cache.addAll(urlsToCache);
    }),
  );
});

self.addEventListener("activate", (event) => {
  console.log("Service worker activated");
});

self.addEventListener("fetch", (event) => {
  // if request fails, try to load from cache
  event.respondWith(
    fetch(event.request).catch((error) => {
      console.log("Server offline - using cache");
      return caches.match(event.request);
    }),
  );
});
