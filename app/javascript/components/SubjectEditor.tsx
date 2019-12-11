/** @jsx jsx */
import { jsx } from '@emotion/core';
import CKEditor from '@ckeditor/ckeditor5-react';
import { Fragment, useState } from 'react';
import Subject from '../types/Subject';

// devs are dumb and don't seem to want to use modern import semantics despite many many issues
require('@ckeditor/ckeditor5-build-inline');

type Props = {
  subject: Subject;
};  

export default function SubjectEditor({ subject }: Props) {
  const [content, setContent] = useState(subject.content);

  return (
    <form>
      <CKEditor
        editor={window['InlineEditor']}
        data={content}
        onChange={(_, editor) => {
          setContent(editor.getData());
        }}
      />
    </form>
  );
}