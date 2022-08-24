import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ['tab']

  connect(){
    const url = window.location.href.split('/')
    const tab = url[url.length - 1];
    const selected = document.querySelector('.active');

    let tabElement = ''
    switch(tab){
      case 'seller':
        selected.classList.remove('active')
        tabElement = document.querySelector(`[data-tab-name='my-shows']`)
        tabElement.classList.add('active')
        break;
      case 'bookings':
        selected.classList.remove('active')
        tabElement = document.querySelector(`[data-tab-name='bookings']`)
        tabElement.classList.add('active')
        break;

      default:
        selected.classList.remove('active')
        tabElement = document.querySelector(`[data-tab-name='shows']`)
        tabElement.classList.add('active')
        break
    }
  }
}
