import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ['tab']

  connect(){
    const selected = document.querySelector('.active');
    if(selected) selected.classList.toggle('active');

    const lastTab = localStorage.getItem('lastTab')|| 'my_shows'
    const lastTabElement = document.querySelector(`[data-tab-name=${lastTab}`)

    lastTabElement.classList.add('active');
  }

  active(event) {
    const selected = document.querySelector('.active');

    if(selected) selected.classList.toggle('active');

    event.target.classList.toggle('active')
    const currentTab = event.target.dataset.tabName

    localStorage.setItem('lastTab', currentTab)
  }
}
