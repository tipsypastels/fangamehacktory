import { Controller } from 'stimulus';
import axios from 'axios';

export default class TagsController extends Controller {
  static targets = [
    'field', 
    'picker', 
    'meta',
    'currentsBlock', 
    'suggestionsBlock'
  ];

  connect() {
    this.displaySuggestions(this.getCurrentTypeTarget(), { initial: true });
  }

  handleKeybind(e) {
    const { key, target: { value } } = e; 
    let trim = value.trim();

    if (!trim && key === 'Backspace') {
      this.removeLastCurrent();
    } else if (trim && key === ' ') {
      if (trim.endsWith(',')) {
        trim = trim.slice(0, -1);
      }

      this.addAsCurrent(trim);
      e.target.value = '';
    }
  }

  openPicker() {
    if (!this.nothingToSuggest) {
      this.pickerTarget.classList.add('active');
    }
  }  

  closePicker() {
    this.pickerTarget.classList.remove('active');
  }

  async changeType({ target }) {
    if (target.checked) {
      await this.displaySuggestions(target);
    }
  }

  async displaySuggestions(target, { initial } = { initial: false }) {
    const suggestions = await this.loadSuggestions(target);
    this.nothingToSuggest = suggestions.length === 0;

    if (this.nothingToSuggest) {
      this.closePicker();
    } else if (!initial) {
      this.openPicker();
    }

    this.suggestionsBlockTarget.innerHTML = suggestions
      .map(s => `<span class="sticker sticker--inline clickable bg-primary" data-action="click->tags#clickSuggestion">${s}</span>`)
      .join('');

    this.currentsBlockTarget.dataset.replaceableClass = 
      `inner__bg-${target.dataset.cssClass}`;
  }

  async loadSuggestions(target) {
    const { tagsType, cachedSuggestions } = target.dataset;
    if (cachedSuggestions) {
      return JSON.parse(cachedSuggestions);
    }

    const { data: suggestions } = await axios
      .get(`/api/tag_suggestions/${tagsType}`)
      .catch(() => {
        return { data: [] };
      });

    target.dataset.cachedSuggestions = JSON.stringify(suggestions);
    return suggestions;
  }

  clickSuggestion(e) {
    const name = e.target.innerHTML;
    const typeTarget = this.getCurrentTypeTarget();

    typeTarget.dataset.cachedSuggestions = 
      JSON.stringify(
        JSON.parse(
          typeTarget.dataset.cachedSuggestions
        ).filter(s => s !== name)
      );

    this.displaySuggestions(typeTarget);
    this.addAsCurrent(name);
  }

  addAsCurrent(name) {
    this.currentsBlockTarget.innerHTML += `
      <div class="sticker sticker--inline clickable" data-action="click->tags#removeAsCurrent">
        ${name}
      </div>
    `;

    this.updateMeta();
  }

  removeAsCurrent(e) {
    if (e.target) {
      this.currentsBlockTarget.removeChild(e.target);
      this.updateMeta();
    }
  }

  getCurrentTypeTarget() {
    return document.querySelector('input[data-action="tags#changeType"]:checked');
  }

  getNonCurrentTypeTargets() {
    return [...document.querySelectorAll('input[data-action="tags#changeType"]:not(:checked)')];
  }

  removeLastCurrent() {
    this.removeAsCurrent({ target: this.currentsBlockTarget.lastChild });
  }

  updateMeta() {
    this.metaTarget.value = [...this.currentsBlockTarget.children]
        .map(c => c.innerHTML.trim())
        .join(',');
  }
}