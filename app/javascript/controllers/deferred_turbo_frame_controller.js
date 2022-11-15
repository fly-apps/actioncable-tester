// ./app/javascript/controllers/deferred_turbo_frame_controller.js
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    const element = this.element;
    const wait = element.dataset.wait || 1000;

    setTimeout(function(){
      element.removeAttribute("disabled");
    }, wait)
  }
}
