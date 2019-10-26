import { Controller } from 'stimulus';

export default class DropdownController extends Controller {
  static targets = ['modal', 'button'];

  toggle(e) {
    const { classList } = this.modalTarget;

    if (classList.contains('hidden')) {
      this.openModal();
    } else {
      this.closeModal();
    }
  }

  openModal = () => {
    this.modalTarget.classList.remove('hidden');
    this.buttonTarget.classList.add('active');
    window.addEventListener('click', this.closeModal);
  }

  closeModal = (e = undefined) => {
    if (e && e.target !== this.modalTarget) {
      return;
    }

    this.modalTarget.classList.add('hidden');
    this.buttonTarget.classList.remove('active');
    window.removeEventListener('click', this.closeModal);
  }
}