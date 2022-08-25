import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

  static targets = ["search"]

  modal(event) {
    console.log(event.currentTarget.id)
  }
}
