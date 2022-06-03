importScripts('https://storage.googleapis.com/workbox-cdn/releases/5.1.2/workbox-sw.js');

const OFFLINE_HTML 	= '/offline.html';
const JQUERY_LIB 	= '/catalog/view/theme/kp/js/jquery-3.3.1.min.js';
const JQUERY_UI_LIB = '/catalog/view/theme/kp/js/jquery-ui.min.js';
const FAVICON 		= '/favicon.ico';


const PRECACHE = [{url: OFFLINE_HTML, revision: '1001'}, {url: JQUERY_LIB, revision: '331'}, {url: JQUERY_UI_LIB, revision: '331'}, {url: FAVICON, revision: '1'}];

/**
	* Precache Manifest for resources available offline.
	* https://developers.google.com/web/tools/workbox/modules/workbox-precaching#explanation_of_the_precache_list
*/
workbox.precaching.precacheAndRoute(PRECACHE);

/**
	* Enable navigation preload.
*/
workbox.navigationPreload.enable();

/**
	* Enable tracking with Google Analytics while offline.
	* This does not work with other tracking vendors.
*/
workbox.googleAnalytics.initialize();

/**
	* Basic caching for CSS and JS.
*/
/*
	workbox.routing.registerRoute(
	/\.(?:js|css)$/,
	new workbox.strategies.StaleWhileRevalidate({
    cacheName: 'css_js'
	})
	);
*/

/**
	* Basic caching for fonts.
*/
workbox.routing.registerRoute(
    /\.(?:woff|woff2|ttf|otf|eot)$/,
    new workbox.strategies.StaleWhileRevalidate({
        cacheName: 'fonts',
	})
);

// Cache Google Fonts with a stale-while-revalidate strategy, with
// a maximum number of entries.
workbox.routing.registerRoute(
    ({url}) => url.origin === 'https://fonts.googleapis.com' ||
	url.origin === 'https://fonts.gstatic.com',
    new workbox.strategies.StaleWhileRevalidate({
		cacheName: 'google-fonts',
		plugins: [
			new workbox.expiration.ExpirationPlugin({maxEntries: 20}),
		],
	}),
);


/**
	* Basic caching for images.
*/
workbox.routing.registerRoute(
    /\.(?:png|gif|jpg|jpeg|svg|webp)$/,
    new workbox.strategies.StaleWhileRevalidate({
        cacheName: 'images',
        plugins: [
            new workbox.expiration.ExpirationPlugin({
                // Only cache 60 most recent images.
                maxEntries: 60,
                purgeOnQuotaError: true,
			}),
		],
	})
);

/*
	* Fallback to offline HTML page when a navigation request fails.
*/
const htmlHandler = new workbox.strategies.NetworkOnly();
// A NavigationRoute matches navigation requests in the browser, i.e. requests for HTML.
const navigationRoute = new workbox.routing.NavigationRoute(({ event }) => {
    const request = event.request;
    return htmlHandler
	.handle({
		event,
		request,
	})
	.catch(() =>
		caches.match(OFFLINE_HTML, {
			ignoreSearch: true,
		})
	);
});
workbox.routing.registerRoute(navigationRoute);