import { Controller } from 'stimulus';
import { ajax } from 'jquery'

export default class FieldsEditorController extends Controller {
  static targets = ['field', 'deletions']

  submit(e) {
    e.preventDefault();

    const persistedFields = this.fieldTargets.map(target => {
      const [name, content] = [...target.querySelectorAll('input')]
        .map(t => t.value);
      
      const field = { name, content };
      if (target.dataset.id) {
        field.id = target.dataset.id;
      }
      
      return field;
    });

    const deletedFields = this.deletionsTarget.value
      .split(',')
      .map(id => ({ id, _destroy: '1' }));

    const fields = [...persistedFields, ...deletedFields];

    ajax({
      url: `/edit/${this.data.get('subject-id')}`,
      method: 'PATCH',
      data: {
        subject: { fields_attributes: fields },
        authenticity_token: document.querySelector('[name="csrf-token"]').content
      },
    });
  }
}