import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

  connect(){
    const url = window.location.href.split('/')
    const tab = url[url.length - 1];
    const selected = document.querySelector('.active');
     if (selected != null) selected.classList.toggle('active')

    let tabElement
    let shows = document.querySelector('#shows')
    let user_shows = document.querySelector('#user-shows')
    let bookings = document.querySelector('#bookings')



    switch(tab){
      case 'user_shows':
        tabElement = document.querySelector(`[data-tab-name='user-shows']`)
        tabElement.classList.add('active')
        user_shows.classList.remove('d-none')
        shows.classList.add('d-none')
        console.log('toto')
        bookings.classList.add('d-none')
        break;
      case 'bookings':
        tabElement = document.querySelector(`[data-tab-name='bookings']`)
        tabElement.classList.add('active')
        bookings.classList.remove('d-none')
        shows.classList.add('d-none')
        user_shows.classList.add('d-none')
        break;

      default:
        tabElement = document.querySelector(`[data-tab-name='shows']`)
        tabElement.classList.add('active')
        shows.classList.remove('d-none')
        user_shows.classList.add('d-none')
        bookings.classList.add('d-none')
        break
    }
  }
}
