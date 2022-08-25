// const alert = document.querySelector("card-status");
console.log("hello");

 $(".jsdata").dataset.bookings.sort(function(a,b) {
  var c = new Date(a.created_at);
  var d = new Date(b.created_at);
  return c-d;
});
