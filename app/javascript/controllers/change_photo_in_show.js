import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

  static targets = ["photo"]

  change_photo(event) {
    this.photoTarget.src = event.target.src
    console.log(photoTarget)
  }
}
