// console.log("")
importScripts("https://www.gstatic.com/firebasejs/8.2.5/firebase-app.js");
importScripts("https://www.gstatic.com/firebasejs/8.2.5/firebase-messaging.js");
firebase.initializeApp({
    apiKey: "AIzaSyA_P8vIvyxOuqs0Oz9f-jeYfv-eKkjkhXw",
    authDomain: "flutter-chat-59387.firebaseapp.com",
    projectId: "flutter-chat-59387",
    storageBucket: "flutter-chat-59387.appspot.com",
    messagingSenderId: "58345159193",
    appId: "1:58345159193:web:1d000776de0c0f4d1e8888",
    measurementId: "G-99E26KCM5D"
});
const messaging = firebase.messaging();
messaging.setBackgroundMessageHandler(function (payload) {
    const promiseChain = clients
        .matchAll({
            type: "window",
            includeUncontrolled: true
        })
        .then(windowClients => {
            for (let i = 0; i < windowClients.length; i++) {
                const windowClient = windowClients[i];
                windowClient.postMessage(payload);
            }
        })
        .then(() => {
            const title = payload.notification.title;
            const options = {
                body: payload.notification.score
              };
            return registration.showNotification(title, options);
        });
    return promiseChain;
});
self.addEventListener('notificationclick', function (event) {
    console.log('notification received: ', event)
});