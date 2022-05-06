(() => {
  // app.ts
  function startApp() {
    console.log("hello world");
  }
  document.addEventListener("ready turbolinks:load", function() {
    startApp();
  });
})();
