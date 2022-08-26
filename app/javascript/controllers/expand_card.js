import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

  static targets = ["search", "alexandre"]

  change(event) {
    const id = event.currentTarget.id

    this.alexandreTarget.insertAdjacentHTML("beforeend", `<%= @show = Show.find(${id})%>`)
    console.log(this.alexandreTarget.innerHTML)
  }
}
