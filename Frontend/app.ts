function startApp() {
    console.log("hello world");
}

document.addEventListener('ready turbolinks:load', function () {
    // This is called on the first page load *and* also when the page is changed by turbolinks
    startApp();
});
