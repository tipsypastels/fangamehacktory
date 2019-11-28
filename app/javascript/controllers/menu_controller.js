import { Controller } from 'stimulus';

export default class MenuController extends Controller {
  static targets = ['icon', 'button', 'sidebar']

  toggle() {
    this.buttonTarget.classList.toggle('navbar__menu--open');
  }

  close(e) {
    if (e.target === this.sidebarTarget) {
      this.buttonTarget.classList.remove('navbar__menu--open');
    }
  }
}