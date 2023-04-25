const urlsToCache = ["/app", "css/layout.css", "imgs/header.jpg"];

self.addEventListener("install", (event) => {
  console.log("Service worker installed");
  event.waitUntil(
    caches.open("pwa-assets").then((cache) => {
      return cache.addAll(urlsToCache);
    }),
  );
});

self.addEventListener("activate", (event) => {
  console.log("Service worker activated");
});
