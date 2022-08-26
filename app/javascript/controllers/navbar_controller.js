import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    console.log("Hello World b!");

  }

  index(event) {
    console.log(event);
  }
}

const until = document.getElementById('until');
const button = document.getElementById('button');

until.addEventListener('keypress', function (e) {
  if (e.key === 'Enter') {
    e.preventDefault();
    button.click()
  }
});
